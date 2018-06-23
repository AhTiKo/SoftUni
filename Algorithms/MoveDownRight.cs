using System;
using System.Collections.Generic;

namespace MoveDownRight
{
    class Program
    {
        static void Main(string[] args)
        {
            int rows = int.Parse(Console.ReadLine());
            int cols = int.Parse(Console.ReadLine());

            int[,] matrix = new int[rows, cols];
            for (int i = 0; i < rows; i++)
            {
                var line = Console.ReadLine().Split(' ');
                for (int j = 0; j < cols; j++)
                {
                    matrix[i, j] = int.Parse(line[j]);
                }
            }

            int[,] sums = new int[rows, cols];

            sums[0, 0] = matrix[0, 0];
            for (int i = 1; i < cols; i++)
            {
                sums[0, i] = sums[0, i - 1] + matrix[0, i];
            }
            for (int i = 1; i < rows; i++)
            {
                sums[i, 0] = sums[i - 1, 0] + matrix[i, 0];
            }

            for (int i = 1; i < rows; i++)
            {
                for (int j = 1; j < cols; j++)
                {
                    sums[i, j] = Math.Max(sums[i - 1, j], sums[i, j - 1]) + matrix[i,j];
                }
            }

//            Console.WriteLine(sums[rows-1,cols-1]);
            var result = new List<string>();
            int row = rows - 1;
            int col = cols - 1;
            int top;
            int left;
            result.Add($"[{row}, {col}]");

            while (row >=0 && col >= 0)
            {
                if(row -1 >=0 && col-1 >= 0)
                {
                    top = sums[row - 1, col];
                    left = sums[row, col - 1];
                    if(top > left)
                    {
                        row = row - 1; 
                    } else
                    {
                        col = col - 1;
                    }
                }
                else if(row - 1 >= 0 && col - 1 < 0)
                {
                    row = row - 1;
                }
                else
                {
                    col = col - 1;
                }
                result.Add($"[{row}, {col}]");
                if(row == 0 && col == 0)
                {
                    break;
                }
            }
            result.Reverse();
            Console.WriteLine(string.Join(" ",result));
        }
    }
}
