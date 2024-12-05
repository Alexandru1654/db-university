CREATE TABLE Dipartimenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE CorsiDiLaurea (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    dipartimento_id INT,
    FOREIGN KEY (dipartimento_id) REFERENCES Dipartimenti (id)
);

CREATE TABLE Corsi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    corso_di_laurea_id INT,
    FOREIGN KEY (corso_di_laurea_id) REFERENCES CorsiDiLaurea (id)
);

CREATE TABLE Insegnanti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Corso_Insegnante (
    corso_id INT,
    insegnante_id INT,
    PRIMARY KEY (corso_id, insegnante_id),
    FOREIGN KEY (corso_id) REFERENCES Corsi (id),
    FOREIGN KEY (insegnante_id) REFERENCES Insegnanti (id)
);

SELECT
    YEAR(birth_date) AS anno_iscrizione,
    COUNT(*) AS numero_iscritti
FROM students
GROUP BY
    anno_iscrizione;

SELECT office, COUNT(*) AS numero_insegnanti
FROM professors
GROUP BY
    office;

SELECT exam_id, AVG(grade) AS media_voti
FROM exam_sessions
GROUP BY
    exam_id;

SELECT
    department_id,
    COUNT(*) AS numero_corsi_laurea
FROM degree_programs
GROUP BY
    department_id;

SELECT s.*
FROM
    students s
    JOIN degree_programs dp ON s.degree_id = dp.degree_id
WHERE
    dp.name = 'Economia';

SELECT dp.*
FROM
    degree_programs dp
    JOIN departments d ON dp.department_id = d.department_id
WHERE
    d.name = 'Neuroscienze'
    AND dp.degree_type = 'Laurea Magistrale';

SELECT c.*
FROM
    courses c
    JOIN course_professor cp ON c.course_id = cp.course_id
    JOIN professors p ON cp.professor_id = p.professor_id
WHERE
    p.professor_id = 44;

SELECT
    s.*,
    dp.name AS corso_di_laurea,
    d.name AS dipartimento
FROM
    students s
    JOIN degree_programs dp ON s.degree_id = dp.degree_id
    JOIN departments d ON dp.department_id = d.department_id
ORDER BY s.last_name, s.first_name;

SELECT
    dp.name AS corso_di_laurea,
    c.name AS corso,
    p.name AS insegnante
FROM
    degree_programs dp
    JOIN courses c ON dp.degree_id = c.degree_id
    JOIN course_professor cp ON c.course_id = cp.course_id
    JOIN professors p ON cp.professor_id = p.professor_id;

SELECT DISTINCT
    p.*
FROM
    professors p
    JOIN course_professor cp ON p.professor_id = cp.professor_id
    JOIN courses c ON cp.course_id = c.course_id
    JOIN degree_programs dp ON c.degree_id = dp.degree_id
WHERE
    dp.department_id = 54;


    