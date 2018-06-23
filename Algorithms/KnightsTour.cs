using System;
using System.Collections.Generic;

namespace KnightsTour
{
    class Cell
    {
        public int row { get; set; }
        public int col { get; set; }

        public Cell(int x, int y)
        {
            this.row = x;
            this.col = y;
        }

    }
    class Program
    {
        static int[,] board;
        static int count = 1;
        static int[] rowParam = { -2, -2, -1, -1, 1, 1, 2, 2 };
        static int[] colParam = { -1, 1, -2, 2, -2, 2, -1, 1 };
        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine());
            board = new int[n, n];

            Cell curentCell = new Cell(0, 0);
           
            while (count <= n * n)
            {
                board[curentCell.row, curentCell.col] = count;
                curentCell = FindNextCell(curentCell);
                count++;
            }

            printBoard();
        }

        private static void printBoard()
        {
            for(int i = 0; i < board.GetLength(0); i++)
            {
                for(int j = 0; j < board.GetLength(1); j++)
                {

                    Console.Write($" {board[i, j]}");
                }
                Console.WriteLine();
            }
        }

        private static Cell FindNextCell(Cell curentCell)
        {
            var curentCellList = GetListMoves(curentCell);
            Cell nextCell = null;
            int countMoves = 9;
            foreach(var cell in curentCellList)
            {
                int curentCount = GetListMoves(cell).Count;
                if (curentCount >= 0 && curentCount < countMoves)
                {
                    nextCell = cell;
                    countMoves = GetListMoves(cell).Count;
                }
            }
            return nextCell;
        }

        private static List<Cell> GetListMoves(Cell cell)
        {
            List<Cell> list = new List<Cell>();

            for(int i = 0; i < 8; i++)
            {
                if(isPosibleMovie(cell.row + rowParam[i], cell.col + colParam[i]))
                {
                    list.Add(new Cell(cell.row + rowParam[i], cell.col + colParam[i]));
                }
            }
            return list;
        }

        private static bool isPosibleMovie(int x, int y)
        {
            return (x >= 0 && x < board.GetLength(0) && y >= 0 && y < board.GetLength(1) && board[x,y] == 0);
        }
    }
}
