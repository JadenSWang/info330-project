-- Number of productions that won the award ‘Best picture’ that was directed by a female director
-- Jaden Wang

CREATE FUNCTION fnFemaleDirectorBestPicture(@PK VARCHAR(50))
    RETURNS VARCHAR(256)
    AS BEGIN
        DECLARE @RET VARCHAR(256) = (
            SELECT COUNT(PRO.professional_id)
            FROM PRODUCTION P
                JOIN PRODUCTION_NOMINATION PN on P.production_id = PN.production_id
                JOIN AWARD A on PN.award_id = A.award_id
                JOIN PROFESSIONAL_NOMINATION PRN on A.award_id = PRN.award_id
                JOIN PROFESSIONAL PRO on PRN.professional_id = PRO.professional_id
            WHERE A.award_id = @PK
            AND A.award_name = 'Best Picture'
            AND PRO.gender = 'f'
        )
        RETURN @RET
    END
GO

ALTER TABLE AWARD
ADD BestPictureByFemaleDirectors AS (dbo.fnFemaleDirectorBestPicture(A.award_id))