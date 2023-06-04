DROP TABLE IF EXISTS `income_statement`;
CREATE TABLE `income_statement`  (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `ts_code` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ts_code',
    `ann_date` DATE NOT NULL COMMENT 'announcement date',
    `f_ann_date` DATE NOT NULL COMMENT 'final announcement date',
    `end_date` DATE NOT NULL COMMENT 'report period',
    `report_type` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'report type',
    `comp_type` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'company type',
    `end_type` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'report period type',
    `basic_eps` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'basic eps',
    `diluted_eps` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'diluted eps',
    `total_revenue` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total revenue',
    `revenue` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'revenue',
    `int_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'interest income',
    `prem_earned` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'premium earned',
    `comm_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'commission income',
    `n_commis_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non commission income',
    `n_oth_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non other income',
    `n_oth_b_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non other business income',
    `prem_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'premium income',
    `out_prem` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'out premium',
    `une_prem_reser` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'unearned premium reserve',
    `reins_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'reinsurance income',
    `n_sec_tb_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net security income',
    `n_sec_uw_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net security underwriting income',
    `n_asset_mg_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net asset management income',
    `oth_b_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other business income',
    `fv_value_chg_gain` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'fair value change income',
    `invest_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'investment income',
    `ass_invest_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'asset investment income',
    `forex_gain` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'forex gain',
    `total_cogs` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total cost of goods sold',
    `oper_cost` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'operating cost',
    `int_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'interest expense',
    `comm_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'commission expense',
    `biz_tax_surchg` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'business tax and surcharge',
    `sell_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'selling expense',
    `admin_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'administrative expense',
    `fin_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'financial expense',
    `assets_impair_loss` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'assets impairment loss',
    `prem_refund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'premium refund',
    `compens_payout` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'compensation payout',
    `reser_insur_liab` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'reserve insurance liability',
    `div_payt` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'dividend payout',
    `reins_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'reinsurance expense',
    `oper_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'operating expense',
    `compens_payout_refu` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'compensation payout refund',
    `insur_reser_refu` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'insurance reserve refund',
    `reins_cost_refund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'reinsurance cost refund',
    `other_bus_cost` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other business cost',
    `operate_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'operating profit',
    `non_oper_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non operating income',
    `non_oper_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non operating expense',
    `nca_disploss` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'disposal of non current asset loss',
    `total_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total profit',
    `income_tax` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'income tax',
    `n_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net income',
    `n_income_attr_p` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net income attributable to parent company',
    `minority_gain` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'minority gain',
    `oth_compr_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other comprehensive income',
    `t_compr_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total comprehensive income',
    `compr_inc_attr_p` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'comprehensive income attributable to parent company',
    `compr_inc_attr_m_s` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'comprehensive income attributable to minority shareholders',
    `ebit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'ebit',
    `ebitda` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'ebitda',
    `insurance_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'insurance expense',
    `undist_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'undistributed profit',
    `distable_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'distributable profit',
    `rd_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'r&d expense',
    `fin_exp_int_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'financial expense interest expense',
    `fin_exp_int_inc` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'financial expense interest income',
    `transfer_surplus_rese` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'transfer surplus reserve',
    `transfer_housing_imprest` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'transfer housing imprest',
    `transfer_oth` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'transfer other',
    `adj_lossgain` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'adjust loss gain',
    `withdra_legal_surplus` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal legal surplus',
    `withdra_legal_pubfund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal legal public fund',
    `withdra_biz_devfund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal business development fund',
    `withdra_rese_fund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal reserve fund',
    `withdra_oth_ersu` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal other equity reserve',
    `workers_welfare` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'workers welfare',
    `distr_profit_shrhder` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'distributable profit shareholders',
    `prfshare_payable_dvd` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'profit share payable dividend',
    `comshare_payable_dvd` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'comshare payable dividend',
    `capit_comstock_div` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'capital common stock dividend',
    `continued_net_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'continued net profit',
    `update_flag` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'update flag',
    `net_after_nr_lp_correct` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net after nr lp correct',
    `oth_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other income',
    `asset_disp_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'asset disposal income',
    `end_net_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'end net profit',
    `credit_impa_loss` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'credit impairment loss',
    `net_expo_hedging_benefits` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net exposure hedging benefits',
    `oth_impair_loss_assets` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other impairment loss assets',
    `total_opcost` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total operating cost',
    `amodcost_fin_assets` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'amortization cost financial assets',
    PRIMARY KEY (`id`)
) COMMENT = 'income statement';

