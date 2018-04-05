INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('1', 'what is 2 + 2?', 'CS:1020');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('2', 'what is the difference between python and ruby?', 'CS:1110');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('3', 'what is javascript used for?', 'CS:1210');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('4', 'what is 2 + 7?', 'CS:1110');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('5', 'what is the difference between html and html5?', 'CS:1210');
INSERT INTO course  (problemNumber, question, courseNumber) VALUES  ('6', 'what is the bootstrap used for?', 'CS:1020');

INSERT INTO student  (hawkid, courseNumber, tutorCreditsRemaining) VALUES  ('kmerschman', '', '');


INSERT INTO faculty  (hawkid, courseNumber) VALUES  ('', '');


INSERT INTO sessionSchedule  (session_id, sessionDateTime, courseNumber, open) VALUES  ('', '', '', '', '');


INSERT INTO tutorSession  (session_id, hawkid, hawkid, courseNumber, studentCancel, tutorCancel) VALUES  ('', '', '', '', '', '');


INSERT INTO tutorAvailability  (calendar_id, sessionDateTime) VALUES  ('', '', '');


INSERT INTO tutor  (hawkid, courseNumber) VALUES  ('', '');


INSERT INTO admin  (hawkid) VALUES  ('');
