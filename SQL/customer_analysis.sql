{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2047\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Top Customers by Revenue\
\
SELECT \
c.customer_unique_id,\
COUNT(DISTINCT o.order_id) AS Total_Orders,\
SUM(oi.price) AS Total_Revenue\
FROM customers c\
JOIN orders o\
ON c.customer_id = o.customer_id\
JOIN order_items oi\
ON o.order_id = oi.order_id\
GROUP BY c.customer_unique_id\
ORDER BY Total_Revenue DESC\
LIMIT 10;\
\
\
}