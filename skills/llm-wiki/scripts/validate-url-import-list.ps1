param(
    [Parameter(Mandatory=$true)]
    [string]$Path
)

$file = (Resolve-Path -LiteralPath $Path).Path
$lines = Get-Content -LiteralPath $file
$text = $lines -join "`n"
$problems = @()

if ($text -notmatch '(?m)^New URLs\s*$') {
    $problems += 'Missing "New URLs" section.'
}
if ($text -notmatch '(?m)^Ingested URLs\s*$') {
    $problems += 'Missing "Ingested URLs" section.'
}

$section = ''
$newUrls = @()
$ingestedUrls = @()
$invalidUrlLines = @()

foreach ($line in $lines) {
    $trimmed = $line.Trim()
    if ($trimmed -eq 'New URLs') {
        $section = 'new'
        continue
    }
    if ($trimmed -eq 'Ingested URLs') {
        $section = 'ingested'
        continue
    }
    if ($trimmed -eq '' -or $trimmed -match '^[A-Za-z ].*$' -and $trimmed -notmatch 'https?://') {
        continue
    }
    if ($trimmed -match 'https?://\S+') {
        $url = $Matches[0]
        if ($section -eq 'new') {
            $newUrls += $url
        } elseif ($section -eq 'ingested') {
            $ingestedUrls += $url
        }
        if ($url -notmatch '^https?://') {
            $invalidUrlLines += $line
        }
    } elseif ($trimmed -match '\S') {
        $invalidUrlLines += $line
    }
}

if ($invalidUrlLines.Count -gt 0) {
    $problems += "Found non-empty lines that are not recognized URLs or section headings."
}

$duplicates = $newUrls | Group-Object | Where-Object { $_.Count -gt 1 }
if ($duplicates.Count -gt 0) {
    $problems += "Duplicate URL(s) in New URLs: $($duplicates.Name -join ', ')"
}

$alreadyIngested = $newUrls | Where-Object { $ingestedUrls -contains $_ }
if ($alreadyIngested.Count -gt 0) {
    $problems += "URL(s) appear in both New URLs and Ingested URLs: $($alreadyIngested -join ', ')"
}

if ($problems.Count -eq 0) {
    Write-Output "OK: URL import list looks valid. New URLs: $($newUrls.Count); Ingested URLs: $($ingestedUrls.Count)."
    exit 0
}

Write-Output "URL import list validation problems:"
$problems | ForEach-Object { Write-Output "- $_" }
exit 1
