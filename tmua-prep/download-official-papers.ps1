# Download all official TMUA papers 2016-2023

$baseUrl = "https://uat-wp.s3.eu-west-2.amazonaws.com/wp-content/uploads"
$outputDir = "C:\code\tmua-prep\materials\official"

# Ensure directory exists
New-Item -ItemType Directory -Path $outputDir -Force | Out-Null

# All TMUA papers 2016-2023
$papers = @(
    # 2016
    @{url="$baseUrl/2024/05/07125112/TMUA-2016-paper-1.pdf"; file="TMUA_2016_Paper_1.pdf"},
    @{url="$baseUrl/2024/05/07125113/TMUA-2016-paper-1-worked-answers.pdf"; file="TMUA_2016_Paper_1_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07125102/TMUA-2016-paper-2.pdf"; file="TMUA_2016_Paper_2.pdf"},
    @{url="$baseUrl/2024/05/07125106/TMUA-2016-paper-2-worked-answers.pdf"; file="TMUA_2016_Paper_2_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07125113/TMUA-2016-answer-keys.pdf"; file="TMUA_2016_Answer_Keys.pdf"},
    
    # 2017
    @{url="$baseUrl/2024/05/07125230/TMUA-2017-paper-1.pdf"; file="TMUA_2017_Paper_1.pdf"},
    @{url="$baseUrl/2024/05/07125231/TMUA-2017-paper-1-worked-answers.pdf"; file="TMUA_2017_Paper_1_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07125224/TMUA-2017-paper-2.pdf"; file="TMUA_2017_Paper_2.pdf"},
    @{url="$baseUrl/2024/05/07125228/TMUA-2017-paper-2-worked-answers.pdf"; file="TMUA_2017_Paper_2_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07125232/TMUA-2017-answer-keys.pdf"; file="TMUA_2017_Answer_Keys.pdf"},
    
    # 2018
    @{url="$baseUrl/2024/05/07125407/TMUA-2018-paper-1.pdf"; file="TMUA_2018_Paper_1.pdf"},
    @{url="$baseUrl/2024/05/07125413/TMUA-2018-paper-1-worked-answers.pdf"; file="TMUA_2018_Paper_1_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07125404/TMUA-2018-paper-2.pdf"; file="TMUA_2018_Paper_2.pdf"},
    @{url="$baseUrl/2024/05/07125406/TMUA-2018-paper-2-worked-answers.pdf"; file="TMUA_2018_Paper_2_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07125413/TMUA-2018-answer-keys.pdf"; file="TMUA_2018_Answer_Keys.pdf"},
    
    # 2019
    @{url="$baseUrl/2024/05/07140825/TMUA-2019-paper-1.pdf"; file="TMUA_2019_Paper_1.pdf"},
    @{url="$baseUrl/2024/05/07140826/TMUA-2019-paper-1-worked-answers.pdf"; file="TMUA_2019_Paper_1_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07140823/TMUA-2019-paper-2.pdf"; file="TMUA_2019_Paper_2.pdf"},
    @{url="$baseUrl/2024/05/07140824/TMUA-2019-paper-2-worked-answers.pdf"; file="TMUA_2019_Paper_2_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07140827/TMUA-2019-answer-keys.pdf"; file="TMUA_2019_Answer_Keys.pdf"},
    
    # 2020
    @{url="$baseUrl/2024/05/07140953/TMUA-2020-paper-1.pdf"; file="TMUA_2020_Paper_1.pdf"},
    @{url="$baseUrl/2024/05/07140955/TMUA-2020-paper-1-worked-answers.pdf"; file="TMUA_2020_Paper_1_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07140951/TMUA-2020-paper-2.pdf"; file="TMUA_2020_Paper_2.pdf"},
    @{url="$baseUrl/2024/05/07140952/TMUA-2020-paper-2-worked-answers.pdf"; file="TMUA_2020_Paper_2_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07140956/TMUA-2020-answer-keys.pdf"; file="TMUA_2020_Answer_Keys.pdf"},
    
    # 2021
    @{url="$baseUrl/2024/05/07141119/TMUA-2021-paper-1.pdf"; file="TMUA_2021_Paper_1.pdf"},
    @{url="$baseUrl/2024/05/07141121/TMUA-2021-paper-1-worked-answers.pdf"; file="TMUA_2021_Paper_1_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07141117/TMUA-2021-paper-2.pdf"; file="TMUA_2021_Paper_2.pdf"},
    @{url="$baseUrl/2024/05/07141118/TMUA-2021-paper-2-worked-answers.pdf"; file="TMUA_2021_Paper_2_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07141122/TMUA-2021-answer-keys.pdf"; file="TMUA_2021_Answer_Keys.pdf"},
    
    # 2022
    @{url="$baseUrl/2024/05/07141241/TMUA-2022-paper-1.pdf"; file="TMUA_2022_Paper_1.pdf"},
    @{url="$baseUrl/2024/06/04105226/TMUA-2022-paper-1-worked-answers.pdf"; file="TMUA_2022_Paper_1_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07141239/TMUA-2022-paper-2.pdf"; file="TMUA_2022_Paper_2.pdf"},
    @{url="$baseUrl/2024/06/04105227/TMUA-2022-paper-2-worked-answers.pdf"; file="TMUA_2022_Paper_2_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07141242/TMUA-2022-answer-keys.pdf"; file="TMUA_2022_Answer_Keys.pdf"},
    
    # 2023
    @{url="$baseUrl/2024/04/30144109/TMUA-2023-paper-1.pdf"; file="TMUA_2023_Paper_1.pdf"},
    @{url="$baseUrl/2024/06/04105227/TMUA-2023-paper-1-worked-answers.pdf"; file="TMUA_2023_Paper_1_Solutions.pdf"},
    @{url="$baseUrl/2024/04/30144111/TMUA-2023-paper-2.pdf"; file="TMUA_2023_Paper_2.pdf"},
    @{url="$baseUrl/2024/06/04105226/TMUA-2023-paper-2-worked-answers.pdf"; file="TMUA_2023_Paper_2_Solutions.pdf"},
    @{url="$baseUrl/2024/04/30144123/TMUA-2023-answer-keys.pdf"; file="TMUA_2023_Answer_Keys.pdf"},
    
    # Specimen papers
    @{url="$baseUrl/2024/05/07141417/TMUA-early-specimen-paper-1.pdf"; file="TMUA_Specimen_Paper_1.pdf"},
    @{url="$baseUrl/2024/05/07141418/TMUA-early-specimen-paper-1-worked-answers.pdf"; file="TMUA_Specimen_Paper_1_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07141413/TMUA-early-specimen-paper-2.pdf"; file="TMUA_Specimen_Paper_2.pdf"},
    @{url="$baseUrl/2024/05/07141415/TMUA-early-specimen-paper-2-worked-answers.pdf"; file="TMUA_Specimen_Paper_2_Solutions.pdf"},
    @{url="$baseUrl/2024/05/07141414/TMUA-early-specimen-paper-answer-keys.pdf"; file="TMUA_Specimen_Answer_Keys.pdf"}
)

Write-Host "Downloading $($papers.Count) TMUA papers..."

$count = 0
foreach ($paper in $papers) {
    $count++
    $outputPath = Join-Path $outputDir $paper.file
    
    # Skip if already exists
    if (Test-Path $outputPath) {
        Write-Host "[$count/$($papers.Count)] Already exists: $($paper.file)"
        continue
    }
    
    Write-Host "[$count/$($papers.Count)] Downloading: $($paper.file)"
    try {
        Invoke-WebRequest -Uri $paper.url -OutFile $outputPath -ErrorAction Stop
        Write-Host "  ✓ Success"
    } catch {
        Write-Host "  ✗ Failed: $_" -ForegroundColor Red
    }
    
    # Small delay to be polite
    Start-Sleep -Milliseconds 500
}

Write-Host ""
Write-Host "Download complete! Files saved to:" $outputDir
