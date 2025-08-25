# 🚀 Kvatch CLI

**Kvatch CLI** lets you query multiple data sources — databases, files, APIs (coming soon) — as if they were a single SQL database.  
Run it **locally for free**, or sign up for early access to the upcoming **remote mode** for multi-user collaboration and orchestration.

---

## ✨ Features

- 🔄 **Query anything with SQL** — CSV, JSON, SQLite, Postgres, APIs (coming soon) and more
- 🧱 **Plan-based architecture** — Define everything in one YAML or JSON file
- 💻 **Local mode (Free)** — All processing happens locally, no cloud required
- 🌐 **Remote mode (Coming Soon)** — Share, schedule, and orchestrate data jobs
- ⚙️ **Simple CLI** — One binary, zero dependencies

---

## 📦 Installation (Local Mode)

### Option 1: Install via Homebrew (Recommended)

```bash
brew tap kvatch-hub/tap
brew install kvatch
```

Then confirm it’s working:

```bash
kvatch --version
```


#### ⚠️ If `kvatch` isn’t found:
Make sure Homebrew’s `bin` directory is on your `PATH`.

**Apple Silicon (M1/M2/M3) Macs:**
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

**Intel Macs / Linuxbrew:**
```bash
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
```

---

### Option 2: Download the latest release manually

Visit the [Releases page](https://github.com/kvatch-hub/kvatch-cli/releases/latest) and download the binary for your OS.

**Apple Silicon (M1/M2/M3) Macs**:
```bash
curl -L https://github.com/kvatch-hub/kvatch-cli/releases/latest/download/kvatch-darwin-arm64 -o kvatch
chmod +x kvatch
```

**Intel Macs**:
```bash
curl -L https://github.com/kvatch-hub/kvatch-cli/releases/latest/download/kvatch-darwin-amd64 -o kvatch
chmod +x kvatch
```

**Linux (x86_64)**:
```bash
curl -L https://github.com/kvatch-hub/kvatch-cli/releases/latest/download/kvatch-linux-amd64 -o kvatch
chmod +x kvatch
```

**Windows (PowerShell)**:
```powershell
Invoke-WebRequest https://github.com/kvatch-hub/kvatch-cli/releases/latest/download/kvatch-windows-amd64.exe -OutFile kvatch.exe
```

---

### First Run on macOS

macOS may block the binary since it’s unsigned:

```bash
# Remove quarantine
xattr -d com.apple.quarantine kvatch
./kvatch --help
```

Or:
1. Run the binary (you’ll get a warning)
2. Go to **System Settings → Privacy & Security**
3. Click **Allow Anyway**
4. Re-run `./kvatch`

---

### Confirm it’s working:

```bash
kvatch help
```

### Add to PATH (optional)

```bash
sudo mv kvatch /usr/local/bin/
```

Then try:

```bash
kvatch completion [bash|zsh|fish|powershell]
```

---

### 🔧 Setup the workspace

```bash
# Initialize the local workspace at ~/.kvatch
kvatch init
```

---


## 🧪 Getting started

The easiest way to get started is by running a built-in example, see the [examples](./examples) directory for ready-to-run plans:

- Basic CSV / JSON ingestion
- SQLite and Postgres queries
- Deduplication and joins across sources
- Enterprise-grade federation scenarios

---

## 🧩 How It Works

Kvatch uses a single `plan.yaml` or `plan.json` file to:

- Define **data sources** (CSV, SQLite, Postgres, etc.)
- Configure **datasets** with SQL queries and plugins
- Enable **joins**, **deduplication**, and **storage options**

---

## 🧠 Learn More

- [📄 Plan file format](docs/plan-spec.md) (coming soon)
- [❓ Docs](./docs/README.md)
- [🧪 Examples](./examples)

---

## 💡 Licensing

Kvatch CLI is:
- ✅ **Free** for personal and commercial use in **local mode**
- 🔐 **Paid** for advanced **remote mode** features

### Local Mode (Free)
Everything runs on your machine:
- No internet connection required
- Unlimited connectors, datasets, and joins
- Ideal for analysts, engineers, and builders

### Remote Mode (Paid, Coming Soon)
Advanced collaboration and automation:
- Team-wide access to shared plans and storage
- Scheduled runs and background jobs
- Web UI, access control, audit logs

📝 [Join the waitlist](https://www.kvatch.com/cli#signup) for early access.