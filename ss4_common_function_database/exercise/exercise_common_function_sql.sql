USE quan_ly_sinh_vien;

SELECT 
    sub_id, sub_name, MAX(credit)
FROM
    subject;

SELECT 
    s.sub_name, MAX(mark)
FROM
    subject s
        JOIN
    mark m ON m.sub_id = s.sub_id;
    
SELECT 
    s.*, AVG(mark)
FROM
    student s
        LEFT JOIN
    mark m ON s.student_id = m.student_id
GROUP BY s.student_id
ORDER BY m.mark DESC;
    