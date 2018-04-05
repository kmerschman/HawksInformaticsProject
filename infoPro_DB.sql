-- course table
DROP TABLE tutor;
DROP TABLE course;

CREATE TABLE course   (
        courseNumber            VARCHAR(6) NOT NULL,
	      studentsEnrolled        VARCHAR(25) NOT NULL,
	      courseDate              DATE,
        courseTime              TIME,
	PRIMARY KEY (courseNumber));



-- tutor table
CREATE TABLE tutor   (
        hawkid                 VARCHAR(20),
        courseNumber           VARCHAR(6),
	FOREIGN KEY (courseNumber)    REFERENCES course(courseNumber),
	PRIMARY KEY (hawkid));


-- tutorAvailability table
CREATE TABLE tutorAvailability   (
        calendar_id            VARCHAR(10) NOT NULL,
        sessionDateTime           DATETIME,
	FOREIGN KEY (sessionDateTime) REFERENCES sessionSchedule(sessionDateTime),
	PRIMARY KEY (calendar_id));



-- tutorSession table
CREATE TABLE tutorSession   (
        session_id              VARCHAR(10) NOT NULL,
        hawkidStudent           VARCHAR(20) NOT NULL,
        hawkidTutor             VARCHAR(20) NOT NULL,
        courseNumber            VARCHAR(6)  NOT NULL,
        studentCancel           CHAR(1),
        tutorCancel             CHAR(1),
  FOREIGN KEY (hawkidStudent) REFERENCES student(hawkid);
	FOREIGN KEY (hawkidTutor) REFERENCES tutor(hawkid);
	FOREIGN KEY (courseNumber) REFERENCES course(courseNumber),
	PRIMARY KEY (session_id));



-- sessionSchedule table
CREATE TABLE sessionSchedule   (
        session_id              VARCHAR(10) PRIMARY KEY NOT NULL,
        sessionDateTime         DATETIME,
        courseNumber            VARCHAR(6)  FOREIGN KEY NOT NULL,
        open                    CHAR(1));


-- faculty table
CREATE TABLE faculty   (
        hawkidFaculty           VARCHAR(20) PRIMARY KEY NOT NULL,
        courseNumber            VARCHAR(6)  FOREIGN KEY NOT NULL,
  FOREIGN KEY (hawkidFaculty) REFERENCES role(hawkid));

-- admin table
CREATE TABLE admin   (
        hawkidAdmin             VARCHAR(20) PRIMARY KEY NOT NULL,
  FOREIGN KEY (hawkidAdmin) REFERENCES role(hawkid));


-- student table
CREATE TABLE student   (
        hawkidStudent           VARCHAR(20) PRIMARY KEY NOT NULL,
        courseNumber            VARCHAR(6) FOREIGN KEY NOT NULL,
	      tutorCreditsRemaining   INTEGER,
  FOREIGN KEY (courseNumber) REFERENCES course(courseNumber),
  FOREIGN KEY (hawkidStudent) REFERENCES role(hawkid));


-- problemSet table
CREATE TABLE problemSet   (
        problemNumber           INTEGER PRIMARY KEY NOT NULL,
	      question                VARCHAR(400) NOT NULL,
	      courseNumber            VARCHAR(6));





-- sample data insert statements
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('1', 'what is 2 + 2?', 'CS:1020');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('2', 'what is the difference between python and ruby?', 'CS:1110');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('3', 'what is javascript used for?', 'CS:1210');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('4', 'what is 2 + 7?', 'CS:1110');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('5', 'what is the difference between html and html5?', 'CS:1210');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('6', 'what is the bootstrap used for?', 'CS:1020');


INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('a', 'CS:1210', '20');
INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('b', 'CS:1110', '60');
INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('c', 'CS:1020', '40');
INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('d', 'CS:1020', '60');
INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('e', 'CS:1110', '60');
INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('f', 'CS:1210', '20');
INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('g', 'CS:1110', '60');
INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('h', 'CS:1210', '40');


INSERT INTO faculty  (hawkid, courseNumber) VALUES  ('jphourcade', 'CS:1210');
INSERT INTO faculty  (hawkid, courseNumber) VALUES  ('amsegre', 'CS:1020');
INSERT INTO faculty  (hawkid, courseNumber) VALUES  ('rparida', 'CS:1110');


INSERT INTO sessionSchedule  (session_id, sessionDateTime, courseNumber, open) VALUES  ('1', '', 'CS:1210', 'Y');
INSERT INTO sessionSchedule  (session_id, sessionDateTime, courseNumber, open) VALUES  ('2', '', 'CS:1110', 'Y');
INSERT INTO sessionSchedule  (session_id, sessionDateTime, courseNumber, open) VALUES  ('3', '', 'CS:1020', 'N');


INSERT INTO tutorSession  (session_id, hawkidStudent, hawkidTutor, courseNumber, studentCancel, tutorCancel) VALUES  ('1', 'a', 'kmerschman', 'CS:1210', '', '');
INSERT INTO tutorSession  (session_id, hawkidStudent, hawkidTutor, courseNumber, studentCancel, tutorCancel) VALUES  ('2', 'b', 'adanover', 'CS:1110', '', '');
INSERT INTO tutorSession  (session_id, hawkidStudent, hawkidTutor, courseNumber, studentCancel, tutorCancel) VALUES  ('3', 'c', 'kmbillings', 'CS:1020', '', '');


INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('1', '');
INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('2', '');
INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('3', '');
INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('4', '');


INSERT INTO tutor  (hawkid, courseNumber) VALUES  ('kmerschman', 'CS:1210');
INSERT INTO tutor  (hawkid, courseNumber) VALUES  ('adanover', 'CS:1110');
INSERT INTO tutor  (hawkid, courseNumber) VALUES  ('kmbillings', 'CS:1020');


INSERT INTO admin  (hawkid) VALUES  ('kmerschman');
INSERT INTO admin  (hawkid) VALUES  ('adanover');
INSERT INTO admin  (hawkid) VALUES  ('kmbillings');
