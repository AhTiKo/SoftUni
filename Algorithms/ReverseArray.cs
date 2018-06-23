using System;
using System.Linq;

namespace ReverseArray
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] arr = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            reverseArray(arr, 0, arr.Length - 1);
            Console.WriteLine(String.Join(" ", arr));
        }

        static void reverseArray(int[] arr, int left, int right)
        {
            if (left >= right)
            {
                return;
            }
            int temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;
            reverseArray(arr, left + 1, right - 1);
        }
    }
}
