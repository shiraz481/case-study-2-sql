#How many Vegetarian and Meatlovers were ordered by each customer?

SELECT  co.customer_id, count(co.pizza_id), pn.pizza_name as pizza_kind FROM pizza_runner.customer_orders co
join pizza_runner.pizza_names pn on co.pizza_id= pn.pizza_id
group by customer_id, pizza_name
order by customer_id asc