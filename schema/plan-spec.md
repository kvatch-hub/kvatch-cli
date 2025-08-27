# Schema Docs

- [1. Property `root > Name`](#Name)
- [2. Property `root > storage`](#storage)
  - [2.1. Property `root > storage > type`](#storage_type)
  - [2.2. Property `root > storage > metadata_store_path`](#storage_metadata_store_path)
  - [2.3. Property `root > storage > data_store_path`](#storage_data_store_path)
- [3. Property `root > connectors`](#connectors)
  - [3.1. root > connectors > ProcessorPlanConnector](#connectors_items)
    - [3.1.1. Property `root > connectors > connectors items > name`](#connectors_items_name)
    - [3.1.2. Property `root > connectors > connectors items > type`](#connectors_items_type)
    - [3.1.3. Property `root > connectors > connectors items > connection`](#connectors_items_connection)
    - [3.1.4. Property `root > connectors > connectors items > description`](#connectors_items_description)
- [4. Property `root > datasets`](#datasets)
  - [4.1. root > datasets > ProcessorPlanDataset](#datasets_items)
    - [4.1.1. Property `root > datasets > datasets items > name`](#datasets_items_name)
    - [4.1.2. Property `root > datasets > datasets items > connector_name`](#datasets_items_connector_name)
    - [4.1.3. Property `root > datasets > datasets items > type`](#datasets_items_type)
    - [4.1.4. Property `root > datasets > datasets items > description`](#datasets_items_description)
    - [4.1.5. Property `root > datasets > datasets items > config`](#datasets_items_config)
    - [4.1.6. Property `root > datasets > datasets items > data`](#datasets_items_data)
    - [4.1.7. Property `root > datasets > datasets items > query`](#datasets_items_query)
    - [4.1.8. Property `root > datasets > datasets items > children`](#datasets_items_children)
      - [4.1.8.1. root > datasets > datasets items > children > ProcessorPlanDatasetChildren](#datasets_items_children_items)
        - [4.1.8.1.1. Property `root > datasets > datasets items > children > children items > dataset_name`](#datasets_items_children_items_dataset_name)
    - [4.1.9. Property `root > datasets > datasets items > dedupe_key`](#datasets_items_dedupe_key)
      - [4.1.9.1. root > datasets > datasets items > dedupe_key > dedupe_key items](#datasets_items_dedupe_key_items)
- [5. Property `root > output`](#output)
  - [5.1. Property `root > output > datasetName`](#output_datasetName)
  - [5.2. Property `root > output > verbose`](#output_verbose)
  - [5.3. Property `root > output > format`](#output_format)
  - [5.4. Property `root > output > filePath`](#output_filePath)
  - [5.5. Property `root > output > limit`](#output_limit)
  - [5.6. Property `root > output > includeHeaders`](#output_includeHeaders)

|                           |              |
| ------------------------- | ------------ |
| **Type**                  | `object`     |
| **Required**              | No           |
| **Additional properties** | Not allowed  |
| **Defined in**            | #/$defs/Plan |

| Property                     | Pattern | Type   | Deprecated | Definition                       | Title/Description |
| ---------------------------- | ------- | ------ | ---------- | -------------------------------- | ----------------- |
| + [Name](#Name )             | No      | string | No         | -                                | -                 |
| + [storage](#storage )       | No      | object | No         | In #/$defs/ProcessorStoragePlan  | -                 |
| + [connectors](#connectors ) | No      | array  | No         | -                                | -                 |
| + [datasets](#datasets )     | No      | array  | No         | -                                | -                 |
| + [output](#output )         | No      | object | No         | In #/$defs/ProcessorOutputConfig | -                 |

## <a name="Name"></a>1. Property `root > Name`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

## <a name="storage"></a>2. Property `root > storage`

|                           |                              |
| ------------------------- | ---------------------------- |
| **Type**                  | `object`                     |
| **Required**              | Yes                          |
| **Additional properties** | Not allowed                  |
| **Defined in**            | #/$defs/ProcessorStoragePlan |

| Property                                               | Pattern | Type   | Deprecated | Definition | Title/Description |
| ------------------------------------------------------ | ------- | ------ | ---------- | ---------- | ----------------- |
| + [type](#storage_type )                               | No      | string | No         | -          | -                 |
| + [metadata_store_path](#storage_metadata_store_path ) | No      | string | No         | -          | -                 |
| + [data_store_path](#storage_data_store_path )         | No      | string | No         | -          | -                 |

### <a name="storage_type"></a>2.1. Property `root > storage > type`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

### <a name="storage_metadata_store_path"></a>2.2. Property `root > storage > metadata_store_path`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

### <a name="storage_data_store_path"></a>2.3. Property `root > storage > data_store_path`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

## <a name="connectors"></a>3. Property `root > connectors`

|              |         |
| ------------ | ------- |
| **Type**     | `array` |
| **Required** | Yes     |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be             | Description |
| ------------------------------------------- | ----------- |
| [ProcessorPlanConnector](#connectors_items) | -           |

### <a name="connectors_items"></a>3.1. root > connectors > ProcessorPlanConnector

|                           |                                |
| ------------------------- | ------------------------------ |
| **Type**                  | `object`                       |
| **Required**              | No                             |
| **Additional properties** | Not allowed                    |
| **Defined in**            | #/$defs/ProcessorPlanConnector |

| Property                                        | Pattern | Type   | Deprecated | Definition | Title/Description |
| ----------------------------------------------- | ------- | ------ | ---------- | ---------- | ----------------- |
| + [name](#connectors_items_name )               | No      | string | No         | -          | -                 |
| + [type](#connectors_items_type )               | No      | string | No         | -          | -                 |
| + [connection](#connectors_items_connection )   | No      | object | No         | -          | -                 |
| - [description](#connectors_items_description ) | No      | string | No         | -          | -                 |

#### <a name="connectors_items_name"></a>3.1.1. Property `root > connectors > connectors items > name`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

#### <a name="connectors_items_type"></a>3.1.2. Property `root > connectors > connectors items > type`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

#### <a name="connectors_items_connection"></a>3.1.3. Property `root > connectors > connectors items > connection`

|                           |                  |
| ------------------------- | ---------------- |
| **Type**                  | `object`         |
| **Required**              | Yes              |
| **Additional properties** | Any type allowed |

#### <a name="connectors_items_description"></a>3.1.4. Property `root > connectors > connectors items > description`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

## <a name="datasets"></a>4. Property `root > datasets`

|              |         |
| ------------ | ------- |
| **Type**     | `array` |
| **Required** | Yes     |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be         | Description |
| --------------------------------------- | ----------- |
| [ProcessorPlanDataset](#datasets_items) | -           |

### <a name="datasets_items"></a>4.1. root > datasets > ProcessorPlanDataset

|                           |                              |
| ------------------------- | ---------------------------- |
| **Type**                  | `object`                     |
| **Required**              | No                           |
| **Additional properties** | Not allowed                  |
| **Defined in**            | #/$defs/ProcessorPlanDataset |

| Property                                            | Pattern | Type            | Deprecated | Definition | Title/Description |
| --------------------------------------------------- | ------- | --------------- | ---------- | ---------- | ----------------- |
| + [name](#datasets_items_name )                     | No      | string          | No         | -          | -                 |
| + [connector_name](#datasets_items_connector_name ) | No      | string          | No         | -          | -                 |
| + [type](#datasets_items_type )                     | No      | string          | No         | -          | -                 |
| - [description](#datasets_items_description )       | No      | string          | No         | -          | -                 |
| - [config](#datasets_items_config )                 | No      | object          | No         | -          | -                 |
| - [data](#datasets_items_data )                     | No      | object          | No         | -          | -                 |
| + [query](#datasets_items_query )                   | No      | string          | No         | -          | -                 |
| - [children](#datasets_items_children )             | No      | array           | No         | -          | -                 |
| - [dedupe_key](#datasets_items_dedupe_key )         | No      | array of string | No         | -          | -                 |

#### <a name="datasets_items_name"></a>4.1.1. Property `root > datasets > datasets items > name`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

#### <a name="datasets_items_connector_name"></a>4.1.2. Property `root > datasets > datasets items > connector_name`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

#### <a name="datasets_items_type"></a>4.1.3. Property `root > datasets > datasets items > type`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

#### <a name="datasets_items_description"></a>4.1.4. Property `root > datasets > datasets items > description`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

#### <a name="datasets_items_config"></a>4.1.5. Property `root > datasets > datasets items > config`

|                           |                  |
| ------------------------- | ---------------- |
| **Type**                  | `object`         |
| **Required**              | No               |
| **Additional properties** | Any type allowed |

#### <a name="datasets_items_data"></a>4.1.6. Property `root > datasets > datasets items > data`

|                           |                  |
| ------------------------- | ---------------- |
| **Type**                  | `object`         |
| **Required**              | No               |
| **Additional properties** | Any type allowed |

#### <a name="datasets_items_query"></a>4.1.7. Property `root > datasets > datasets items > query`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

#### <a name="datasets_items_children"></a>4.1.8. Property `root > datasets > datasets items > children`

|              |         |
| ------------ | ------- |
| **Type**     | `array` |
| **Required** | No      |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be                                | Description |
| -------------------------------------------------------------- | ----------- |
| [ProcessorPlanDatasetChildren](#datasets_items_children_items) | -           |

##### <a name="datasets_items_children_items"></a>4.1.8.1. root > datasets > datasets items > children > ProcessorPlanDatasetChildren

|                           |                                      |
| ------------------------- | ------------------------------------ |
| **Type**                  | `object`                             |
| **Required**              | No                                   |
| **Additional properties** | Not allowed                          |
| **Defined in**            | #/$defs/ProcessorPlanDatasetChildren |

| Property                                                       | Pattern | Type   | Deprecated | Definition | Title/Description |
| -------------------------------------------------------------- | ------- | ------ | ---------- | ---------- | ----------------- |
| + [dataset_name](#datasets_items_children_items_dataset_name ) | No      | string | No         | -          | -                 |

###### <a name="datasets_items_children_items_dataset_name"></a>4.1.8.1.1. Property `root > datasets > datasets items > children > children items > dataset_name`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

#### <a name="datasets_items_dedupe_key"></a>4.1.9. Property `root > datasets > datasets items > dedupe_key`

|              |                   |
| ------------ | ----------------- |
| **Type**     | `array of string` |
| **Required** | No                |

|                      | Array restrictions |
| -------------------- | ------------------ |
| **Min items**        | N/A                |
| **Max items**        | N/A                |
| **Items unicity**    | False              |
| **Additional items** | False              |
| **Tuple validation** | See below          |

| Each item of this array must be                      | Description |
| ---------------------------------------------------- | ----------- |
| [dedupe_key items](#datasets_items_dedupe_key_items) | -           |

##### <a name="datasets_items_dedupe_key_items"></a>4.1.9.1. root > datasets > datasets items > dedupe_key > dedupe_key items

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

## <a name="output"></a>5. Property `root > output`

|                           |                               |
| ------------------------- | ----------------------------- |
| **Type**                  | `object`                      |
| **Required**              | Yes                           |
| **Additional properties** | Not allowed                   |
| **Defined in**            | #/$defs/ProcessorOutputConfig |

| Property                                    | Pattern | Type    | Deprecated | Definition | Title/Description |
| ------------------------------------------- | ------- | ------- | ---------- | ---------- | ----------------- |
| + [datasetName](#output_datasetName )       | No      | string  | No         | -          | -                 |
| + [verbose](#output_verbose )               | No      | boolean | No         | -          | -                 |
| - [format](#output_format )                 | No      | string  | No         | -          | -                 |
| - [filePath](#output_filePath )             | No      | string  | No         | -          | -                 |
| - [limit](#output_limit )                   | No      | integer | No         | -          | -                 |
| + [includeHeaders](#output_includeHeaders ) | No      | boolean | No         | -          | -                 |

### <a name="output_datasetName"></a>5.1. Property `root > output > datasetName`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | Yes      |

### <a name="output_verbose"></a>5.2. Property `root > output > verbose`

|              |           |
| ------------ | --------- |
| **Type**     | `boolean` |
| **Required** | Yes       |

### <a name="output_format"></a>5.3. Property `root > output > format`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

### <a name="output_filePath"></a>5.4. Property `root > output > filePath`

|              |          |
| ------------ | -------- |
| **Type**     | `string` |
| **Required** | No       |

### <a name="output_limit"></a>5.5. Property `root > output > limit`

|              |           |
| ------------ | --------- |
| **Type**     | `integer` |
| **Required** | No        |

### <a name="output_includeHeaders"></a>5.6. Property `root > output > includeHeaders`

|              |           |
| ------------ | --------- |
| **Type**     | `boolean` |
| **Required** | Yes       |

----------------------------------------------------------------------------------------------------------------------------
Generated using [json-schema-for-humans](https://github.com/coveooss/json-schema-for-humans) on 2025-08-27 at 18:04:36 +0200
