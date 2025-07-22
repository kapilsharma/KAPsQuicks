# Queries cheatsheet

These are quick summary of queries.

## Create worksheet

Once we [setup test account](../SnowFlake.md#setup-test-accounts), open/create worksheet

- In left sidebar, click `Projects`
- Click `Worksheets`
- On top-right, click `+` symbol to create `SQL` or `Python` worksheet.

## Create Warehouse

- In the left sidebar, click `Admin`
- Click `Warehouses`
- On top-right, click `+ Warehouse`
- In popup
  - Give warehouse name. Say `Test_warehouse`.
  - We can keep other default options.
    - Type: Standard.
      - Standard: Most cost effective for testing purpose.
      - Snowpark-optimized. Have large memory and cache. Used for memory intensice operations.
    - Size: X-Small is fine for testing. It is actule server size. It [costs](./01Basic.md#warehouse-cost) depending on the size.
    - Auto-resume & Auto-suspend: Helps managing the cost, at least during learning. If checked, add Suspend after as 5 (minutes) of inactivity. (Not for Production)
    - Multi-cluster: Keep unchecked. Used to create new server, if there are more users at certain peak hours.
    - Query Acceleration: Used for some occational queries that might need higher resources.

## Set warehouse and role

```SQL
USE ROLE SNOWFLAKE_LEARNING_ROLE;
USE WAREHOUSE SNOWFLAKE_LEARNING_WH;
```

## Create Database and schema

```SQL
CREATE OR REPLACE DATABASE TEST_DB
CREATE OR REPLACE SCHEMA TEST_SCHEMA
```

## Create Table

```SQL
CREATE TABLE "TEST_DB"."TEST_SCHEMA"."LOAN_PAYMENT" (
  "Loan_ID" STRING,
  "loan_status" STRING,
  "Principal" STRING,
  "terms" STRING,
  "effective_date" STRING,
  "due_date" STRING,
  "paid_off_time" STRING,
  "past_due_days" STRING,
  "age" STRING,
  "education" STRING,
  "Gender" STRING);
```

## Create Stage

```SQL
CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage
    url='s3://SomePublicBucket';
```