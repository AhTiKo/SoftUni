using System;

namespace DpFibonacci
{
    class Program
    {
        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine());
            
            int fib1 = 1;
            int fib2 = 0;
            int fibn = 1;
            for(int i = 2; i <= n; i++)
            {    

                fibn = fib1 + fib2;
                fib2 = fib1;
                fib1 = fibn;
            }

            if (n == 0)
            {
                fibn = 0;
            }
            Console.WriteLine(fibn);
        }
    }
}
