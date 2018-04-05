
-- course table
DROP TABLE tutor;
DROP TABLE course;

CREATE TABLE course   (
        courseNumber            VARCHAR(6) NOT NULL,
	studentsEnrolled        VARCHAR(25) NOT NULL,
	courseDate              DATE,
        courseTime              TIME,
	PRIMARY KEY (courseNumber));

INSERT INTO course  (courseNumber, studentsEnrolled, courseDate, courseTime) VALUES  ('', '', '', '');

-- tutor table
CREATE TABLE tutor   (
        hawkid                 VARCHAR(10),
        courseNumber           VARCHAR(6),
	FOREIGN KEY (courseNumber) REFERENCES course(courseNumber),
	PRIMARY KEY (hawkid));

INSERT INTO tutor  (hawkid, courseNumber) VALUES  ('', '');

-- tutorAvailability table
CREATE TABLE tutorAvailability   (
        calendar_id            VARCHAR(10) NOT NULL,
        sessionDate            DATE,
        sessionTime            TIME,
	FOREIGN KEY (sessionDate) REFERENCES sessionSchedule(sessionDate),
	FOREIGN KEY (sessionTime) REFERENCES sessionSchedule(sessionTime),
	PRIMARY KEY (calendar_id));

INSERT INTO tutorAvailability  (calendar_id, sessionDate, sessionTime) VALUES  ('', '', '');


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

INSERT INTO tutorSession  (session_id, hawkid, hawkid, courseNumber, studentCancel, tutorCancel) VALUES  ('', '', '', '', '', '');

-- sessionSchedule table
CREATE TABLE sessionSchedule   (
        session_id              VARCHAR(10) PRIMARY KEY NOT NULL,
        sessionDate             date,
        sessionTime             time
        courseNumber            VARCHAR(6)  FOREIGN KEY NOT NULL,
        open                    CHAR(1);)

INSERT INTO sessionSchedule  (session_id, sessionDate, sessionTime, courseNumber, open) VALUES  ('', '', '', '', '');


-- faculty table
CREATE TABLE faculty   (
        hawkid(faculty)         VARCHAR(10) PRIMARY KEY NOT NULL,
        courseNumber            VARCHAR(6)  FOREIGN KEY NOT NULL;)

INSERT INTO faculty  (hawkid, courseNumber) VALUES  ('', '');


-- student table
CREATE TABLE student   (
        hawkid                  VARCHAR(10) PRIMARY KEY NOT NULL,
        courseNumber            VARCHAR(6) FOREIGN KEY NOT NULL,
	      tutorCreditsRemaining   INTEGER,

INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('', '', '');



-- problemSet table
CREATE TABLE problemSet   (
        problemNumber           INTEGER PRIMARY KEY NOT NULL,
	      question                VARCHAR2(400) NOT NULL,
	      courseNumber            VARCHAR(6));

INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('', '', '');
