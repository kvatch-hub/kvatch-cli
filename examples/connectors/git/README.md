# 📚 Git Connector Example

This example demonstrates how to use the **GIT** connector with Kvatch CLI to fetch and query data directly from a Git repository.  
The data is processed into a local SQLite database.

---

## 🔧 Requirements

- `kvatch` CLI installed  
- Access to the specified Git repository (public in this example)

---

## 📄 Plan Overview
The full plan is available in [plan.yaml](./plan.yaml).  

Key sections:

- **Storage** → set to a SQLite DB called 'git_connector_example.db'
- **Connectors** → [Git]
- **Datasets** → [users]
- **Output** → ouput the 'users' dataset.

---

## 🚀 Run the Plan

```bash
kvatch query --plan examples/connectors/git/plan.yaml
```

---

## ✅ Expected Results

When you run the plan, you should see output similar to:

```
🚀 Results of Query (local mode):
────────────────────────────────────────
   name    | email               | id
────────────────────────────────────────
   Alice   | alice@example.com   | 1 
   Bob     | bob@example.com     | 2 
   Charlie | charlie@example.com | 3 
────────────────────────────────────────
```

---

## 📦 Output 

As we specified the output to go to a 'sqlite' database called 'git_connector_example.db'  then you can inspect the results in the SQLite database:

```bash
sqlite3 git_connector_example.db
```

Then run:

```sql
SELECT * FROM users;
```

---

## 🔒 Notes

- You can modify the connector to point to any Git repo containing CSV/JSON files.  
- Ensure the path points to the correct folder within the repository.  
