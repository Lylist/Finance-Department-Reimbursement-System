create login lyl with password = '980502',default_database="bit-pc";
create user lyl for login lyl with default_schema = dbo;
exec sp_addrolemember 'db_owner', 'lyl';

--�û���
--Ȩ�ޱ�ʶԽСȨ��Խ��
create table usr
( 
  id char(6) NOT NULL,
  username varchar(8) ,
  permission int,
  pwd varbinary(max) NOT NULL, 
  primary key(id)
);

--�û����������ʱ��������
--�ǶԳƼ�����Կ
CREATE ASYMMETRIC KEY my_key WITH ALGORITHM = RSA_2048 ENCRYPTION BY PASSWORD = N'666666';
CREATE SYMMETRIC KEY TestSymmetric
    WITH ALGORITHM = AES_256
    ENCRYPTION BY PASSWORD = '666666';


--���ڴ���ı�������
create table processing
(id char(6) NOT NULL,	--ҵ�񵥺�
 userid char(6) NOT NULL,	--�������˻�
 invoice char(8) NOT NULL,	--��Ʊ��
 price float,			--�����۸�
 createtime datetime NOT NULL,	--����ʱ�� 	
 statu varchar(10),		--����״̬
 remark varchar(20),		--��ע
 primary key(id)
);

--�ѱ���������
create table processed
(id char(6) NOT NULL,	--ҵ�񵥺�
 userid char(6) NOT NULL,	--�������˻�
 invoice char(8) NOT NULL,	--��Ʊ��
 price float,			--�����۸�
 createtime datetime NOT NULL,	--����ʱ��
 compeltetime datetime NOT NULL, --���ʱ�� 	
 statu varchar(10),		--����״̬
 remark varchar(20),		--��ע
  primary key(id)
);


--����ϸ��ÿһ��
create table processdetail
(id char(6) NOT NULL,	--ҵ�񵥺�
 userid char(6) NOT NULL,	--�������˻�
 price float,			--�����۸�
 processtime datetime NOT NULL, --����ʱ�� 	
 statu varchar(10),		--����״̬
 remark varchar(20),		--��ע
 primary key(id,statu)
);

--��֧ϸ��
create table revenuedetail
(times datetime NOT NULL,	--ʱ��
 usrid char(6) NOT NULL,	--������ID
 price float NOT NULL,		--��֧���
 remark varchar(12),		--˵��
 primary key(times,usrid)
);
--drop table revenuedetail
--insert into revenuedetail values(getdate(),'000002','100','123');
--�����ȵ���֧ͳ�Ʊ�
create table revenue
(years int NOT NULL,	--���
 quarters int NOT NULL,	--����
 income float,			--����
 expend float,			--֧��
 surplus float,			--ӯ��
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


