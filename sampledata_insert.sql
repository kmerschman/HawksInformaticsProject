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
