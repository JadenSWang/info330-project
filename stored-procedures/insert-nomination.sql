-- stored procedures

CREATE PROCEDURE NOMINATE
@p_fname VARCHAR(30),
@p_lname VARCHAR(30),
@a_name VARCHAR(50)
@receive BIT
AS
DECLARE @P_ID INT, A_ID INT
SET @P_ID = (
        SELECT P.professional_id
        FROM PROFESSIONAL P
        WHERE P.professional_fname = @p_fname
        AND P.professional_lname = @p_lname
    )
SET @A_ID = (
        SELECT A.award_id
        FROM AWARD A
        WHERE A.award_name = @a_name
    )
INSERT INTO NOMINATIONS (professional_id, award_id, received)
VALUES
(@P_ID, @A_ID, @receive)

EXECUTE NOMINATE
@p_fname = 'John'
@p_lname = 'Doe'
@a_name = 'Academy Awards'
@receive = 1
GO;
