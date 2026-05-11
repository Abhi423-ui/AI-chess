# ♟️ Chess RL AI — BTAIC602 CA-II

**Advanced Machine Learning | Reinforcement Learning Project**

A fully playable Chess AI built using Reinforcement Learning concepts:
- **Minimax Algorithm** with Alpha-Beta Pruning
- **Piece-Square Tables** for positional evaluation
- **Move Ordering** heuristics (captures → checks → quiet)
- **Material + Positional** board evaluation function

---

## 🚀 Deployed on Streamlit Cloud (Global Link)

(https://ai-chess-gpjiwxldkv5csqkavdo8ac.streamlit.app/)

### Step 1 — Initialize Git & Push to GitHub
```bash
# Initialize git repository
git init
git add .
git commit -m "Chess RL AI - BTAIC602 CA-II"
git branch -M main

# Add your GitHub repository
git remote add origin https://github.com/YOUR_USERNAME/chess-rl-ai.git
git push -u origin main
```

### Step 2 — Deploy on Streamlit Cloud
1. Go to **https://share.streamlit.io**
2. Click **"New app"** (top right)
3. Connect your GitHub account if prompted
4. Select:
   - **Repository**: `YOUR_USERNAME/chess-rl-ai`
   - **Branch**: `main`
   - **Main file path**: `app.py`
5. Click **Deploy** ✅

### ✨ Your Live App
Once deployed, access your app at:  
`https://YOUR_USERNAME-chess-rl-ai-XXXXX.streamlit.app`

### Configuration Files
- **`.streamlit/config.toml`** — Production-ready settings (headless, CORS, theme)
- **`.streamlit/secrets.example.toml`** — Template for secrets (if needed)
- **`.gitignore`** — Excludes sensitive files from version control

---

## 🖥️ Run Locally

```bash
# Create virtual environment
python -m venv venv
.\venv\Scripts\Activate  # Windows
# or
source venv/bin/activate  # macOS/Linux

# Install dependencies
pip install -r requirements.txt

# Run the app
streamlit run app.py
```

The app will be available at `http://localhost:8501`

---

## 📚 Methodology (in Sidebar)

| Section | Content |
|---------|---------|
| What is RL? | Agent, Environment, State, Action, Reward |
| Minimax + Alpha-Beta | Tree search, pruning, complexity |
| Board Evaluation | Material values, PST |
| Move Ordering | Captures, checks, quiet moves |
| RL Connection | AlphaZero comparison |
| Complexity Analysis | Nodes explored at each depth |

---

## 🎮 How to Play

- Enter moves in **UCI notation**: `e2e4`, `g1f3`, `e1g1` (castle), `e7e8q` (promote)
- Choose difficulty: Beginner / Intermediate / Advanced / Expert
- Play as White or Black
- Use the **Hint** button if stuck

---

*BTAIC602 · Advanced Machine Learning · CA-II · Reinforcement Learning*
