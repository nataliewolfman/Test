create database SS_Task2

	create table t_clients
(
	p_CustomerId int not null identity(1,1), 
	p_RegistrationDateTime datetime not null
)

alter table t_clients add constraint pk_clients
primary key(p_CustomerId)

create table t_purchaises
(
	p_purchaisId int not null identity(1,1),
	p_CustomerId int not null, 
	p_PurchaiseDatetime datetime not null, 
	p_ProductName nvarchar(30)
)

alter table t_purchaises add constraint pk_purchaises
primary key(p_purchaisId)

alter table t_purchaises add constraint fk_purchaises_clients
foreign key(p_CustomerId) references t_clients(p_CustomerId)

insert into t_clients(p_RegistrationDateTime)
values('18-06-12 10:34:09')
insert into t_clients(p_RegistrationDateTime)
values('18-06-12 10:40:09')
insert into t_clients(p_RegistrationDateTime)
values('18-06-12 11:34:09')
insert into t_clients(p_RegistrationDateTime)
values('18-06-12 11:54:09')

insert into t_purchaises(p_CustomerId, p_PurchaiseDatetime, p_ProductName)
values (1, '18-06-12 10:34:09', N'молоко')
insert into t_purchaises(p_CustomerId, p_PurchaiseDatetime, p_ProductName)
values (1, '18-06-12 10:35:15', N'кефир')
insert into t_purchaises(p_CustomerId, p_PurchaiseDatetime, p_ProductName)
values (2, '18-06-12 10:34:09', N'сметана')
insert into t_purchaises(p_CustomerId, p_PurchaiseDatetime, p_ProductName)
values (2, '18-06-12 10:34:09', N'молоко')
insert into t_purchaises(p_CustomerId, p_PurchaiseDatetime, p_ProductName)
values (3, '18-06-12 10:34:09', N'молоко')
insert into t_purchaises(p_CustomerId, p_PurchaiseDatetime, p_ProductName)
values (3, '18-06-12 10:34:09', N'конфеты')
insert into t_purchaises(p_CustomerId, p_PurchaiseDatetime, p_ProductName)
values (4, '18-06-12 10:34:09', N'конфеты')
insert into t_purchaises(p_CustomerId, p_PurchaiseDatetime, p_ProductName)
values (4, '18-06-12 10:34:09', N'сметана')

select p_CustomerId, COUNT(p_purchaisId) AS milk As milkTable
from t_purchaises
where p_ProductName = N'молоко'
group by p_CustomerId

select p_CustomerId, COUNT(p_purchaisId) AS smetana As smetanaTable
from t_purchaises
where p_ProductName = N'сметана'
group by p_CustomerId

select t4.p_CustomerId from t_purchaises t1
join smetanaTable t2 on t1.p_CustomerId != t2.p_CustomerId
join milkTable t3 on t1.p_CustomerId = t3.p_CustomerId
join t_clients t4 on t4.p_CustomerId = t1.p_CustomerId
group by t4.p_CustomerId