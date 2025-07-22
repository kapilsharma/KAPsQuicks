# Basic Snowflake terms

- **Worksheet**: A place, where we write queries
- **Context**: Each worksheet have a context, which consist of 
  - **Role**:
    - Used to define permissions, which can be assigned to different users and applications
  - **Warehouse**
    - To start, consider it as a data storate, which store transformed data (in given format) to be used by different purpose later like reporting, data analysis, etc.
    - One example way of loading data: We run ETL tools (Like Talend, Informatica etc.) on source data to transform the data and load in warehouse.
      - Snowflake also provide limited ability to transform the data. External tools are helpful when we need lot of operations during transform.
    - In Snowflake, Warehouse provide compute capacity to execute the workload. It [costs](#warehouse-cost) us money
  - **Database** and **Schema**
    - Much like RDBMS. Used to store data within Snowflake. We will check it in more details
  - Stages: These are temporary or permanent storage locations (Like S3) for loading and unloading data files in the Snowflake.

# Warehouse cost

- Standard
  - X-Small - 1 credit/hour
  - Small - 2 credit/hour
  - Medium - 4 credit/hour
  - Large - 8 credit/hour
  - X-Large - 16 credit/hour
  - 2X-Large - 32 credit/hour
  - 3X-Large - 64 credit/hour
  - 4X-Large - 128 credit/hour
  - 5X-Large - 256 credit/hour
- Latest credit cost can be seen at https://www.snowflake.com/en/pricing-options/

