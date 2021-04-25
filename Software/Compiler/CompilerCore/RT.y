%{
    internal StatementList AST;
%}

%namespace CompilerCore
%visibility internal

%start program

%union 
{ 
    internal Expression Expression;
    internal Statement Statement;
    internal ExpressionList ExpressionList;
    internal StatementList StatementList;
    internal string Identifier;
    internal DeclarationItem DeclaraionItem;
    internal DeclarationList DeclarationList;
    internal int IntLiteral;
    internal float FloatLiteral;
    internal string VectorLiteral;
    internal Type Type;
    internal ParameterList ParameterList;
}

%left AND "&&" OR "||" '^'
%left EQ "==" NE "!=" GT ">" GE ">=" LT "<" LE "<="
%left '+' '-'
%left '*' '/' '%'
%left UMINUS
%token<IntLiteral> INT_LITERAL 
%token<FloatLiteral> FLOAT_LITERAL 
%token<VectorLiteral> VECTOR_LITERAL
%token<Identifier> IDENTIFIER
%token INT FLOAT VECTOR VOID IF ELSE FOR WHILE BREAK CONTINUE RETURN STRUCT CONST AND OR 
    EQ NE GT GE LT LE INCREMENT DECREMENT

%type<Type> value_type
%type<Statement> statement  loop_statement return_statement assignment_statement function_definition_statement
    declaration_statement for_special_statement block_statement toplevel_statement if_statement
%type<DeclaraionItem> declaration_item
%type<DeclarationList> declaration_list
%type<StatementList> statement_list optional_statement_list program
%type<ExpressionList> expression_list
%type<Expression> expression binary_expression unary_expression literal_expression index_expression possible_array_expression
    optional_expression assignment_lval_expression identifier_expression function_call_expression
%type<ParameterList> parameter_list

%%
program: toplevel_statement
    {
        AST = new StatementList(@$, $1);
    }
    | program toplevel_statement
    {
        AST.Add($2);
    }
    ;
toplevel_statement: declaration_statement ';'
    | function_definition_statement
    ;

statement_list: statement
    {
        $$ = new StatementList(@$, $1);
    }
    | statement_list statement
    {
        $$ = $1.Add($2);
    }
    ;   

statement: if_statement
    | loop_statement
    | return_statement
    | assignment_statement ';'
    | declaration_statement ';'
    | CONTINUE ';'
    {
        $$ = new ControlStatement(@$, ControlStatement.Type.CONTINUE);
    }
    | BREAK ';'
    {
        $$ = new ControlStatement(@$, ControlStatement.Type.BREAK);
    }
    | block_statement
    | function_call_expression ';'
    {
        $$ = new FunctionCallStatement(@$, $1 as FunctionCallExpression);
    }
    ;
return_statement: RETURN ';'
    {
        $$ = new ReturnStatement(@$);
    }
    | RETURN expression ';'
    {
        $$ = new ReturnStatement(@$, $2);
    }
    ;
block_statement: '{' optional_statement_list '}'
    {
        $$ = new BlockStatement(@$, $2);
    }
    ;
loop_statement: FOR '(' for_special_statement ';' optional_expression ';' for_special_statement ')' statement
    {
        $$ = new LoopStatement(@$, $3, $5, $7, $9);
    }
    | WHILE '(' expression ')' statement
    {
        $$ = new LoopStatement(@$, $3, $5);
    }
    ;
optional_expression: /* empty */
    {
        $$ = null;
    }
    | expression
    ;
for_special_statement: /* empty */
    {
        $$ = null;
    }
    | declaration_statement
    | assignment_statement
    ;
if_statement: IF '(' expression ')' statement
    {
        $$ = new IfStatement(@$, $3, $5);
    }
    | if_statement ELSE statement
    {
        $$ = ($1 as IfStatement).AddElse($3);
    }
    ;
function_definition_statement: value_type IDENTIFIER '(' parameter_list ')' '{' optional_statement_list '}'
    {
        $$ = new FunctionDefinitionStatement(@$, $1, $2, $4, $7);
    }
    ;
optional_statement_list: /* empty */
    {
        $$ = new StatementList(@$);
    }
    | statement_list
    ;
parameter_list: /* empty */
    {
        $$ = new ParameterList(@$);
    }
    | value_type IDENTIFIER
    {
        $$ = new ParameterList(@$, new Parameter(@$, $1, $2));
    }
    | parameter_list ',' value_type IDENTIFIER
    {
        $$ = $1.Add(new Parameter(@$, $3, $4));
    }
    | value_type '*' IDENTIFIER
    {
        $$ = new ParameterList(@$, new Parameter(@$, $1, $3, true));
    }
    | parameter_list ',' value_type '*' IDENTIFIER
    {
        $$ = $1.Add(new Parameter(@$, $3, $5, true));
    }
    ;
