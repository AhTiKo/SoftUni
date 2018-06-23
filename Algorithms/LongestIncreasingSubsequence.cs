using System;
using System.Collections.Generic;
using System.Linq;

namespace LongestIncreasingSubsequence
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] arr = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            int[] len = new int[arr.Length];
            int[] prevIndex = new int[arr.Length];
            int maxLength = 0;
            int lastIndex = -1;
            for (int i = 0; i < arr.Length; i++)
            {
                len[i] = 1;
                prevIndex[i] = -1;
                for (int j = 0; j < i ; j++)
                {
                    if (arr[j] < arr[i] && len[j] + 1 > len[i])
                    {
                        len[i] = len[j] + 1;
                        prevIndex[i] = j;
                    }
                }
                if(len[i] > maxLength)
                {
                    maxLength = len[i];
                    lastIndex = i;
                }
            }

 //           Console.WriteLine(maxLength);
            Console.WriteLine(string.Join(" ", RestoreLis(arr,prevIndex,lastIndex)));
        }

        private static List<int> RestoreLis(int[] seq, int[] prevIndex, int lastIndex)
        {
            var longSeq = new List<int>();
            while(lastIndex != -1)
            {
                longSeq.Add(seq[lastIndex]);
                lastIndex = prevIndex[lastIndex];
            }
            longSeq.Reverse();
            return longSeq;
        }
    }
}
