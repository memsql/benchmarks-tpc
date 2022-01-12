use tpcc;

-- Example load commands - fill in your AWS keys and AWS bucket

CREATE PIPELINE IF NOT EXISTS customer_pipeline AS
LOAD DATA S3 "yourbucket/tpcc/customer."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `customer`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

CREATE PIPELINE IF NOT EXISTS history_pipeline AS
LOAD DATA S3 "yourbucket/tpcc/history."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `history`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

CREATE PIPELINE IF NOT EXISTS new_orders_pipeline AS
LOAD DATA S3 "yourbucket/tpcc/new_orders."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `new_orders`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

CREATE PIPELINE IF NOT EXISTS order_line_pipeline AS
LOAD DATA S3 "yourbucket/tpcc/order_line."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `order_line`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

CREATE PIPELINE IF NOT EXISTS district_pipeline AS
LOAD DATA S3 "yourbucket/tpcc/district."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `district`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

CREATE PIPELINE IF NOT EXISTS orders_pipeline AS
LOAD DATA S3 "yourbucket/tpcc/orders."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `orders`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

CREATE PIPELINE IF NOT EXISTS item_pipeline AS
LOAD DATA S3 "yourbucket/tpcc/item."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `item`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

CREATE PIPELINE IF NOT EXISTS warehouse_pipeline AS
LOAD DATA S3 "yourbucket/tpcc/warehouse."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `warehouse`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

CREATE PIPELINE IF NOT EXISTS stock_pipeline AS
LOAD DATA S3 "yourbucket/tpcc/stock."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `stock`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '\n';

start pipeline customer_pipeline foreground;
start pipeline history_pipeline foreground;
start pipeline new_orders_pipeline foreground;
start pipeline order_line_pipeline foreground;
start pipeline district_pipeline foreground;
start pipeline orders_pipeline foreground;
start pipeline item_pipeline foreground;
start pipeline warehouse_pipeline foreground;
start pipeline stock_pipeline foreground;

-- Optimization commands - background processes will do roughly the same if you wait, but slower.

optimize table customer flush;
optimize table history flush;
optimize table new_orders flush;
optimize table order_line flush;
optimize table district flush;
optimize table orders flush;
optimize table item flush;
optimize table warehouse flush;
optimize table stock flush;

optimize table customer;
optimize table history;
optimize table new_orders;
optimize table order_line;
optimize table district;
optimize table orders;
optimize table item;
optimize table warehouse;
optimize table stock;

analyze table customer columns all enable;
analyze table history columns all enable;
analyze table new_orders columns all enable;
analyze table order_line columns all enable;
analyze table district columns all enable;
analyze table orders columns all enable;
analyze table item columns all enable;
analyze table warehouse columns all enable;
analyze table stock columns all enable;
