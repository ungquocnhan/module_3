USE quan_ly_sinh_vien;

SELECT 
    address, COUNT(student_id) AS so_luong_hoc_vien
FROM
    student
GROUP BY address;

SELECT 
    s.student_id, s.student_name, AVG(mark)
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
GROUP BY s.student_id , s.student_name;

SELECT 
    s.student_id, s.student_name, AVG(mark)
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
GROUP BY s.student_id , s.student_name
HAVING AVG(mark) > 15;

SELECT 
    s.student_id, s.student_name, AVG(mark)
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
GROUP BY s.student_id , s.student_name
HAVING AVG(mark) >= ALL (SELECT 
        AVG(mark)
    FROM
        mark
    GROUP BY mark.student_id);