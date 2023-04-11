using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("api")]
public class ApiController : ControllerBase
{

    [HttpGet("get")]
    public IActionResult Get()
    {
        return Ok(DateTime.Now);
    }

    [HttpGet("")]
    public IActionResult AllGetRequest()
    {
        return Ok("All request");
    }
}