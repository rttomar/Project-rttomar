CREATE DATABASE academic_management_system;
USE academic_management_system;

CREATE TABLE StudentInfo (
  STU_ID INT AUTO_INCREMENT PRIMARY KEY,
  STU_NAME VARCHAR(100),
  DOB DATE,
  PHONE_NO VARCHAR(15),
  EMAIL_ID VARCHAR(100),
  ADDRESS TEXT
);

CREATE TABLE CoursesInfo (
  COURSE_ID INT AUTO_INCREMENT PRIMARY KEY,
  COURSE_NAME VARCHAR(100),
  COURSE_INSTRUCTOR_NAME VARCHAR(100)
);

CREATE TABLE EnrollmentInfo (
  ENROLLMENT_ID INT AUTO_INCREMENT PRIMARY KEY,
  STU_ID INT,
  COURSE_ID INT,
  ENROLL_STATUS ENUM('Enrolled', 'Not Enrolled'),
  FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
  FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);

INSERT INTO StudentInfo (STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS)
VALUES
  ('Atul Singh', '1990-01-15', '1234567890', 'atul@email.com', '123 Main St, City'),
  ('Bharat Chauhan', '1991-05-20', '9876543210', 'bharat@email.com', '456 Elm St, Town'),
  ('Deepak Tomar', '1992-07-12', '5555555555', 'deepak@email.com', '789 Oak St, Village'),
  ('Hitesh Pundir', '1993-03-03', '6666666666', 'hitesh@email.com', '101 Pine St, Hamlet'),
  ('Nitesh Sharma', '1994-09-09', '4444444444', 'nitesh@email.com', '222 Birch St, Town'),
  ('Akshay Dravid', '1995-02-18', '7777777777', 'akshay@email.com', '345 Cedar St, City'),
  ('Prabhat Tendulkar', '1996-04-30', '8888888888', 'prabhat@email.com', '789 Redwood St, Town'),
  ('Rahul Chauhan', '1997-08-27', '9999999999', 'rahul@email.com', '456 Sequoia St, Village'),
  ('Rohan Singh', '1998-12-10', '1111111111', 'rohan@email.com', '567 Maple St, City'),
  ('Puneet Tomar', '1999-06-06', '2222222222', 'puneet@email.com', '654 Fir St, Town');

INSERT INTO CoursesInfo (COURSE_NAME, COURSE_INSTRUCTOR_NAME)
VALUES
  ('Math 101', 'Professor Math'),
  ('Physics 101', 'Professor Physics'),
  ('Chemistry 101', 'Professor Chemistry'),
  ('Biology 101', 'Professor Biology'),
  ('Computer Science 101', 'Professor CS'),
  ('History 101', 'Professor History'),
  ('Geography 101', 'Professor Geography'),
  ('Literature 101', 'Professor Literature'),
  ('Economics 101', 'Professor Economics'),
  ('Psychology 101', 'Professor Psychology');

INSERT INTO EnrollmentInfo (STU_ID, COURSE_ID, ENROLL_STATUS)
VALUES
  (1, 1, 'Enrolled'),
  (1, 2, 'Enrolled'),
  (2, 1, 'Enrolled'),
  (2, 3, 'Enrolled'),
  (3, 1, 'Enrolled'),
  (4, 2, 'Enrolled'),
  (5, 2, 'Enrolled'),
  (6, 3, 'Enrolled'),
  (7, 3, 'Enrolled'),
  (8, 1, 'Enrolled'),
  (8, 4, 'Enrolled'),
  (9, 4, 'Enrolled'),
  (9, 5, 'Enrolled'),
  (10, 5, 'Enrolled'),
  (10, 6, 'Enrolled');


SELECT SI.STU_NAME, SI.PHONE_NO, SI.EMAIL_ID, EI.ENROLL_STATUS
FROM StudentInfo SI
JOIN EnrollmentInfo EI ON SI.STU_ID = EI.STU_ID;

SELECT CI.COURSE_NAME
FROM CoursesInfo CI
JOIN EnrollmentInfo EI ON CI.COURSE_ID = EI.COURSE_ID
WHERE EI.STU_ID = 1; 

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo;

SELECT *
FROM CoursesInfo
WHERE COURSE_ID = 1; 

SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE COURSE_ID IN (1, 2, 3); 


SELECT CI.COURSE_NAME, COUNT(EI.STU_ID) AS NUM_ENROLLED
FROM CoursesInfo CI
LEFT JOIN EnrollmentInfo EI ON CI.COURSE_ID = EI.COURSE_ID
GROUP BY CI.COURSE_NAME;


SELECT SI.STU_NAME
FROM StudentInfo SI
JOIN EnrollmentInfo EI ON SI.STU_ID = EI.STU_ID
WHERE EI.COURSE_ID = 1; 


SELECT CI.COURSE_INSTRUCTOR_NAME, COUNT(EI.STU_ID) AS NUM_ENROLLED
FROM CoursesInfo CI
LEFT JOIN EnrollmentInfo EI ON CI.COURSE_ID = EI.COURSE_ID
GROUP BY CI.COURSE_INSTRUCTOR_NAME;

SELECT SI.STU_NAME
FROM StudentInfo SI
JOIN EnrollmentInfo EI ON SI.STU_ID = EI.STU_ID
WHERE EI.ENROLL_STATUS = 'Enrolled'
GROUP BY SI.STU_NAME
HAVING COUNT(DISTINCT EI.COURSE_ID) > 1;

SELECT CI.COURSE_NAME, COUNT(EI.STU_ID) AS NUM_ENROLLED
FROM CoursesInfo CI
LEFT JOIN EnrollmentInfo EI ON CI.COURSE_ID = EI.COURSE_ID
GROUP BY CI.COURSE_NAME
ORDER BY NUM_ENROLLED DESC;
