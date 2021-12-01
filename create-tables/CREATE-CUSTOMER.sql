CREATE TABLE CUSTOMER (
        customer_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        customer_username VARCHAR(50) UNIQUE NOT NULL,
        customer_dob DATE NOT NULL,
        customer_country VARCHAR(60) NOT NULL
)