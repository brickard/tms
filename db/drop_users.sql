REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'sresetter'@'localhost', 'sresetter'@'%',
  'sresetter_dev'@'localhost', 'sresetter_dev'@'%';
DROP USER 'sresetter'@'localhost', 'sresetter'@'%', 'sresetter_dev'@'localhost',
  'sresetter_dev'@'%';
FLUSH PRIVILEGES;
