using System;
using System.Collections.Generic;

namespace PermutationWithRepetition2
{
    class Program
    {
        static string[] set;
        static void Main(string[] args)
        {
            set = Console.ReadLine().Split(" ");
            GenPermotation(0);
        }

        static void GenPermotation(int index)
        {
            if(index >= set.Length)
            {
                Console.WriteLine(string.Join(" ", set));
            }
            else
            {
                HashSet<string> swapped = new HashSet<string>();
                for(int i = index; i < set.Length; i++)
                {
                    if (!swapped.Contains(set[i]))
                    {
                        Swap(index, i);
                        GenPermotation(index + 1);
                        Swap(index, i);
                        swapped.Add(set[i]);
                    }
                   

                }
            }
        }

        private static void Swap(int left, int right)
        {
            var temp = set[left];
            set[left] = set[right];
            set[right] = temp;
        }
    }   
}
