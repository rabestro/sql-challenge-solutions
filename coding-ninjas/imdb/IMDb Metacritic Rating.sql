/*
Print the title and ratings of the movies released in 2012 whose metacritic rating
is more than 60 and Domestic collections exceed 10 Crores.
*/

SELECT
    title,
    rating
FROM
    imdb
    INNER JOIN earning
    ON imdb.movie_id = earning.movie_id
        AND title LIKE '%(2012)'
        AND domestic > 100000000
        AND metacritic > 60
ORDER BY title;
