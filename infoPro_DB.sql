-- course table
DROP TABLE IF EXISTS problemSet;
DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS faculty;
DROP TABLE IF EXISTS tutorSession;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS sessionSchedule;
DROP TABLE IF EXISTS tutor;
DROP TABLE IF EXISTS course;

CREATE TABLE course   (
        courseNumber            VARCHAR(6) NOT NULL,
	      studentsEnrolled        VARCHAR(25) NOT NULL,
        courseDateTime          DATETIME NOT NULL,
	      PRIMARY KEY (courseNumber));


-- tutor table
CREATE TABLE tutor   (
        hawkidTutor            VARCHAR(20),
        courseNumber           VARCHAR(6),
	      FOREIGN KEY (courseNumber) REFERENCES course(courseNumber),
	      PRIMARY KEY (hawkidTutor));


-- sessionSchedule table
CREATE TABLE sessionSchedule   (
        session_id              VARCHAR(10) NOT NULL,
        sessionDateTime         DATETIME NOT NULL,
        courseNumber            VARCHAR(6) NOT NULL,
        openSession             CHAR(1),
        FOREIGN KEY (courseNumber) REFERENCES course (courseNumber),
        PRIMARY KEY (session_id));





-- student table
CREATE TABLE student   (
        hawkidStudent           VARCHAR(20) NOT NULL,
        courseNumber            VARCHAR(6) NOT NULL,
	      tutorCreditsRemaining   INTEGER,
        FOREIGN KEY (courseNumber) REFERENCES course(courseNumber),
        PRIMARY KEY (hawkidStudent));


-- tutorSession table
CREATE TABLE tutorSession   (
        session_id              VARCHAR(10) NOT NULL,
        hawkidStudent           VARCHAR(20) NOT NULL,
        hawkidTutor             VARCHAR(20) NOT NULL,
        courseNumber            VARCHAR(6)  NOT NULL,
        studentCancel           CHAR(1),
        tutorCancel             CHAR(1),
        FOREIGN KEY (hawkidStudent) REFERENCES student(hawkidStudent),
	      FOREIGN KEY (hawkidTutor) REFERENCES tutor(hawkidTutor),
        FOREIGN KEY (courseNumber) REFERENCES course(courseNumber),
        PRIMARY KEY (session_id));


-- faculty table
CREATE TABLE faculty   (
        hawkidFaculty           VARCHAR(20) NOT NULL,
        courseNumber            VARCHAR(6) NOT NULL,
        FOREIGN KEY (courseNumber) REFERENCES course (courseNumber),
        PRIMARY KEY (hawkidFaculty));

-- admin table
CREATE TABLE admins   (
        hawkidAdmin             VARCHAR(20) NOT NULL,
        PRIMARY KEY (hawkidAdmin));



-- problemSet table
CREATE TABLE problemSet   (
        problemNumber           INTEGER NOT NULL,
	      question                VARCHAR(400) NOT NULL,
	      courseNumber            VARCHAR(6),
        PRIMARY KEY (problemNumber));





-- sample data insert statements
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('1', 'what is 2 + 2?', 'CS:1020');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('2', 'what is the difference between python and ruby?', 'CS:1110');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('3', 'what is javascript used for?', 'CS:1210');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('4', 'what is 2 + 7?', 'CS:1110');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('5', 'what is the difference between html and html5?', 'CS:1210');
INSERT INTO problemSet  (problemNumber, question, courseNumber) VALUES  ('6', 'what is the bootstrap used for?', 'CS:1020');

INSERT INTO student  (hawkidStudent, courseNumber, tutorCreditsRemaining) VALUES  ('a', 'CS:1210', '20');
INSERT INTO student  (hawkidStudent, courseNumber, tutorCreditsRemaining) VALUES  ('b', 'CS:1110', '60');
INSERT INTO student  (hawkidStudent, courseNumber, tutorCreditsRemaining) VALUES  ('c', 'CS:1020', '40');
INSERT INTO student  (hawkidStudent, courseNumber, tutorCreditsRemaining) VALUES  ('d', 'CS:1020', '60');
INSERT INTO student  (hawkidStudent, courseNumber, tutorCreditsRemaining) VALUES  ('e', 'CS:1110', '60');
INSERT INTO student  (hawkidStudent, courseNumber, tutorCreditsRemaining) VALUES  ('f', 'CS:1210', '20');
INSERT INTO student  (hawkidStudent, courseNumber, tutorCreditsRemaining) VALUES  ('g', 'CS:1110', '60');
INSERT INTO student  (hawkidStudent, courseNumber, tutorCreditsRemaining) VALUES  ('h', 'CS:1210', '40');

INSERT INTO faculty  (hawkidFaculty, courseNumber) VALUES  ('jphourcade', 'CS:1210');
INSERT INTO faculty  (hawkidFaculty, courseNumber) VALUES  ('amsegre', 'CS:1020');
INSERT INTO faculty  (hawkidFaculty, courseNumber) VALUES  ('rparida', 'CS:1110');

INSERT INTO sessionSchedule  (session_id, sessionDateTime, courseNumber, openSession) VALUES  ('1', '', 'CS:1210', 'Y');
INSERT INTO sessionSchedule  (session_id, sessionDateTime, courseNumber, openSession) VALUES  ('2', '', 'CS:1110', 'Y');
INSERT INTO sessionSchedule  (session_id, sessionDateTime, courseNumber, openSession) VALUES  ('3', '', 'CS:1020', 'N');

INSERT INTO tutorSession  (session_id, hawkidStudent, hawkidTutor, courseNumber, studentCancel, tutorCancel) VALUES  ('1', 'a', 'kmerschman', 'CS:1210', '', '');
INSERT INTO tutorSession  (session_id, hawkidStudent, hawkidTutor, courseNumber, studentCancel, tutorCancel) VALUES  ('2', 'b', 'adanover', 'CS:1110', '', '');
INSERT INTO tutorSession  (session_id, hawkidStudent, hawkidTutor, courseNumber, studentCancel, tutorCancel) VALUES  ('3', 'c', 'kmbillings', 'CS:1020', '', '');

INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('1', '');
INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('2', '');
INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('3', '');
INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('4', '');

INSERT INTO tutor  (hawkidTutor, courseNumber) VALUES  ('kmerschman', 'CS:1210');
INSERT INTO tutor  (hawkidTutor, courseNumber) VALUES  ('adanover', 'CS:1110');
INSERT INTO tutor  (hawkidTutor, courseNumber) VALUES  ('kmbillings', 'CS:1020');

INSERT INTO admins  (hawkidAdmin) VALUES  ('kmerschman');
INSERT INTO admins  (hawkidAdmin) VALUES  ('adanover');
INSERT INTO admins  (hawkidAdmin) VALUES  ('kmbillings');
