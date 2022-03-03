#How nuch time has passed from ordering till picking the order for each order
select distinct x.order_id, if(x.do_t=x.r_t,if( x.rp_t=x.ho_t, x.mp_t-x.mo_t, x.rp_t-x.ho_t), x.r_t-x.do_t ) as time_pass
 from
(SELECT ro.order_id, day(co.order_time) as do_t, hour(co.order_time) as ho_t,day(ro.pickup_time) as r_t, hour(ro.pickup_time) rp_t,
minute(co.order_time) as mo_t, minute(ro.pickup_time) as mp_t,
 ro.pickup_time, co.order_time  FROM pizza_runner.runner_orders ro
join pizza_runner.customer_orders co on co.order_id=ro.order_id)x