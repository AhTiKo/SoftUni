    using System;

namespace Combination
{
    class Program
    {
        static string[] elements;
        static int k;
        static string[] combination;

        static void Main(string[] args)
        {
            elements = Console.ReadLine().Split(' ');
            k = int.Parse(Console.ReadLine());
            combination = new string[k];

            GenCombination(0, 0);

        }

        static void GenCombination(int index, int start)
        {
            if (index >= k)
            {
                Console.WriteLine(string.Join(" ", combination));
            }
            else
            {
                for (int i = start; i < elements.Length; i++)
                {
                    combination[index] = elements[i];
                    GenCombination(index + 1, i);
                }
            }
        }
    }
}
