-- Drop table

-- DROP TABLE public.t_order_items;

CREATE TABLE public.t_order_items (
	itm_id serial NOT NULL,
	itm_ord_id int4 NOT NULL,
	itm_no text NOT NULL,
	itm_prd_id int4 NOT NULL,
	itm_qty int4 NOT NULL,
	CONSTRAINT t_order_items_pk PRIMARY KEY (itm_id),
	CONSTRAINT t_order_items_orders_fk FOREIGN KEY (itm_ord_id) REFERENCES t_orders(ord_id),
	CONSTRAINT t_order_items_products_fk FOREIGN KEY (itm_prd_id) REFERENCES t_products(prd_id)
);