using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System.Net.Http;

namespace Function
{
    public static class CheckIn
    {
        private static HttpClient _client = new HttpClient();

        [FunctionName("CheckIn")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation($"{DateTime.Now}: CheckIn function triggered.");

            var id = req.Query["id"];
            _client.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", "da885ee32cd84fb998e87efbbf262d18");
            var response = await _client.GetAsync($"http://localhost/rai-demo/registrations?id={id}");
            var toReturn = response.IsSuccessStatusCode 
                ? (IActionResult)new OkObjectResult($"Check-in for visitor {id} done. Response was: {await response.Content.ReadAsStringAsync()}")
                : (IActionResult)new NotFoundObjectResult($"Check-in for visitor {id} failed. Response was: {response.ReasonPhrase}");

            return toReturn;
        }
    }
}
