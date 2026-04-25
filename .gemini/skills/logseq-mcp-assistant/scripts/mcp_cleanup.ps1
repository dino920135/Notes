# Logseq MCP Cleanup Script
# This script identifies and terminates orphaned mcp-logseq processes
# It spares processes that are children of an active gemini-cli session.

$activeGeminiPids = Get-Process | Where-Object { $_.Name -match 'node' -and $_.Path -like '*gemini-cli*' } | Select-Object -ExpandProperty Id

$mcpProcesses = Get-Process | Where-Object { $_.Name -match 'node|uv|python|mcp-logseq' } | Where-Object { 
    ($_.Path -like '*gemini-logseq-mcp*') -or ($_.CommandLine -like '*mcp-logseq*')
}

$toTerminate = @()

foreach ($proc in $mcpProcesses) {
    $parentPid = (Get-CimInstance Win32_Process -Filter "ProcessId = $($proc.Id)").ParentProcessId
    
    # If the parent is not in the active Gemini CLI list, it's a potential orphan/zombie from a previous session
    if ($activeGeminiPids -notcontains $parentPid) {
        $toTerminate += $proc
    }
}

if ($toTerminate) {
    Write-Host "Found $($toTerminate.Count) orphaned MCP processes. Terminating..." -ForegroundColor Yellow
    foreach ($proc in $toTerminate) {
        Write-Host "Killing PID $($proc.Id): $($proc.Name)" -ForegroundColor Gray
        Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
    }
    Write-Host "Cleanup complete." -ForegroundColor Green
} else {
    Write-Host "No orphaned MCP processes found. Active session preserved." -ForegroundColor Gray
}

# Verify port 12315
$connection = Test-NetConnection -ComputerName localhost -Port 12315 -ErrorAction SilentlyContinue
if ($connection.TcpTestSucceeded) {
    Write-Host "Logseq HTTP API is responsive on port 12315." -ForegroundColor Green
} else {
    Write-Warning "Logseq HTTP API is NOT responding on port 12315. Please ensure Logseq is running and the HTTP server is started."
}
