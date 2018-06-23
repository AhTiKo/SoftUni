using System;

namespace NestedLoops2
{
    class RecursiveNestedLoops
    {
        static int numberOfLoops;
        static int numberOfIterations;
        static int[] loops;
        static void Main()
        {
            numberOfIterations = int.Parse(Console.ReadLine());
            numberOfLoops = int.Parse(Console.ReadLine());

            loops = new int[numberOfLoops];
            NestedLoops(0);
        }
        static void NestedLoops(int currentLoop = 0, int countIter = 1)
        {
            if (currentLoop == numberOfLoops)
            {
                PrintLoops();
                return;
            }
            for (int counter = countIter; counter <= numberOfIterations; counter++)
            {
                loops[currentLoop] = counter;
                NestedLoops(currentLoop + 1, counter + 1);
            }
        }
        static void PrintLoops()
        {
            for (int i = 0; i < numberOfLoops; i++)
            {
                Console.Write("{0} ", loops[i]);
            }
            Console.WriteLine();
        }
    }
}
