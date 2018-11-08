using System;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;

namespace homework
{
    [StorageAccount("AzureWebJobsStorage")]
    public static class TimerTriggerFunc1
    {
        [FunctionName("TimerTriggerFunc1")]
        [return: Queue("outqueue")]
        public static string Run([TimerTrigger("0 */5 * * * *")]TimerInfo myTimer, ILogger log)
        {
            log.LogInformation($"C# Timer trigger function executed at: {DateTime.Now}");
            return DateTime.Now.ToString();
        }
    }
}
