# 2669. Count Artist Occurrence on Spotify

SELECT artist, COUNT(id) AS occurrences
FROM Spotify
GROUP BY artist
ORDER BY occurrences DESC, artist;