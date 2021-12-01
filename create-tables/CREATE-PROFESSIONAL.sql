CREATE TABLE PROFESSIONAL (
        professional_id INTEGER IDENTITY(1,1) PRIMARY KEY,
        professional_fname VARCHAR(30) NOT NULL,
        professional_lname VARCHAR(30) NOT NULL,
        professional_dob DATE NOT NULL
)