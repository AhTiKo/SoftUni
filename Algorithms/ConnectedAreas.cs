using System;
using System.Collections.Generic;
using System.Linq;

namespace ConnectedAreas 
{
    class Area : IComparable<Area>
    {
        private int row;
        private int col;
        private int size;

        public Area(int row, int col, int size)
        {
            this.row = row;
            this.col = col;
            this.size = size;
        }

        public int Row
        {
            get { return this.row; }
        }

        public int Cow
        {
            get { return this.col; }
        }

        public int Size
        {
            get { return this.size; }
        }

        public int CompareTo(Area other)
        {
            int result = other.size.CompareTo(size);
            if(result == 0)
            {
                result = row.CompareTo(other.row);

                if(result == 0)
                {
                    result = col.CompareTo(other.col);
                }
            }
            return result;
        }

        public override string ToString()
        {
            return "at (" + this.row + ", " + this.col + "), size: " + this.size;
        }
    }
    class Program
    {
        static List<Area> list = new List<Area>();
        static char[,] matrix;
        static int curRow;
        static int curCol;
        static int countArea;

        static void Main(string[] args)
        {
            int rows = int.Parse(Console.ReadLine());
            int cols = int.Parse(Console.ReadLine());
            matrix = new char[rows, cols];

            for (int i = 0; i < rows; i++)
            {
                char[] elements = Console.ReadLine().ToCharArray();

                for (int j = 0; j < cols; j++)
                {
                    matrix[i, j] = elements[j];
                }
            }

            while (findSpace())
            {
                findArea(curRow, curCol);
                list.Add(new Area(curRow, curCol, countArea));
                countArea = 0;
            }

            list.Sort();
            int n = 1;
            Console.WriteLine("Total areas found: " + list.Count);
            foreach(Area area in list)
            {
                Console.WriteLine("Area #" + n + " " + area);
                n++;
            }

         }

        private static bool findSpace()
        {
            for (int i = 0; i < matrix.GetLength(0); i++)
            {
                for (int j = 0; j < matrix.GetLength(1); j++)
                {
                    if (matrix[i, j] == '-')
                    {
                        curRow = i;
                        curCol = j;
                        return true;
                    }
                }
            }
            return false;
        }

        public static void findArea(int row, int col)
        {
            if (row < 0 || row >= matrix.GetLength(0)
                || col < 0 || col >= matrix.GetLength(1))
            {
                return;
            }
            if (matrix[row, col] != '*')
            {
                if (matrix[row, col] == '-')
                {
                    countArea++;
                    matrix[row, col] = 'v';

                    findArea(row, col + 1);
                    findArea(row + 1, col);
                    findArea(row, col - 1);
                    findArea(row - 1, col);

                }
            }

        }
    }
}
