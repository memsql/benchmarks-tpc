-- tpch schema, all sharded columnstore tables

CREATE DATABASE tpch;
USE tpch;

CREATE TABLE `customer` (
  `c_custkey` int(11) NOT NULL,
  `c_name` varchar(25) NOT NULL,
  `c_address` varchar(40) NOT NULL,
  `c_nationkey` int(11) NOT NULL,
  `c_phone` char(15) NOT NULL,
  `c_acctbal` decimal(15,2) NOT NULL,
  `c_mktsegment` char(10) NOT NULL,
  `c_comment` varchar(117) NOT NULL,
  UNIQUE KEY pk (`c_custkey`) USING HASH,
  SHARD KEY (`c_custkey`) USING CLUSTERED COLUMNSTORE
);

CREATE TABLE `lineitem` (
  `l_orderkey` bigint(11) NOT NULL,
  `l_partkey` int(11) NOT NULL,
  `l_suppkey` int(11) NOT NULL,
  `l_linenumber` int(11) NOT NULL,
  `l_quantity` decimal(15,2) NOT NULL,
  `l_extendedprice` decimal(15,2) NOT NULL,
  `l_discount` decimal(15,2) NOT NULL,
  `l_tax` decimal(15,2) NOT NULL,
  `l_returnflag` char(1) NOT NULL,
  `l_linestatus` char(1) NOT NULL,
  `l_shipdate` date NOT NULL,
  `l_commitdate` date NOT NULL,
  `l_receiptdate` date NOT NULL,
  `l_shipinstruct` char(25) NOT NULL,
  `l_shipmode` char(10) NOT NULL,
  `l_comment` varchar(44) NOT NULL,
  UNIQUE KEY pk (`l_orderkey`, `l_linenumber`) USING HASH,
  SHARD KEY (`l_orderkey`) USING CLUSTERED COLUMNSTORE
);

CREATE TABLE `nation` (
  `n_nationkey` int(11) NOT NULL,
  `n_name` char(25) NOT NULL,
  `n_regionkey` int(11) NOT NULL,
  `n_comment` varchar(152) NOT NULL,
  UNIQUE KEY pk (`n_nationkey`) USING HASH,
  SHARD KEY (`n_nationkey`) USING CLUSTERED COLUMNSTORE
);

CREATE TABLE `orders` (
  `o_orderkey` bigint(11) NOT NULL,
  `o_custkey` int(11) NOT NULL,
  `o_orderstatus` char(1) NOT NULL,
  `o_totalprice` decimal(15,2) NOT NULL,
  `o_orderdate` date NOT NULL,
  `o_orderpriority` char(15) NOT NULL,
  `o_clerk` char(15) NOT NULL,
  `o_shippriority` int(11) NOT NULL,
  `o_comment` varchar(79) NOT NULL,
  UNIQUE KEY pk (`o_orderkey`) USING HASH,
  SHARD KEY (`o_orderkey`) USING CLUSTERED COLUMNSTORE
);

CREATE TABLE `part` (
  `p_partkey` int(11) NOT NULL,
  `p_name` varchar(55) NOT NULL,
  `p_mfgr` char(25) NOT NULL,
  `p_brand` char(10) NOT NULL,
  `p_type` varchar(25) NOT NULL,
  `p_size` int(11) NOT NULL,
  `p_container` char(10) NOT NULL,
  `p_retailprice` decimal(15,2) NOT NULL,
  `p_comment` varchar(23) NOT NULL,
  UNIQUE KEY pk (`p_partkey`) USING HASH,
  SHARD KEY (`p_partkey`) USING CLUSTERED COLUMNSTORE
);

CREATE TABLE `partsupp` (
  `ps_partkey` int(11) NOT NULL,
  `ps_suppkey` int(11) NOT NULL,
  `ps_availqty` int(11) NOT NULL,
  `ps_supplycost` decimal(15,2) NOT NULL,
  `ps_comment` varchar(199) NOT NULL,
  UNIQUE KEY pk (`ps_partkey`,`ps_suppkey`) USING HASH,
  SHARD KEY(`ps_partkey`),
  KEY (`ps_partkey`,`ps_suppkey`) USING CLUSTERED COLUMNSTORE
);

CREATE TABLE `region` (
  `r_regionkey` int(11) NOT NULL,
  `r_name` char(25) NOT NULL,
  `r_comment` varchar(152) NOT NULL,
  UNIQUE KEY pk (`r_regionkey`) USING HASH,
  SHARD KEY (`r_regionkey`) USING CLUSTERED COLUMNSTORE
);

CREATE TABLE `supplier` (
  `s_suppkey` int(11) NOT NULL,
  `s_name` char(25) NOT NULL,
  `s_address` varchar(40) NOT NULL,
  `s_nationkey` int(11) NOT NULL,
  `s_phone` char(15) NOT NULL,
  `s_acctbal` decimal(15,2) NOT NULL,
  `s_comment` varchar(101) NOT NULL,
  UNIQUE KEY pk (`s_suppkey`) USING HASH,
  SHARD KEY (`s_suppkey`) USING CLUSTERED COLUMNSTORE
);


-- View for q15
create view revenue_q15 as
  select
    l_suppkey as supplier_no,
    sum(l_extendedprice * (1 - l_discount)) as total_revenue
  from
    lineitem
  where
    l_shipdate >= date('1996-01-01')
    and l_shipdate < date('1996-01-01') + interval '3' month
  group by
    l_suppkey;
