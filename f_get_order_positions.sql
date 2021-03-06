CREATE OR REPLACE FUNCTION public.get_order_positions(i_ord_no text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
 
 declare
 	l_ord_positions text;
 begin
	 
	 select row_to_json(ord) as t_orders 
	 into l_ord_positions
	 from 
 		(select ord.ord_no,
  			(select json_agg(rowset) from 
	  			 (select itm.itm_id,                     
	   			 prd.prd_name from 
	             t_orders as ord          
	             join t_order_items as itm on ord.ord_id = itm.itm_ord_id          
	             join t_products as prd on itm.itm_prd_id = prd.prd_id
	             where ord.ord_no = i_ord_no
	             )rowset
	  		) as positions
	from t_orders as ord where ord.ord_no = i_ord_no)ord;
	
	return l_ord_positions;


 end;
$function$
;