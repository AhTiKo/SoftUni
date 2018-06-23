using System;
using System.Linq;
using System.Text;

namespace HeapSort
{
    class Program
    {
        private static int N;

        static void Main(string[] args)
        {
            int[] arr = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            sort(arr);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < arr.Length; i++)
            {
                sb.Append(arr[i]);
                sb.Append(" ");
            }

            Console.WriteLine(sb.ToString());
        }

        public static void sort(int[] arr)
        {
            heapify(arr);

            for (int i = N; i > 0; i--)
            {
                swap(arr, 0, i);
                N--;
                downHeap(arr, 0);
            }
        }

        public static void heapify(int[] arr)
        {
            N = arr.Length - 1;
            for (int i = N / 2; i >= 0; i--)
            {
                downHeap(arr, i);
            }
        }

        private static void downHeap(int[] arr, int i)
        {
            int left = 2 * i + 1;
            int right = 2 * i + 2;
            int max = i;

            if (left <= N && arr[left] > arr[i])
            {
                max = left;
            }
            if (right <= N && arr[right] > arr[max])
            {
                max = right;
            }
            if (max != i)
            {
                swap(arr, i, max);
                downHeap(arr, max);
            }
        }

        private static void swap(int[] arr, int i, int max)
        {
            int temp = arr[i];
            arr[i] = arr[max];
            arr[max] = temp;
        }
    }
}
