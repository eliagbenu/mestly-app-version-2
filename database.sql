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
user_id INT NOT NULL,
tag VARCHAR(45) NOT NULL,
CONSTRAINT chkUserTag UNIQUE(user_id,tag),
PRIMARY KEY(user_id,tag)
);

