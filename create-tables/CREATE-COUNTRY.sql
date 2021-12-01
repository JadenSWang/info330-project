CREATE TABLE COUNTRY (
        country_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        customer_id INTEGER FOREIGN KEY REFERENCES CUSTOMER(customer_id) NOT NULL,
        country_name VARCHAR(60) NOT NULL
)