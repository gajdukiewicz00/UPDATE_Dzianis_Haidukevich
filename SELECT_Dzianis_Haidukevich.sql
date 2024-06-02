-- Five most rented movies and the expected age of the audience
WITH MovieRentals AS (
    SELECT 
        f.film_id,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        AVG(EXTRACT(YEAR FROM AGE(c.create_date))) AS average_age
    FROM 
        rental r
    JOIN 
        film f ON r.inventory_id = f.film_id
    JOIN 
        customer c ON r.customer_id = c.customer_id
    GROUP BY 
        f.film_id, f.title
    ORDER BY 
        rental_count DESC
    LIMIT 5
)
SELECT 
    *
FROM 
    MovieRentals;
