 DROP TABLE IF EXISTS users CASCADE;
 DROP TABLE IF EXISTS user_tag;
 DROP TABLE IF EXISTS user_location;

CREATE TABLE users(
username VARCHAR(45) UNIQUE PRIMARY KEY,
email VARCHAR(45) UNIQUE,
password VARCHAR(150),
first_name VARCHAR(45),
last_name VARCHAR(45),
one_liner VARCHAR(45),
short_bio VARCHAR(45),
following VARCHAR(45),
theme_id INT
);


CREATE TABLE user_tag(
username VARCHAR(45) NOT NULL REFERENCES users ON DELETE CASCADE,
tag VARCHAR(45) NOT NULL,
CONSTRAINT chkUserTag UNIQUE(username,tag),
PRIMARY KEY(username,tag)
);


CREATE TABLE user_location(
username VARCHAR(45) NOT NULL REFERENCES users ON DELETE CASCADE,
lat VARCHAR(45),
lng VARCHAR(45),
PRIMARY KEY(username)
);


/*create a trigger*/
CREATE OR REPLACE FUNCTION user_location_insert() RETURNS TRIGGER AS $user_location_insert$ 
BEGIN
IF(TG_OP='INSERT') THEN
INSERT INTO user_location(username)
       VALUES (NEW.username);
END IF;
RETURN NEW;
END;
$user_location_insert$ LANGUAGE plpgsql;

CREATE TRIGGER user_location_insert AFTER INSERT ON users
FOR EACH ROW EXECUTE PROCEDURE user_location_insert();

/*insert queries start here*/

INSERT INTO users (username,email,password,first_name,last_name,one_liner,short_bio,following,theme_id) 
VALUES 
('samuel','sam@gm.com','123456','Eli','Agbenu','An EIT','An EIT at East Legon','2,3',1);

INSERT INTO users (username,email,password,first_name,last_name,one_liner,short_bio,following,theme_id) 
VALUES 
('tony','tony1@gm.com','123456','Tony','Agbenu','An EIT','An EIT at East Legon','1,3',1);

INSERT INTO users (username,email,password,first_name,last_name,one_liner,short_bio,following,theme_id) 
VALUES 
('andre','andre@gm.com','123456','El','Agbenu','An EIT','An EIT at East Legon','2,1',1);

INSERT INTO users (username,email,password,first_name,last_name,one_liner,short_bio,following,theme_id) 
VALUES 
('anthony','anthony@gm.com','123456','Anthony','Agbenu','An EIT','An EIT at East Legon','2,3',1);

INSERT INTO users (username,email,password,first_name,last_name,one_liner,short_bio,following,theme_id) 
VALUES 
('jackson','jackson@gm.com','123456','Jackson','Agbenu','An EIT','An EIT at East Legon','1,3',1);


