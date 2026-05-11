# ✅ Pre-Deployment Checklist

## Essential Requirements

### Code & Files
- [ ] `app.py` exists and runs locally without errors
- [ ] `requirements.txt` has **all** dependencies
  ```bash
  # Test this locally:
  pip install -r requirements.txt
  ```
- [ ] `.streamlit/config.toml` has `headless = true`
- [ ] `.gitignore` excludes `venv/` and `.streamlit/secrets.toml`

### Git & GitHub
- [ ] GitHub account created (https://github.com)
- [ ] Repository created on GitHub
- [ ] `git remote` is configured
  ```bash
  git remote -v  # Should show origin URL
  ```
- [ ] All changes committed and pushed
  ```bash
  git status     # Should show "nothing to commit"
  git log        # Should show your commits
  ```

### Local Testing
- [ ] App runs locally with:
  ```bash
  streamlit run app.py
  ```
- [ ] No error messages in terminal
- [ ] UI loads correctly in browser at `http://localhost:8501`
- [ ] All interactive elements work (buttons, inputs, etc.)

### Dependencies Check
- [ ] All `import` statements in `app.py` are in `requirements.txt`
- [ ] Test with fresh environment:
  ```bash
  python -m venv test_env
  test_env\Scripts\activate  # Windows
  pip install -r requirements.txt
  ```

### Security & Secrets
- [ ] No hardcoded API keys in `app.py`
- [ ] No passwords or secrets in code
- [ ] `.gitignore` includes `.streamlit/secrets.toml`
- [ ] If using secrets:
  - [ ] `.streamlit/secrets.toml` exists locally (not committed)
  - [ ] Ready to add secrets via Streamlit Cloud dashboard

### File Paths
- [ ] No absolute file paths (C:\Users\..., /home/user/...)
- [ ] Using relative paths for any file operations
- [ ] No dependencies on local folders outside project

---

## Pre-Push Verification

### Run these commands:

```bash
# 1. Check git status
git status

# 2. See what will be pushed
git log -1 --oneline

# 3. Verify remote is correct
git remote -v

# 4. Check .gitignore
cat .gitignore | grep -E "venv|secrets"

# 5. Verify app runs
streamlit run app.py
```

**All commands should succeed without errors!**

---

## Streamlit Cloud Readiness

### Final Checks

| Requirement | Check | Status |
|-------------|-------|--------|
| Repository is public | Anyone can view | [ ] |
| GitHub has all latest code | `git push` completed | [ ] |
| Main branch is `main` | `git branch` shows `main` | [ ] |
| `app.py` at root level | Not in subfolder | [ ] |
| `requirements.txt` at root | All deps listed | [ ] |
| `.streamlit/config.toml` exists | Has correct settings | [ ] |
| No venv committed | `.gitignore` excludes it | [ ] |
| No secrets committed | `.gitignore` excludes secrets | [ ] |

---

## Deployment Steps

### Step 1: Final Git Push
```bash
git add .
git commit -m "Final deployment prep"
git push origin main
```

### Step 2: Streamlit Cloud
1. Visit: https://share.streamlit.io
2. Sign in with GitHub
3. Click "New app"
4. Select repository: `chess-rl-ai`
5. Select branch: `main`
6. Set main file: `app.py`
7. Click "Deploy"

### Step 3: Wait & Monitor
- First deployment: 2-5 minutes
- Watch the logs for any errors
- Refresh page once deployment shows "Running"

---

## Post-Deployment

### Verify Your Live App

- [ ] App loads without errors
- [ ] No error messages in Streamlit Cloud logs
- [ ] All UI elements are visible
- [ ] Interactive features work
- [ ] Performance is acceptable

### Monitor & Update

```bash
# To make updates:
git add .
git commit -m "Update: description"
git push origin main

# Auto-redeployed! Check logs in Streamlit Cloud
```

---

## 🆘 Common Issues & Solutions

| Issue | Cause | Solution |
|-------|-------|----------|
| "Module not found" | Missing from `requirements.txt` | Add to requirements.txt and `git push` |
| App doesn't start | Syntax error in `app.py` | Test locally first |
| Slow performance | First load or large files | Check logs, consider Streamlit Pro |
| "Headless not enabled" | Config issue | Update `.streamlit/config.toml` with `headless = true` |
| Can't log in | GitHub account not connected | Sign up at https://share.streamlit.io |

---

## 📞 Getting Help

1. **Streamlit Docs**: https://docs.streamlit.io/deploy/streamlit-cloud
2. **Community**: https://discuss.streamlit.io
3. **This Project**: See `DEPLOYMENT.md` for detailed guide

---

## ✨ You're Ready!

✅ All checks passed?

**Your app is ready for Streamlit Cloud!**

Run: `deploy.bat` (Windows) or `./deploy.sh` (macOS/Linux)

Or manually:
1. `git push origin main`
2. Visit https://share.streamlit.io
3. Click "New app" and deploy!

🎉 Good luck! Your Chess RL AI will be live soon!
