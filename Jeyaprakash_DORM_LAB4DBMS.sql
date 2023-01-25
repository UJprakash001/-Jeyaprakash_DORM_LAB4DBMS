select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from 
(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from 
(select `orderr`.*, customer.cus_gender, customer.cus_name from `orderr` inner join customer where `orderr`.cus_id=customer.cus_id having `orderr`.ord_amount>=3000)
as t1  group by t1.cus_id) as t2 group by t2.cus_gender;

select product.pro_name, `orderr`.* from `orderr`, supplier_pricing, product 
where `orderr`.cus_id=2 and 
`orderr`.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;


select category.cat_id,category.cat_name, min(t3.min_price) as Min_Price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join  
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id) 
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

select product.pro_id,product.pro_name from `orderr` inner join supplier_pricing on supplier_pricing.pricing_id=`orderr`.pricing_id inner join product on product.pro_id=supplier_pricing.pro_id where `orderr`.ord_date>"2021-10-05";

select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

Call serviceRating();