param(
    [Parameter(Mandatory=$true)]
    [string]$Path
)

$file = (Resolve-Path -LiteralPath $Path).Path
$text = Get-Content -LiteralPath $file -Raw
$problems = @()

if ($text -notmatch '(?m)^Extraction Quality:\s*(clean|minor-noise|noisy|partial)\s*$') {
    $problems += 'Missing or invalid Extraction Quality header.'
}
if ($text -notmatch '(?m)^Known Issues:\s*$') {
    $problems += 'Missing Known Issues header.'
}
if ($text -notmatch '(?m)^Coverage:\s*$') {
    $problems += 'Missing Coverage header.'
}
if ($text -notmatch '(?m)^-\s*PDF pages\s+\S+') {
    $problems += 'Missing PDF page coverage line.'
}
if ($text -notmatch '(?m)^Source:\s*$' -or $text -notmatch '(?m)^-\s*raw/books/.+\.pdf\s*$') {
    $problems += 'Missing Source header or raw/books PDF path.'
}
if ($text -notmatch '(?m)^Tracker:\s*$' -or $text -notmatch '(?m)^-\s*wiki/entities/.+\.md\s*$') {
    $problems += 'Missing Tracker header or wiki/entities tracker path.'
}

$body = $text -replace '(?s)^Extraction Quality:.*?Tracker:\s*\r?\n-\s*wiki/entities/.+?\.md\s*', ''
if (($body.Trim()).Length -lt 500) {
    $problems += 'Extracted body is very short; verify this is intentional before ingestion.'
}

if ($problems.Count -eq 0) {
    Write-Output "OK: extracted text header looks valid."
    exit 0
}

Write-Output "Extraction text validation problems:"
$problems | ForEach-Object { Write-Output "- $_" }
exit 1
