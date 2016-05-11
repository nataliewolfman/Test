using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Task1
{
    public static class Triangle
    {
        /// <summary>
        /// возвращает площадь прямоугольного треугольника по трем сторонам
        /// возвращает -1, если треугольник не прямоугольный
        /// возвращает -1, если данные не корректны
        /// </summary>
        public static double getAreaRightTriangle(double a, double b, double c)
        {
            double area = -1;
            if (a > 0 && b > 0 && c > 0)
            {
                var hyp = a;
                var a1 = b;
                var a2 = c;
                if (b > hyp)
                {
                    hyp = b;
                    a1 = a;
                    a2 = c;
                }
                if (c > hyp)
                {
                    hyp = c;
                    a1 = a;
                    a2 = b;
                }
                var g = Math.Round(hyp*hyp, 4);
                if (g == a1*a1 + a2*a2)
                {
                    area = a1*a2/2;
                }
            }
            return area;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(Triangle.getAreaRightTriangle(1, 1, Math.Sqrt(2)));
        }
    }
}
