namespace SimulatorCore
{
    public class RegisterFile<T>
    {
        public T[] Array {get;}
        public RegisterFile(int size)
        {
            Array = new T[size];
        }

        public T this[int i]
        {
            get => Array[i];
            set => Array[i] = value;
        }
    }
}