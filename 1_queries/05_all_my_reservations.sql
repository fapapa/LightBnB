SELECT reservations.*, properties.*, AVG(rating)
       FROM reservations
       JOIN properties
            ON reservations.property_id = properties.id
       JOIN property_reviews
            ON properties.id = property_reviews.property_id
       WHERE end_date < now()::date AND reservations.guest_id = 1
       GROUP BY properties.id, reservations.id
       ORDER BY reservations.start_date DESC
       LIMIT 10;
