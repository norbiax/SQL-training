-- Drop table

-- DROP TABLE public.t_products;

CREATE TABLE public.t_products (
	prd_id serial NOT NULL,
	prd_name text NOT NULL,
	prd_desc text NOT NULL,
	prd_price numeric(10,2) NOT NULL,
	CONSTRAINT t_products_pk PRIMARY KEY (prd_id)
);
