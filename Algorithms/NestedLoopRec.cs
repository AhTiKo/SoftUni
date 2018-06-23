using System;

namespace NestedLoopRec
{
    class Program
    {

        static void Main(string[] args)
        {
            int iters = int.Parse(Console.ReadLine());
            int loops = int.Parse(Console.ReadLine());
            int[] result = new int[loops];
            recursion(result, iters, loops, 0);
        }
        
        static void recursion(int[] result,int iters, int loops, int count)
        {
            if(count == loops)
            {
                Console.WriteLine(String.Join(" ", result));
                return;
            }
            
            for(int i = 1; i <= iters; i++)
            {
                result[count] = i;
                recursion(result, iters, loops, count + 1);
            }

        }
    }
}
