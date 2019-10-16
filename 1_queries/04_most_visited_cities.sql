SELECT properties.city, COUNT(reservations.*)
       FROM properties
       JOIN reservations
            ON properties.id = reservations.property_id
       GROUP BY properties.city
       ORDER BY COUNT(reservations.*) DESC;