value_type: INT {$$ = Type.INT;}
    | FLOAT {$$ = Type.FLOAT;} 
    | VECTOR {$$ = Type.VECTOR;}
    | VOID {$$ = Type.VOID;}
    ;

expression: '(' expression ')'
    {
        $$ = $2;
    }
    | binary_expression
    | unary_expression
    | possible_array_expression
    | function_call_expression
    | literal_expression
    ;
declaration_statement: value_type declaration_list
    {
        $$ = new DeclarationStatement(@$, $1, $2);
    }
    | CONST value_type declaration_list
    {
        $$ = new DeclarationStatement(@$, $2, $3, true);
    }
    ;
declaration_list: declaration_item
    {
        $$ = new DeclarationList(@$, $1);
    }
    | declaration_list ',' declaration_item
    {
        $$ = $1.Add($3);
    }
    ;
declaration_item: IDENTIFIER
    {
        $$ = new DeclarationItem(@$, $1);
    }
    | IDENTIFIER '=' expression
    {
        $$ = new DeclarationItem(@$, $1, $3);
    }
    | '*' IDENTIFIER
    {
        $$ = new DeclarationItem(@$, $2, true);
    }
    | IDENTIFIER '[' INT_LITERAL ']'
    {
        $$ = new DeclarationItem(@$, $1, null, $3);
    }
    ;
assignment_statement: assignment_lval_expression '=' expression
    {
        $$ = new AssignmentStatement(@$, $1, $3);
    }
    | assignment_lval_expression INCREMENT
    {
        var one = new IntLiteralExpression(@$, 1);
        $$ = new AssignmentStatement(@$, $1, new BinaryExpression(@$, BinaryExpression.Type.ADD, $1, one));
    }
    | assignment_lval_expression DECREMENT
    {
        var one = new IntLiteralExpression(@$, 1);
        $$ = new AssignmentStatement(@$, $1, new BinaryExpression(@$, BinaryExpression.Type.SUB, $1, one));
    }
    ;
assignment_lval_expression: index_expression
    | identifier_expression
    ;
binary_expression: expression '+' expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.ADD, $1, $3);
    }
    | expression '-' expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.SUB, $1, $3);            
    }
    | expression '*' expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.MUL, $1, $3);            
    }
    | expression '/' expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.DIV, $1, $3);            
    }
    | expression '%' expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.MOD, $1, $3);            
    }
    | expression EQ expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.EQ, $1, $3);
    }
    | expression NE expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.NE, $1, $3);
    }
    | expression GT expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.GT, $1, $3);
    }
    | expression GE expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.GE, $1, $3);
    }
    | expression LT expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.LT, $1, $3);
    }
    | expression LE expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.LE, $1, $3);
    }
    | expression AND expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.AND, $1, $3);
    }
    | expression OR expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.OR, $1, $3);
    }
    | expression '^' expression
    {
        $$ = new BinaryExpression(@$, BinaryExpression.Type.XOR, $1, $3);
    }
    ;
unary_expression: '-' expression %prec UMINUS
    {
        $$ = new UnaryExpression(@$, UnaryExpression.Type.NEGATE, $2);
    }
    | '!' expression %prec UMINUS
    {
        $$ = new UnaryExpression(@$, UnaryExpression.Type.NOT, $2);
    }
    | '~' expression %prec UMINUS
    {
        $$ = new UnaryExpression(@$, UnaryExpression.Type.BITWISE_NOT, $2);
    }
    ;
identifier_expression: IDENTIFIER
    {
        $$ = new IdentifierExpression(@$, $1);
    }
    ;
possible_array_expression: index_expression
    | identifier_expression
    | '[' expression ',' expression ',' expression ',' expression ']'
    {
        $$ = new VectorConstructorExpression(@$, $2, $4, $6, $8);
    }
    ;
index_expression: possible_array_expression '[' expression ']'
    {
        $$ = new IndexExpression(@$, $1, $3);
    }
    ;
literal_expression: INT_LITERAL
    {
        $$ = new IntLiteralExpression(@$, $1);
    }
    | FLOAT_LITERAL
    {
        $$ = new FloatLiteralExpression(@$, $1);
    }
    | VECTOR_LITERAL
    {
        $$ = new VectorLiteralExpression(@$, $1);
    }
    ;
function_call_expression: IDENTIFIER '(' expression_list ')'
    {
        $$ = new FunctionCallExpression(@$, $1, $3);
    }
    ;
expression_list: /* empty */
    {
        $$ = new ExpressionList(@$);
    }
    | expression
    {
        $$ = new ExpressionList(@$, $1);
    }
    | expression_list ',' expression
    {
        $$ = $1.Add($3);
    }
    ;
%%
public Parser(Scanner scnr) : base(scnr) { }