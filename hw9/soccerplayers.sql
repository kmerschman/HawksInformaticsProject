-- drop the table soccerplayers if it already exists
DROP TABLE IF EXISTS soccerplayers;

-- create a table to hold information on soccer players
-- for all the columns/variables that will be eventually sent to the web app, use exactly the same spelling/capitalization
CREATE TABLE soccerplayers (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    country VARCHAR(255) NOT NULL,
    club VARCHAR(255) NOT NULL,
    video VARCHAR(255),
    PRIMARY KEY (id)
                            );

-- insert some players into the table
INSERT INTO soccerplayers (name, country, club, video) VALUES ("Lionel Messi", "Argentina", "Barcelona", "E2MBCa_OFsY");
INSERT INTO soccerplayers (name, country, club, video) VALUES ("Gianluigi Buffon", "Italy", "Juventus", "U0XSU0wNiNw");

-- <iframe src='https://www.youtube.com/embed/U0XSU0wNiNw' frameborder='0' allow='autoplay; encrypted-media' allowfullscreen></iframe>