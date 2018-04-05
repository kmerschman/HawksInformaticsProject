
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
        hawkid                 VARCHAR(10),
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
        hawkidStudent           VARCHAR(10) NOT NULL,
        hawkidTutor             VARCHAR(10) NOT NULL,
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
        open                    CHAR(1);)




-- faculty table
CREATE TABLE faculty   (
        hawkid         VARCHAR(10) PRIMARY KEY NOT NULL,
        courseNumber   VARCHAR(6)  FOREIGN KEY NOT NULL;)




-- student table
CREATE TABLE student   (
        hawkid                  VARCHAR(10) PRIMARY KEY NOT NULL,
        courseNumber            VARCHAR(6) FOREIGN KEY NOT NULL,
	tutorCreditsRemaining   INTEGER,





-- problemSet table
CREATE TABLE problemSet   (
        problemNumber           INTEGER PRIMARY KEY NOT NULL,
	      question                VARCHAR(400) NOT NULL,
	      courseNumber            VARCHAR(6));

INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('', '', '');
INSERT INTO course  (courseNumber, studentsEnrolled, courseDate, courseTime) VALUES  ('', '', '', '');
INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('', '', '');
INSERT INTO faculty  (hawkid, courseNumber) VALUES  ('', '');
INSERT INTO sessionSchedule  (session_id, sessionDateTime, courseNumber, open) VALUES  ('', '', '', '', '');
INSERT INTO tutorSession  (session_id, hawkid, hawkid, courseNumber, studentCancel, tutorCancel) VALUES  ('', '', '', '', '', '');
INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('', '', '');
INSERT INTO tutor  (hawkid, courseNumber) VALUES  ('', '');