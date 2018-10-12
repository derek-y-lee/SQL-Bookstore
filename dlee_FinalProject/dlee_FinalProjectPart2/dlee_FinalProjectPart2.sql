/*CS 31A 
Derek Lee
Final Project Part 2 - SQL Queries
dlee_FinalProjectPart2.sql*/

SHOW warnings; /* enable warnings!*/ 

USE University;

/*Query 1: Display all course sections offered in Winter 2017. 
Returns these columns: course_id, section_id, and term_id.*/

SELECT course_id, section_id, term_id 
FROM Section
WHERE term_id = 'WN17';


/*Query 2: Modifies the title of course, CIS253 from Database Systems 
to Introduction to Relational Databases.*/

UPDATE Course
SET title = 'Introduction to Relational Databases'
WHERE title = 'Database Systems' AND course_id = 'CIS253';



/*Query 3: Displays the number of enrollments for section 1103 of Course ID MA150. 
Returns these columns: section_id, course_id and the number of enrollments.*/

SELECT section_id, course_id, COUNT(section_id) AS num_enrollments
FROM Section
WHERE section_id = 1103 AND course_id = 'MA150'
GROUP BY section_id;

/*Query 4: Display the student roster (use the format: <last name>, <first name> in a single column) 
for each section taught by Professor Sen. 
Identify the section using course ID and section ID. 
Returns these columns: course_id , section_id , last_name, and first_name.*/

SELECT sec.course_id, r.section_id, CONCAT(s.last_name, ", ", s.first_name) AS whole_name 
FROM Section sec
JOIN Registration r ON sec.section_id = r.section_id
JOIN Student s ON s.student_id = r.student_id
JOIN Faculty f ON sec.faculty_id = f.faculty_id
WHERE f.name = 'Sen';

/*Query 5: Displays a list of all departments, with the total number of 
instructors in each department, without using subqueries. 
Returns these columns: dept_name and the total number of instructors.*/

SELECT d.dept_name, COUNT(f.faculty_id) AS total_instructors
FROM Department d
JOIN Faculty f ON d.dept_id = f.dept_id
GROUP BY dept_name;


/*Query 6: Displays names of faculty members who work in department 4 or 5. 
This statement should return these columns: faculty_id, name, and department_id.*/

SELECT faculty_id, name, dept_id
FROM Faculty
WHERE dept_id = 4 OR dept_id = 5;

/*Query 7: Displays Winter 2017 course sections with the faculty member 
assigned to teach the class. Returns these columns: course_id, section_id, and name.*/


SELECT sec.course_id, sec.section_id, f.name
FROM Section sec
JOIN Faculty f ON sec.faculty_id = f.faculty_id
JOIN Term t ON t.term_id = sec.term_id
WHERE term_desc = 'Winter 2017';


/*Query 8: Displays names of students, who received an ‘A’ as their final grade in Winter 2017.*/

SELECT CONCAT(s.first_name," ", s.last_name) AS Student, r.final_grade 
FROM Student s
JOIN Registration r ON r.student_id = s.student_id
JOIN Section sec ON r.section_id = sec.section_id
WHERE final_grade LIKE 'A'
AND term_id = 'WN17';

/*Query 9: Displays the total enrollment for course CIS253 in a column named TOTAL ENROLLED.*/

SELECT COUNT(r.student_id) AS Total_Enrolled
FROM Registration r
JOIN Section sec ON sec.section_id = r.section_id
JOIN Course c ON c.course_id = sec.course_id
WHERE c.course_id = 'CIS253';


/*Query 10: Displays course title, total capacity and number of sections 
in each course, where there is more than one section.*/


SELECT c.title, SUM(max_count) AS total_capacity, COUNT(sec.section_id) AS num_sections
FROM Section sec
JOIN Course c ON c.course_id = sec.course_id
WHERE sec.course_id IN(SELECT course_id
					FROM Section
                    GROUP BY course_id
                    HAVING COUNT(section_id) > 1)
GROUP BY c.title;


/*Query 11: Creates a view that lists all course sections offered 
by the Accounting department in Winter 2017.*/
DROP VIEW Accounting_Course_Sections;

CREATE VIEW Accounting_Course_Sections AS 
SELECT section_id FROM Section sec
JOIN Term t ON t.term_id = sec.term_id
JOIN Course c ON c.course_id = sec.course_id
JOIN Department d ON c.dept_id = d.dept_id
WHERE d.dept_name = 'Accounting' AND t.term_desc = 'Winter 2017';

SELECT * FROM Accounting_Course_Sections;

/*Query 12: Shows all the sections whose registration is greater than two students.
Returns these columns: course_id, section_id, and the number of enrollments.*/

SELECT r.section_id, sec.course_id, COUNT(r.section_id) AS number_enrollments 
FROM Section sec
JOIN Registration r ON r.section_id = sec.section_id
WHERE r.section_id IN (SELECT section_id 
						FROM Registration
                        GROUP BY section_id
                        HAVING COUNT(section_id) > 2)
GROUP BY r.section_id;



