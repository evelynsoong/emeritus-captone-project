SELECT
	strftime('%Y', date_time) AS year,
	SUM(traffic_volume) as total_traffic,
	holiday,
	AVG(temp) as average_temp

FROM 
	Metro_Interstate_Traffic_Volume
WHERE 
	(strftime('%Y', date_time) BETWEEN '2015' AND '2017') AND holiday IN ('New Years Day', 'Labor Day')
GROUP BY 
	year,holiday
ORDER BY
	holiday,year;