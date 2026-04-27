param(
    [Parameter(Mandatory=$true)]
    [string]$WikiRoot
)

$root = (Resolve-Path -LiteralPath $WikiRoot).Path
$markdownFiles = Get-ChildItem -LiteralPath $root -Recurse -File -Filter '*.md'
$broken = @()

foreach ($file in $markdownFiles) {
    $text = Get-Content -LiteralPath $file.FullName -Raw
    $text = [regex]::Replace($text, '(?ms)^```.*?^```', '')
    $matches = [regex]::Matches($text, '\[[^\]]+\]\(([^)]+)\)')
    foreach ($match in $matches) {
        $target = $match.Groups[1].Value.Trim()
        if ($target -match '^(https?:|mailto:|#)' -or $target -eq '') { continue }

        $withoutAnchor = ($target -split '#')[0]
        if ($withoutAnchor -eq '') { continue }
        if ($withoutAnchor -match '^[a-zA-Z]+:') { continue }

        $decoded = [uri]::UnescapeDataString($withoutAnchor)
        $baseDir = Split-Path -Parent $file.FullName
        $candidate = Join-Path -Path $baseDir -ChildPath $decoded

        if (-not (Test-Path -LiteralPath $candidate)) {
            $broken += [pscustomobject]@{
                File = $file.FullName.Substring($root.Length).TrimStart('\')
                Link = $target
            }
        }
    }
}

if ($broken.Count -eq 0) {
    Write-Output "OK: no broken local markdown links found."
    exit 0
}

$broken | Format-Table -AutoSize
Write-Error "Found $($broken.Count) broken local markdown link(s)."
exit 1
