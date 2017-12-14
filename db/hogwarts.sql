DROP TABLE students;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses (
  id SERIAL2 PRIMARY KEY,
  name VARCHAR(255),
  logo_url VARCHAR(255)
);

CREATE TABLE students (
  id  SERIAL2 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house_id INT2 REFERENCES houses(id),
  age INT2
);
