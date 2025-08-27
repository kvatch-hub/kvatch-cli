# 📚 Local Files Join Example

This example demonstrates how to use Kvatch CLI to join data from two local files — one JSON and one YAML — into a unified dataset using a federated query plan.

---

## 🔧 Requirements

- `kvatch` CLI installed  
- Two local data files:  
  - `./data/employees.json` — list of employees  
  - `./data/projects.json` — list of projects (YAML format)  
- No external database required (uses SQLite for storage).

---

## 📄 Plan Overview
The full plan is available in [plan.yaml](./plan.yaml).  

Key sections:
- **Storage** → SQLite DB (`local_file_example.db`)  
- **Connectors** → [employees.json, projects.json]  
- **Datasets** → [all_employees, all_projects, employee_projects]  
- **Output** → outputs the `employee_projects` dataset  

---

## 🚀 Run the Plan

⚠️ This plan uses relative file paths (`./data/...`). You must run it from the **root of the repository**:

```bash
kvatch query --plan examples/local-file/plan.yaml
```

---

## 📦 Output Example

After running the plan, the `employee_projects` dataset will contain:

| employee_name | department  | salary | project_name   | budget  |
|---------------|-------------|--------|----------------|---------|
| Alice         | Engineering | 95000  | Project Alpha  | 100000  |
| Bob           | Marketing   | 75000  | Project Beta   | 75000   |

---

## 🔒 Notes

- Dataset types (`JSON`, `YAML`) automatically parse and flatten based on queries.  
- The federated engine deduplicates rows using `dedupe_key` fields.  

