-- connecting with db and showing positions of selected order
import psycopg2

database = "ordersdb"
user = "..."
host = "..."
port = ...
password = "..."

conn = psycopg2.connect(database = database, user = user, host = host, port = port, password = password)

print("Database connected successfully")

with conn:

    cur = conn.cursor()
    cur.execute('''
    select ord.ord_no,        
        itm.itm_id,        
        prd.prd_name 
    from t_orders as ord 
    join t_order_items as itm on ord.ord_id = itm.itm_ord_id 
    join t_products as prd on itm.itm_prd_id = prd.prd_id 
    where ord.ord_no = '1/3/2020' 
    ''')

    rows = cur.fetchall()

    for data in rows:
        print(data)


