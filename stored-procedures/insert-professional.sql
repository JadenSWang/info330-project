CREATE PROCEDURE INSERT_PROFESSIONAL
    @prof_fname VARCHAR(30),
    @prof_lname VARCHAR(30),
    @prof_dob DATE,
    @gender BIT
AS
BEGIN TRANSACTION T1
    INSERT INTO PROFESSIONAL
    VALUES
    (@prof_fname, @prof_lname, @prof_dob, @gender)
COMMIT TRANSACTION T1

-- EXECUTE INSERT_PROFESSIONAL
-- @prof_fname = '',
-- @prof_lname = '',
-- @prof_dob = '',
-- @gender = ''
-- GO;
