CREATE DATABASE magento /*\!40100 DEFAULT CHARACTER SET utf8 */;
CREATE USER 'magento'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON magento . * TO 'magento'@'localhost';