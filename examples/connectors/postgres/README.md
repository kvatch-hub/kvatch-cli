# 📚 PostgreSQL Federated Example

This example demonstrates how to use Kvatch CLI to query and join data from **two separate PostgreSQL databases**: one for books and one for authors.

---

## 🔧 Requirements

- `kvatch` CLI installed  
- Two PostgreSQL databases accessible (`books` and `authors`)  
- Two secrets files with credentials:
  - [secrets-authors.yaml](./secrets-authors.yaml)
  - [secrets-books.yaml](./secrets-books.yaml)

---

## 📄 Plan Overview

The full plan is available in [plan.yaml](./plan.yaml).  

Key sections:
- **Storage** → SQLite DB  
- **Connectors** → [books_db, authors_db]  
- **Datasets** → [books, authors, author_books]  
- **Output** → outputs the `author_books` dataset  

---

## 🚀 Run the Plan

⚠️ This example assumes relative file paths. Run it from the **root of the repository**:

```bash
kvatch query --plan examples/connectors/postgres/plan.yaml \
  --secrets examples/connectors/postgres/secrets-authors.yaml,examples/connectors/postgres/secrets-books.yaml
```

---

## ✅ Expected Results

When you run the plan, you should see output similar to:

```
🚀 Results of Query (local mode):
────────────────────────────────────────────────────────────────────────
   review                    | title              | name             
────────────────────────────────────────────────────────────────────────
   Great but terrible ending | A Clash of Kings   | george r r martin
   Great but terrible ending | A Game of Thrones  | george r r martin
   Not about wolves          | Wolf of the Plains | conn iggulden    
────────────────────────────────────────────────────────────────────────
```

---

## 📦 Output

The results are written to the **SQLite database defined in the plan**.

Inspect the results with:

```bash
sqlite3 postgres-example.db
```

Then run:

```sql
SELECT * FROM author_books;
```

---

## 🔒 Notes

- Secrets are loaded from two separate YAML files — one per database.
- Do **not commit** secrets to version control.
