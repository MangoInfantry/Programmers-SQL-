WITH ids AS (
    SELECT animal_id, animal_type, name
    FROM animal_ins
    WHERE sex_upon_intake = 'Intact Male' OR sex_upon_intake = 'Intact Female'
)
SELECT o.animal_id, o.animal_type, o.name
FROM ids
JOIN animal_outs AS o
ON ids.animal_id = o.animal_id
WHERE o.sex_upon_outcome IN ('Neutered Male', 'Neutered Female', 'Spayed Male', 'Spayed Female');
