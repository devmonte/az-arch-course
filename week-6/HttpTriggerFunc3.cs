using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace homework
{
    public static class HttpTriggerFunc3
    {
        [FunctionName("HttpTriggerFunc3")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");

            string date = req.Query["date"];

            var queryStr = $"SELECT Message FROM Messages WHERE Message LIKE '%{date}%'";
            var messages = new List<string>();
            var str = Environment.GetEnvironmentVariable("ConnectionString");
            using (SqlConnection conn = new SqlConnection(str))
            {

                SqlCommand command = new SqlCommand(queryStr, conn);
                try
                {
                    conn.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        messages.Add(reader[0].ToString());
                    }
                    reader.Close();
                }
                catch (System.Exception exception)
                {
                    log.LogError(exception, "Ups...");
                }
            }
            log.LogDebug($"Returning {messages.Count}messages!");
            return (ActionResult)new OkObjectResult(messages);
        }
    }
}
