-- From the IMDb dataset, print the title and rating of those movies which have
-- a genre starting from 'C' released in 2014 with a budget higher than 4 Crore.

SELECT
    title,
    rating
FROM
    imdb
    INNER JOIN genre
    ON genre.movie_id = imdb.movie_id
        AND genre LIKE 'C%'
        AND title LIKE '%(2014)'
        AND budget > 40000000
ORDER BY
    title;