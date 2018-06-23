using System;
using System.Linq;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] set = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            int num = int.Parse(Console.ReadLine());
            int[] arr = new int[num];

            GenCombination(arr, set, 0, 0);
        }
        public static void GenCombination(int[] arr, int[] set, int indexArr, int indexSet)
        {
            if (indexArr == arr.Length)
            {
                Console.WriteLine(string.Join("", arr));
            }else
            {
                for (int i = indexSet; i < set.Length; i++)
                {
                    arr[indexArr] = set[i];
                    GenCombination(arr, set, indexArr + 1, i + 1);
                }
            }
        }
    }
}
