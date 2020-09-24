using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System.Data.SqlClient;

namespace Function
{
    public static class RetrieveRegistration
    {
        [FunctionName("RetrieveRegistration")]
        public static async Task<IActionResult> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get")] HttpRequest req, ILogger log)
        {
            log.LogInformation($"{DateTime.Now} RetrieveRegistration function triggered.");

            // Retrieve local settings
            var environment = Environment.GetEnvironmentVariable("Environment");
            var connectionString = Environment.GetEnvironmentVariable("SQL_Connection_String");

            // Retrieve data from database for passed in ID
            string id = req.Query["id"];

            if (!string.IsNullOrEmpty(id))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    var text = $"SELECT * FROM Registrations WHERE ID = @ID;";

                    using (SqlCommand command = new SqlCommand(text, connection))
                    {
                        command.Parameters.Add("@ID", System.Data.SqlDbType.Int);
                        command.Parameters["@ID"].Value = id;

                        SqlDataReader reader = await command.ExecuteReaderAsync();
                        while (await reader.ReadAsync())
                        {
                            log.LogInformation($"Data: {reader[0]} - {reader[1]} - {reader[2]}");
                            return (ActionResult)new OkObjectResult($"Registration found for attendee {reader[1]} with event {reader[2]} in environment {environment}.");
                        }
                    }
                }
            }

            return (ActionResult)new NotFoundObjectResult("The provided ID could not be found.");
        }
    }
}
