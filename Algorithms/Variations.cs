using System;

namespace Variations
{
    class Program
    {
        static string[] elements;
        static bool[] used;
        static int k;
        static string[] variation;

        static void Main(string[] args)
        {
            elements = Console.ReadLine().Split(' ');
            k = int.Parse(Console.ReadLine());
            variation = new string[k];
            used = new bool[elements.Length];

            GenVariation(0);

        }

        static void GenVariation(int index)
        {
            if(index >= k)
            {
                Console.WriteLine(string.Join(" ", variation));
            }
            else
            {
                for(int i = 0; i < elements.Length; i++)
                {
                    if (!used[i])
                    {
                        used[i] = true;
                        variation[index] = elements[i];
                        GenVariation(index + 1);
                        used[i] = false;
                    }
                    
                }
            }
        }
    }
}
