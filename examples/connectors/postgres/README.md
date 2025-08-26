
# Postgres Federated Example

This example demonstrates how to use the federated SQL engine to query and join data from **two separate PostgreSQL databases**: one for books and one for authors.

## 📄 Overview

- **Connectors**: Two PostgreSQL connectors (`books_db`, `authors_db`), each referencing different databases.
- **Datasets**:
  - `books`: Fetched from the `books` database.
  - `authors`: Fetched from the `authors` database.
  - `author_books`: A federated join of the above two datasets.
- **Storage**: Output is written to a local SQLite database.

## 🔐 Secrets

The plan uses environment variable placeholders to avoid committing sensitive database credentials:

```yaml
username: "${BOOKS_DB_USERNAME}"
password: "${BOOKS_DB_PASSWORDs}"
```

Create a `secrets.yaml` file or `.env` file with the following:

### Option 1: `.env`

```env
BOOKS_DB_USERNAME=root
BOOKS_DB_PASSWORD=root

AUTHORS_DB_USERNAME=root
AUTHORS_DB_PASSWORD=root
```

### Option 2: `secrets.yaml`

```yaml
BOOKS_DB_USERNAME: root
BOOKS_DB_PASSWORD: root

AUTHORS_DB_USERNAME: root
AUTHORS_DB_PASSWORD: root
```

## 🚀 Running the Plan

```bash
federate query --plan examples/connectors/postgres/plan.yaml --secrets examples/connectors/postgres/secrets-authors.yaml,examples/connectors/postgres/secrets-books.yaml
```

This will:
- Connect to both PostgreSQL databases
- Fetch books and authors data
- Join the datasets using SQL
- Write results to `author_books` table in a local SQLite DB

## 🧪 Output

The final dataset will contain:

| name        | title             | review       |
|-------------|-------------------|--------------|
| Jane Doe    | A Great Book      | ⭐⭐⭐⭐⭐       |
| John Smith  | Another Story     | ⭐⭐⭐         |

--

✅ Use this template to federate more datasets from multiple sources.
