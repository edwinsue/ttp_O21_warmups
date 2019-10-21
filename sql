WITH holiday_films AS (
	SELECT 
	title,
	description,
	CASE 
	WHEN title ILIKE '%christmas%' OR description ILIKE '%christmas%' THEN 'Christmas' 
	WHEN title ILIKE '%thanksgiving%' OR description ILIKE '%thanksgiving%' THEN 'Thanksgiving' 
	WHEN title ILIKE '%halloween%' OR description ILIKE '%halloween%' THEN 'Halloween'
	WHEN title ILIKE '%new year%' OR description ILIKE '%new year%' THEN 'New Year'
	ELSE NULL
	END AS Holiday,
	rental_rate
	FROM film
	ORDER BY holiday ASC, title ASC
)

SELECT 
*,
CASE WHEN Holiday IS NOT NULL THEN ROUND(rental_rate * 0.5,2)
ELSE rental_rate
END AS promo_rate
FROM holiday_films