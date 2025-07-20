-- Database to manage stage objects, fileformats etc.
CREATE OR REPLACE DATABASE MANAGE_DB;
CREATE OR REPLACE SCHEMA external_stages;

-- Creating external stage
-- Publicly accessible staging area
CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage
    url='s3://bucketsnowflakes3';
-- We can also provide credentials
--    credentials=(aws_key_id='ABCD_DUMMY_ID' aws_secret_key='1234abcd_key');

-- Description of external stage
DESC STAGE MANAGE_DB.external_stages.aws_stage; 

-- We can also alter stage, after creation
-- Alter external stage   
--ALTER STAGE aws_stage
--    SET credentials=(aws_key_id='XYZ_DUMMY_ID' aws_secret_key='987xyz');

-- List files in stage
LIST @aws_stage;

-- Create orders table
CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.ORDERS (
    ORDER_ID VARCHAR(30),
    AMOUNT INT,
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30));

--Dont execute
-- Load data using copy command
COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS
    FROM @aws_stage
    file_format= (type = csv field_delimiter=',' skip_header=1)
    pattern='.*Order.*';

-- Copy
COPY INTO OUR_FIRST_DB.PUBLIC.ORDERS
    FROM @MANAGE_DB.external_stages.aws_stage
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails.csv');

SELECT * from OUR_FIRST_DB.PUBLIC.ORDERS;

-- Assignment 3
CREATE OR REPLACE DATABASE MANAGE_DB;
