CREATE PROCEDURE INSERT_NOMINATION (
    @award_name VARCHAR(256),
    @professional_fname VARCHAR(30),
    @professional_lname VARCHAR(30),
    @professional_dob DATE,
    @received BIT
) 
AS DECLARE @award_id, @professional_id INTEGER 
BEGIN TRANSACTION T1
SET
    @award_id = (SELECT award_id FROM AWARD WHERE award_name = @award_name)
SET
    @professional_id = (
        SELECT
            professional_id
        FROM
            PROFESSIONAL
        WHERE
            professional_fname = @professional_fname
            AND professional_lname = @professional_lname
            AND professional_dob = @professional_dob
    )
INSERT INTO
    NOMINATION (award_id, professional_id, received)
VALUES
(@award_id, @professional_id, @received) COMMIT TRANSACTION T1
