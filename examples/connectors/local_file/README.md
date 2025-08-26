# 📚 Federated Join: Employees and Projects (Local Files)

This example demonstrates how to use the `kvatch` CLI to join data from two local files — one JSON and one YAML — into a unified dataset using a federated query plan.

---

## 🔧 Requirements

- `kvatch` CLI installed
- Two local data files:
  - `./data/employees.json` — list of employees
  - `./data/projects.json` — list of projects (in YAML format)
- No external database required — this example uses local **SQLite** for storage.

---

## 📁 Structure

- `plan.yaml`: The full federated plan, which:
  - Loads employees from a **JSON** file
  - Loads projects from a **YAML** file
  - Joins them on `employee.id = project.owner_id`
  - Produces the final output dataset: `employee_projects`

---

## 🧪 Sample Data

Ensure the following files exist:

### `./data/employees.json`

\`\`\`json
{
  "data": [
    { "id": 1, "name": "Alice", "department": "Engineering", "salary": 95000 },
    { "id": 2, "name": "Bob", "department": "Marketing", "salary": 75000 }
  ]
}
\`\`\`

### `./data/projects.json`

\`\`\`yaml
projects:
  - project_id: 101
    name: Project Alpha
    owner_id: 1
    budget: 100000
  - project_id: 102
    name: Project Beta
    owner_id: 2
    budget: 75000
\`\`\`

---

## 🚀 Run the Plan

Run the query using the `kvatch` CLI:

\`\`\`bash
kvatch query --plan examples/local-file-join/plan.yaml
\`\`\`

This will create a local SQLite database (`local_file_example.db`) and generate the joined output.

---

## 📦 Output Example

After running the plan, the `employee_projects` dataset will contain:

| employee_name | department  | salary | project_name   | budget  |
|---------------|-------------|--------|----------------|---------|
| Alice         | Engineering | 95000  | Project Alpha  | 100000 |
| Bob           | Marketing   | 75000  | Project Beta   | 75000  |

---

## 🛠 Notes

- The dataset types (`JSON`, `YAML`) automatically parse and flatten based on the top-level key in your query (e.g. `SELECT * FROM data`, `SELECT * FROM projects`).
- The federated engine deduplicates rows using the `dedupe_key` fields (`id`, `project_id`).
- The join is executed via SQL in-memory over SQLite.

---

## 🧩 Want to Explore More?

Try modifying the `query` in `plan.yaml` or add additional datasets using other local files, APIs, or SQL backends.
