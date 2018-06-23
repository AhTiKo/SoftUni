using System;
using System.Collections.Generic;

namespace Needles
{
    class Program
    {
        static List<int> result = new List<int>();

        public static void Main(string[] args)
        {
            string[] firstLine = Console.ReadLine().Split(' ');
            int c = int.Parse(firstLine[0]);
            int n = int.Parse(firstLine[1]);

            string[] secondLine = Console.ReadLine().Split(' ');
            int[] arrayC = Array.ConvertAll(secondLine, s => int.Parse(s));

            string[] thirdLine = Console.ReadLine().Split(' ');
            int[] arrayN = Array.ConvertAll(thirdLine, s => int.Parse(s));

            foreach (int number in arrayN)
            {
                for (int i = 0; i < arrayC.Length; i++)
                {
                    // First case if current element is not 0
                    if (arrayC[i] != 0)
                    {
                        if (number <= arrayC[i])
                        {
                            result.Add(i);
                            break;
                        }

                        if (i == arrayC.Length - 1)
                        {
                            result.Add(i + 1);
                            break;
                        }
                    }

                    // Second case if current element is 0
                    else
                    {
                        int j = i + 1;
                        int temp = i;

                        // Search value diferent from 0
                        while (j < arrayC.Length && arrayC[j] == 0)
                        {
                            j++;
                        }

                        // Jump elements with value 0
                        i = j - 1;

                        // If element with index j is not bigger then Number, we have result
                        if (j >= arrayC.Length || number <= arrayC[j])
                        {
                            result.Add(temp);
                            break;
                        }
                    }
                }
            }

            Console.WriteLine(string.Join<int>(" ", result));
        }
    }
}
