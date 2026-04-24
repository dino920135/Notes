# Logseq MCP Cleanup Script
# This script identifies and terminates hanging mcp-logseq processes

$processes = Get-Process | Where-Object { $_.Name -match 'node|uv|python|mcp-logseq' } | Where-Object { $_.Path -like '*gemini-logseq-mcp*' }

if ($processes) {
    Write-Host "Found $($processes.Count) hanging MCP processes. Terminating..." -ForegroundColor Yellow
    $processes | Stop-Process -Force -ErrorAction SilentlyContinue
    Write-Host "Cleanup complete." -ForegroundColor Green
} else {
    Write-Host "No hanging MCP processes found." -ForegroundColor Gray
}

# Verify port 12315
$connection = Test-NetConnection -ComputerName localhost -Port 12315 -ErrorAction SilentlyContinue
if ($connection.TcpTestSucceeded) {
    Write-Host "Logseq HTTP API is responsive on port 12315." -ForegroundColor Green
} else {
    Write-Warning "Logseq HTTP API is NOT responding on port 12315. Please ensure Logseq is running and the HTTP server is started."
}
