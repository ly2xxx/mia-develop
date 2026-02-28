# TMUA Prep - Past Papers Download Script
# Created: 2026-02-28
# Purpose: Download all essential exam papers from official sources

Write-Host "TMUA Exam Preparation - Past Papers Download Script" -ForegroundColor Cyan
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host ""

# Create folders if they don't exist
$folders = @("TMUA-Official", "MAT", "STEP-Foundation", "PAT", "AMC12")
foreach ($folder in $folders) {
    if (!(Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "✓ Created folder: $folder" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Starting downloads..." -ForegroundColor Yellow
Write-Host ""

# Counter for progress
$totalDownloads = 0
$successfulDownloads = 0
$failedDownloads = 0

# Function to download with progress
function Download-File {
    param(
        [string]$url,
        [string]$outputPath,
        [string]$description
    )
    
    $global:totalDownloads++
    Write-Host "[$global:totalDownloads] Downloading: $description" -ForegroundColor White
    
    try {
        # Try download with timeout
        $ProgressPreference = 'SilentlyContinue'  # Hide progress bar for speed
        Invoke-WebRequest -Uri $url -OutFile $outputPath -TimeoutSec 30 -ErrorAction Stop
        $global:successfulDownloads++
        Write-Host "    ✓ Success: $outputPath" -ForegroundColor Green
        return $true
    }
    catch {
        $global:failedDownloads++
        Write-Host "    ✗ Failed: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
    finally {
        Start-Sleep -Milliseconds 500  # Be nice to servers
    }
}

# ============================================================
# TMUA Official Papers (2024, 2023, 2022) - Priority 1
# ============================================================
Write-Host "`n=== TMUA Official Papers ===" -ForegroundColor Cyan

$tmuaYears = @(2024, 2023, 2022)
$tmuaBase = "https://esat-tmua.ac.uk/sites/default/files"

foreach ($year in $tmuaYears) {
    Download-File `
        -url "$tmuaBase/$year-10/TMUA_${year}_Paper1.pdf" `
        -outputPath "TMUA-Official\TMUA_${year}_Paper1.pdf" `
        -description "TMUA $year Paper 1"
    
    Download-File `
        -url "$tmuaBase/$year-10/TMUA_${year}_Paper2.pdf" `
        -outputPath "TMUA-Official\TMUA_${year}_Paper2.pdf" `
        -description "TMUA $year Paper 2"
    
    Download-File `
        -url "$tmuaBase/$year-10/TMUA_${year}_Solutions.pdf" `
        -outputPath "TMUA-Official\TMUA_${year}_Solutions.pdf" `
        -description "TMUA $year Solutions"
}

# TMUA Specification and Logic Notes
Download-File `
    -url "https://esat-tmua.ac.uk/sites/default/files/TMUA_Specification.pdf" `
    -outputPath "TMUA-Official\TMUA_Specification.pdf" `
    -description "TMUA Specification"

Download-File `
    -url "https://esat-tmua.ac.uk/sites/default/files/Logic_and_Proof_Notes.pdf" `
    -outputPath "TMUA-Official\Logic_and_Proof_Notes.pdf" `
    -description "TMUA Logic and Proof Notes"

# ============================================================
# MAT Papers (2024, 2023, 2022) - Priority 1
# ============================================================
Write-Host "`n=== MAT Oxford Papers ===" -ForegroundColor Cyan

$matYears = @(2024, 2023, 2022)
$matBase = "https://www.maths.ox.ac.uk/system/files/attachments"

foreach ($year in $matYears) {
    Download-File `
        -url "$matBase/${year}_MAT_paper.pdf" `
        -outputPath "MAT\MAT_${year}_paper.pdf" `
        -description "MAT $year Paper"
    
    Download-File `
        -url "$matBase/${year}_MAT_solutions.pdf" `
        -outputPath "MAT\MAT_${year}_solutions.pdf" `
        -description "MAT $year Solutions"
}

# ============================================================
# STEP Foundation Modules - Priority 1
# ============================================================
Write-Host "`n=== STEP Foundation Modules ===" -ForegroundColor Cyan

$stepModules = @(
    @{num=1; name="Introduction"},
    @{num=2; name="Algebra"}
)

foreach ($module in $stepModules) {
    Download-File `
        -url "https://maths.org/step/sites/maths.org.step/files/STEP%20Support%20-%20Module%20$($module.num).pdf" `
        -outputPath "STEP-Foundation\STEP_Module_$($module.num)_$($module.name).pdf" `
        -description "STEP Foundation Module $($module.num) - $($module.name)"
}

# ============================================================
# Summary
# ============================================================
Write-Host "`n======================================================" -ForegroundColor Cyan
Write-Host "Download Summary" -ForegroundColor Cyan
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "Total attempts:     $totalDownloads" -ForegroundColor White
Write-Host "Successful:         $successfulDownloads" -ForegroundColor Green
Write-Host "Failed:             $failedDownloads" -ForegroundColor Red
Write-Host ""

if ($failedDownloads -eq 0) {
    Write-Host "[OK] All downloads completed successfully!" -ForegroundColor Green
} else {
    Write-Host "[!] Some downloads failed. Check URLs in DOWNLOAD-LINKS.md" -ForegroundColor Yellow
    Write-Host "    Official websites may have changed file locations." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Review downloaded files in each folder" -ForegroundColor White
Write-Host "2. Verify PDFs open correctly" -ForegroundColor White
Write-Host "3. See DOWNLOAD-LINKS.md for additional resources" -ForegroundColor White
Write-Host "4. Run this script again to download more papers as needed" -ForegroundColor White
Write-Host ""

# List downloaded files
Write-Host "Downloaded files by folder:" -ForegroundColor Cyan
foreach ($folder in $folders) {
    if (Test-Path $folder) {
        $files = Get-ChildItem $folder -Filter *.pdf
        if ($files.Count -gt 0) {
            Write-Host ""
            Write-Host "$folder - $($files.Count) files:" -ForegroundColor Yellow
            $files | ForEach-Object {
                $sizeMB = [math]::Round($_.Length/1MB, 2)
                Write-Host "  - $($_.Name) - $sizeMB MB" -ForegroundColor Gray
            }
        }
    }
}

Write-Host ""
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
Write-Host "Script completed at: $timestamp" -ForegroundColor Cyan
