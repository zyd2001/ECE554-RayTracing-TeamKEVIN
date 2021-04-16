%namespace CompilerCore
%visibility internal

%start statement_list

%union 
{ 
    internal Expression Expression;
    internal Statement Statement;
    internal List<Expression> ExpressionList;
    internal List<Statement> StatementList;
    internal string Identifier;
    internal DeclarationStatement.DeclarationItem DeclaraionItem;
    internal List<DeclarationStatement.DeclarationItem> DeclarationList;
    internal int IntLiteral;
    internal float FloatLiteral;
    internal string VectorLiteral;
    internal IfStatement IfStatement;
    internal Type Type;
    internal List<FunctionDefinitionStatement.Parameter> ParameterList;
}

%left AND "&&" OR "||"
%left EQ "==" NE "!=" GT ">" GE ">=" LT "<" LE "<="
%left '+' '-'
%left '*' '/' '%'
%left UMINUS
%token<IntLiteral> INT_LITERAL 
%token<FloatLiteral> FLOAT_LITERAL 
%token<VectorLiteral> VECTOR_LITERAL
%token<Identifier> IDENTIFIER
%token INT FLOAT VECTOR IF ELSE ELSEIF FOR WHILE BREAK CONTINUE RETURN STRUCT CONST AND OR 
    EQ NE GT GE LT LE INCREMENT DECREMENT

%type<Type> value_type
%type<Statement> statement  loop_statement return_statement assignment_statement function_definition_statement
    declaration_statement for_special_statement block_statement
%type<IfStatement> if_statement
%type<DeclaraionItem> declaration_item
%type<DeclarationList> declaration_list
%type<StatementList> statement_list optional_statement_list
%type<ExpressionList> expression_list
%type<Expression> expression binary_expression unary_expression literal_expression index_expression possible_array_expression
    optional_expression assignment_lval_expression identifier_expression function_call_expression
%type<ParameterList> parameter_list

%%

statement_list: statement
    {
        $$ = new List<Statement>{$1};
    }
    | statement_list statement
    {
        $1.Add($2);
        $$ = $1;
    }
    ;   

statement: expression ';'
    {
        $$ = new ExpressionStatement($1);
    }
    | if_statement
    | loop_statement
    | return_statement
    | assignment_statement ';'
    | declaration_statement ';'
    | CONTINUE ';'
    {
        $$ = new ControlStatement(ControlStatement.Type.CONTINUE);
    }
    | BREAK ';'
    {
        $$ = new ControlStatement(ControlStatement.Type.BREAK);
    }
    | block_statement
    | function_definition_statement
    ;
return_statement: RETURN ';'
    {
        $$ = new ReturnStatement();
    }
    | RETURN expression ';'
    {
        $$ = new ReturnStatement($2);
    }
    ;
block_statement: '{' optional_statement_list '}'
    {
        $$ = new BlockStatement($2);
    }
    ;
loop_statement: FOR '(' for_special_statement ';' optional_expression ';' for_special_statement ')' statement
    {
        $$ = new LoopStatement($3, $5, $7, $9);
    }
    | WHILE '(' expression ')' statement
    {
        $$ = new LoopStatement($3, $5);
    }
    ;
optional_expression: /* empty */
    | expression
    ;
for_special_statement: declaration_statement
    | assignment_statement
    ;
if_statement: IF '(' expression ')' statement
    {
        $$ = new IfStatement($3, $5);
    }
    | if_statement ELSE statement
    {
        $$ = $1.AddElse($3);
    }
    ;
function_definition_statement: value_type IDENTIFIER '(' parameter_list ')' '{' optional_statement_list '}'
    {
        $$ = new FunctionDefinitionStatement($1, $2, $4, $7);
    }
    ;
optional_statement_list: /* empty */
    {
        $$ = new List<Statement>();
    }
    | statement_list
    ;
parameter_list: value_type IDENTIFIER
    {
        $$ = new List<FunctionDefinitionStatement.Parameter>{new FunctionDefinitionStatement.Parameter($1, $2)};
    }
    | parameter_list ',' value_type IDENTIFIER
    {
        $1.Add(new FunctionDefinitionStatement.Parameter($3, $4));
        $$ = $1;
    }
    ;
