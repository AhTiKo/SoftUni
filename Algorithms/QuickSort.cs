using System;
using System.Linq;

namespace QuickSort
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] arr = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            quickSort(arr, 0, arr.Length - 1);
            Console.WriteLine(String.Join(" ", arr));
        }

        static void quickSort(int[] arr, int left, int right)
        {
            if(left >= right)
            {
                return;
            }
            int k = partition(arr, left, right);
            quickSort(arr, left, k - 1);
            quickSort(arr, k + 1, right);
        }

        static int partition(int[] arr, int left, int right)
        {
            //Random random = new Random();
            //int randomIndex = random.Next(left, right);

            //swap(arr, right, randomIndex);

            int pivot = arr[right];
            int k = left - 1;

            for(int i = left; i <= right; i++)
            {
                if(arr[i] <= pivot)
                {
                    k++;
                    swap(arr, k, i);
                }
            }
            return k;
        }

        static void swap(int[] arr, int x, int y)
        {
            int temp = arr[x];
            arr[x] = arr[y];
            arr[y] = temp;
        }
    }
}
