DROP TABLE IF EXISTS `stock_list`;
CREATE TABLE `stock_list` (
  `ts_code` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ts_code',
  `symbol` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'stock symbol',
  `name` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'stock name',
  `area` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'company area',
  `industry` VARCHAR(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'level 1 industry',
  `market` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'market',
  `list_date` DATE DEFAULT NULL COMMENT 'list date',
  PRIMARY KEY (`ts_code`)
  ) COMMENT = 'stock list';

DROP TABLE IF EXISTS `trading_calendar`;
CREATE TABLE `trading_calendar` (
  `cal_date` DATE NOT NULL COMMENT 'calendar date',
  `exchange` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'exchange',
  `is_open` INT(1) DEFAULT NULL COMMENT 'open status',
  `pretrade_date` DATE DEFAULT NULL COMMENT 'previous trade',
PRIMARY KEY (`cal_date`, `exchange`)
) COMMENT = 'trading calendar';
