namespace SimulatorCore
{
    public class RegisterFile<T>
    {
        T[] arr;
        int size {get;}
        public RegisterFile(int size)
        {
            this.size = size;
            arr = new T[size];
        }

        public T this[int i]
        {
            get => arr[i];
            set => arr[i] = value;
        }
    }
}