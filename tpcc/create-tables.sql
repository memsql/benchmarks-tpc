-- tpcc schema, all columnstore tables

CREATE DATABASE tpcc;
USE tpcc;

create table warehouse (
    w_id int not null,
    w_name varchar(10),
    w_street_1 varchar(20),
    w_street_2 varchar(20),
    w_city varchar(20),
    w_state char(2),
    w_zip char(9),
    w_tax decimal(4,2),
    w_ytd decimal(12,2),
    primary key (w_id),
    shard key (w_id)
);


create table district (
    d_id tinyint not null,
    d_w_id int not null,
    d_name varchar(10),
    d_street_1 varchar(20),
    d_street_2 varchar(20),
    d_city varchar(20),
    d_state char(2),
    d_zip char(9),
    d_tax decimal(4,2),
    d_ytd decimal(12,2),
    d_next_o_id int,
    primary key (d_w_id, d_id),
    shard key (d_w_id)
);


create table customer (
    c_id int not null,
    c_d_id tinyint not null,
    c_w_id int not null,
    c_first varchar(16),
    c_middle char(2),
    c_last varchar(16),
    c_street_1 varchar(20),
    c_street_2 varchar(20),
    c_city varchar(20),
    c_state char(2),
    c_zip char(9),
    c_phone char(16),
    c_since datetime,
    c_credit char(2),
    c_credit_lim bigint,
    c_discount decimal(4,2),
    c_balance decimal(12,2),
    c_ytd_payment decimal(12,2),
    c_payment_cnt smallint,
    c_delivery_cnt smallint,
    c_data text,
    KEY (c_w_id, c_d_id, c_id) using clustered columnstore,
    unique key (c_w_id, c_d_id, c_id) using hash,
    KEY (c_last) using hash,
    shard key (c_w_id)
);


create table history (
    h_c_id int,
    h_c_d_id tinyint,
    h_c_w_id int,
    h_d_id tinyint,
    h_w_id int,
    h_date datetime,
    h_amount decimal(6,2),
    h_data varchar(24),
    KEY() USING CLUSTERED COLUMNSTORE,
    shard key (h_c_w_id)
);


create table new_orders (
    no_o_id int not null,
    no_d_id tinyint not null,
    no_w_id int not null,
    KEY(no_w_id, no_d_id, no_o_id) using clustered columnstore,
    unique key (no_w_id, no_d_id, no_o_id) using hash,
    shard key(no_w_id)
);


create table orders (
    o_id int not null,
    o_d_id tinyint not null,
    o_w_id int not null,
    o_c_id int,
    o_entry_d datetime,
    o_carrier_id tinyint,
    o_ol_cnt tinyint,
    o_all_local tinyint,
    KEY(o_w_id, o_d_id, o_id) using clustered columnstore,
    unique key(o_w_id, o_d_id, o_id) using hash,
    shard key(o_w_id)
);


create table order_line (
    ol_o_id int not null,
    ol_d_id tinyint not null,
    ol_w_id int not null,
    ol_number tinyint not null,
    ol_i_id int,
    ol_supply_w_id int,
    ol_delivery_d datetime,
    ol_quantity tinyint,
    ol_amount decimal(6,2),
    ol_dist_info char(24),
    KEY(ol_w_id, ol_d_id, ol_o_id, ol_number) using clustered columnstore,
    unique key(ol_w_id, ol_d_id, ol_o_id, ol_number) using hash,
    shard key(ol_w_id)
);


create reference table item (
    i_id int not null,
    i_im_id int,
    i_name varchar(24),
    i_price decimal(5,2),
    i_data varchar(50),
    key() using clustered columnstore,
    unique KEY(i_id) using hash
);


create table stock (
    s_i_id int not null,
    s_w_id int not null,
    s_quantity smallint,
    s_dist_01 char(24),
    s_dist_02 char(24),
    s_dist_03 char(24),
    s_dist_04 char(24),
    s_dist_05 char(24),
    s_dist_06 char(24),
    s_dist_07 char(24),
    s_dist_08 char(24),
    s_dist_09 char(24),
    s_dist_10 char(24),
    s_ytd decimal(8,0),
    s_order_cnt smallint,
    s_remote_cnt smallint,
    s_data varchar(50) ,
    KEY(s_w_id, s_i_id) using clustered columnstore,
    unique key(s_w_id, s_i_id) using hash,
    shard key(s_w_id)
);
