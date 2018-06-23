using System;
using System.Collections.Generic;
using System.Linq;

namespace Cubes
{
    class Program
    {
        private static HashSet<string> allRotatetions = new HashSet<string>();
        private static int[] arr;
        private static int count = 0;
        static void Main(string[] args)
        {
            arr = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            PermuteRep(0);
            Console.WriteLine(count);
            
        }

        private static void PermuteRep(int start)
        {
            if (start >= arr.Length)
            {
                string strArr = string.Join("", arr);
                if (!allRotatetions.Contains(strArr))
                {
                    GenAllRotate();
                    count++;
                }
            }
            else
            {
                PermuteRep(start + 1);

                var used = new HashSet<int> { arr[start] };

                for (var i = start + 1; i < arr.Length; i++)
                {
                    if (!used.Contains(arr[i]))
                    {
                        used.Add(arr[i]);
                        Swap(start, i);
                        PermuteRep(start + 1);

                        Swap(start, i);
                    }
                }
            }
        }

        private static void GenAllRotate()
        {
            allRotatetions.Add(string.Join("",arr));

            int[] rotArr = new int[arr.Length];
            Array.Copy(arr,rotArr,arr.Length);

            for (int i = 0; i < 4; i++)
            {
                rotArr = RotateX(rotArr);
                allRotatetions.Add(string.Join("", rotArr));

                for (int j = 0; j < 4; j++)
                {
                    rotArr = RotateY(rotArr);
                    allRotatetions.Add(string.Join("", rotArr));

                    for (int k = 0; k < 4; k++)
                    {
                        rotArr = RotateZ(rotArr);
                        allRotatetions.Add(string.Join("", rotArr));
                    }
                }

            }
        }

        private static void Swap(int i, int j)
        {
            var temp = arr[i];
            arr[i] = arr[j];
            arr[j] = temp;
        }

        static int[] RotateX(int[] arr)
        {
            int[] newArr = new int[12];

            newArr[0] = arr[8];
            newArr[1] = arr[5];
            newArr[2] = arr[0];
            newArr[3] = arr[4];
            newArr[4] = arr[11];
            newArr[5] = arr[9];
            newArr[6] = arr[1];
            newArr[7] = arr[3];
            newArr[8] = arr[10];
            newArr[9] = arr[6];
            newArr[10] = arr[2];
            newArr[11] = arr[7];

            return newArr;
        }

        static int[] RotateY(int[] arr)
        {
            int[] newArr = new int[12];

            newArr[0] = arr[1];
            newArr[1] = arr[2];
            newArr[2] = arr[3];
            newArr[3] = arr[0];
            newArr[4] = arr[5];
            newArr[5] = arr[6];
            newArr[6] = arr[7];
            newArr[7] = arr[4];
            newArr[8] = arr[9];
            newArr[9] = arr[10];
            newArr[10] = arr[11];
            newArr[11] = arr[8];

            return newArr;
        }

        static int[] RotateZ(int[] arr)
        {
            int[] newArr = new int[12];

            newArr[0] = arr[4];
            newArr[1] = arr[3];
            newArr[2] = arr[7];
            newArr[3] = arr[11];
            newArr[4] = arr[8];
            newArr[5] = arr[0];
            newArr[6] = arr[2];
            newArr[7] = arr[10];
            newArr[8] = arr[5];
            newArr[9] = arr[1];
            newArr[10] = arr[6];
            newArr[11] = arr[9];

            return newArr;
        }
    }
}