value_type: INT {$$ = Type.INT;}
    | FLOAT {$$ = Type.FLOAT;} 
    | VECTOR {$$ = Type.VECTOR;}
    ;

expression: '(' expression ')'
    {
        $$ = $2;
    }
    | binary_expression
    | unary_expression
    | possible_array_expression
    ;
declaration_statement: value_type declaration_list
    {
        $$ = new DeclarationStatement($1, $2);
    }
    | CONST value_type declaration_list
    {
        $$ = new DeclarationStatement($2, $3, true);
    }
    ;
declaration_list: declaration_item
    {
        $$ = new List<DeclarationStatement.DeclarationItem>{$1};
    }
    | declaration_list ',' declaration_item
    {
        $1.Add($3);
        $$ = $1;
    }
    ;
declaration_item: IDENTIFIER
    {
        $$ = new DeclarationStatement.DeclarationItem($1);
    }
    | IDENTIFIER '=' expression
    {
        $$ = new DeclarationStatement.DeclarationItem($1, $3);
    }
    | IDENTIFIER '[' INT_LITERAL ']'
    {
        $$ = new DeclarationStatement.DeclarationItem($1, null, $3);
    }
    ;
assignment_statement: assignment_lval_expression '=' expression
    {
        $$ = new AssignmentStatement($1, $3);
    }
    | assignment_lval_expression INCREMENT
    {
        var one = new IntLiteralExpression(1);
        $$ = new AssignmentStatement($1, new BinaryExpression(BinaryExpression.Type.ADD, $1, one));
    }
    | assignment_lval_expression DECREMENT
    {
        var one = new IntLiteralExpression(1);
        $$ = new AssignmentStatement($1, new BinaryExpression(BinaryExpression.Type.SUB, $1, one));
    }
    ;
assignment_lval_expression: index_expression
    | identifier_expression
    ;
binary_expression: expression '+' expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.ADD, $1, $3);
    }
    | expression '-' expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.SUB, $1, $3);            
    }
    | expression '*' expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.MUL, $1, $3);            
    }
    | expression '/' expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.DIV, $1, $3);            
    }
    | expression '%' expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.MOD, $1, $3);            
    }
    | expression EQ expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.EQ, $1, $3);
    }
    | expression NE expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.NE, $1, $3);
    }
    | expression GT expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.GT, $1, $3);
    }
    | expression GE expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.GE, $1, $3);
    }
    | expression LT expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.LT, $1, $3);
    }
    | expression LE expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.LE, $1, $3);
    }
    | expression AND expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.AND, $1, $3);
    }
    | expression OR expression
    {
        $$ = new BinaryExpression(BinaryExpression.Type.OR, $1, $3);
    }
    ;
unary_expression: '-' expression %prec UMINUS
    {
        $$ = new UnaryExpression(UnaryExpression.Type.NEGATE, $2);
    }
    | '!' expression %prec UMINUS
    {
        $$ = new UnaryExpression(UnaryExpression.Type.NOT, $2);
    }
    ;
identifier_expression: IDENTIFIER
    {
        $$ = new IdentifierExpression($1);
    }
    ;
possible_array_expression: literal_expression
    | index_expression
    | function_call_expression
    | identifier_expression
    ;
index_expression: possible_array_expression '[' expression ']'
    {
        $$ = new IndexExpression($1, $3);
    }
    ;
literal_expression: INT_LITERAL
    {
        $$ = new IntLiteralExpression($1);
    }
    | FLOAT_LITERAL
    {
        $$ = new FloatLiteralExpression($1);
    }
    | VECTOR_LITERAL
    {
        $$ = new VectorLiteralExpression($1);
    }
    ;
function_call_expression: IDENTIFIER '(' expression_list ')'
    {
        $$ = new FunctionCallExpression($1, $3);
    }
    ;
expression_list: /* empty */
    | expression
    {
        $$ = new List<Expression>{$1};
    }
    | expression_list ',' expression
    {
        $1.Add($3);
        $$ = $1;
    }
    ;
%%
public Parser(Scanner scnr) : base(scnr) { }