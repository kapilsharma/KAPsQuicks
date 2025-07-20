-- Create new stage
CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage_errorex
    url='s3://bucketsnowflakes4';

-- List files in stage
LIST @MANAGE_DB.external_stages.aws_stage_errorex;

-- Specifying file_format in Copy command
COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX
    FROM @MANAGE_DB.external_stages.aws_stage_errorex
    file_format = (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv')
    ON_ERROR = 'SKIP_FILE_3'; 

-- Creating table
CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.ORDERS_EX (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30));    
    
-- Creating schema to keep things organized
CREATE OR REPLACE SCHEMA MANAGE_DB.file_formats;

-- Creating file format object
CREATE OR REPLACE file format MANAGE_DB.file_formats.my_file_format;

-- See properties of file format object
DESC file format MANAGE_DB.file_formats.my_file_format;


-- Using file format object in Copy command       
COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX
    FROM @MANAGE_DB.external_stages.aws_stage_errorex
    file_format= (FORMAT_NAME=MANAGE_DB.file_formats.my_file_format)
    files = ('OrderDetails_error.csv')
    ON_ERROR = 'SKIP_FILE_3'; 


-- Altering file format object
ALTER file format MANAGE_DB.file_formats.my_file_format
    SET SKIP_HEADER = 1;
    
-- Defining properties on creation of file format object   
CREATE OR REPLACE file format MANAGE_DB.file_formats.my_file_format
    TYPE=JSON,
    TIME_FORMAT=AUTO;    
    
-- See properties of file format object    
DESC file format MANAGE_DB.file_formats.my_file_format;   

  
-- Using file format object in Copy command       
COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX
    FROM @MANAGE_DB.external_stages.aws_stage_errorex
    file_format= (FORMAT_NAME=MANAGE_DB.file_formats.my_file_format)
    files = ('OrderDetails_error.csv')
    ON_ERROR = 'SKIP_FILE_3'; 


-- Altering the type of a file format is not possible
ALTER file format MANAGE_DB.file_formats.my_file_format
SET TYPE = CSV;


-- Recreate file format (default = CSV)
CREATE OR REPLACE file format MANAGE_DB.file_formats.my_file_format;


-- See properties of file format object    
DESC file format MANAGE_DB.file_formats.my_file_format;   



-- Truncate table
TRUNCATE table OUR_FIRST_DB.PUBLIC.ORDERS_EX;



-- Overwriting properties of file format object      
COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS_EX
    FROM  @MANAGE_DB.external_stages.aws_stage_errorex
    file_format = (FORMAT_NAME= MANAGE_DB.file_formats.my_file_format  field_delimiter = ',' skip_header=1 )
    files = ('OrderDetails_error.csv')
    ON_ERROR = 'SKIP_FILE_3'; 

DESC STAGE MANAGE_DB.external_stages.aws_stage_errorex;

-----------------------------------------------------------------
--                        Assignment 4                         --
-----------------------------------------------------------------
-- Point 1
CREATE OR REPLACE DATABASE EXERCISE_DB;

CREATE TABLE EXERCISE_DB.PUBLIC.customer (
  "ID" INT,
  "first_name" VARCHAR,
  "last_name" VARCHAR,
  "email" VARCHAR,
  "age" INT,
  "city" VARCHAR);

CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage_mc
    url='s3://snowflake-assignments-mc/fileformat/';

 
CREATE OR REPLACE file format MANAGE_DB.file_formats.aws_stage_mc
    FIELD_DELIMITER="|",
    SKIP_HEADER=1;

DESC file format MANAGE_DB.file_formats.aws_stage_mc;

-- Point 2
use MANAGE_DB.external_stages;
LIST @aws_stage;
LIST @aws_stage_mc;

COPY INTO EXERCISE_DB.PUBLIC.customer
    FROM @aws_stage_mc
    file_format= (FORMAT_NAME=MANAGE_DB.FILE_FORMATS.aws_stage_mc)
    ON_ERROR = 'CONTINUE';

SELECT * FROM EXERCISE_DB.PUBLIC.customer;

-----------------------------------------------------------------
--                        Assignment 5                         --
-----------------------------------------------------------------
-- 1. Creating table
CREATE OR REPLACE TABLE EXERCISE_DB.PUBLIC.employees (
    CUSTOMER_ID INT,
    "first_name" VARCHAR(50),
    "last_name" VARCHAR(50),
    "email" VARCHAR(50),
    "age" INT,
    "department" VARCHAR(50)
);

-- 2. Create new stage
CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage_assignment5
    url='s3://snowflake-assignments-mc/copyoptions/example1';
-- List files in stage
LIST @MANAGE_DB.external_stages.aws_stage_assignment5;

-- 3. Create a file format object with the specification
CREATE OR REPLACE file format MANAGE_DB.file_formats.aws_file_format_assignment5
    TYPE = CSV
    FIELD_DELIMITER=','
    SKIP_HEADER=1;
DESC file format MANAGE_DB.file_formats.aws_file_format_assignment5;

-- 4. Use the copy option to only validate if there are errors and if yes what errors.
COPY INTO EXERCISE_DB.PUBLIC.employees
    FROM  @MANAGE_DB.external_stages.aws_stage_assignment5
    file_format = (FORMAT_NAME= MANAGE_DB.file_formats.aws_file_format_assignment5  field_delimiter = ',' skip_header=1 )
    //files = ('*employees.csv')
    VALIDATION_MODE=RETURN_ERRORS;
-- Error: Numeric value '-' is not recognized
-- Line 10, Character 1, row 9
-- Rejected record: -,Sutherland,Deinhard,sdeinhard8@wunderground.com,81,Legal

-- 5. Load the data anyways regardless of the error using the ON_ERROR option. How many rows have been loaded?
COPY INTO EXERCISE_DB.PUBLIC.employees
    FROM  @MANAGE_DB.external_stages.aws_stage_assignment5
    file_format = (FORMAT_NAME= MANAGE_DB.file_formats.aws_file_format_assignment5  field_delimiter = ',' skip_header=1 )
    ON_ERROR=CONTINUE;
-- Status: PARTIALLY_LOADED
-- Row parsed: 122
-- Row ;oaded: 121
-- Error seen: 1
-- First error line: 10