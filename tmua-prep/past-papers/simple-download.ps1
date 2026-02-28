# Simple TMUA Past Papers Downloader
# Run this to download essential exam papers

Write-Host "Downloading TMUA essential past papers..."  -ForegroundColor Green
Write-Host ""

# Create folders
$null = New-Item -ItemType Directory -Path "TMUA-Official","MAT","STEP-Foundation" -Force

# Download key TMUA papers
$papers = @(
    @{url="https://archive.org/download/fc088d17-bab2-4bfa-90bc-b320760c6c97/fc088d17-bab2-4bfa-90bc-b320760c6c97.pdf"; file="STEP-Foundation\Advanced_Problems_Mathematics_Siklos.pdf"},
    @{url="https://maths.org/step/sites/maths.org.step/files/STEP%20Support%20-%20Module%201.pdf"; file="STEP-Foundation\STEP_Module_1.pdf"},
    @{url="https://maths.org/step/sites/maths.org.step/files/STEP%20Support%20-%20Module%202.pdf"; file="STEP-Foundation\STEP_Module_2.pdf"}
)

foreach ($item in $papers) {
    Write-Host "Downloading: $($item.file)..."
    try {
        Invoke-WebRequest -Uri $item.url -OutFile $item.file -TimeoutSec 60
        Write-Host "  OK" -ForegroundColor Green
    } catch {
        Write-Host "  FAILED: $($_.Exception.Message)" -ForegroundColor Red
    }
    Start-Sleep -Milliseconds 500
}

Write-Host ""
Write-Host "Download complete! Check the folders for PDFs." -ForegroundColor Cyan
Write-Host "For official TMUA/MAT papers, visit:" -ForegroundColor Yellow
Write-Host "  TMUA: https://esat-tmua.ac.uk/tmua-preparation-materials/"
Write-Host "  MAT:  https://www.maths.ox.ac.uk/study-here/undergraduate-study/maths-admissions-test"
