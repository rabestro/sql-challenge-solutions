/*
    Problem statement

    Print the genre and the maximum weighted rating among all the movies of that genre
    released in 2014 per genre. (Download the dataset from console)

    Note:

    1. Do not print any row where either genre or the weighted rating is empty/null.
    2.  weighted_rating = avgerge of (rating + metacritic/10.0)
    3. Keep the name of the columns as 'genre' and 'weighted_rating'
    4. The genres should be printed in alphabetical order.
 */

SELECT
    genre,
    MAX((rating / 2 + metacritic / 20)) AS weighted_rating
FROM
    imdb
    INNER JOIN genre
    ON imdb.movie_id = genre.movie_id
        AND genre IS NOT NULL
        AND rating IS NOT NULL
        AND metacritic IS NOT NULL
        AND imdb.title LIKE '%(2014)'
GROUP BY
    genre
ORDER BY
    genre;