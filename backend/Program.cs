var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World!");

app.MapGet("/healthz", () => new { Status = "ok" });
app.MapGet("/readyz", () => new { Status = "ok" });

app.Run();
