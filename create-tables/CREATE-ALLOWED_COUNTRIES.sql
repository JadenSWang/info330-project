CREATE TABLE ALLOWED_COUNTRIES (
        production_id INTEGER FOREIGN KEY REFERENCES PRODUCTION(production_id) NOT NULL,
        country_id INTEGER FOREIGN KEY REFERENCES COUNTRY(country_id) NOT NULL
)