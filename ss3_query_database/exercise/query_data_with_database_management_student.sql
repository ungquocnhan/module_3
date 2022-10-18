USE quan_ly_sinh_vien;

SELECT 
    *
FROM
    student
WHERE
    student_name LIKE 'h%';

SELECT 
    *
FROM
    class
WHERE
    start_date LIKE ('%-12-%');

SELECT 
    *
FROM
    subject
WHERE
    credit BETWEEN 3 AND 5;

UPDATE student 
SET 
    class_id = 2
WHERE
    student_name = 'Hung';

SET SQL_SAFE_UPDATES = 1;

SELECT 
    student_name, sub_name, mark
FROM
    mark
        JOIN
    student ON mark.student_id = student.student_id
        JOIN
    subject ON mark.sub_id = subject.sub_id
ORDER BY mark DESC , student_name;