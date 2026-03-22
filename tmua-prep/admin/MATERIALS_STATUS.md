# TMUA Materials Status

**Last Updated:** 2026-03-22  
**Location:** `C:\code\mia-develop\tmua-prep`

---

## ✅ Downloaded Materials

### Official TMUA Papers (2016-2023) - COMPLETE
**Location:** `past-papers/TMUA-Official/`  
**Status:** ✅ 45 files downloaded (2026-03-22)

**Contents:**
- **2016-2023 Exam Papers:** 16 papers (Paper 1 & 2 for each year)
- **Worked Solutions:** 16 complete solution sets
- **Answer Keys:** 9 quick answer keys
- **Specimen Papers:** 2 specimen papers with solutions

**Files:**
```
TMUA_2016_Paper_1.pdf
TMUA_2016_Paper_1_Solutions.pdf
TMUA_2016_Paper_2.pdf
TMUA_2016_Paper_2_Solutions.pdf
TMUA_2016_Answer_Keys.pdf
... (and so on for 2017-2023)
TMUA_Specimen_Paper_1.pdf
TMUA_Specimen_Paper_1_Solutions.pdf
TMUA_Specimen_Paper_2.pdf
TMUA_Specimen_Paper_2_Solutions.pdf
TMUA_Specimen_Answer_Keys.pdf
```

---

### MAT Papers (2022-2025) - COMPLETE
**Location:** `past-papers/MAT/`  
**Status:** ✅ 8 files

**Contents:**
- MAT 2022, 2023, 2024, 2025
- With solutions and feedback
- **Note:** MAT discontinued in 2026, Oxford now uses TMUA

---

### STEP Foundation Materials
**Location:** `past-papers/STEP-Foundation/`  
**Status:** ✅ 3 files

**Contents:**
- Foundation modules assignments
- STEP 2 2023 mock
- Assignment feedback

---

## ⚠️ Manual Download Required

### Jacqueline Taylor Mock Papers (Sets A, B, C, D)
**Target Location:** `practice-tests/Jacqueline-Taylor-Mocks/`  
**Status:** ⚠️ NOT downloaded (requires manual browser download)

**What to download:** 12 PDFs total
- Mock Set A: Paper 1, Paper 2, Solutions
- Mock Set B: Paper 1, Paper 2, Solutions
- Mock Set C: Paper 1, Paper 2, Solutions
- Mock Set D: Paper 1, Paper 2, Solutions

**Instructions:** See `resources/Jacqueline-Taylor-Mocks-README.md`  
**Download from:** https://www.tylertutoring.com/tmua-exam-papers (scroll to bottom)

---

## 💻 Digital Practice (2024+ Format)

### Pearson VUE Computer-Based Practice
**Status:** ⚠️ Account setup required

**TMUA went digital in 2024** - all exams now computer-based!

**Available Practice:**
- **Specimen Test:** Familiarize with interface
- **Practice Test:** Full timed simulation
- **Link:** https://www.pearsonvue.com/us/en/uatuk.html

**Action Required:**
1. Create Pearson VUE account
2. Complete specimen test (get familiar with navigation)
3. Complete timed practice test (full exam simulation)
4. **CRITICAL:** Your daughter MUST practice digital interface before exam day!

---

## 📋 Missing/To Download

### 2025-2026 TMUA Specification
**Status:** ⚠️ Need to download

**Where to find:**
- Official TMUA website: https://esat-tmua.ac.uk/
- Pearson VUE: https://www.pearsonvue.com/us/en/uatuk.html

**Action:** Download latest spec PDF, save to `resources/`

---

## 🔄 Weekly Automated Checks

**Cron Job:** `weekly-tmua-materials-check`  
**Schedule:** Every Sunday at 5:00 PM  
**Location:** ⚠️ **UPDATE NEEDED** → Should check `C:\code\mia-develop\tmua-prep` (currently checking old path)

**What it checks:**
- New TMUA papers released
- Updates to Jacqueline Taylor mocks
- New practice materials
- Specification updates

**Last check:** 2026-03-22 (found complete TMUA collection, downloaded successfully)

---

## 📊 Collection Summary

| Category | Status | Count | Notes |
|----------|--------|-------|-------|
| **Official TMUA (2016-2023)** | ✅ Complete | 45 files | All papers + solutions |
| **MAT Papers** | ✅ Complete | 8 files | MAT discontinued 2026 |
| **STEP Foundation** | ✅ Available | 3 files | Practice materials |
| **Jacqueline Taylor Mocks** | ⚠️ Manual download | 0 / 12 | See instructions in resources/ |
| **Pearson VUE Practice** | ⚠️ Account setup | N/A | Digital interface practice |
| **TMUA Specification** | ⚠️ Need to download | 0 | 2025-2026 version |

---

## 🎯 Next Actions

1. ⚠️ **Download Jacqueline Taylor mocks** (4 sets, 12 PDFs)
   - Visit tylertutoring.com/tmua-exam-papers
   - Scroll to bottom, download all sets
   - Save to `practice-tests/Jacqueline-Taylor-Mocks/`

2. ⚠️ **Set up Pearson VUE account**
   - Go to pearsonvue.com/us/en/uatuk.html
   - Create account
   - Complete specimen test
   - Complete practice test

3. ⚠️ **Download 2025-2026 TMUA Specification**
   - Get from esat-tmua.ac.uk
   - Save to `resources/`

4. ✅ **Update cron job path**
   - Change from `C:\code\tmua-prep` to `C:\code\mia-develop\tmua-prep`
   - See CRON_UPDATE_NOTE.md

---

## 📁 Directory Structure

```
C:\code\mia-develop\tmua-prep/
├── past-papers/
│   ├── TMUA-Official/     ✅ 45 files (2016-2023 complete)
│   ├── MAT/               ✅ 8 files
│   ├── STEP-Foundation/   ✅ 3 files
│   ├── AMC12/
│   └── PAT/
├── practice-tests/
│   └── Jacqueline-Taylor-Mocks/  ⚠️ Empty (need manual download)
├── resources/
│   └── Jacqueline-Taylor-Mocks-README.md  ✅ Download instructions
├── anki-decks/
├── notes/
├── progress-tracking/
├── download-tmua.ps1           ✅ Download script (if needed)
├── download-official-papers.ps1  ✅ Backup download script
├── DOWNLOAD_SUMMARY_2026-03-22.md  ✅ Full download report
├── weekly-update-2026-03-22.md     ✅ Latest weekly check
└── README.md
```

---

**All official TMUA materials (2016-2023) are now ready for practice!** 🎯

**Critical next steps:** Jacqueline Taylor mocks + Pearson VUE digital practice
