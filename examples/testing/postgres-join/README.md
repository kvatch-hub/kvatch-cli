# 📚 Federated Join: Books and Authors (Postgres)

This example shows how to use the `kvatch` CLI to join data from two separate PostgreSQL databases using a federated plan.

## 🔧 Requirements

- Local or remote access to two Postgres DBs:
  - One with a `books` table
  - One with an `authors` table
- CLI installed: `kvatch`

## 📁 Structure

- `plan.yaml`: Full config to:
  - Connect to two databases
  - Extract books and authors data
  - Join them into a single dataset: `author_books`

## 📦 Seed the Databases

Run this if you want to test the example locally with actual data:

```bash
# Create and populate books DB
createdb books
psql books < seed/books.sql

# Create and populate authors DB
createdb authors
psql authors < seed/authors.sql

## 🚀 Run the Plan

```bash
kvatch query --plan examples/postgres-join/plan.yaml --root-dataset author_books 
```
