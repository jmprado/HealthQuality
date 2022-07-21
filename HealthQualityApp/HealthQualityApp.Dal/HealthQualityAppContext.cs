using HealthQualityApp.Model;
using Microsoft.EntityFrameworkCore;
using System;

namespace HealthQualityApp.Dal
{
    public class HealthQualityAppContext : DbContext
    {
        public HealthQualityAppContext()
        {
        }

        public HealthQualityAppContext(DbContextOptions<HealthQualityAppContext> options)
            : base(options)
        {
        }

        public DbSet<Car> Cars { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseInMemoryDatabase("health_quality_db");
            }
        }
    }
}
