param(
    [Parameter(Mandatory=$true)]
    [string]$Path
)

$file = (Resolve-Path -LiteralPath $Path).Path
$text = Get-Content -LiteralPath $file -Raw
$problems = @()

$requiredLines = @(
    '^# YouTube Transcript Intake\s*$',
    '^Title:\s*',
    '^YouTube URL:\s*',
    '^Channel / creator:\s*',
    '^Published date:\s*',
    '^Published date confidence:\s*(high|medium|low)\s*$',
    '^Transcript captured date:\s*',
    '^Transcript source:\s*(YouTube auto captions|manual transcript|third-party tool|unknown)\s*$',
    '^Language:\s*',
    '^Duration:\s*',
    '^## Human Context\s*$',
    '^Reason for interest:\s*',
    '^Relevant wiki area:\s*',
    '^Initial confidence:\s*(high|medium|low)\s*$',
    '^Source stance:\s*(neutral|opinion|tutorial|product/vendor|interview|unclear)\s*$',
    '^Priority:\s*(high|medium|low)\s*$',
    '^Ingest intent:\s*(source page only|update existing topics|create new synthesis if useful)\s*$',
    '^## Notes for Ingest\s*$',
    '^Key questions I want this source to help answer:\s*$',
    '^Known caveats:\s*$',
    '^Links mentioned or related:\s*$',
    '^## Transcript\s*$'
)

foreach ($pattern in $requiredLines) {
    if ($text -notmatch "(?m)$pattern") {
        $problems += "Missing or invalid line matching: $pattern"
    }
}

if ($text -notmatch '(?m)^YouTube URL:\s*https?://(www\.)?(youtube\.com|youtu\.be)/') {
    $problems += 'YouTube URL should contain a youtube.com or youtu.be URL.'
}

$afterTranscript = ($text -split '(?m)^## Transcript\s*$', 2)
if ($afterTranscript.Count -lt 2 -or ($afterTranscript[1].Trim()).Length -lt 200) {
    $problems += 'Transcript body is missing or very short; verify before ingestion.'
}

if ($problems.Count -eq 0) {
    Write-Output "OK: YouTube transcript intake header looks valid."
    exit 0
}

Write-Output "YouTube transcript intake validation problems:"
$problems | ForEach-Object { Write-Output "- $_" }
exit 1
