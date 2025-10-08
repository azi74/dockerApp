# Calls an API /health endpoint and logs the response

$apiUrl = "http://localhost:5000/health"
$logFile = "C:\Logs\api_health.log"

$logDir = Split-Path $logFile
if (!(Test-Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}

function Write-Log {
    param([string]$Message)
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Add-Content -Path $logFile -Value "$timestamp - $Message"
}

Write-Log "=== Checking API Health ==="

try {
    $response = Invoke-RestMethod -Uri $apiUrl -Method Get -TimeoutSec 10
    Write-Log "✅ API responded successfully: $(ConvertTo-Json $response)"
} catch {
    Write-Log "❌ API check failed: $($_.Exception.Message)"
}

Write-Log "=== Health check completed ==="
Write-Host "Health check done. See log at $logFile"
