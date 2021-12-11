-- computed column to find the number of award nomination that a professional received
-- Patrick Liu

CREATE FUNCTION fnCalcNumNominations(@professional_id INTEGER)
    RETURNS INTEGER
AS
BEGIN
    DECLARE @RET INTEGER = (SELECT COUNT(*) FROM PROFESSIONAL_NOMINATION WHERE professional_id = @professional_id)
    RETURN @RET
END