CREATE TABLE REVIEW (
        review_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        review VARCHAR(MAX) NOT NULL,
        rating_stars INTEGER NOT NULL
)