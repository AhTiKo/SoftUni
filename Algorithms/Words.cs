using System;
using System.Collections.Generic;

namespace Words
{
    class Program
    {
        static char[] elements;
        static char[] perm;
        static bool[] used;
        static int count = 0;
        static HashSet<String> set = new HashSet<String>();

        static void Main(string[] args)
        {
            elements = Console.ReadLine().ToCharArray();
            perm = new char[elements.Length];
            used = new bool[elements.Length];
            GenPerm(0);
            count = set.Count;
            Console.WriteLine(count);


        }

        public static void GenPerm(int index)
        {
            if (index >= elements.Length)
            {
                set.Add(String.Join("", perm));
            }
            else
            {
                for (int i = 0; i < elements.Length; i++)
                {
                    if (!used[i])
                    {
                        if (index == 0 || (index > 0 && perm[index - 1] != elements[i]))
                        {
                            used[i] = true;
                            perm[index] = elements[i];
                            GenPerm(index + 1);
                            used[i] = false;
                        }
                    }

                }
            }

        }
    }
}
