using System;

namespace CombinatorialAlgorithms
{
    class Program
    {
        static String[] set;
        static void Main(string[] args)
        {
            set = Console.ReadLine().Split(' ');        
                //           set = new char[elements.Length];
            GenPermotation(0);
        }

        static void GenPermotation(int index)
        {
            if(index >= set.Length)
            {
                Console.WriteLine(String.Join(" ", set));
            }
            else
            {
                GenPermotation(index + 1);
                for(int i = index + 1; i < set.Length; i++)
                {
                    Swap(index, i);
                    GenPermotation(index + 1);
                    Swap(index, i);
                }
            }
        }

        private static void Swap(int index, int i)
        {
            var temp = set[index];
            set[index] = set[i];
            set[i] = temp;
        }
    }
}
