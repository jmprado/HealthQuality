using HealthQualityApp.Dal;
using HealthQualityApp.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HealthQualityApp.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly ICarService _carService;
        public IEnumerable<Car> carList;

        public IndexModel(ILogger<IndexModel> logger, ICarService carService)
        {
            _logger = logger;
            _carService = carService;
        }

        public async Task OnGetAsync()
        {
            carList = await _carService.GetAllAsync();
        }
    }
}
