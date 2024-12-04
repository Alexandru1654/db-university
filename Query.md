SELECT * FROM students WHERE YEAR(birth_date) = 1990;

SELECT * FROM courses WHERE credits > 10;

SELECT * FROM students WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) > 30;

SELECT * FROM courses
WHERE semester = 1 AND year = 1;

SELECT * FROM exam_sessions
WHERE exam_date = '2020-06-20' AND HOUR(exam_time) > 14;

SELECT * FROM degree_programs WHERE degree_type = 'Laurea Magistrale';

SELECT COUNT(DISTINCT department_id) FROM departments;

SELECT COUNT(*) FROM professors WHERE phone_number IS NULL;

INSERT INTO students (first_name, last_name, birth_date, degree_id)
VALUES ('Giuseppe', 'Verdi', '1995-01-01', (SELECT degree_id FROM degree_programs ORDER BY RAND() LIMIT 1));

UPDATE professors SET office_number = '126' WHERE first_name = 'Pietro' AND last_name = 'Rizzo';

DELETE FROM students WHERE first_name = 'Giuseppe' AND last_name = 'Verdi' AND birth_date = '1995-01-01';
