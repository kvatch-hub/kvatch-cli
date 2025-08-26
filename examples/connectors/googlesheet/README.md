# Google Sheets Connector Example

This example demonstrates how to use the `GOOGLESHEET` connector with the Federated SQL Engine to query data directly from a public or private Google Sheet and store it into a local SQLite database.

## 🔧 Requirements

Before running this example, ensure the following environment variables are set in a `.env` file at the root of your project:

```
GOOGLESHEET_SPREADSHEET_ID=your-google-sheet-id
GOOGLESHEET_API_KEY=your-google-api-key
```

## 📄 Plan Overview

### Storage

This plan writes the processed data to a local SQLite database:

```yaml
storage:
  type: sqlite
  data_store_path: googlesheet_example.db
```

### Connector

This connector reads from a Google Sheet using the API key and spreadsheet ID provided via environment variables:

```yaml
connectors:
  - name: my_googlesheet
    type: GOOGLESHEET
    connection:
      spreadsheet_id: "${{GOOGLESHEET_SPREADSHEET_ID}}"
      api_key: "${{GOOGLESHEET_API_KEY}}"
      read_range: "Portfolio!A:B"
      header_row_no: 0
```

### Dataset

This dataset processes the sheet content into a structured format:

```yaml
datasets:
  - name: portfolio
    connector_name: my_googlesheet
    type: GOOGLESHEET
    query: "{}"
    description: "my portfolio on google sheets"
    config:
      timeout: 30
```

### Output

This defines the final dataset output:

```yaml
output:
  dataset_name: portfolio
```

## ✅ Running the Example

Once your `.env` is configured, run the CLI:

```bash
federate run --plan docs/cli/examples/connectors/googlesheet/plan.yaml
```

This will download your sheet, process the data, and store it into the `googlesheet_example.db` SQLite file.

## 📁 Output

You can inspect the resulting SQLite database using:

```bash
sqlite3 googlesheet_example.db
```

Then run:

```sql
SELECT * FROM portfolio;
```

## 🧪 Regression Test

This example is regression tested in CI to ensure compatibility with the latest engine changes.

## 🔒 Note on Secrets

This example uses environment variable substitution to keep API keys and sheet IDs out of the plan file. Make sure you **do not commit `.env`** files containing sensitive keys.
