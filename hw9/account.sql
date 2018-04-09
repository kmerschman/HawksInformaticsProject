DROP TABLE IF EXISTS account;

-- This a table to hold user accounts
CREATE TABLE account (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  hashedpass VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO account (username, hashedpass) VALUES ('jp', '$2a$12$ZHJ8LLXjYecuJhkDspA8o.kFUG9VvfaWX5w3JT7N/xXMuDWpSTIle');