-- Drop table

-- DROP TABLE public.t_orders;

CREATE TABLE public.t_orders (
	ord_id serial NOT NULL,
	ord_no text NOT NULL,
	ord_date timestamptz NOT NULL,
	CONSTRAINT t_orders_pk PRIMARY KEY (ord_id),
	CONSTRAINT unique_ord_no UNIQUE (ord_no)
);