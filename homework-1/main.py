"""Скрипт для заполнения данными таблиц в БД Postgres."""
import pandas as pd
import psycopg2
import csv

conn = psycopg2.connect(
    host="localhost",
    database="north",
    user="postgres",
    password="3500Clasic"
)
with conn:
    with conn.cursor() as cur:
        with open('north_data\customers_data.csv') as file:
            csv_reader = csv.DictReader(file)
            for row in csv_reader:
                cur.execute('INSERT INTO customers_data VALUES (%s, %s, %s)', (row['customer_id'], row['company_name'], row['contact_name']))
            cur.execute("SELECT * FROM customers_data")
            rows = cur.fetchall()
            for row in rows:
                print(row)

