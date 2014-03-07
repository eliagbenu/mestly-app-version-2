 DROP TABLE IF EXISTS users CASCADE;
 DROP TABLE IF EXISTS user_tag;
 

CREATE TABLE users(
username VARCHAR(45) UNIQUE PRIMARY KEY,
email VARCHAR(45) UNIQUE,
password VARCHAR(150),
first_name VARCHAR(45),
last_name VARCHAR(45),
one_liner VARCHAR(45),
location VARCHAR(45),
short_bio VARCHAR(45),
following VARCHAR(45),
location VARCHAR(70),
theme_id INT
);


CREATE TABLE user_tag(
username VARCHAR(45) NOT NULL REFERENCES users ON DELETE CASCADE,
tag VARCHAR(45) NOT NULL,
CONSTRAINT chkUserTag UNIQUE(username,tag),
PRIMARY KEY(username,tag)
);


/*insert queries start here*/

INSERT INTO users (username,email,password,first_name,last_name,one_liner,location,short_bio,following,theme_id) 
VALUES 
('samuel','sam@gm.com','123456','Eli','Agbenu','An EIT','East Legon','An EIT at East Legon','2,3',1);

INSERT INTO users (username,email,password,first_name,last_name,one_liner,location,short_bio,following,theme_id) 
VALUES 
('tony','tony1@gm.com','123456','Tony','Agbenu','An EIT','East Legon','An EIT at East Legon','1,3',1);

INSERT INTO users (username,email,password,first_name,last_name,one_liner,location,short_bio,following,theme_id) 
VALUES 
('andre','andre@gm.com','123456','El','Agbenu','An EIT','East Legon','An EIT at East Legon','2,1',1);

INSERT INTO users (username,email,password,first_name,last_name,one_liner,location,short_bio,following,theme_id) 
VALUES 
('anthony','anthony@gm.com','123456','Anthony','Agbenu','An EIT','East Legon','An EIT at East Legon','2,3',1);

INSERT INTO users (username,email,password,first_name,last_name,one_liner,location,short_bio,following,theme_id) 
VALUES 
('jackson','jackson@gm.com','123456','Jackson','Agbenu','An EIT','East Legon','An EIT at East Legon','1,3',1);