DROP TABLE IF EXISTS `income_statement_fill`;
CREATE TABLE `income_statement_fill`  (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `ts_code` VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ts_code',
    `trade_date` DATE NOT NULL COMMENT 'trade date',
    `end_date` DATE NOT NULL COMMENT 'report period',
    `report_type` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'report type',
    `comp_type` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'company type',
    `end_type` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'report period type',
    `basic_eps` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'basic eps',
    `diluted_eps` DECIMAL(10, 4) NULL DEFAULT NULL COMMENT 'diluted eps',
    `total_revenue` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total revenue',
    `revenue` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'revenue',
    `int_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'interest income',
    `prem_earned` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'premium earned',
    `comm_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'commission income',
    `n_commis_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non commission income',
    `n_oth_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non other income',
    `n_oth_b_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non other business income',
    `prem_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'premium income',
    `out_prem` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'out premium',
    `une_prem_reser` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'unearned premium reserve',
    `reins_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'reinsurance income',
    `n_sec_tb_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net security income',
    `n_sec_uw_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net security underwriting income',
    `n_asset_mg_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net asset management income',
    `oth_b_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other business income',
    `fv_value_chg_gain` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'fair value change income',
    `invest_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'investment income',
    `ass_invest_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'asset investment income',
    `forex_gain` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'forex gain',
    `total_cogs` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total cost of goods sold',
    `oper_cost` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'operating cost',
    `int_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'interest expense',
    `comm_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'commission expense',
    `biz_tax_surchg` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'business tax and surcharge',
    `sell_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'selling expense',
    `admin_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'administrative expense',
    `fin_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'financial expense',
    `assets_impair_loss` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'assets impairment loss',
    `prem_refund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'premium refund',
    `compens_payout` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'compensation payout',
    `reser_insur_liab` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'reserve insurance liability',
    `div_payt` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'dividend payout',
    `reins_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'reinsurance expense',
    `oper_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'operating expense',
    `compens_payout_refu` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'compensation payout refund',
    `insur_reser_refu` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'insurance reserve refund',
    `reins_cost_refund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'reinsurance cost refund',
    `other_bus_cost` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other business cost',
    `operate_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'operating profit',
    `non_oper_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non operating income',
    `non_oper_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'non operating expense',
    `nca_disploss` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'disposal of non current asset loss',
    `total_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total profit',
    `income_tax` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'income tax',
    `n_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net income',
    `n_income_attr_p` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net income attributable to parent company',
    `minority_gain` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'minority gain',
    `oth_compr_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other comprehensive income',
    `t_compr_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total comprehensive income',
    `compr_inc_attr_p` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'comprehensive income attributable to parent company',
    `compr_inc_attr_m_s` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'comprehensive income attributable to minority shareholders',
    `ebit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'ebit',
    `ebitda` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'ebitda',
    `insurance_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'insurance expense',
    `undist_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'undistributed profit',
    `distable_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'distributable profit',
    `rd_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'r&d expense',
    `fin_exp_int_exp` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'financial expense interest expense',
    `fin_exp_int_inc` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'financial expense interest income',
    `transfer_surplus_rese` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'transfer surplus reserve',
    `transfer_housing_imprest` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'transfer housing imprest',
    `transfer_oth` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'transfer other',
    `adj_lossgain` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'adjust loss gain',
    `withdra_legal_surplus` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal legal surplus',
    `withdra_legal_pubfund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal legal public fund',
    `withdra_biz_devfund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal business development fund',
    `withdra_rese_fund` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal reserve fund',
    `withdra_oth_ersu` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'withdrawal other equity reserve',
    `workers_welfare` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'workers welfare',
    `distr_profit_shrhder` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'distributable profit shareholders',
    `prfshare_payable_dvd` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'profit share payable dividend',
    `comshare_payable_dvd` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'comshare payable dividend',
    `capit_comstock_div` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'capital common stock dividend',
    `continued_net_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'continued net profit',
    `update_flag` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'update flag',
    `net_after_nr_lp_correct` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net after nr lp correct',
    `oth_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other income',
    `asset_disp_income` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'asset disposal income',
    `end_net_profit` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'end net profit',
    `credit_impa_loss` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'credit impairment loss',
    `net_expo_hedging_benefits` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'net exposure hedging benefits',
    `oth_impair_loss_assets` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'other impairment loss assets',
    `total_opcost` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'total operating cost',
    `amodcost_fin_assets` DECIMAL(20, 4) NULL DEFAULT NULL COMMENT 'amortization cost financial assets',
    PRIMARY KEY (`id`)
) COMMENT = 'income statement fill';