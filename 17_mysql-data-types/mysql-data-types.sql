CREATE DATABASE mydb;
USE mydb;

CREATE TABLE users (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(150),
  password VARCHAR(100),
  contact VARCHAR(15),
  address TEXT,
  dob DATE,
  gender ENUM('M','F','O'),
  status BOOLEAN
);

SELECT * FROM users;

INSERT INTO users
(id, name, email, password, contact, address, dob, gender, status)
VALUES
(1, 'amy', 'ij2005@gmail.com', '65464', '8556', 'Unknown address', '2005-03-05', 'F', 1);
