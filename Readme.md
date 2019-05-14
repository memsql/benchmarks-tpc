# Supporting material for the MemSQL May 2019 Benchmark Blogpost #

To find the blogpost, go to https://www.memsql.com/blog.

The blog post describes running TPC-H, TPC-DS and TPC-C.

# TPC-H & TPC-DS #

There are separate sql scripts in the tpch and tpcds directories, with the same commands for both benchmarks.
 - The schema and table creation scripts, including MemSQL shard key definitions are defined in create-table.sql.
 - The post-load work to optimize the tables and perform creation of histograms is defined in after-load.sql.
 - The queries (with substitued template values and scale factor for TPC-H) are in queries.sql.

# TPC-C #

Our TPC-C test code uses a forked repo from github.com/percona-lab/tpcc-mysql, with our changes found at github.com/memsql/tpcc-mysql; check that for more information about running tpcc.

------------------------------

Nick Kline, John Sherwood, and Eric Hanson
