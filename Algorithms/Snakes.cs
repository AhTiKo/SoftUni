using System;
using System.Collections.Generic;

namespace Snakes
{
    class Program
    {
        private static char[] currentSnake;
        private static HashSet<string> visitedCells = new HashSet<string>();
        private static HashSet<string> results = new HashSet<string>();
        private static HashSet<string> allPosibleSnakes = new HashSet<string>();

        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine());
            currentSnake = new char[n];

            GenSnake(0, 0, 0, 'S');

            foreach(var snake in results)
            {
                Console.WriteLine(snake);
            }
            Console.WriteLine($"Snakes count = {results.Count}");

        }

        static void GenSnake(int index, int row, int col, char direction)
        {
            if(index >= currentSnake.Length)
            {
                MarkSnake();
            }
            else
            {
                string cell = $"{row} {col}";
                if (!visitedCells.Contains(cell))
                {
                    currentSnake[index] = direction;
                    visitedCells.Add(cell);

                    GenSnake(index + 1, row, col + 1, 'R');
                    GenSnake(index + 1, row + 1, col, 'D');
                    GenSnake(index + 1, row, col - 1, 'L');
                    GenSnake(index + 1, row - 1, col, 'U');

                    visitedCells.Remove(cell);
                }

            }
        }

        private static void MarkSnake()
        {
            string normalSnake = new string(currentSnake);

            if (allPosibleSnakes.Contains(normalSnake))
            {
                return;
            }

            results.Add(normalSnake);

            string flippedSnake = Flip(normalSnake);
            string reversedSnake = Reverse(normalSnake);
            string reversedFlippedSnake = Flip(reversedSnake);

            for (int i = 0; i < 4; i++)
            {
                allPosibleSnakes.Add(normalSnake);
                normalSnake = Rotate(normalSnake);

                allPosibleSnakes.Add(flippedSnake);
                flippedSnake = Rotate(flippedSnake);

                allPosibleSnakes.Add(reversedSnake);
                reversedSnake = Rotate(reversedSnake);

                allPosibleSnakes.Add(reversedFlippedSnake);
                reversedFlippedSnake = Rotate(reversedFlippedSnake);
            }
        }

        private static string Reverse(string snake)
        {
            var newSnake = new char[snake.Length];

            newSnake[0] = 'S';

            for (int i = 1; i < snake.Length; i++)
            {
                newSnake[snake.Length - i] = snake[i];
            }

            return new string(newSnake);
        }

        private static string Flip(string snake)
        {
            var newSnake = new char[snake.Length];

            for (int i = 0; i < snake.Length; i++)
            {
                switch (snake[i])
                {
                    case 'U': newSnake[i] = 'D';
                        break;
                    case 'D': newSnake[i] = 'U';
                        break;
                    default: newSnake[i] = snake[i];
                        break;
                }
            }
            return new string(newSnake);
        }

        private static string Rotate(string snake)
        {
            var newSnake = new char[snake.Length];

            for (int i = 0; i < snake.Length; i++)
            {
                switch (snake[i])
                {
                    case 'R':
                        newSnake[i] = 'D';
                        break;
                    case 'D':
                        newSnake[i] = 'L';
                        break;
                    case 'L':
                        newSnake[i] = 'U';
                        break;
                    case 'U':
                        newSnake[i] = 'R';
                        break;
                    default:
                        newSnake[i] = snake[i];
                        break;
                }
            }
            return new string(newSnake);
        }
    }
}
