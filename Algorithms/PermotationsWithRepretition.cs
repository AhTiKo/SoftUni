using System;

namespace PermotationsWithRepretition
{
    class Program
    {
        public static string[] arr;
        static void Main(string[] args)
        {
            arr = Console.ReadLine().Split(' ');
            Array.Sort(arr);
            
            PermRep(0, arr.Length - 1);

        }

        static void PermRep(int start, int end)
        {

            Console.WriteLine(String.Join(" ", arr));

            for(int left = end - 1; left >= start; left--)
            {
                for (int right = left + 1; right <= end; right++)
                {
                    if (arr[left] != arr[right])
                    {
                        Swap(left, right);
                        PermRep(left + 1, end);
                    }
                }
                var firstElement = arr[left];
                for(int i = left; i <= end - 1; i++)
                {
                    arr[i] = arr[i + 1];
                }
                arr[end] = firstElement;
            }
        }

        private static void Swap(int left, int right)
        {
            var temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;
        }
    }
}
