-- Assignment 7 
-- Instruction: If you have not created the database EXERCISE_DB then you can do so - otherwise use this database for this exercise.

-- 1. Create a stage object that is pointing to 's3://snowflake-assignments-mc/unstructureddata/'
CREATE OR REPLACE STAGE EXERCISE_DB.PUBLIC.aws_stage_raw_data
    url='s3://snowflake-assignments-mc/unstructureddata/';

DESC STAGE EXERCISE_DB.PUBLIC.aws_stage_raw_data;
List @EXERCISE_DB.PUBLIC.aws_stage_raw_data;
-- name: s3://snowflake-assignments-mc/unstructureddata/Jobskills.json

-- 2. Create a file format object that is using TYPE = JSON
CREATE OR REPLACE file format MANAGE_DB.file_formats.file_format_json
    TYPE=JSON;

-- 3. Create a table called JSON_RAW with one column
-- Column name: Raw
-- Column type: Variant
CREATE OR REPLACE table EXERCISE_DB.PUBLIC.JSON_RAW (
    raw variant
);

//4. Copy the raw data in the JSON_RAW table using the file format object and stage object
COPY INTO EXERCISE_DB.PUBLIC.JSON_RAW
    FROM @EXERCISE_DB.PUBLIC.aws_stage_raw_data
    file_format= MANAGE_DB.file_formats.file_format_json
    files = ('Jobskills.json');
-- Status: Loaded
-- rows_parsed/rows_loaded: 112

-- Check data
SELECT * from EXERCISE_DB.PUBLIC.JSON_RAW;