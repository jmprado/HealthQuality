/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 	                    */
/* Created on:     7/19/2022 3:05:04 PM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OrderDetail') and o.name = 'FK_ORDERDET_REFERENCE_ORDERS')
alter table OrderDetail
   drop constraint FK_ORDERDET_REFERENCE_ORDERS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Orders') and o.name = 'FK_ORDERS_REFERENCE_CUSTOMER')
alter table Orders
   drop constraint FK_ORDERS_REFERENCE_CUSTOMER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Customer')
            and   type = 'U')
   drop table Customer
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OrderDetail')
            and   type = 'U')
   drop table OrderDetail
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Orders')
            and   type = 'U')
   drop table Orders
go

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer (
   PersonId             int                  not null,
   FirstName            varchar(255)         null,
   LastName             varchar(255)         null,
   Age                  int                  null,
   Occupation           varchar(255)         null,
   MaritalStatus        varchar(255)         null,
   constraint PK_CUSTOMER primary key (PersonId)
)
go

/*==============================================================*/
/* Table: OrderDetail                                           */
/*==============================================================*/
create table OrderDetail (
   OrderDetailId        int                  not null,
   OrderId              int                  not null,
   ProductNumber        int                  null,
   ProductId            int                  null,
   ProductOrigin        varchar(255)         null,
   constraint PK_ORDERDETAIL primary key (OrderDetailId)
)
go

/*==============================================================*/
/* Table: Orders                                                */
/*==============================================================*/
create table Orders (
   OrderId              int                  not null,
   PersonId             int                  not null,
   DateCreated          datetime             not null,
   MethodOfPurchasse    varchar(255)         not null,
   constraint PK_ORDERS primary key (OrderId)
)
go

alter table OrderDetail
   add constraint FK_ORDERDET_REFERENCE_ORDERS foreign key (OrderId)
      references Orders (OrderId)
go

alter table Orders
   add constraint FK_ORDERS_REFERENCE_CUSTOMER foreign key (PersonId)
      references Customer (PersonId)
go

/*==============================================================*/
/* Test Data                                                */
/*==============================================================*/
INSERT INTO Customer values(1, 'Joao', 'Prado', 46, 'System Engineer', 'Married') 
INSERT INTO Customer values(2, 'Isabel', 'Cristina', 46, 'HR Manager', 'Married') 

INSERT INTO Orders VALUES (1, 1, GETDATE(), 'Credit Card')
INSERT INTO Orders VALUES (2, 2, GETDATE(), 'Credit Card')
INSERT INTO Orders VALUES (3, 2, GETDATE(), 'Credit Card')

INSERT INTO OrderDetail VALUES(1, 1, 3, 1112222333, 'Brazil')
INSERT INTO OrderDetail VALUES(2, 3, 3, 1112222333, 'Brazil')
INSERT INTO OrderDetail VALUES(3, 1, 4, 1112222334, 'US')