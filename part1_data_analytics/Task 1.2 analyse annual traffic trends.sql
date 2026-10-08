--This is an SQL script to analyse the data
/* 
	Created by: Me
	Created on: 6 Oct 2026
	Description: this is a query to select records from the table in order to analyse traffic volume 
	*/
SELECT
	strftime('%Y', date_time) AS year,
	SUM(traffic_volume) as total_traffic,
	COUNT(date_time)

FROM 
	Metro_Interstate_Traffic_Volume
WHERE 
	strftime('%Y', date_time) BETWEEN '2012' AND '2017'
GROUP BY 
	year
ORDER BY
	year;