using System;
using System.Collections.Generic;

namespace FindPath
{
    class Program
    {
        public static char[,] labyrinth;
        public static List<char> path = new List<char>();
        static void Main(string[] args)
        {
            int row = int.Parse(Console.ReadLine());
            int col = int.Parse(Console.ReadLine());
            labyrinth = new char[row, col];
            for (int i = 0; i < row; i++)
            {
                char[] lineChar = Console.ReadLine().ToCharArray();
                for (int j = 0; j < col; j++)
                {
                    labyrinth[i, j] = lineChar[j];
                }
            }

            findPath(0, 0);
        }

        public static void findPath(int row, int col, char direction = ' ')
        {
            if (row < 0 || row >= labyrinth.GetLength(0)
                || col < 0 || col >= labyrinth.GetLength(1))
            {
                return;
            }
            if (labyrinth[row,col] != '*')
            {
                path.Add(direction);
                if (labyrinth[row, col] == 'e')
                {
                    
                    Console.WriteLine(String.Join("", path).Trim());
                }

                if (labyrinth[row, col] == '-')
                {
                    labyrinth[row, col] = 'v';

                    findPath(row, col + 1, 'R');
                    findPath(row + 1, col, 'D');
                    findPath(row, col - 1, 'L');
                    findPath(row - 1, col, 'U');

                    labyrinth[row, col] = '-';
                    
                }

                path.RemoveAt(path.Count - 1);
            }
            

        }
    }
}
