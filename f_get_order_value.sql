CREATE OR REPLACE FUNCTION public.get_order_value(i_ord_no text)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
 
declare 
	l_ord_value numeric;
begin
	
	select sum(t_order_items.itm_qty * t_products.prd_price) 
	into l_ord_value
	from t_orders
	join t_order_items on t_orders.ord_id = t_order_items.itm_ord_id
	join t_products on t_order_items.itm_prd_id = t_products.prd_id
	where t_orders.ord_no = i_ord_no
	group by t_orders.ord_no;
	
	return l_ord_value;
	
END;
$function$
;