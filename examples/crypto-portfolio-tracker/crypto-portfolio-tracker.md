# Track Your Crypto Portfolio with Google Sheets and CoinGecko – No Code Required

*September 08, 2025 · 5 min read*

Want to track your real-time crypto portfolio without writing any code or using spreadsheets full of formulas? This tutorial shows you how to use **Kvatch CLI** to federate data from a Google Sheet and the CoinGecko API — all queried together using plain SQL.

---

## 🚀 What You'll Build

- **Live prices** from [CoinGecko API](https://www.coingecko.com/en/api)
- **Holdings** stored in [Google Sheets](https://docs.google.com/spreadsheets/d/1DYEHzASo9D8GHKpTCL_6ia2vDVoTaMSQiLhR2y7TGRQ/edit?usp=sharing)
- **Federated SQL query** to calculate total portfolio value

---

## 🧰 Prerequisites

- [Kvatch CLI](https://github.com/kvatch-hub/kvatch-cli) installed
- Public Google Sheet with crypto holdings. (look at the googlesheet example if you want this to be private! )

---

## 📄 Step 1: Define Your Plan File

Create a file named `plan.yaml` and paste the following:

```yaml
name: crypto_portfolio_example
storage:
  type: sqlite
  data_store_path: crypto_portfolio_example.db

connectors:
  - name: coin_gecko_api
    type: API
    connection:
      url: "https://api.coingecko.com/api/v3/simple/price"
      method: GET
      query_params:
        ids: bitcoin,ethereum
        vs_currencies: usd
      response_path: "$"

  - name: holdings_sheet
    type: GOOGLESHEET
    connection:
      spreadsheet_id: "1DYEHzASo9D8GHKpTCL_6ia2vDVoTaMSQiLhR2y7TGRQ"
      read_range: "holdings"
    desc: "Your crypto holdings"

datasets:
  - name: prices
    connector_name: coin_gecko_api
    type: JSON
    options:
      normalize_nested_objects: true
      normalized_key_field_name: coin
      normalized_value_prefix: price_
    query: "$"
    dedupe_key:
      - coin

  - name: holdings
    connector_name: holdings_sheet
    type: GOOGLESHEET
    config:
      header_row_no: 1
    query: "holdings"

  - name: portfolio_value
    connector_name: federated
    type: SQL
    query: |
      SELECT
        h.coin,
        h.holding,
        p.price_usd,
        ROUND(h.holding * p.price_usd, 2) AS total_value_usd
      FROM holdings h
      JOIN prices p ON h.coin = p.coin
    children:
      - dataset_name: holdings
      - dataset_name: prices

output:
  dataset_name: portfolio_value
  format: table
  verbose: false
```

### 🧠 What's Going On?

- **`coin_gecko_api`**: Fetches live prices for BTC and ETH in USD.
- **`holdings_sheet`**: Loads your crypto balances from Google Sheets.
- **`portfolio_value`**: Joins both datasets and calculates the total value.

---

## 💻 Step 2: Run the Query

```bash
federate query -p plan.yaml
```

### ✅ Sample Output

```
+----------+---------+-----------+------------------+
| coin     | holding | price_usd | total_value_usd |
+----------+---------+-----------+------------------+
| bitcoin  | 0.005   | 112227    | 561.13           |
| ethereum | 0.5     | 4344.04   | 2172.02          |
+----------+---------+-----------+------------------+
```

Boom! You’ve joined a Google Sheet and an API in one federated query.

---

## 🧩 Why This Matters

This approach works for much more than just crypto:

- Track **stock portfolios** from Sheets + APIs
- Blend **sales data** with external pricing tools
- Enrich **CSV exports** with metadata services

---

## 🌐 Try It Yourself

- Fork the example
- Add more coins to the query
- Use different APIs with the same plugin

No pipelines. No integration glue. Just SQL.

---

**Kvatch** is open-source and built for curious developers. Join the [GitHub repo](https://github.com/kvatch-hub/kvatch-cli) and start federating your data.
