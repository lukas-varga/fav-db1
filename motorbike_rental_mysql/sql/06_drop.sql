START TRANSACTION;
-- Delete all tables
DROP TABLE IF EXISTS `rent`;
DROP TABLE IF EXISTS `motorbike`;
DROP TABLE IF EXISTS `model`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `address`;
COMMIT;

-- Delete all views
START TRANSACTION;
DROP VIEW IF EXISTS `prague_customers`;
DROP VIEW IF EXISTS `avg_price_by_brand`;
COMMIT;