CREATE USER 'sresetter'@'localhost' IDENTIFIED BY '!sresetter!';
CREATE USER 'sresetter'@'%' IDENTIFIED BY '!sresetter!';
GRANT ALL ON sresetter_production.* TO 'sresetter'@'localhost';
GRANT ALL ON sresetter_production.* TO 'sresetter'@'%';

CREATE USER 'sresetter_dev'@'localhost' IDENTIFIED BY '!sresetter_dev!';
CREATE USER 'sresetter_dev'@'%' IDENTIFIED BY '!sresetter_dev!';
GRANT ALL ON sresetter_development.* TO 'sresetter_dev'@'localhost';
GRANT ALL ON sresetter_development.* TO 'sresetter_dev'@'%';
GRANT ALL ON sresetter_test.* TO 'sresetter_dev'@'localhost';
GRANT ALL ON sresetter_test.* TO 'sresetter_dev'@'%';
