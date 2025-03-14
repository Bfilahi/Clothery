CREATE USER 'clotheryapp'@'localhost' IDENTIFIED BY 'clotheryapp';

GRANT ALL PRIVILEGES ON * . * TO 'clotheryapp'@'localhost';

ALTER USER 'clotheryapp'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'clotheryapp';