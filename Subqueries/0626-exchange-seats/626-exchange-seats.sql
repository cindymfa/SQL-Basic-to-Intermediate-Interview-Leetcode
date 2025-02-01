-- swap the seat id of every two consecutive students
-- If the number of students is odd, the id of the last student is not swapped
SELECT id,
CASE 
    WHEN id%2 = 0
    THEN lag(student) OVER (ORDER BY id)
    ELSE COALESCE(lead(student) OVER (ORDER BY id),student)
END AS student
FROM Seat