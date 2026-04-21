# 1623. All Valid Triplets That Can Represent a Country

SELECT s1.student_name AS member_A, s2.student_name AS member_B, s3.student_name AS member_C
FROM SchoolA AS s1
INNER JOIN SchoolB AS s2
ON s1.student_id <> s2.student_id
AND s1.student_name <> s2.student_name
INNER JOIN SchoolC AS s3
ON s2.student_id <> s3.student_id
AND s3.student_name <> s3.student_name
AND s1.student_id <> s3.student_id
AND s1.student_name <> s3.student_name
