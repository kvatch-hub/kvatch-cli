# 📚 Google Sheets Connector Example

This example demonstrates how to use the **GOOGLESHEET** connector with Kvatch CLI to query data directly from a Google Sheet and store it into a local SQLite database.

---

## 🔧 Requirements

- `kvatch` CLI installed  
- A Google Sheet with an accessible range  
- A `secrets.yaml` file at the project root with your credentials:

```yaml
GOOGLESHEET_SPREADSHEET_ID: "my-google-sheet-id"
GOOGLESHEET_API_KEY: "my-google-sheet-api-key"
```

---

## 📄 Plan Overview
The full plan is available in [plan.yaml](./plan.yaml).  

Key sections:
- **Storage** → SQLite DB (`googlesheet_example.db`)  
- **Connectors** → [Google Sheets]  
- **Datasets** → [portfolio]  
- **Output** → outputs the `portfolio` dataset  

---

## 🚀 Run the Plan

Run the plan with your secrets file:

```bash
kvatch query --plan examples/connectors/googlesheet/plan.yaml --secrets examples/connectors/googlesheet/secrets.yaml
```

This will fetch your Google Sheet data, process it, and store it in `googlesheet_example.db`.

---

## ✅ Expected Results

When you run the plan, you should see output similar to:

```
🚀 Results of Query (local mode):
───────────────────────────────
   column1   | column2
───────────────────────────────
   value1    | value2
   value3    | value4
───────────────────────────────
```

*(The exact rows depend on the contents of your Google Sheet.)*

---

## 📦 Output

The results are written to the **SQLite database specified in the plan** (`googlesheet_example.db`). 

Inspect the results with:

```bash
sqlite3 googlesheet_example.db
```

Then run:

```sql
SELECT * FROM portfolio;
```

---

## 🔒 Notes

- This example uses a `secrets.yaml` file to avoid committing sensitive keys into `plan.yaml`.  
- Do **not commit your `secrets.yaml` file** if it contains secrets.  
