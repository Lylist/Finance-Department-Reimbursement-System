create login lyl with password = '980502',default_database="bit-pc";
create user lyl for login lyl with default_schema = dbo;
exec sp_addrolemember 'db_owner', 'lyl';

--用户表
--权限标识越小权限越高
create table usr
( 
  id char(6) NOT NULL,
  username varchar(8) ,
  permission int,
  pwd varbinary(max) NOT NULL, 
  primary key(id)
);

--用户表插入数据时加密数据
--非对称加密密钥
CREATE ASYMMETRIC KEY my_key WITH ALGORITHM = RSA_2048 ENCRYPTION BY PASSWORD = N'666666';
CREATE SYMMETRIC KEY TestSymmetric
    WITH ALGORITHM = AES_256
    ENCRYPTION BY PASSWORD = '666666';


--正在处理的报销申请
create table processing
(id char(6) NOT NULL,	--业务单号
 userid char(6) NOT NULL,	--申请者账户
 invoice char(8) NOT NULL,	--发票号
 price float,			--报销价格
 createtime datetime NOT NULL,	--申请时间 	
 statu varchar(10),		--处理状态
 remark varchar(20),		--备注
 primary key(id)
);

--已报销的申请
create table processed
(id char(6) NOT NULL,	--业务单号
 userid char(6) NOT NULL,	--申请者账户
 invoice char(8) NOT NULL,	--发票号
 price float,			--报销价格
 createtime datetime NOT NULL,	--申请时间
 compeltetime datetime NOT NULL, --完成时间 	
 statu varchar(10),		--处理状态
 remark varchar(20),		--备注
  primary key(id)
);


--处理细表，每一步
create table processdetail
(id char(6) NOT NULL,	--业务单号
 userid char(6) NOT NULL,	--处理者账户
 price float,			--报销价格
 processtime datetime NOT NULL, --处理时间 	
 statu varchar(10),		--处理状态
 remark varchar(20),		--备注
 primary key(id,statu)
);

--收支细表
create table revenuedetail
(times datetime NOT NULL,	--时间
 usrid char(6) NOT NULL,	--操作者ID
 price float NOT NULL,		--收支金额
 remark varchar(12),		--说明
 primary key(times,usrid)
);
--drop table revenuedetail
--insert into revenuedetail values(getdate(),'000002','100','123');
--按季度的收支统计表
create table revenue
(years int NOT NULL,	--年份
 quarters int NOT NULL,	--季度
 income float,			--收入
 expend float,			--支出
 surplus float,			--盈余
 primary key(years,quarters)
);

create trigger tri_revenuedetail_insert
on revenuedetail
for insert
as
begin
	declare @years int, @quarters int,@prices float;
	set @years = (select DATEPART(yyyy,(select times from inserted)));
	set @quarters = (select DATEPART(qq,(select times from inserted)));
	set @prices = (select price  from inserted);
	
	if (select count(*) from revenue where years = @years) = 0
	begin
		insert into revenue values(@years,'1','0','0','0');
		insert into revenue values(@years,'2','0','0','0');
		insert into revenue values(@years,'3','0','0','0');
		insert into revenue values(@years,'4','0','0','0');
	end
	if @prices < 0
	begin
		declare @expends float;
		set @expends = (select expend from revenue where years = @years and quarters = @quarters);
		update revenue
		set expend = @expends - @prices where years = @years and quarters = @quarters;
		update revenue
		set surplus = (select surplus from revenue where years = @years and quarters = @quarters) + @prices where years = @years and quarters = @quarters; 
	end
	else
	begin
		declare @incomes float;
		set @incomes = (select income from revenue where years = @years and quarters = @quarters);
		update revenue
		set income = @incomes + @prices where years = @years and quarters = @quarters;
		update revenue
		set surplus = (select surplus from revenue where years = @years and quarters = @quarters) + @prices where years = @years and quarters = @quarters; 
	end;
end;


