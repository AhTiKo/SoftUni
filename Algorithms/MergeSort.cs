using System;
using System.Linq;

namespace MergeSort
{
    class Program
    {
        static int numInvers = 0;

        static void Main(string[] args)
        {
            int[] arr = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            int[] arrSort = mergeSort(arr);
            Console.WriteLine(numInvers);
        }

        public static int[] mergeSort(int[] arr)
        {
            if(arr.Length > 1)
            {
                int arr1Length = arr.Length / 2;
                int arr2Length = arr.Length - arr1Length;

                int[] arr1 = new int[arr1Length];
                int[] arr2 = new int[arr2Length];

                for(int i = 0; i < arr1Length; i++)
                {
                    arr1[i] = arr[i];
                }
                for (int i = 0; i < arr2Length; i++)
                {
                    arr2[i] = arr[arr1Length + i];
                }

                arr1 = mergeSort(arr1);
                arr2 = mergeSort(arr2);

                int indexArr = 0;
                int indexArr1 = 0;
                int indexArr2 = 0;

                while(indexArr1 < arr1.Length && indexArr2 < arr2.Length)
                {
                    if(arr1[indexArr1] < arr2[indexArr2])
                    {
                        arr[indexArr] = arr1[indexArr1];
                        indexArr1++;
                    }
                    else
                    {
                        arr[indexArr] = arr2[indexArr2];
                        indexArr2++;
                        numInvers = numInvers + (arr1.Length - indexArr1);
                    }
                    indexArr++;
                }

                while(indexArr1 < arr1Length)
                {
                    arr[indexArr] = arr1[indexArr1];
                    indexArr1 ++;
                    indexArr ++;
                }
                while (indexArr2 < arr2Length)
                {
                    arr[indexArr] = arr2[indexArr2];
                    indexArr2++;
                    indexArr++;
                }
            }
            return arr;
        }
    }
}
