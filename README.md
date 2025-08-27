# 🚀 Kvatch CLI

**Kvatch CLI** lets you query multiple data sources — databases, files, and (soon) APIs — as if they were a single SQL database.  
Run it **locally for free**, or sign up for early access to the upcoming **remote mode** for team collaboration and orchestration.

---

## ✨ Features

- 🔄 **Query anything with SQL** — CSV, JSON, SQLite, Postgres, APIs (coming soon), and more  
- 🧱 **Plan-based architecture** — Define everything in a single YAML or JSON file  
- 💻 **Local mode (Free)** — All processing happens locally, no cloud required  
- 🌐 **Remote mode (Coming Soon)** — Share, schedule, and orchestrate data jobs with your team  
- ⚙️ **Simple CLI** — One binary, zero external dependencies  

---

## 📦 Installation

### Option 1: Install via Homebrew (Recommended)

```bash
brew tap kvatch-hub/tap
brew install kvatch
```

Verify installation:

```bash
kvatch --version
```

#### ⚠️ If `kvatch` isn’t found:
Ensure Homebrew’s `bin` directory is on your `PATH`.

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

### Option 2: Download the Latest Release Manually

Grab the latest binary from the [Releases page](https://github.com/kvatch-hub/kvatch-cli/releases/latest).

**Apple Silicon (M1/M2/M3):**
```bash
curl -L https://github.com/kvatch-hub/kvatch-cli/releases/latest/download/kvatch-darwin-arm64 -o kvatch
chmod +x kvatch
```

**Intel Macs:**
```bash
curl -L https://github.com/kvatch-hub/kvatch-cli/releases/latest/download/kvatch-darwin-amd64 -o kvatch
chmod +x kvatch
```

**Linux (x86_64):**
```bash
curl -L https://github.com/kvatch-hub/kvatch-cli/releases/latest/download/kvatch-linux-amd64 -o kvatch
chmod +x kvatch
```

**Windows (PowerShell):**
```powershell
Invoke-WebRequest https://github.com/kvatch-hub/kvatch-cli/releases/latest/download/kvatch-windows-amd64.exe -OutFile kvatch.exe
```

---

### macOS First Run (Unsigned Binary)

macOS may block unsigned binaries. To fix:

```bash
xattr -d com.apple.quarantine kvatch
./kvatch --help
```

Or manually:  
1. Run the binary (you’ll see a warning)  
2. Open **System Settings → Privacy & Security**  
3. Click **Allow Anyway**  
4. Re-run `./kvatch`  

---

### Verify Installation

```bash
kvatch help
```

(Optional) Add to your PATH:

```bash
sudo mv kvatch /usr/local/bin/
```

Then test shell completion:

```bash
kvatch completion [bash|zsh|fish|powershell]
```

---

## 🔧 Initialize Workspace

```bash
# Sets up local workspace at ~/.kvatch
kvatch init
```

---

## 🧪 Try It Out

Start with a built-in example — see the [examples](./examples) directory for ready-to-run plans:

- CSV / JSON ingestion  
- SQLite and Postgres queries  
- Deduplication and joins across sources  
- Advanced federation scenarios  

---

## 🧩 How It Works

Kvatch uses a single `plan.yaml` or `plan.json` file to:  
- Define **data sources** (CSV, SQLite, Postgres, etc.)  
- Configure **datasets** with SQL queries and plugins  
- Enable **joins**, **deduplication**, and **storage options**  

---

## 🧠 Learn More

- [📄 Plan file format](docs/plan-spec.md) *(coming soon)*  
- [📚 Documentation](./docs/README.md)  
- [🧪 Examples](./examples)  

---

## 💡 Licensing

Kvatch CLI is:  
- ✅ **Free** for personal and commercial use in **local mode**  
- 🔐 **Paid** for advanced **remote mode** features  

### Local Mode (Free)
- Runs entirely on your machine  
- No internet connection required  
- Unlimited connectors, datasets, and joins  
- Ideal for analysts, engineers, and builders  

### Remote Mode (Paid, Coming Soon)
- Team-wide shared plans and storage  
- Scheduled runs and background jobs  
- Web UI, access control, audit logs  

📝 [Join the waitlist](https://www.kvatch.com/cli#signup) for early access.  
