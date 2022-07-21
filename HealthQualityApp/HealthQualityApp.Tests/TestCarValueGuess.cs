using HealthQualityApp.Dal;

namespace HealthQualityApp.Tests
{
    public class TestCarValueGuess
    {
        [Theory]
        [InlineData(79995, 82000)]
        [InlineData(54995, 50000)]
        public void GuessIsIn5000Range(int carValue, int guessValue)
        {
            var test = GuessTest.IsBetween(guessValue, carValue - 5000, carValue + 5000);
            Assert.True(test);
        }


        [Theory]
        [InlineData(79995, 98000)]
        [InlineData(54995, 30000)]
        public void GuessNotIn5000Range(int carValue, int guessValue)
        {
            var test = GuessTest.IsBetween(guessValue, carValue - 5000, carValue + 5000);
            Assert.False(test);
        }
    }
}