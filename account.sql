DROP TABLE IF EXISTS account;

-- This a table to hold the user accounts
CREATE TABLE account (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  hashedpass VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO account (username, hashedpass) VALUES ('km', '$2y$10$5YkfLoIRC1mLjpO8RSQKAuo431zsSmgRWaEwIAFhvlVFdl5tt8umi');
