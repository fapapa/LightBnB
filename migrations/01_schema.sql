DROP TABLE IF EXISTS guest_reviews CASCADE;
DROP TABLE IF EXISTS property_reviews CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS rates CASCADE;
DROP TABLE IF EXISTS properties CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
       id SERIAL PRIMARY KEY,
       name VARCHAR(255),
       email VARCHAR(255),
       password VARCHAR(255)
);

CREATE TABLE properties (
       id SERIAL PRIMARY KEY,
       owner_id INTEGER REFERENCES users(id),
       title VARCHAR(255),
       description TEXT,
       thumbnail_photo_url VARCHAR(255),
       cover_photo_url VARCHAR(255),
       cost_per_night MONEY,
       street VARCHAR(255),
       parking_spaces SMALLINT,
       number_of_bathrooms SMALLINT,
       number_of_bedrooms SMALLINT,
       country VARCHAR(255),
       city VARCHAR(255),
       province VARCHAR(255),
       post_code VARCHAR(255),
       active BOOLEAN DEFAULT TRUE
);

CREATE TABLE rates (
       id SERIAL PRIMARY KEY,
       start_date TIMESTAMP,
       end_date TIMESTAMP,
       cost_per_night MONEY,
       property_id INTEGER REFERENCES properties(id)
);

CREATE TABLE reservations (
       id SERIAL PRIMARY KEY,
       start_date TIMESTAMP,
       end_date TIMESTAMP,
       property_id INTEGER REFERENCES properties(id),
       guest_id INTEGER REFERENCES users(id)
);

CREATE TABLE property_reviews (
       id SERIAL PRIMARY KEY,
       guest_id INTEGER REFERENCES users(id),
       reservation_id INTEGER REFERENCES reservations(id),
       property_id INTEGER REFERENCES properties(id),
       rating SMALLINT,
       message TEXT
);

CREATE TABLE guest_reviews (
       id SERIAL PRIMARY KEY,
       guest_id INTEGER REFERENCES users(id),
       owner_id INTEGER REFERENCES users(id),
       reservation_id INTEGER REFERENCES reservations(id),
       rating SMALLINT,
       message TEXT
);
