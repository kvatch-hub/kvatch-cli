# 📄 Kvatch Plan Specification

This document describes the fields available in a Kvatch `plan.yaml` or `plan.json` file, used to define federated queries, connectors, datasets, and output configuration.

---

## 🔹 Top-Level Fields

| Field       | Type       | Description                                      |
|-------------|------------|--------------------------------------------------|
| `name`      | string     | Name of the plan                                 |
| `storage`   | object     | Storage backend details for metadata & results   |
| `connectors`| array      | List of connector definitions                    |
| `datasets`  | array      | Processing/query definitions                     |
| `output`    | object     | Controls output formatting and destination       |

---

## 🗄️ `storage`

```yaml
storage:
  type: sqlite
  metadata_store_path: meta.db
  data_store_path: quickstart.db
```

| Field                 | Type   | Description                                 |
|----------------------|--------|---------------------------------------------|
| `type`               | string | Backend type (e.g., `sqlite`, `postgres`)   |
| `data_store_path`    | string | Optional override for data store path       |

---

## 🔌 `connectors`

Each connector represents a data source (e.g., file, database, API).

### Example:

```yaml
- name: books_db
  type: POSTGRES
  connection:
    host: localhost
    port: 5432
    database: books
    username: user
    password: pass
    sslmode: disable
```

### Supported connector types and configs:

#### 🧠 `POSTGRES`
```yaml
connection:
  host: localhost
  port: 5432
  database: mydb
  username: user
  password: pass
  sslmode: disable
```

#### 📁 `LOCALFILE`
```yaml
connection:
  file_path: ./data/file.csv
```

#### 🧱 `GIT`
```yaml
connection:
  repo: https://github.com/org/repo.git
  branch: main
  path: data/
```

#### 🌐 `GOOGLESHEET`
```yaml
connection:
  spreadsheet_id: your-id
  api_key: your-key
  read_range: Sheet1!A:B
  header_row_no: 0
```

---

## 📊 `datasets`

Defines how each dataset should be processed.

### Example:

```yaml
- name: books
  connector_name: books_db
  type: SQL
  query: SELECT * FROM books
  dedupe_key: [id]
```

| Field          | Type         | Description                                      |
|----------------|--------------|--------------------------------------------------|
| `name`         | string       | Dataset name                                     |
| `connector_name`| string      | Name of connector to use                         |
| `type`         | string       | Plugin type (e.g., `SQL`, `CSV`, `JSON`)         |
| `query`        | string       | SQL query, filename, or range                    |
| `config`       | object       | Plugin-specific options                          |
| `dedupe_key`   | array        | Keys for deduplication (optional)                |
| `children`     | array        | Dependency datasets for joins                    |

---

## 🔧 Plugin Configs

### 📁 `CSV`
```yaml
config:
  has_headers: true
  delimiter: ","
  skip_lines: 0
```

### 📜 `JSON`
```yaml
config:
  root_path: data.items
```

### 📊 `GOOGLESHEET`
```yaml
config:
  spreadsheet_id: your-id
  read_range: Sheet1!A:B
  header_row_no: 0
```

---

## 📤 `output`

Controls output formatting, limits, and destination.

```yaml
output:
  dataset_name: books
  sink: console         # or 'sqlite' or 'file'
  format: table         # table, json, csv, ndjson
  file_path: output.json
  sqlite_path: output.db
  verbose: true
  include_headers: true
  limit: 100
```

| Field            | Type    | Description                                      |
|------------------|---------|--------------------------------------------------|
| `dataset_name`   | string  | Dataset to return                                |
| `sink`           | string  | Where to output: `console`, `sqlite`, `file`     |
| `format`         | string  | Format: `table`, `json`, `csv`, `ndjson`         |
| `file_path`      | string  | Output path when using `file` sink               |
| `sqlite_path`    | string  | Path to SQLite DB when using `sqlite` sink       |
| `verbose`        | bool    | Print verbose logs                               |
| `include_headers`| bool    | Include headers in output (for table/csv)        |
| `limit`          | int     | Maximum rows to output (0 = unlimited)           |

---

## ✅ Minimal Example

```yaml
name: quickstart
storage:
  type: sqlite
  data_store_path: quickstart.db
connectors:
  - name: local_file
    type: LOCALFILE
    connection:
      file_path: ./data/users.csv
datasets:
  - name: users
    connector_name: local_file
    type: CSV
    query: users.csv
    options:
      has_headers: true
output:
  dataset_name: users
  sink: console
  format: table
```