use tpcds;

OPTIMIZE TABLE `call_center`;
OPTIMIZE TABLE `catalog_page`;
OPTIMIZE TABLE `catalog_returns`;
OPTIMIZE TABLE `catalog_sales`;
OPTIMIZE TABLE `customer`;
OPTIMIZE TABLE `customer_address`;
OPTIMIZE TABLE `customer_demographics`;
OPTIMIZE TABLE `date_dim`;
OPTIMIZE TABLE `household_demographics`;
OPTIMIZE TABLE `income_band`;
OPTIMIZE TABLE `inventory`;
OPTIMIZE TABLE `item`;
OPTIMIZE TABLE `promotion`;
OPTIMIZE TABLE `reason`;
OPTIMIZE TABLE `ship_mode`;
OPTIMIZE TABLE `store`;
OPTIMIZE TABLE `store_returns`;
OPTIMIZE TABLE `store_sales`;
OPTIMIZE TABLE `time_dim`;
OPTIMIZE TABLE `warehouse`;
OPTIMIZE TABLE `web_page`;
OPTIMIZE TABLE `web_returns`;
OPTIMIZE TABLE `web_sales`;
OPTIMIZE TABLE `web_site`;

ANALYZE TABLE `call_center` COLUMNS ALL ENABLE;
ANALYZE TABLE `catalog_page` COLUMNS ALL ENABLE;
ANALYZE TABLE `catalog_returns` COLUMNS ALL ENABLE;
ANALYZE TABLE `catalog_sales` COLUMNS ALL ENABLE;
ANALYZE TABLE `customer` COLUMNS ALL ENABLE;
ANALYZE TABLE `customer_address` COLUMNS ALL ENABLE;
ANALYZE TABLE `customer_demographics` COLUMNS ALL ENABLE;
ANALYZE TABLE `date_dim` COLUMNS ALL ENABLE;
ANALYZE TABLE `household_demographics` COLUMNS ALL ENABLE;
ANALYZE TABLE `income_band` COLUMNS ALL ENABLE;
ANALYZE TABLE `inventory` COLUMNS ALL ENABLE;
ANALYZE TABLE `item` COLUMNS ALL ENABLE;
ANALYZE TABLE `promotion` COLUMNS ALL ENABLE;
ANALYZE TABLE `reason` COLUMNS ALL ENABLE;
ANALYZE TABLE `ship_mode` COLUMNS ALL ENABLE;
ANALYZE TABLE `store` COLUMNS ALL ENABLE;
ANALYZE TABLE `store_returns` COLUMNS ALL ENABLE;
ANALYZE TABLE `store_sales` COLUMNS ALL ENABLE;
ANALYZE TABLE `time_dim` COLUMNS ALL ENABLE;
ANALYZE TABLE `warehouse` COLUMNS ALL ENABLE;
ANALYZE TABLE `web_page` COLUMNS ALL ENABLE;
ANALYZE TABLE `web_returns` COLUMNS ALL ENABLE;
ANALYZE TABLE `web_sales` COLUMNS ALL ENABLE;
ANALYZE TABLE `web_site` COLUMNS ALL ENABLE;
