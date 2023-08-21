USE fresher;
CREATE VIEW exercise_2 AS
    SELECT* FROM fresher_management
    WHERE
        ET_IQ + ET_Gmath >= 20 AND ET_IQ >= 8 AND ET_Gmath >= 8 AND ET_English >= 18;
SELECT* FROM exercise_2;