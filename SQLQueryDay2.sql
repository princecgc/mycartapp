USE [mycartdb]
GO
/****** Object:  Table [dbo].[coupons]    Script Date: 05/19/2016 17:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[coupons](
	[coupon_id] [int] IDENTITY(1,1) NOT NULL,
	[coupon_code] [varchar](200) NULL,
	[coupon_discount] [int] NOT NULL,
	[coupon_quantity] [int] NULL,
	[coupon_used] [int] NULL,
	[coupon_validity] [date] NOT NULL,
	[create_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[coupon_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[coupon_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[categories]    Script Date: 05/19/2016 17:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](100) NOT NULL,
	[is_enabled] [int] NULL,
	[create_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spGetCoupons]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetCoupons]
as
begin
select coupon_code,coupon_quantity,coupon_discount from coupons
end;
GO
/****** Object:  StoredProcedure [dbo].[spInsertCoupon]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertCoupon]
(@C_code varchar(200),@C_quan int,@discount int,@validity date)
as
begin
insert into coupons (coupon_code,coupon_quantity,coupon_discount,coupon_validity)values
(@C_code,@C_quan,@discount,@validity)
end;
GO
/****** Object:  StoredProcedure [dbo].[spInsertCategory]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertCategory]
@cat_name varchar(100)
as begin
insert into categories(category_name)
values(@cat_name);
end
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCoupon]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUpdateCoupon]
(@id int,@discount int,@quantity int)
as
begin
update coupons set coupon_discount=@discount,coupon_quantity=@quantity where coupon_id=@id
end;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCoupons]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetAllCoupons]
as
begin
select * from coupons
end;
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCategory]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetAllCategory]

as begin
 Select * from categories;
 end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCoupon]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteCoupon]
@id int
as
begin
delete from coupons where coupon_id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCategory]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeleteCategory]
(@id int)
as begin
 Delete from categories where id=@id;
 end
GO
/****** Object:  Table [dbo].[product_meta]    Script Date: 05/19/2016 17:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_meta](
	[prod_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_id] [int] NULL,
	[min_stock] [int] NULL,
	[actual_stock] [int] NULL,
	[create_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_details]    Script Date: 05/19/2016 17:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product_details](
	[prod_id] [int] NULL,
	[prod_name] [varchar](200) NULL,
	[prod_desc] [text] NULL,
	[prod_cost] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spUpdateProduct]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spUpdateProduct]
(@prod_id int,@prod_name varchar(100),@min_stock int,@actual_stock int,@prod_desc text,@cat_id int,@cost money)
as begin
Update product_meta set actual_stock=@actual_stock,min_stock=@min_stock,cat_id=@cat_id where prod_id=@prod_id;
 Update product_details set prod_name=@prod_name,prod_desc=@prod_desc,prod_cost=@cost where prod_id=@prod_id;
 
 end
GO
/****** Object:  StoredProcedure [dbo].[spInsertProduct]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertProduct]
(@cat_id int,@min_stock int,@actual_stock int,@name varchar(200),@desc text,@cost money)
as begin
declare @prod_id int;
insert into product_meta(cat_id,min_stock,actual_stock)values
(@cat_id,@min_stock,@actual_stock);
set @prod_id=(select @@IDENTITY);
insert into product_details values (@prod_id,@name,@desc,@cost);
end
GO
/****** Object:  StoredProcedure [dbo].[spGetProductsByCategory]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetProductsByCategory]
@id int
as
begin
select product_meta.prod_id,prod_name,prod_desc,prod_cost,
cat_id,min_stock,actual_stock from product_meta,product_details
 where product_meta.prod_id=product_details.prod_id and product_meta.cat_id=@id;
end
GO
/****** Object:  StoredProcedure [dbo].[spGetAllProducts]    Script Date: 05/19/2016 17:42:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spGetAllProducts]
as
begin
select product_meta.prod_id,prod_name,prod_desc,prod_cost,
cat_id,min_stock,actual_stock from product_meta,product_details
 where product_meta.prod_id=product_details.prod_id
end
GO
/****** Object:  Default [DF__categorie__is_en__014935CB]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[categories] ADD  DEFAULT ((1)) FOR [is_enabled]
GO
/****** Object:  Default [DF__categorie__creat__023D5A04]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[categories] ADD  DEFAULT (getdate()) FOR [create_date]
GO
/****** Object:  Default [DF__coupons__coupon___2B3F6F97]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[coupons] ADD  DEFAULT ((1)) FOR [coupon_quantity]
GO
/****** Object:  Default [DF__coupons__coupon___2C3393D0]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[coupons] ADD  DEFAULT ((0)) FOR [coupon_used]
GO
/****** Object:  Default [DF__coupons__create___2D27B809]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[coupons] ADD  DEFAULT (getdate()) FOR [create_date]
GO
/****** Object:  Default [DF__product_m__min_s__0BC6C43E]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[product_meta] ADD  DEFAULT ((0)) FOR [min_stock]
GO
/****** Object:  Default [DF__product_m__actua__0CBAE877]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[product_meta] ADD  DEFAULT ((0)) FOR [actual_stock]
GO
/****** Object:  Default [DF__product_m__creat__0DAF0CB0]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[product_meta] ADD  DEFAULT (getdate()) FOR [create_date]
GO
/****** Object:  ForeignKey [FK_product_details_product_meta]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[product_details]  WITH CHECK ADD  CONSTRAINT [FK_product_details_product_meta] FOREIGN KEY([prod_id])
REFERENCES [dbo].[product_meta] ([prod_id])
GO
ALTER TABLE [dbo].[product_details] CHECK CONSTRAINT [FK_product_details_product_meta]
GO
/****** Object:  ForeignKey [FK__product_m__cat_i__0EA330E9]    Script Date: 05/19/2016 17:42:46 ******/
ALTER TABLE [dbo].[product_meta]  WITH CHECK ADD FOREIGN KEY([cat_id])
REFERENCES [dbo].[categories] ([id])
GO
