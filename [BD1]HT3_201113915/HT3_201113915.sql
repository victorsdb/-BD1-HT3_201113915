

use northwind;


update employees 
	inner join 
		(select * from employees where employees.id = '2') as tabla2
			on tabla2.id = '2'
				set employees.first_name = tabla2.first_name,
					employees.last_name = tabla2.last_name
where employees.id = '8';

select id, first_name, last_name
	from employees 
		where id=2 or id=8;

select concat(first_name, ' ', last_name) as Nombre,
        concat(round(sum(quantity*unit_price)*100/(select sum(quantity*unit_price) from order_details),2),' %') 
        as 'Porcentaje Ventas'
			from employees 
				inner join orders on employees.id = orders.employee_id
				inner join order_details on order_details.order_id = orders.id
					group by nombre, employees.id
						order by sum(quantity*unit_price)  desc;

select orders.id as 'Id Orden', round(sum(quantity*unit_price), 2) as 'Total Orden'from orders
	inner join order_details on order_details.order_id = orders.id
		group by orders.id
			order by sum(quantity*unit_price)  desc
				limit 3;
                
select orders.id as 'Id Orden', round(sum(quantity),0) as Productos from orders
	inner join order_details on order_details.order_id = orders.id
		group by orders.id
			order by sum(quantity)  desc
				limit 3;
                
select product_name as Producto, round(sum(quantity),0) as Cantidad from order_details
	inner join products on order_details.product_id=products.id
		group by products.id
			order by sum(quantity) desc
				limit 5;