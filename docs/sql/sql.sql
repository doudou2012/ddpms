/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2013/2/21 15:54:25                           */
/*==============================================================*/


drop table if exists dd_category;

drop table if exists dd_contacts;

drop table if exists dd_depots;

drop table if exists dd_material;

drop table if exists dd_supplier;

drop table if exists dd_supplier_contacts;

drop table if exists dd_warehouse_entry;

/*==============================================================*/
/* Table: dd_category                                           */
/*==============================================================*/
create table dd_category
(
   id                   int not null auto_increment,
   name                 varchar(30) not null,
   type                 tinyint unsigned not null default 1 comment '1：原料 2：产品 3：行业',
   pid                  int not null,
   state                tinyint unsigned not null default 1 comment '1:正常',
   add_time             int unsigned not null default 0,
   primary key (id)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8;

alter table dd_category comment '分类表';

/*==============================================================*/
/* Table: dd_contacts                                           */
/*==============================================================*/
create table dd_contacts
(
   id                   int unsigned not null auto_increment,
   name                 varchar(16) not null,
   alias                varchar(16),
   gender               tinyint not null comment '0 未知 1:男  2：女',
   phone                char(20),
   mobile               char(16) not null,
   other_tel            varchar(60),
   email                varchar(60) not null,
   birthday             date,
   company_id           int not null,
   department           int not null,
   fax                  varchar(60) not null,
   img                  varchar(100),
   qq                   bigint unsigned,
   msn                  varchar(100),
   assistant            varchar(16),
   assistant_tel        varchar(20),
   approved             tinyint not null comment '0:未审核 1：邮件审核  2：人工审核',
   approve_id           int,
   level                tinyint not null comment '1:普通 2：有合作  3：vip',
   type                 tinyint not null comment '1:客户   2：采购',
   add_time             int unsigned not null default 0,
   owner_id             int not null,
   last_up_time         int not null,
   modify_uid           int not null,
   primary key (id)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: dd_depots                                             */
/*==============================================================*/
create table dd_depots
(
   id                   int not null,
   name                 varchar(255） not null,
   address              varchar(255) not null,
   primary key (id)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: dd_material                                           */
/*==============================================================*/
create table dd_material
(
   id                   int unsigned not null auto_increment,
   title                varchar(255) not null,
   model                varchar(255) not null,
   standard             decimal(9,2) not null default 0.00,
   class                int not null,
   code                 varchar(60) not null,
   state                tinyint not null,
   provider             int not null,
   price                decimal(9,2) not null default 0,
   stocks               decimal(11,2) not null,
   warn_stock           decimal(11,2) not null,
   unit                 varchar(255) not null,
   "desc"               text,
   depot_id             int not null,
   add_time             int unsigned not null,
   up_time              int unsigned not null,
   primary key (id)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: dd_supplier                                           */
/*==============================================================*/
create table dd_supplier
(
   id                   int not null auto_increment,
   name                 varchar(60) not null,
   code                 varchar(40),
   industry             int not null,
   state                varchar(16) not null,
   province             int not null,
   city                 int not null,
   area                 int not null,
   address              varchar(255) not null,
   postcode             varchar(16),
   website              varchar(255),
   "desc"               text not null,
   logo                 varchar(255),
   level                float(6,1),
   flag                 tinyint unsigned not null default 0 comment '0:普通
            1:已成交
            2:潜在
            3:排除',
   turnover             tinyint unsigned not null default 0,
   add_time             int not null,
   creator              int not null,
   last_up_time         int not null,
   primary key (id)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: dd_supplier_contacts                                  */
/*==============================================================*/
create table dd_supplier_contacts
(
   id                   int not null,
   supplier_id          int not null,
   contacts_id          int not null,
   flag                 tinyint unsigned not null default 1 comment '1:正常',
   primary key (id)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: dd_warehouse_entry                                    */
/*==============================================================*/
create table dd_warehouse_entry
(
   id                   varchar(40) not null,
   primary key (id)
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8;

