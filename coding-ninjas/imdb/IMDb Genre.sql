/*
  Problem statement

  Print the genre and the maximum net profit among all the movies of that genre
  released in 2012 per genre. (Download the dataset from console)

  Note:

    1. Do not print any row where either genre or the net profit is empty/null.
    2. net_profit = Domestic + Worldwide - Budget
    3. Keep the name of the columns as 'genre' and 'net_profit'
    4. The genres should be printed in alphabetical order.
 */

SELECT
    genre,
    MAX(domestic + worldwide - budget) AS net_profit
FROM
    imdb
    INNER JOIN earning
    ON imdb.movie_id = earning.movie_id
        AND title LIKE '%(2012)'
        AND budget IS NOT NULL
    INNER JOIN genre
    ON imdb.movie_id = genre.movie_id
        AND genre IS NOT NULL
GROUP BY
    genre
ORDER BY
    genre;