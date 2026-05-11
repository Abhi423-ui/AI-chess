# 🚀 Quick Start - Streamlit Cloud Deployment

## One-Minute Setup

### For Windows Users
```bash
# Run the deployment script
deploy.bat

# Or manually:
git init
git add .
git commit -m "Chess RL AI - Deployment"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/chess-rl-ai.git
git push -u origin main
```

### For macOS/Linux Users
```bash
chmod +x deploy.sh
./deploy.sh
```

## Then on Streamlit Cloud

1. Go to: https://share.streamlit.io
2. Click: **"New app"** (top right)
3. Select: Your **chess-rl-ai** repository
4. Set: **app.py** as main file
5. Click: **Deploy** ✅

## 📊 What's Configured

| Component | Status | Details |
|-----------|--------|---------|
| `app.py` | ✅ | Chess AI application |
| `requirements.txt` | ✅ | streamlit, chess |
| `.streamlit/config.toml` | ✅ | Production settings |
| `.gitignore` | ✅ | Excludes venv & secrets |
| `DEPLOYMENT.md` | ✅ | Detailed guide |
| `deploy.bat` / `deploy.sh` | ✅ | One-click deployment |

## 🎯 Key Features

✨ **Already Configured for Cloud:**
- Headless mode enabled
- Security hardened (CORS, CSRF protection)
- Dark theme with gold accents
- Minimal toolbar
- Production logging
- No file dependencies

⚡ **Performance Ready:**
- No external databases
- Stateless application
- Efficient serialization (Arrow)
- Cached board evaluation

🔐 **Security:**
- Secrets template included
- No hardcoded credentials
- Version control prepared

## 🆘 Troubleshooting

**Can't find "New app" button?**
- Make sure you're logged in at https://share.streamlit.io
- Try clearing browser cache

**Deployment failed?**
- Check: `requirements.txt` has all imports from `app.py`
- Check: `app.py` runs locally without errors
- See: `DEPLOYMENT.md` for detailed troubleshooting

**App is slow?**
- First load is slower (cold start)
- Consider Streamlit Pro for faster deployments
- See: Performance tips in `DEPLOYMENT.md`

## 📚 Documentation

- **`README.md`** — Overview & quick start
- **`DEPLOYMENT.md`** — Detailed deployment guide
- **`STREAMLIT_CONFIG.md`** — Configuration details
- **`deploy.sh`** / **`deploy.bat`** — Automated deployment

## ✅ Deployment Checklist

Before deploying:
- [ ] Tested locally with `streamlit run app.py`
- [ ] No hardcoded file paths in code
- [ ] All imports in `requirements.txt`
- [ ] `.gitignore` exists and updated
- [ ] GitHub account created
- [ ] Repository pushed to GitHub
- [ ] Streamlit Cloud account created

## 🎉 Done!

Your Chess RL AI is now production-ready on Streamlit Cloud!

**Questions?** See `DEPLOYMENT.md` or visit https://docs.streamlit.io
