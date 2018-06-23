using System;
using System.Linq;

namespace BinarySearch
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] arr = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            int num = int.Parse(Console.ReadLine());
            int pos = binSearch(arr, num, 0, arr.Length - 1);
            Console.WriteLine(pos);
        }

        private static int binSearch(int[] arr, int num, int left, int right)
        {
            int middle = (right + left) / 2;

            if(left > right)
            {
                return -1;
            }

            if(num == arr[middle])
            {
                return middle;
            }

            if(num < arr[middle])
            {
                return binSearch(arr, num, left, middle - 1);
            }

            if (num > arr[middle])
            {
                return binSearch(arr, num, middle + 1, right);
            }

            return -1;
        }
    }
}
