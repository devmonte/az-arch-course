using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace MediaApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MediaController : ControllerBase
    {
        private readonly HttpClient _httpClient;

        public MediaController(IConfiguration config)
        {
            _httpClient = new HttpClient();
            _httpClient.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", $"{config["vision-api-key"]}");
        }

        // POST api/values
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] string url)
        {
            _httpClient.BaseAddress = new Uri("https://westeurope.api.cognitive.microsoft.com/vision/v1.0/analyze");
            var result = await _httpClient.PostAsync("?visualFeatures=Adult", new StringContent(JsonConvert.SerializeObject(new { url }), Encoding.UTF8, "application/json"));

            var responseBody = await result.Content.ReadAsStringAsync();
            dynamic deserializedResponse = JsonConvert.DeserializeObject(responseBody);
            if ((bool)deserializedResponse.adult.isAdultContent)
                return StatusCode(406, "Image is for adults!");
            return Ok("Image is OK!");
        }
    }
}
