# ⚡ Quickstart Example: CSV + SQLite

This is a minimal example that reads from a local CSV file and loads it into a SQLite database using the `kvatchs` CLI.

---

## 📁 Plan File

- `plan.json`: The plan file describing the datasource and dataset
- `data/users.csv`: Example input data

---

## 🚀 Run the Plan

```bash
kvatch query --plan examples/quickstart/plan.json --root-dataset users  
```

This will:
1. Read the `users.csv` file
2. Load the data into a SQLite file named `quickstart.db`

---

## 🔍 Inspect the Output

You can open the output SQLite DB using any SQLite tool, for example:

```bash
sqlite3 quickstart.db
sqlite> SELECT * FROM users;
```

---

## 🧩 Modify It

You can easily swap out the CSV file or change the output storage location by editing `plan.json`.