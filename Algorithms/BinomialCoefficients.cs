using System;

namespace BinomialCoefficients
{
    class Program
    {
        static int n;
        static int k;
        static decimal[,] matrix;

        static void Main(string[] args)
        {
            n = int.Parse(Console.ReadLine());
            k = int.Parse(Console.ReadLine());
            matrix = new decimal[n + 1, k + 1];

            decimal result = CalcBinomCoeff(n, k);
            Console.WriteLine(result);
        }

        private static decimal CalcBinomCoeff(int n, int k)
        {
            if (k > n)
            {
                return 0;
            }
            if (k == 0 || k == n)
            {
                return 1;
            }
 //           return CalcBinomCoeff(n - 1, k - 1) + CalcBinomCoeff(n - 1, k);
            if(matrix[n,k] == 0)
            {
                matrix[n, k] = CalcBinomCoeff(n - 1, k - 1) + CalcBinomCoeff(n - 1, k);
            }
            return matrix[n, k];
        }
    }
}
