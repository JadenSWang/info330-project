-- [#3] production that has been streamed the most in the genre 'Action' that has been directed
-- by professional 'Michael Bae'
SELECT P.production_name,
FROM (
     SELECT P.production_name, COUNT(S.production_id) AS num_stream
     FROM STREAM S
        JOIN PRODUCTION P on S.production_id = P.production_id
        JOIN GENRE G on P.genre_id = G.genre_id
         )
WHERE (
    SELECT professional_fname, professional_lname
    FROM PROFESSIONAL
    WHERE professional_fname = 'Michael'
    AND professional_lname = 'Bay')
AND G.genre_name = 'Action'