-- find the number of times each student attended each exam.
SELECT a.student_id, a.student_name, b.subject_name, count(e.subject_name) as attended_exams
FROM Students a
CROSS JOIN Subjects b
LEFT JOIN Examinations e
ON a.student_id=e.student_id AND b.subject_name=e.subject_name
GROUP BY a.student_id, a.student_name, b.subject_name
ORDER BY a.student_id, b.subject_name;

