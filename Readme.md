# SingleStore TPC benchmarking materials

You can find the blogpost about our results at https://www.singlestore.com/blog/tpc-benchmarking-results/

Note: This repository contains benchmarks derived from the TPC benchmarks. Our benchmarks use the schema, data, and queries derived from the TPC benchmarks; however, they are not official TPC benchmarks.

You can clone these files to your local machine by running
```
git clone git@github.com:memsql/benchmarks-tpc.git
```

# Running a TPC benchmark on SingleStore

Prerequisites:
- Generate the benchmark dataset using the TPC scripts at http://tpc.org/tpc_documents_current_versions/current_specifications5.asp - dbgen for TPC-H or dsdgen for TPC-DS. Upload the data to your cloud storage e.g. AWS S3. We recommend compressing the data.
  - If you just want to run a quick experiment on a small scale cluster and dataset, then you can skip this step and use our built-in sample TPC-H 10GB dataset for our smallest cluster size (S-00). Follow the same steps as below, but instead of running `create-table.sql` and `load.sql` click Tutorials > Try with Sample Data > Benchmark Dataset - TPC-H. Warning: currently this is specifically optimized to load quickly to our smallest clusters (S-00) as a quick demo, it is not intended for benchmarking on larger clusters (in the future we will be working on changing that to make it more flexible).

Creating a SingleStore cluster (you can also see https://www.singlestore.com/blog/how-to-get-started-with-singlestore/ for a guide with additional examples):
- Go to https://www.singlestore.com/managed-service-trial/ to start a free trial. Or, if you already have an account, go to https://portal.singlestore.com/ to log in.
- Once you are logged in at https://portal.singlestore.com/, click `Create Database Cluster` in the top right. Follow the steps to choose your desired cluster size, cloud provider, etc.
- The cluster will be created in a short time.
- Once the cluster is available, connect to the cluster in either the online SQL Editor or your favorite SQL client (e.g. SQL IDE or CLI).
  - For the online SQL Editor, click `SQL Editor` on the left sidebar.
  - For your favorite SQL client, click `Connect` and follow the instructions.

Running the benchmark:
- Run `create-table.sql` which contains the schema and table creation scripts.
  - If you're using the SQL Editor: copy-paste the queries in, highlight all the queries, and press `Run`.
- Open `load.sql` which contains sample dataset load scripts. To use these, fill in your AWS bucket and credentials information, and run the queries.
  - You can also load data with another method of your choice.
  - This file also contains recommended post-load optimization commands - SingleStore's background processes will do roughly the same if you wait, but slower.
- Run `queries.sql` which contains sample benchmark queries.
  - We ran `queries.sql` once to measure the cold query runtimes, then repeated `queries.sql` three more times to measure warm query runtimes.
  - The first run will be slower than subsequent runs because SingleStore optimizes and compiles queries for future invocations.
  - TPC-H and TPC-DS have templatized queries with randomly generated parameter values. We didn’t find much variation with different parameters, so we used a fixed set of parameters for the ease of testing and tracking performance across time. We include the query text with an example set of parameter values. You can generate multiple instances of the queries with different random parameter values using the TPC tools (qgen or dsqgen).

# TPC-C

For information about running TPC-C, see our repo at https://github.com/memsql/tpcc-mysql (forked from Percona's MySQL driver with changes to run on SingleStore).

------------------------------

Jack Chen, Genevieve LaLonde, John Sherwood, Szu-Po Wang, Nick Kline, Eric Hanson
