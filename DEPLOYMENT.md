# 🚀 Streamlit Cloud Deployment Guide

## Quick Start to Production

### 1. **Prepare Your GitHub Repository**

```bash
# Navigate to project directory
cd AI3050_AML

# Initialize git (if not already done)
git init

# Add all files (important: .gitignore will exclude venv and secrets)
git add .
git commit -m "Chess RL AI - Ready for deployment"
git branch -M main

# Add your GitHub repo as remote
git remote add origin https://github.com/YOUR_USERNAME/chess-rl-ai.git

# Push to GitHub
git push -u origin main
```

### 2. **Verify Project Structure**

Ensure your project has these files:

```
├── app.py                    ✅ Main application
├── requirements.txt          ✅ Python dependencies
├── .streamlit/
│   ├── config.toml          ✅ Production config
│   └── secrets.example.toml  ✅ Secrets template (won't deploy)
├── .gitignore               ✅ Excludes venv, secrets, etc.
└── README.md                ✅ Documentation
```

### 3. **Deploy on Streamlit Cloud**

**Option A: Via Web UI (Easiest)**

1. Visit https://share.streamlit.io
2. Click **"New app"** button (top right)
3. Sign in with GitHub
4. Select deployment settings:
   - **GitHub account**: `YOUR_USERNAME`
   - **Repository**: `chess-rl-ai`
   - **Branch**: `main`
   - **Main file**: `app.py`
5. Click **Deploy** and wait (2-3 minutes typically)

**Option B: Via Command Line**

```bash
# Install Streamlit CLI
pip install streamlit

# Deploy directly
streamlit run app.py --logger.level=info --client.toolbarMode=minimal
```

### 4. **Your Live URL**

Once deployed, your app will be available at:

```
https://YOUR_USERNAME-chess-rl-ai-XXXXX.streamlit.app
```

---

## ⚙️ Configuration Details

### `.streamlit/config.toml` (Production Settings)

```toml
[theme]
primaryColor = "#D4AF37"           # Gold accent color
backgroundColor = "#0D0D0D"         # Dark theme
secondaryBackgroundColor = "#161616"
textColor = "#E8E8E8"
font = "sans serif"

[server]
headless = true                     # Required for Streamlit Cloud
enableCORS = false                  # Security
enableXsrfProtection = false        # Security
maxUploadSize = 200                 # 200MB max upload

[client]
showErrorDetails = false            # Hide sensitive info in production
toolbarMode = "minimal"             # Minimal UI

[global]
developmentMode = false             # Production mode
dataFrameSerialization = "arrow"    # Efficient serialization
```

### `.gitignore` (Prevents Uploading Secrets)

```
venv/                    # Virtual environment
.streamlit/secrets.toml  # NEVER commit secrets
__pycache__/            # Python cache
.env                    # Environment variables
```

---

## 🔐 Secrets Management (Optional)

If your app needs API keys or credentials:

1. **Create secrets locally** (`.streamlit/secrets.toml`):
   ```toml
   api_key = "your_secret_key_here"
   ```

2. **In Streamlit Cloud**:
   - Go to app settings (⚙️ icon)
   - Paste your secrets in the "Secrets" section
   - **Never commit `secrets.toml` to GitHub**

3. **Access in code**:
   ```python
   import streamlit as st
   api_key = st.secrets["api_key"]
   ```

---

## 📋 Deployment Checklist

- [ ] `requirements.txt` has all dependencies
- [ ] No hardcoded file paths (use relative paths)
- [ ] No local API keys/secrets in code
- [ ] `.gitignore` excludes `venv/` and `.streamlit/secrets.toml`
- [ ] `app.py` runs without errors locally
- [ ] `.streamlit/config.toml` has `headless = true`
- [ ] README has clear instructions
- [ ] GitHub repo is public (or you have Streamlit Pro)
- [ ] `git push` completed successfully

---

## 🐛 Troubleshooting

### App crashes after deployment

**Check logs**: Click "Manage app" → "Logs" in Streamlit Cloud

### Dependencies not installing

**Ensure requirements.txt is correct**:
```bash
# Generate clean requirements
pip freeze > requirements.txt
```

### Module not found errors

**Verify imports work locally first**:
```bash
python -c "import chess; print(chess.__version__)"
```

### App is slow

**Common causes**:
- Streamlit Cloud free tier has limited resources
- Heavy computations on first load
- Try upgrading to Streamlit Pro for better performance

---

## 📊 Monitoring & Updates

### View App Status
- Dashboard: https://share.streamlit.io
- App logs: Click app → Manage → Logs

### Update Your App
```bash
# Make changes locally
git add .
git commit -m "Update: description of changes"
git push origin main

# App auto-redeploys on push!
```

### Redeploy Manually
1. Go to app settings (⚙️)
2. Click "Reboot" or "Redeploy"

---

## 🎯 Performance Tips

1. **Cache heavy computations**:
   ```python
   @st.cache_data
   def load_model():
       return expensive_model()
   ```

2. **Use `st.session_state` for interactivity**:
   ```python
   if 'counter' not in st.session_state:
       st.session_state.counter = 0
   ```

3. **Minimize imports on every run**:
   - Put heavy imports inside functions if not needed globally

---

## ✅ You're Ready!

Your Chess RL AI is now production-ready! 🎉

For more info: https://docs.streamlit.io/deploy/streamlit-cloud
