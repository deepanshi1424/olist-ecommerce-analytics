{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Customer Segmentation\
\
SELECT\
Customer_Segment,\
COUNT(*) AS Total_Customers\
FROM\
(\
SELECT\
c.customer_unique_id,\
SUM(oi.price) AS Revenue,\
\
CASE\
WHEN SUM(oi.price) > 5000 THEN 'Gold'\
WHEN SUM(oi.price) BETWEEN 1000 AND 5000 THEN 'Silver'\
ELSE 'Bronze'\
END AS Customer_Segment\
\
FROM customers c\
\
JOIN orders o\
ON c.customer_id=o.customer_id\
\
JOIN order_items oi\
ON o.order_id=oi.order_id\
\
GROUP BY c.customer_unique_id\
\
)t\
\
GROUP BY Customer_Segment;}