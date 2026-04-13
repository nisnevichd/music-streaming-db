from sqlalchemy import create_engine
import pandas as pd

# Connect using SQLAlchemy
engine = create_engine('postgresql://postgres:postgres@localhost:5432/music_streaming')

print("Connected successfully!")

# Query 1 - Top 10 most streamed songs
q1 = """
SELECT title, artist_name, COUNT(songs.song_id) AS stream_count
FROM music.streams
JOIN music.songs ON streams.song_id = songs.song_id
JOIN music.artists ON songs.artist_id = artists.artist_id
GROUP BY songs.song_id, title, artist_name
ORDER BY stream_count DESC
LIMIT 10;
"""
# Query 2 - Completion rate by artist
q2 = """
SELECT artist_name, 
ROUND(COUNT(*) FILTER (WHERE completed = true)::numeric / COUNT(*) * 100, 2) AS completion_rate
FROM music.streams
JOIN music.songs ON streams.song_id = songs.song_id
JOIN music.artists ON songs.artist_id = artists.artist_id
GROUP BY artist_name
ORDER BY completion_rate DESC;
"""

# Query 3 - Premium vs free behavior
q3 = """
SELECT plan, COUNT(*) AS total_streams,
ROUND(COUNT(*) FILTER (WHERE completed = true)::numeric / COUNT(*) * 100, 2) AS completion_rate
FROM music.streams
JOIN music.users ON streams.user_id = users.user_id
GROUP BY plan;
"""

# Query 4 - Device breakdown
q4 = """
SELECT device, COUNT(*) AS total_streams,
ROUND(COUNT(*) FILTER (WHERE completed = true)::numeric / COUNT(*) * 100, 2) AS completion_rate
FROM music.streams
GROUP BY device
ORDER BY total_streams DESC;
"""

# Query 5 - Streaming by day of week
q5 = """
SELECT TO_CHAR(streamed_at, 'Day') AS day_of_week, COUNT(*) AS streams
FROM music.streams
GROUP BY day_of_week
ORDER BY streams DESC;
"""

# Query 6 - Top genre
q6 = """
SELECT genre, COUNT(*) AS stream_count
FROM music.streams
JOIN music.songs ON streams.song_id = songs.song_id
JOIN music.artists ON songs.artist_id = artists.artist_id
GROUP BY genre
ORDER BY stream_count DESC;
"""
df1 = pd.read_sql(q1, engine)
df2 = pd.read_sql(q2, engine)
df3 = pd.read_sql(q3, engine)
df4 = pd.read_sql(q4, engine)
df5 = pd.read_sql(q5, engine)
df6 = pd.read_sql(q6, engine)

print("=== Top 10 Most Streamed Songs ===")
print(df1)
print("\n=== Completion Rate by Artist ===")
print(df2)
print("\n=== Premium vs Free ===")
print(df3)
print("\n=== Device Breakdown ===")
print(df4)
print("\n=== Streams by Day ===")
print(df5)
print("\n=== Top Genres ===")
print(df6)



