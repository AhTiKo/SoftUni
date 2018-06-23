using System;
using System.Linq;

namespace RodCutting
{
    class Program
    {
        static int[] price;
        static int[] bestPrice;
        static int[] bestCombo;
        static void Main(string[] args)
        {
            price = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            int n = int.Parse(Console.ReadLine());
            bestPrice = new int[price.Length];
            bestCombo = new int[price.Length];

            Console.WriteLine(CutRoad(n));
            PrintSolution(n);

        }

        private static void PrintSolution(int n)
        {
            while (n > 0)
            {
                Console.Write(bestCombo[n] + " ");
                n = n - bestCombo[n];
            }
            Console.WriteLine();
        }

        private static int CutRoad(int n)
        {
            for (int i = 1; i <= n; i++)
            {
                int currentBest = bestPrice[i];
                for (int j = 1; j <= i; j++)
                {
                    currentBest = Math.Max(bestPrice[i], price[j] + bestPrice[i - j]);
                    if (bestPrice[i] < currentBest)
                    {
                        bestPrice[i] = currentBest;
                        bestCombo[i] = j;
                    }
                }
            }
            return bestPrice[n];
        }
    }
}
