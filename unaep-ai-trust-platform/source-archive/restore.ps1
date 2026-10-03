$ErrorActionPreference = "Stop"

$ExpectedSha256 = "01f7157523708f4aa76d861892ae654f4acef27b1260b6740fe11ac4a612c19a"
$OutputZip = Join-Path $PSScriptRoot "unaep-ai-trust-platform-source.zip"

$chunks = Get-ChildItem -Path $PSScriptRoot -Filter "chunk_*.b64" | Sort-Object Name
if ($chunks.Count -ne 11) {
    throw "Expected 11 Base64 chunks; found $($chunks.Count)."
}

$base64 = ($chunks | ForEach-Object { Get-Content $_.FullName -Raw }) -join ""
$bytes = [Convert]::FromBase64String($base64)
[IO.File]::WriteAllBytes($OutputZip, $bytes)

$actual = (Get-FileHash -Path $OutputZip -Algorithm SHA256).Hash.ToLowerInvariant()
if ($actual -ne $ExpectedSha256) {
    Remove-Item $OutputZip -Force -ErrorAction SilentlyContinue
    throw "SHA-256 mismatch. Expected $ExpectedSha256 but got $actual."
}

Write-Host "UNAEP_SOURCE_ARCHIVE_OK" -ForegroundColor Green
Write-Host "ZIP: $OutputZip"
Write-Host "SHA256: $actual"
