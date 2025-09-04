# Querying Postgres and Google Sheets Together with Kvatch in 5 Minutes

Data rarely lives in one place. You might have structured data in Postgres, but your team still tracks budgets or projects in Google Sheets. What if you could query them both together with plain SQL — without building ETL pipelines?

That's exactly what Kvatch CLI enables: it treats all your sources as one federated dataset. In this quick tutorial, you'll learn how to connect Postgres and Google Sheets and query them together in under five minutes.

---

## 🛠 Prerequisites

* [Kvatch CLI](https://github.com/kvatch-hub/kvatch-cli) installed
* A Postgres table called `projects`. We've set up a **read-only public example** for you on Neon.
* A Google Sheet, with a tab called `employees`. We've also created and shared one with you [here](https://docs.google.com/spreadsheets/d/1sgZU3bv0CGq0nOD6xTvJAK9YcedFJjE54_TcnjFwRhE)

---

## ⚡ Step 1: Define Your Plan

Create a file called `plan.yaml`:

```yaml
name: blog-postgres-googlesheet_example
storage:
  type: sqlite
  data_store_path: googlesheet_example.db

connectors:
  - name: projects_db
    type: POSTGRES
    connection:
      host: "ep-jolly-shadow-a2hk38fo-pooler.eu-central-1.aws.neon.tech"
      port: 5432
      database: "examples"
      username: "kvatch_reader"
      password: "Readonly123!"
      ssl_mode: require
    desc: "Readonly connection to the projects database hosted on Neon"

  - name: team_sheets
    type: GOOGLESHEET
    connection:
      spreadsheet_id: "1sgZU3bv0CGq0nOD6xTvJAK9YcedFJjE54_TcnjFwRhE"
      read_range: "employees"  # tab name only (public mode)
    desc: "Employee info from Google Sheets"

datasets:
  - name: projects
    connector_name: projects_db
    type: SQL
    query: "SELECT id, name, owner_email FROM projects"
    options:
      timeout: 30

  - name: employees
    connector_name: team_sheets
    type: GOOGLESHEET
    config:
      header_row_no: 1
    query: "employees"

  - name: project_with_owner
    connector_name: federated
    type: SQL
    query: |
      SELECT
        p.name AS project_name,
        e.employee_name,
        e.department
      FROM projects p
      JOIN employees e ON p.owner_email = e.email
    children:
      - dataset_name: projects
      - dataset_name: employees

output:
  dataset_name: project_with_owner
  verbose: false
  format: table
  limit: 10
```

Here’s what’s going on:

* **storage**: Uses SQLite as a temporary local database to store intermediate results.
* **connectors**: Defines two sources:

  * A **Postgres** database (`projects_db`) with public read-only credentials
  * A **Google Sheet** (`team_sheets`) that is publicly shared and doesn’t require an API key
* **datasets**:

  * `projects`: Selects `id`, `name`, and `owner_email` from Postgres
  * `employees`: Reads from the `employees` tab in the Google Sheet, using the first row as headers
  * `project_with_owner`: A **federated SQL join** across Postgres and Sheets, matching employees to projects
* **output**: Specifies that the final dataset should be displayed as a table, limited to 10 rows

---

## ⚡ Step 2: Run It

Run the query with:

```bash
federate query -p plan.yaml
```

And you'll see results like:

```
+---------------------+----------------+-------------+
| project_name        | employee_name  | department  |
+---------------------+----------------+-------------+
| Data Pipeline       | Alice Smith    | Engineering |
| Sales Dashboard     | Bob Johnson    | Analytics   |
| Product Redesign    | Carol Nguyen   | Product     |
| Marketing Campaign  | Frank Martin   | Marketing   |
| Legal Tracker       | Helen Kim      | Legal       |
+---------------------+----------------+-------------+
```

---

## 🎉 Done in 5 Minutes

That's it — no ETL jobs, no copy-pasting between systems. Just one query that spans Postgres and Google Sheets.

With Kvatch you can:

* Combine Postgres or MySQL databases
* Mix APIs, JSON, and CSV files with structured data
* Keep sources in sync without moving data around

---

## 🚀 Try It Yourself

* [Install Kvatch CLI](https://github.com/kvatch-hub/kvatch-cli)
* [Check out the example plan.yaml](https://github.com/kvatch-hub/kvatch-cli/tree/main/examples)
* [Explore the public Google Sheet](https://docs.google.com/spreadsheets/d/1sgZU3bv0CGq0nOD6xTvJAK9YcedFJjE54_TcnjFwRhE)
* Join the beta and give feedback!
