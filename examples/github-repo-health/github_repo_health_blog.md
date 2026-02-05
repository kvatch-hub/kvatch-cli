# 📊 Checking Your GitHub Repo’s Health with Kvatch

When you’re maintaining an open-source project, it’s useful to have a quick snapshot of your repository’s “health.” How many files are in the repo? How many issues are open vs closed? When was the first issue created, and what’s the most recent one?

With [Kvatch](https://github.com/kvatch-hub/kvatch-cli), we can treat **a Git repo + the GitHub API** as federated data sources and query them together as if they were just tables in a database.

---

## 🔌 Step 1 — Define the plan

Here’s the `plan.yaml` that combines a Git repo with the GitHub Issues API:

```yaml
name: github-repo-health
storage:
  type: sqlite
  data_store_path: github_repo_health.db

connectors:
  - name: repo_git
    type: GIT
    connection:
      repo: "https://github.com/kvatch-hub/kvatch-cli.git"
      branch: "main"
      path: "examples/git/data"
    desc: "Cloned Git repo with CSV and source files"

  - name: github_api
    type: API
    connection:
      url: "https://api.github.com/repos/kvatch-hub/kvatch-cli/issues"
      method: "GET"
    desc: "GitHub API for repo issues"

datasets:
  - name: repo_files
    connector_name: repo_git
    type: CSV
    query: "users.csv"

  - name: repo_issues
    connector_name: github_api
    type: JSON
    options:
      flatten_nested_objects: true
    query: "$"

  - name: repo_issue_summary
    connector_name: federated
    type: SQL
    query: |
      SELECT
        state,
        COUNT(*) AS issue_count,
        MIN(created_at) AS first_issue_date,
        MAX(created_at) AS last_issue_date
      FROM repo_issues
      GROUP BY state
    children:
      - dataset_name: repo_issues

  - name: kvatch_repo
    connector_name: federated
    type: SQL
    query: |
      SELECT
        (SELECT COUNT(*) FROM repo_files) AS total_files,
        (SELECT COUNT(*) FROM repo_issues WHERE state = 'open') AS open_issues,
        (SELECT COUNT(*) FROM repo_issues WHERE state = 'closed') AS closed_issues,
        (SELECT MIN(created_at) FROM repo_issues) AS first_issue_date,
        (SELECT MAX(created_at) FROM repo_issues) AS last_issue_date
    children:
      - dataset_name: repo_files
      - dataset_name: repo_issues

output:
  dataset_name: kvatch_repo
  format: table
```

---

## ▶️ Step 2 — Run the query

Run the plan with:

```bash
./kvatch query --plan github-repo-health.yaml
```

---

## 📈 Example output

```
─────────────────────────────────────────────────────────────────────────────
 total_files | open_issues | closed_issues | first_issue_date | last_issue_date
─────────────┼─────────────┼───────────────┼──────────────────┼────────────────
 42          | 3           | 15            | 2024-08-01       | 2025-09-20
─────────────────────────────────────────────────────────────────────────────
```

---

## 💡 Why this is useful

- Combine **repo contents** (via Git) and **live GitHub API data**.  
- Get a **single dashboard row** summarizing project health.  
- Works with *any repo* you care about — just swap out the Git + GitHub API connectors.  

This approach can be extended to track PRs, contributors, or even join GitHub data with financial or operational datasets.

---

👉 Next time, we’ll take it further: analyzing **issue churn** and **average time-to-close** for your repo.
