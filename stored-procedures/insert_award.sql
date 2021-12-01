CREATE PROCEDURE (@award_name VARCHAR(256), @award_type_name VARCHAR(50))
AS
DECLARE @award_type_id INTEGER
BEGIN TRANSACTION T1
    SET @award_type_id = (SELECT award_type_id FROM AWARD_TYPE WHERE award_type_name = @award_type_name)

    INSERT INTO AWARD (award_name, award_type_id)
    VALUES (@award_name, @award_type_id)
COMMIT TRANSACTION T1