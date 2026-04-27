param(
    [Parameter(Mandatory=$true)]
    [string]$TrackerPath
)

$path = (Resolve-Path -LiteralPath $TrackerPath).Path
$text = Get-Content -LiteralPath $path -Raw

$required = @(
    '## What It Is',
    '## Bibliographic Details',
    '## Ingest Strategy',
    '## Ingested',
    '## Priority Next',
    '## Open Questions'
)

$missing = @()
foreach ($heading in $required) {
    if ($text -notmatch [regex]::Escape($heading)) {
        $missing += $heading
    }
}

if ($text -notmatch 'raw/books/.+\.pdf') {
    $missing += 'Local PDF path containing raw/books/<file>.pdf'
}

if ($text -notmatch '## Table Of Contents / Chapter Map' -and $text -notmatch '## Queue By Section') {
    $missing += '## Table Of Contents / Chapter Map or ## Queue By Section'
}

if ($text -notmatch '## Remaining Queue' -and $text -notmatch '## Queue By Section') {
    $missing += '## Remaining Queue or ## Queue By Section'
}

if ($text -notmatch '## Extraction Or OCR Notes' -and $text -notmatch '## Extraction Notes') {
    $missing += '## Extraction Or OCR Notes or ## Extraction Notes'
}

if ($text -match 'raw/assets/.+extracted\.txt' -and $text -notmatch '## Extracted Drafts') {
    $missing += '## Extracted Drafts section for listed extracted text files'
}

if ($missing.Count -eq 0) {
    Write-Output "OK: tracker has required sections."
    exit 0
}

Write-Output "Missing or weak tracker elements:"
$missing | ForEach-Object { Write-Output "- $_" }
exit 1
