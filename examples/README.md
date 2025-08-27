# 🧪 Kvatch CLI Examples

This directory contains runnable examples for using the [`kvatch`](../README.md) CLI tool with different types of data sources and connectors.

Each example folder contains:
- A `plan.yaml` file (or `.json`) defining the pipeline
- Optional seed data files (e.g., CSV, JSON, SQL)
- A `README.md` with instructions for running that specific plan

---

## 🔰 Getting Started

Choose an example below to explore Kvatch's capabilities:

- [`quickstart/`](./quickstart) — Ingest a local CSV and JSON file, join and write to SQLite
- [`git/`](./git) — Load a CSV file from a remote Git repo and process it locally
- [`googlesheet/`](./googlesheet) — Query live data from a Google Sheet using an API key
- [`local-file/`](./local-file) — Join local JSON and YAML files with SQL into a federated dataset
- [`postgres/`](./postgres) — Federate and join data from two PostgreSQL databases

---

## 🔐 Secrets

Some examples use environment variable placeholders (e.g., `${DB_USER}`) for credentials.  
These can be supplied using one or more secrets files via the `--secrets` option:

```bash
kvatch query --plan ./plan.yaml --secrets examples/secrets/secrets-db.yaml
```

---

## ✅ Run Any Plan

Most examples can be run from the **project root** with:

```bash
kvatch query --plan examples/<folder>/plan.yaml [--secrets <file.yaml>]
```

> ⚠️ Some examples reference local data files (e.g. `./data/*.json`) using relative paths.  
> In those cases, you may need to:
> - Run the command from the appropriate subfolder (e.g. `cd examples/local-file-join`), or
> - Adjust file paths in the plan, or
> - Use environment variables for dynamic path resolution