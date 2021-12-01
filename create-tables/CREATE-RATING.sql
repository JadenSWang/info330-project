CREATE TABLE RATING (
        rating_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        rating_name VARCHAR(50) NOT NULL,
        age_limit INTEGER NOT NULL
)