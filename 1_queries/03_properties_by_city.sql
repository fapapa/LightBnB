SELECT properties.id, title, cost_per_night, AVG(rating)
       FROM properties
       INNER JOIN property_reviews
            ON properties.id = property_reviews.property_id
       WHERE city = 'Vancouver'
       GROUP BY properties.id
       HAVING AVG(rating) >= 4
       LIMIT 10;
