CREATE TABLE COMPANY_TYPE
(
        company_type_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        company_type_name VARCHAR(50) NOT NULL
);

CREATE TABLE COUNTRY
(
        country_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        country_name VARCHAR(60) NOT NULL
);

CREATE TABLE COMPANY
(
        company_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        company_name VARCHAR(256) NOT NULL,
        company_type_id INTEGER FOREIGN KEY REFERENCES COMPANY_TYPE(company_type_id) NOT NULL,
        country_id INTEGER FOREIGN KEY REFERENCES COUNTRY(country_id) NOT NULL
);

CREATE TABLE COMPANY_ROLE
(
        company_role_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        role_name VARCHAR(30) NOT NULL
);

CREATE TABLE COMPANY_PROD
(
        company_prod_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        company_role_id INTEGER FOREIGN KEY REFERENCES COMPANY_ROLE(company_role_id) NOT NULL,
        company_id INTEGER FOREIGN KEY REFERENCES COMPANY(company_id) NOT NULL
);

CREATE TABLE CUSTOMER
(
        customer_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        customer_username VARCHAR(50) UNIQUE NOT NULL,
        customer_dob DATE NOT NULL,
        customer_country VARCHAR(60)
);

CREATE TABLE SUBSCRIPTION
(
        subscription_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        company_prod_id INTEGER FOREIGN KEY REFERENCES COMPANY_PROD(company_prod_id) NOT NULL,
        customer_id INTEGER FOREIGN KEY REFERENCES CUSTOMER(customer_id) NOT NULL
);

CREATE TABLE PROFESSIONAL
(
        professional_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        professional_fname VARCHAR(30) NOT NULL,
        professional_lname VARCHAR(30) NOT NULL,
        professional_dob DATE NOT NULL
);

CREATE TABLE PRODUCTION_TYPE
(
        production_type_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        production_name VARCHAR(50) NOT NULL
);

CREATE TABLE RATING
(
        rating_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        rating_name VARCHAR(5) NOT NULL
);

CREATE TABLE PRODUCTION
(
        production_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        production_type_id INTEGER FOREIGN KEY REFERENCES PRODUCTION_TYPE(production_type_id) NOT NULL,
        award_id INTEGER FOREIGN KEY REFERENCES AWARD(award_id) NOT NULL,
        rating_id INTEGER FOREIGN KEY REFERENCES RATING(rating_id) NOT NULL,
        review_id INTEGER FOREIGN KEY REFERENCES REVIEW(review_id)
);

CREATE TABLE STREAM
(
        production_id INTEGER FOREIGN KEY REFERENCES PRODUCTION(production_id) NOT NULL,
        customer_id INTEGER FOREIGN KEY REFERENCES CUSTOMER(customer_id) NOT NULL
);

CREATE TABLE POSITION
(
        position_id INTEGER PRIMARY KEY,
        position_name VARCHAR(30) NOT NULL
);

CREATE TABLE CREDIT
(
        production_id INTEGER FOREIGN KEY REFERENCES PRODUCTION(production_id) NOT NULL,
        position_id INTEGER FOREIGN KEY REFERENCES POSITION(position_id) NOT NULL
);

CREATE TABLE AWARD
(
        award_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        award_name VARCHAR(50) NOT NULL
);

CREATE TABLE NOMINATIONS
(
        nomination_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        professional_id INTEGER FOREIGN KEY REFERENCES PROFESSIONAL(professional_id) NOT NULL,
        award_id INTEGER FOREIGN KEY REFERENCES AWARD(award_id) NOT NULL,
        received BIT
);

CREATE TABLE ALLOWED_COUNTRIES
(
        production_id INTEGER FOREIGN KEY REFERENCES PRODUCTION(production_id) NOT NULL,
        country_id INTEGER FOREIGN KEY REFERENCES COUNTRY(country_id) NOT NULL
);

CREATE TABLE REVIEW
(
        review_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        review VARCHAR(MAX) NOT NULL,
        rating INTEGER NOT NULL
);

CREATE TABLE RATING (
        rating_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        rating_name VARCHAR(50),
        age_limit INTEGER
)