SELECT students.first_name, students.last_name, groups.name AS group_name
FROM students
JOIN groups ON students.group_id = groups.id;

SELECT teachers.first_name, teachers.last_name, departments.name AS department_name
FROM teachers
JOIN departments ON teachers.department_id = departments.id;

SELECT groups.name AS group_name, COUNT(students.id) AS student_count
FROM groups
LEFT JOIN students ON groups.id = students.group_id
GROUP BY groups.name;

SELECT departments.name AS department_name, teachers.first_name AS teacher_first_name,
       teachers.last_name AS teacher_last_name, groups.name AS group_name,
       students.first_name AS student_first_name, students.last_name AS student_last_name
FROM teachers
JOIN departments ON teachers.department_id = departments.id
JOIN groups ON teachers.id = groups.department_id
JOIN students ON groups.id = students.group_id
WHERE teachers.last_name IN ('Smith', 'Williams', 'Johnson')
ORDER BY groups.name, students.last_name;


SELECT
    films.id,
    films.film_title,
    films.release_year,
    actors.id,
    actors.actor_name,
    directors.id,
    directors.director_name
FROM films
LEFT JOIN actors ON films.id = actors.id
LEFT JOIN directors ON films.id = directors.id
ORDER BY films.id
LIMIT 5;


SELECT
    CONCAT(
        'This is ',
        name,
        CASE gender
            WHEN 'm' THEN ' he has email ' || email
            WHEN 'f' THEN ' she has email ' || email
        END
    ) AS info
FROM person;


SELECT
    'We have ' || COUNT(CASE WHEN gender = 'm' THEN 1 END) || ' boys!' AS "Gender information"
FROM person
UNION
SELECT
    'We have ' || COUNT(CASE WHEN gender = 'f' THEN 1 END) || ' girls' AS "Gender information"
FROM person;

SELECT vocabulary.name, count (word.id) AS words FROM vocabulary JOIN word ON vocabulary.id = word.vocabulary_id
GROUP BY vocabulary.name;