# ⚠️ CRON JOB PATH UPDATE REQUIRED

**Date:** 2026-03-22  
**Issue:** Weekly TMUA materials check using wrong path

---

## Problem

The weekly cron job `weekly-tmua-materials-check` has been checking:
- **OLD PATH:** `C:\code\tmua-prep`

But the actual version-controlled project is at:
- **CORRECT PATH:** `C:\code\mia-develop\tmua-prep`

---

## What Happened

The cron job was working fine and downloaded all materials successfully (45 TMUA papers, etc.), but to the wrong location.

**On 2026-03-22:**
- All content from `C:\code\tmua-prep` was migrated to `C:\code\mia-develop\tmua-prep`
- Folder structure adapted to match mia-develop organization
- All materials now in correct location

---

## Action Required

**Update the cron job configuration to use the correct path:**

### OpenClaw Cron Job Configuration

**Job name:** `weekly-tmua-materials-check`

**Current configuration (WRONG):**
```bash
# Working directory: C:\code\tmua-prep
```

**Should be (CORRECT):**
```bash
# Working directory: C:\code\mia-develop\tmua-prep
```

---

## How to Update

**Option 1: Via OpenClaw CLI**
```bash
# List current cron jobs
openclaw cron list

# Update the job (if supported)
openclaw cron update weekly-tmua-materials-check --workdir C:\code\mia-develop\tmua-prep
```

**Option 2: Recreate the job**
```bash
# Delete old job
openclaw cron delete weekly-tmua-materials-check

# Create new job with correct path
openclaw cron create weekly-tmua-materials-check \
  --schedule "0 17 * * SUN" \
  --workdir "C:\code\mia-develop\tmua-prep" \
  --command "<original command>"
```

**Option 3: Edit configuration file directly**
- Find OpenClaw cron config file
- Update `workdir` or `cwd` field
- Restart OpenClaw gateway

---

## Verification

After updating, verify:

1. **Check job configuration:**
   ```bash
   openclaw cron describe weekly-tmua-materials-check
   ```
   
2. **Verify working directory:**
   - Should show: `C:\code\mia-develop\tmua-prep`

3. **Test run (optional):**
   ```bash
   openclaw cron run weekly-tmua-materials-check --now
   ```

4. **Check output location:**
   - New files should appear in `C:\code\mia-develop\tmua-prep\`
   - NOT in `C:\code\tmua-prep\`

---

## Migration Completed

**Files migrated from `C:\code\tmua-prep` to `C:\code\mia-develop\tmua-prep`:**

✅ **Past papers:**
- 45 TMUA official papers (2016-2023) → `past-papers/TMUA-Official/`
- 8 MAT papers → `past-papers/MAT/`
- 3 STEP Foundation files → `past-papers/STEP-Foundation/`

✅ **Documentation:**
- `DOWNLOAD_SUMMARY_2026-03-22.md`
- `weekly-update-2026-03-22.md` (and previous weeks)
- Jacqueline Taylor instructions → `resources/`

✅ **Scripts:**
- `download-tmua.ps1`
- `download-official-papers.ps1`

✅ **New files created:**
- `MATERIALS_STATUS.md` - Complete materials inventory
- `CRON_UPDATE_NOTE.md` - This file

---

## Cleanup (Optional)

**Once cron job updated and verified:**

You can safely delete the old location:
```powershell
# Backup first (just in case)
Rename-Item C:\code\tmua-prep C:\code\tmua-prep.old

# Or remove entirely if confirmed working
Remove-Item C:\code\tmua-prep -Recurse -Force
```

**Do NOT delete until:**
- [ ] Cron job updated
- [ ] Next weekly run successful
- [ ] Output appears in correct location

---

## For Helpful Bob (Future Reference)

**When running weekly TMUA materials check:**

1. **Working directory:** `C:\code\mia-develop\tmua-prep`
2. **Download location:** `past-papers/TMUA-Official/`
3. **Update files:** `weekly-update-YYYY-MM-DD.md`
4. **Status file:** `MATERIALS_STATUS.md`

**Folder mapping:**
- Downloaded papers → `past-papers/TMUA-Official/`
- MAT papers → `past-papers/MAT/`
- STEP materials → `past-papers/STEP-Foundation/`
- Jacqueline Taylor → `practice-tests/Jacqueline-Taylor-Mocks/` (manual download required)

---

**Status:** ⚠️ Awaiting cron job configuration update

**Once updated:** This note can be archived/deleted
