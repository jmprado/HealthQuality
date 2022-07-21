using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HealthQualityApp.Dal
{
    public static class GuessTest
    {
        public static bool IsBetween(int testValue, int min, int max)
        {
            return (testValue >= Math.Min(min, max) && testValue <= Math.Max(min, max));
        }
    }
}
