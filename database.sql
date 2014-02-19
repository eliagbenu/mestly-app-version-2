/*
script name: mest_queries.sql

*/
CREATE DATABASE mestly;

\c mestly;


CREATE TABLE theme(
theme_id SERIAL PRIMARY KEY,
theme_title VARCHAR(45),
theme_url VARCHAR(45),
theme_creator VARCHAR(45)
);


CREATE TABLE users(
user_id SERIAL PRIMARY KEY,
username VARCHAR(45) UNIQUE,
email VARCHAR(45) UNIQUE,
password VARCHAR(150),
first_name VARCHAR(45),
last_name VARCHAR(45),
one_liner VARCHAR(45),
location VARCHAR(45),
short_bio VARCHAR(45),
following VARCHAR(45),
theme_id INT
);


CREATE TABLE user_tag(
user_id INT NOT NULL REFERENCES users (user_id) ON DELETE CASCADE,
tag VARCHAR(45) NOT NULL,
CONSTRAINT chkUserTag UNIQUE(user_id,tag),
PRIMARY KEY(user_id,tag)
);

CREATE TABLE university(
university_id SERIAL PRIMARY KEY,
university_name VARCHAR(45),
location VARCHAR(45),
location_url VARCHAR(100),
website VARCHAR(45)
);



CREATE TABLE work(
work_id SERIAL PRIMARY KEY,
company_name VARCHAR(45),
location VARCHAR(45),
location_url VARCHAR(45),
website VARCHAR(45)
);


CREATE TABLE user_university(
user_id  INT NOT NULL REFERENCES users (user_id),
university_id INT,
start_date DATE,
end_date DATE,
CONSTRAINT chkUserUniversity UNIQUE(user_id,university_id),
PRIMARY KEY(user_id,university_id)
);



CREATE TABLE user_work(
user_id INT NOT NULL REFERENCES users (user_id),
work_id INT,
start_date DATE,
end_date DATE,
CONSTRAINT chkUserWork UNIQUE(user_id,work_id),
PRIMARY KEY(user_id,work_id)
);


CREATE TABLE supported_services(
supported_service_id SERIAL PRIMARY KEY,
site_name VARCHAR(45),
site_url VARCHAR(45)
);

CREATE TABLE user_supported_services(
supported_service_id INT,
user_id INT,
CONSTRAINT chkSupportedServices UNIQUE(user_id,supported_service_id),
PRIMARY KEY(user_id,supported_service_id)
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

INSERT INTO user_tag (uesr_id,tag) 
VALUES 
(1,'Blogger');

INSERT INTO user_tag (uesr_id,tag) 
VALUES 
(3,'Adventurer');

INSERT INTO user_tag (uesr_id,tag) 
VALUES 
(2,'Adventurer');

INSERT INTO university (university_name,location,location_url,website) 
VALUES 
('GTUC','Accra','Sonet','www.gtuc.edu.gh');

INSERT INTO university (university_name,location,location_url,website) 
VALUES 
('University Of Ghana','Legon','Sonet','www.unigh.edu.gh');

INSERT INTO university (university_name,location,location_url,website) 
VALUES 
('University Of Cape Coast','Cape Coast','Sonet','www.ucc.edu.gh');


INSERT INTO theme (theme_title,theme_url,theme_creator) 
VALUES 
('green-theme','www.green-theme.com','Eli');

INSERT INTO theme (theme_title,theme_url,theme_creator) 
VALUES 
('red-theme','www.red-theme.com','El');

INSERT INTO theme (theme_title,theme_url,theme_creator) 
VALUES 
('blue-theme','www.blue-theme.com','Anthony');

INSERT INTO theme (theme_title,theme_url,theme_creator) 
VALUES 
('yellow-theme','www.yellow-theme.com','Tony');


INSERT INTO work (company_name,location,location_url,website) 
VALUES 
('MacDonalds','Osu','Sonet','www.macdonalds.com');

INSERT INTO work (company_name,location,location_url,website) 
VALUES 
('Uber','Lapaz','Sonet','www.uber.com');

INSERT INTO work (company_name,location,location_url,website) 
VALUES 
('Riz','Abelemkpe','Sonet','www.riz.com');

INSERT INTO user_university (user_id,university_id,start_date,end_date) 
VALUES 
(1,1,'2004-01-08','2008-08-08');

INSERT INTO user_university (user_id,university_id,start_date,end_date) 
VALUES 
(2,1,'2005-01-08','2007-08-08');

INSERT INTO user_university (user_id,university_id,start_date,end_date) 
VALUES 
(3,3,'2006-01-08','2010-08-08');

INSERT INTO user_university (user_id,university_id,start_date,end_date) 
VALUES 
(4,1,'2006-01-08','2010-08-08');


INSERT INTO user_work (user_id,work_id,start_date,end_date) 
VALUES 
(1,1,'2008-01-08','2012-08-08');

INSERT INTO user_work (user_id,work_id,start_date,end_date) 
VALUES 
(2,1,'2008-01-08','2012-08-08');

INSERT INTO user_work (user_id,work_id,start_date,end_date) 
VALUES 
(3,1,'2001-01-08','2011-08-08');

INSERT INTO supported_services (site_name,site_url) 
VALUES 
('linkedIn','www.linkedIn.com');

INSERT INTO supported_services (site_name,site_url) 
VALUES 
('twitter','www.twitter.com');

INSERT INTO supported_services (site_name,site_url) 
VALUES 
('facebook','www.facebook.com');

INSERT INTO user_supported_services (supported_service_id,user_id) 
VALUES 
(1,1);

INSERT INTO user_supported_services (supported_service_id,user_id) 
VALUES 
(2,1);

INSERT INTO user_supported_services (supported_service_id,user_id) 
VALUES 
(3,1);

INSERT INTO user_supported_services (supported_service_id,user_id) 
VALUES 
(3,2);

INSERT INTO user_supported_services (supported_service_id,user_id) 
VALUES 
(2,2);