using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HealthQualityApp.Model;
using Microsoft.EntityFrameworkCore;

namespace HealthQualityApp.Dal
{
    public class CarService : ICarService
    {
        private readonly HealthQualityAppContext _healthQualityDbContext;

        private List<Car> cars = new()
        {
            new Car { Id = 1, Make = "Audi", Model = "R8", Year = 2018, Doors = 2, Color = "Red", Price = 79995 },
            new Car { Id = 2, Make = "Tesla", Model = "3", Year = 2018, Doors = 4, Color = "Black", Price = 54995 },
            new Car { Id = 3, Make = "Porsche", Model = " 911 991", Year = 2020, Doors = 2, Color = "White", Price = 155000 },
            new Car { Id = 4, Make = "Mercedes-Benz", Model = "GLE 63S", Year = 2021, Doors = 5, Color = "Blue", Price = 83995 },
            new Car { Id = 5, Make = "BMW", Model = "X6 M", Year = 2020, Doors = 5, Color = "Silver", Price = 62995 },
        };


        public CarService()
        {
            _healthQualityDbContext = new HealthQualityAppContext();
        }

        public async Task<IEnumerable<Car>> GetAllAsync()
        {
            return await (from c in _healthQualityDbContext.Cars select c).ToListAsync();
        }

        public async Task<Car> GetAsync(int id)
        {
            return await (from c in _healthQualityDbContext.Cars where c.Id == id select c).FirstOrDefaultAsync();
        }


        public async Task<Car> CreateAsync(Car car)
        {
            _healthQualityDbContext.Add(car);
            await _healthQualityDbContext.SaveChangesAsync();
            return car;
        }

        public async Task<Car> UpdateAsync(Car car)
        {
            _healthQualityDbContext.Attach(car);
            _healthQualityDbContext.Entry(car).State = EntityState.Modified;
            await _healthQualityDbContext.SaveChangesAsync();
            return car;
        }


        public async Task DeleteAsync(int id)
        {
            var carToDelete = GetAsync(id);
            if (carToDelete != null)
            {
                _healthQualityDbContext.Remove(carToDelete);
                await _healthQualityDbContext.SaveChangesAsync();
            }
        }

        public async Task InitTestDataAsync()
        {
            foreach (var car in cars)
            {
                _healthQualityDbContext.Add(car);
            }

            await _healthQualityDbContext.SaveChangesAsync();
        }

        public async Task<bool> GuessPriceWithin5000RangeAsync(int carId, int guessValue)
        {
            var car = await GetAsync(carId);
            if (car != null)
                return GuessTest.IsBetween(guessValue, car.Price - 5000, car.Price + 5000);

            return false;
        }
    }
}
