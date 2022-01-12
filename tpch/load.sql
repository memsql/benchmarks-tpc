use tpch;

-- Example load commands - fill in your AWS keys and AWS bucket

CREATE PIPELINE IF NOT EXISTS customer_pipeline AS
LOAD DATA S3 "yourbucket/tpch/customer."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `customer`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\n';

CREATE PIPELINE IF NOT EXISTS lineitem_pipeline AS
LOAD DATA S3 "yourbucket/tpch/lineitem."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `lineitem`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\n';

CREATE PIPELINE IF NOT EXISTS nation_pipeline AS
LOAD DATA S3 "yourbucket/tpch/nation."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `nation`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\n';

CREATE PIPELINE IF NOT EXISTS orders_pipeline AS
LOAD DATA S3 "yourbucket/tpch/orders."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `orders`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\n';

CREATE PIPELINE IF NOT EXISTS part_pipeline AS
LOAD DATA S3 "yourbucket/tpch/part."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `part`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\n';

CREATE PIPELINE IF NOT EXISTS partsupp_pipeline AS
LOAD DATA S3 "yourbucket/tpch/partsupp."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `partsupp`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\n';

CREATE PIPELINE IF NOT EXISTS region_pipeline AS
LOAD DATA S3 "yourbucket/tpch/region."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `region`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\n';

CREATE PIPELINE IF NOT EXISTS supplier_pipeline AS
LOAD DATA S3 "yourbucket/tpch/supplier."
CONFIG '{"region":"us-east-1", "disable_gunzip": false}'
CREDENTIALS '{ "aws_access_key_id": "YOUR_AWS_ACCESS_KEY_ID", "aws_secret_access_key": "YOUR_AWS_SECRET_ACCESS_KEY" }'
SKIP DUPLICATE KEY ERRORS
INTO TABLE `supplier`
FIELDS TERMINATED BY '|'
ESCAPED BY '\\'
LINES TERMINATED BY '|\n';

start pipeline customer_pipeline foreground;
start pipeline lineitem_pipeline foreground;
start pipeline nation_pipeline foreground;
start pipeline orders_pipeline foreground;
start pipeline part_pipeline foreground;
start pipeline partsupp_pipeline foreground;
start pipeline region_pipeline foreground;
start pipeline supplier_pipeline foreground;

-- Optimization commands - background processes will do roughly the same if you wait, but slower.

optimize table customer flush;
optimize table lineitem flush;
optimize table nation flush;
optimize table orders flush;
optimize table part flush;
optimize table partsupp flush;
optimize table region flush;
optimize table supplier flush;

optimize table customer;
optimize table lineitem;
optimize table nation;
optimize table orders;
optimize table part;
optimize table partsupp;
optimize table region;
optimize table supplier;

analyze table customer columns all enable;
analyze table lineitem columns all enable;
analyze table nation columns all enable;
analyze table orders columns all enable;
analyze table part columns all enable;
analyze table partsupp columns all enable;
analyze table region columns all enable;
analyze table supplier columns all enable;
