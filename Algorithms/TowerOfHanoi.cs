using System;
using System.Collections.Generic;
using System.Linq;

namespace TowerOfHanoi
{
    class Program
    {
        static int numDisks;
        static int steps = 0;
        static Stack<int> source;
        static Stack<int> destination = new Stack<int>();
        static Stack<int> spare = new Stack<int>();
        static void Main(string[] args)
        {
            numDisks = int.Parse(Console.ReadLine());
            var range = Enumerable.Range(1, numDisks);
            source = new Stack<int>(range.Reverse());
            PrintState();
            Solve(numDisks, source, spare, destination);
        }

        private static void Solve(int disks, Stack<int> source, Stack<int> spare, Stack<int> destination)
        {
            if(disks == 1)
            {
                destination.Push(source.Pop());
                steps ++;
                Console.WriteLine($"Step #{steps}: Moved disk");
                PrintState();
            }
            else
            {
                Solve(disks - 1, source, destination, spare);
                Solve(1, source, spare, destination);
                Solve(disks - 1, spare, source, destination);
            }
        }

        static void PrintState()
        {
            Console.WriteLine("Source: {0}", string.Join(", ", source.Reverse()));
            Console.WriteLine("Destination: {0}", string.Join(", ", destination.Reverse()));
            Console.WriteLine("Spare: {0}", string.Join(", ", spare.Reverse()));
            Console.WriteLine();
        }
    }
}
