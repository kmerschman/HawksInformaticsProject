-- course table

DROP TABLE IF EXISTS problemSet;
DROP TABLE IF EXISTS tutorSlots;
DROP TABLE IF EXISTS studentCourse;
DROP TABLE IF EXISTS facultyCourse;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS account;


CREATE TABLE account (
        id INT NOT NULL AUTO_INCREMENT,
        username VARCHAR(50) NOT NULL UNIQUE,
        hashedpass VARCHAR(255) NOT NULL,
        role_id VARCHAR(5),
        PRIMARY KEY (id));

CREATE TABLE courses   (
        courseNumber VARCHAR(10) NOT NULL,
        courseSite VARCHAR(200) NOT NULL,
	PRIMARY KEY (courseNumber));


CREATE TABLE facultyCourse (
        id INT NOT NULL AUTO_INCREMENT,
        hawkid VARCHAR(50) NOT NULL,
        courseNumber VARCHAR(10),
        FOREIGN KEY(hawkid) REFERENCES account(username),
        FOREIGN KEY(courseNumber) REFERENCES courses(courseNumber),
        PRIMARY KEY (id));

CREATE TABLE studentCourse (
        id INT NOT NULL AUTO_INCREMENT,
        hawkid VARCHAR(50) NOT NULL,
        courseNumber VARCHAR(10) NOT NULL,
        credits INT,
        FOREIGN KEY(hawkid) REFERENCES account(username),
        FOREIGN KEY(courseNumber) REFERENCES courses(courseNumber),
        PRIMARY KEY (id));

CREATE TABLE tutorSlots (
        session_id INT NOT NULL AUTO_INCREMENT,
        hawkidTutor VARCHAR (50) NOT NULL,
        courseNumber VARCHAR (10),
        weekday VARCHAR (10) NOT NULL,
        timeslot VARCHAR (50) NOT NULL,
        hawkidStudent VARCHAR (50),
        FOREIGN KEY(hawkidTutor) REFERENCES account(username),
        FOREIGN KEY(courseNumber) REFERENCES courses(courseNumber),
        PRIMARY KEY (session_id));

-- problemSet table
CREATE TABLE problemSet   (
        problemNumber           INT NOT NULL,
	      question                VARCHAR(400) NOT NULL,
        courseNumber VARCHAR(10),
        FOREIGN KEY (courseNumber) REFERENCES courses (courseNumber),
        PRIMARY KEY (problemNumber));


-- sample data insert statements
INSERT INTO account (username, hashedpass, role_id) VALUES ('kmbillings', '$2a$12$ZHJ8LLXjYecuJhkDspA8o.kFUG9VvfaWX5w3JT7N/xXMuDWpSTIle', 'S');
INSERT INTO account (username, hashedpass, role_id) VALUES ('kmerschman', '$2y$10$5YkfLoIRC1mLjpO8RSQKAuo431zsSmgRWaEwIAFhvlVFdl5tt8umi', 'A'); -- password is informaticsisrad
INSERT INTO account (username, hashedpass, role_id) VALUES ('aldanover', '$2a$12$ZHJ8LLXjYecuJhkDspA8o.kFUG9VvfaWX5w3JT7N/xXMuDWpSTIle', 'T');
INSERT INTO account (username, hashedpass, role_id) VALUES ('tutor1', '$2a$12$ZHJ8LLXjYecuJhkDspA8o.kFUG9VvfaWX5w3JT7N/xXMuDWpSTIle', 'T');
INSERT INTO account (username, hashedpass, role_id) VALUES ('tutor2', '$2a$12$ZHJ8LLXjYecuJhkDspA8o.kFUG9VvfaWX5w3JT7N/xXMuDWpSTIle', 'T');
INSERT INTO account (username, hashedpass, role_id) VALUES ('admin1', '$2a$12$ZHJ8LLXjYecuJhkDspA8o.kFUG9VvfaWX5w3JT7N/xXMuDWpSTIle', 'A');
INSERT INTO account (username, hashedpass, role_id) VALUES ('student1', '$2a$12$ZHJ8LLXjYecuJhkDspA8o.kFUG9VvfaWX5w3JT7N/xXMuDWpSTIle', 'S');
INSERT INTO account (username, hashedpass, role_id) VALUES ('faculty1', '$2b$10$ZjCQY5THZ0uvSvGFIEMSz.KuVJDmpawOwdUhqrXSrgsTsX3ur7rSy', 'F'); --password is informatics

INSERT INTO courses (courseNumber, courseSite) VALUES ('CS:1210', 'https://myui.uiowa.edu/my-ui/courses/details.page?_ticket=pnIq7SxbPdEHaknms2z-eR_B-2q8QW-i&id=859637&ci=158650');
INSERT INTO courses (courseNumber, courseSite) VALUES ('CS:1110', 'https://myui.uiowa.edu/my-ui/courses/details.page?_ticket=JFGV31LvRR1m8tDnuBBevB_B-2q8QW-i&id=859633&ci=158649');
INSERT INTO courses (courseNumber, courseSite) VALUES ('CS:1020', 'https://myui.uiowa.edu/my-ui/courses/details.page?_ticket=ilhW5UVVqWHIvlhQWoBzMBUlS3eSxOWK&id=861097&ci=149634');

INSERT INTO studentCourse (hawkid, courseNumber, credits) VALUES ('kmbillings', 'CS:1210', 20);
INSERT INTO studentCourse (hawkid, courseNumber, credits) VALUES ('kmbillings', 'CS:1110', 30);
INSERT INTO studentCourse (hawkid, courseNumber, credits) VALUES ('kmbillings', 'CS:1020', 40);

INSERT INTO tutorSlots (hawkidTutor, courseNumber, weekday, timeslot, hawkidStudent) VALUES ('tutor1', 'CS:1210', 'Monday', '10:00 AM - 10:50 AM', NULL);
INSERT INTO tutorSlots (hawkidTutor, courseNumber, weekday, timeslot, hawkidStudent) VALUES ('tutor1', 'CS:1210', 'Tuesday', '2:00 PM - 2:50 PM', NULL);
INSERT INTO tutorSlots (hawkidTutor, courseNumber, weekday, timeslot, hawkidStudent) VALUES ('tutor1', 'CS:1110', 'Tuesday', '4:00 PM - 4:50 PM', NULL);
INSERT INTO tutorSlots (hawkidTutor, courseNumber, weekday, timeslot, hawkidStudent) VALUES ('tutor2', 'CS:1210', 'Thursday', '4:00 PM - 4:50 PM', NULL);
INSERT INTO tutorSlots (hawkidTutor, courseNumber, weekday, timeslot, hawkidStudent) VALUES ('tutor2', 'CS:1020', 'Wednesday', '11:00 AM - 11:50 AM', NULL);
INSERT INTO tutorSlots (hawkidTutor, courseNumber, weekday, timeslot, hawkidStudent) VALUES ('tutor2', 'CS:1110', 'Tuesday', '12:00 PM - 12:50 PM', NULL);

INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('1', 'what is 2 + 2?', 'CS:1020');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('2', 'what is the difference between python and ruby?', 'CS:1110');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('3', 'what is javascript used for?', 'CS:1210');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('4', 'what is 2 + 7?', 'CS:1110');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('5', 'what is the difference between html and html5?', 'CS:1210');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('6', 'what is the bootstrap used for?', 'CS:1020');
