# 🌍 Converting Multi-Currency Expenses with Kvatch

If you’ve ever tracked your expenses while traveling, you know the pain: one receipt in **USD**, another in **GBP**, a hotel bill in **EUR**. To get the full picture, you need to convert everything into a single currency.  

Most people copy exchange rates into a spreadsheet by hand. But with **Kvatch**, we can federate data from a **Google Sheet** (our expenses) with a **live exchange rate API** — and instantly see all our costs in one currency.  

---

## 🖼️ How It Works

*A Google Sheet + Frankfurter API → Kvatch → Unified expenses table in EUR*

---

## 📊 The Problem

Here’s a simple Google Sheet of expenses across currencies:

| date       | category | amount | currency |
|------------|----------|--------|----------|
| 2025-09-01 | Flights  | 1200   | USD      |
| 2025-09-02 | Hotel    | 900    | GBP      |
| 2025-09-03 | Meals    | 300    | EUR      |

We want to convert them all into **EUR**, using live exchange rates.

---

## 🔌 The Plan

Our Kvatch plan has three parts:

1. **`expenses`** – pulled from Google Sheets.  
2. **`fx_rates`** – pulled from the [Frankfurter API](https://www.frankfurter.app/), which gives free exchange rates (no API key required).  
3. **`expenses_converted`** – a federated SQL dataset that joins expenses with exchange rates.  

Here’s the full YAML:

```yaml
name: currency_conversion_example
storage:
  type: sqlite
  data_store_path: currency_conversion_example.db

connectors:
  - name: expenses_sheet
    type: GOOGLESHEET
    connection:
      spreadsheet_id: "${EXPENSES_SHEET_ID}"
      read_range: "expenses"
    desc: "Expenses in various currencies"

  - name: fx_api
    type: API
    connection:
      url: "https://api.frankfurter.app/latest"
      method: GET
      query_params:
        from: EUR
      response_path: "$"
    desc: "Live exchange rates (EUR base)"

datasets:
  - name: expenses
    connector_name: expenses_sheet
    type: GOOGLESHEET
    config:
      header_row_no: 1
    query: "expenses"
    desc: "Sheet with columns: date, category, amount, currency"

  - name: fx_rates
    connector_name: fx_api
    type: JSON
    options:
      normalize_nested_objects: true
      normalized_key_field_name: currency
      normalized_value_prefix: rate_
    query: "rates"
    dedupe_key:
      - currency
    desc: "Latest FX rates (EUR base)"

  - name: expenses_converted
    connector_name: federated
    type: SQL
    query: |
      SELECT
        e.date,
        e.category,
        e.amount,
        e.currency,
        CASE
          WHEN TRIM(UPPER(e.currency)) = 'EUR' THEN 1.0
          ELSE r.rate_value
        END AS fx_rate,
        ROUND(e.amount / 
          CASE WHEN TRIM(UPPER(e.currency)) = 'EUR' THEN 1.0 ELSE r.rate_value END, 2) AS amount_eur
      FROM expenses e
      LEFT JOIN fx_rates r 
        ON TRIM(UPPER(e.currency)) = TRIM(UPPER(r.currency))
    children:
      - dataset_name: expenses
      - dataset_name: fx_rates
    desc: "Expenses converted into EUR"

output:
  dataset_name: expenses_converted
  format: table
  verbose: true
```

---

## ▶️ Running the Query

With the plan saved as `currency.yaml`, we run:

```bash
kvatch query --plan currency.yaml
```

And we get:

| date       | category | amount | currency | fx_rate | amount_eur |
|------------|----------|--------|----------|---------|------------|
| 2025-09-01 | Flights  | 1200   | USD      | 1.08    | 1111.11    |
| 2025-09-02 | Hotel    | 900    | GBP      | 0.85    | 1058.82    |
| 2025-09-03 | Meals    | 300    | EUR      | 1.00    | 300.00     |

---

## 💡 Insights

With one query, we:  
- Pulled **expenses from Google Sheets**.  
- Pulled **live FX rates from an API**.  
- Federated them into a single dataset with all amounts in **EUR**.  

No manual copying, no outdated exchange rates — just a clean, up-to-date view of spending.  

---

## 🚀 Wrap-Up

This is a simple example, but the same pattern applies to bigger problems:  
- Convert **international sales** into your reporting currency.  
- Combine **bank statements** with live FX feeds.  
- Roll up **multi-country revenue** into a global P&L.  

With Kvatch, all it takes is a few lines of YAML and SQL.  

---

👉 Next time, we’ll look at **enriching datasets with external APIs** — like mapping customer IPs to locations or adding stock prices to your portfolio.  
