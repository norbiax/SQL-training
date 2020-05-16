CREATE OR REPLACE FUNCTION public.place_order()
	RETURNS text
	LANGUAGE plpgsql 
AS $function$
declare

	l_ord_json json := '{
        "ord_no":"1/4/2020",
        "items":[
            {"itm_no":1,"prd_name":"Margharita", "itm_qty": 5}, 
            {"itm_no":2,"prd_name":"Salami", "itm_qty": 5}, 
            {"itm_no":3,"prd_name":"Coca-Cola", "itm_qty": 5}, 
            {"itm_no":4,"prd_name":"Hawai", "itm_qty": 5}
        ]
    }'::json;

	l_ord_item record;
    l_ord_no t_orders.ord_no%type;
begin

	select l_ord_json->'ord_no' into l_ord_no;
	
		insert into t_orders 
			(ord_id, ord_no, ord_date)
			values
			(default, l_ord_no, current_timestamp);

	for l_ord_item in select * from json_to_recordset(l_ord_json->'items') as pos(itm_no int, prd_name text, itm_qty int)
	loop
		insert into t_order_items
			(itm_id, itm_ord_id, itm_no, itm_prd_id, itm_qty)
			values
			(default, 
			(select ord_id from t_orders where ord_no = l_ord_no), 
			l_ord_item.itm_no, 
			(select prd_id from t_products where prd_name = l_ord_item.prd_name), 
			l_ord_item.itm_qty);
	end loop;
	
return 'Order created or replaced';
end;
$function$
;