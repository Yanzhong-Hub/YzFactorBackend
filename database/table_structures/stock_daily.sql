DROP TABLE IF EXISTS `stock_daily`;
CREATE TABLE `stock_daily`  (
    `ts_code` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ts_code',
    `trade_date` DATE NOT NULL COMMENT 'trade date',
    `open` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'open',
    `high` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'high',
    `low` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'low',
    `close` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'close',
    `pre_close` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'previous close',
    `change` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'change',
    `pct_chg` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'change percent',
    `vol` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'volume',
    `amount` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'amount',

  PRIMARY KEY (`ts_code`, `trade_date`)
  ) COMMENT = 'stock daily';


DROP TABLE IF EXISTS `stock_daily_adj`;
CREATE TABLE `stock_daily_adj`  (
    `ts_code` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ts_code',
    `trade_date` DATE NOT NULL COMMENT 'trade date',
    `open` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'open',
    `high` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'high',
    `low` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'low',
    `close` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'close',
    `pre_close` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'previous close',
    `change` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'change',
    `pct_chg` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'change percent',
    `vol` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'volume',
    `amount` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'amount',

  PRIMARY KEY (`ts_code`, `trade_date`)
  ) COMMENT = 'stock daily back adjusted';