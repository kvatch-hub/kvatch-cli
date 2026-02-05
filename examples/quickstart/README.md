# 🚀 Kvatch Quickstart Join Example

This quickstart example demonstrates how to join two datasets using Kvatch:

- A **CSV file** containing issuer metadata (`issuers.csv`)
- A **JSON file** of sample payment transactions (`payments.json`)

It showcases how to enrich transactions with issuer information by joining on the `bin` field.

---

## 📄 Plan Overview

The plan is defined in [plan.yaml](./plan.yaml).

Key elements:
- **Storage** → SQLite (`quickstart.db`)
- **Connectors**:
  - `issuers` → CSV file `./data/issuers.csv`
  - `payments` → JSON file `./data/payments.json`
- **Datasets**:
  - `issuer_data` (deduplicated by `bin`)
  - `payment_data` (from JSON)
  - `joined_payments` (result of `LEFT JOIN` on `bin`)
- **Output** → Writes the enriched dataset to `joined_payments` in SQLite

---

## 🧪 Sample Output Preview

Each row represents a payment enriched with issuer metadata:

| payment_id | amount  | currency | bin    | scheme | brand                   | bank_name                 |
|------------|---------|----------|--------|--------|--------------------------|---------------------------|
| txn_1001   |  532.91 | USD      | 341142 | amex   |                          | AMERICAN EXPRESS          |
| txn_1002   |  133.25 | USD      | 342562 | amex   |                          | AMERICAN EXPRESS          |
| txn_1003   |  289.99 | USD      | 360218 | diners | Diners Club International| DINERS CLUB DEL ECUADOR   |
| ...        |   ...   | ...      |  ...   |  ...   | ...                      | ...                       |

---

## 🚀 Run the Example

Make sure you're in the **project root**, since this plan references files using relative paths:

```bash
kvatch query --plan examples/quickstart/plan.yaml
```


## 🛠 Notes

- The join is a `LEFT JOIN` on `bin` between payments and issuers.
- The payments file is in JSON format (`payments.json`), wrapped in a `data` array.
- The issuer file must have headers and is deduplicated on `bin`.

