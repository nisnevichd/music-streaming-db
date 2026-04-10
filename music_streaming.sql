CREATE SCHEMA music;
SET search_path TO music;

CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE songs (
    song_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist_id INT REFERENCES artists(artist_id),
    duration_seconds INT,
    release_year INT
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    plan VARCHAR(20),
    country VARCHAR(50),
    joined_date DATE
);

CREATE TABLE streams (
    stream_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    song_id INT REFERENCES songs(song_id),
    streamed_at TIMESTAMP,
    device VARCHAR(20),
    completed BOOLEAN
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist_id INT REFERENCES artists(artist_id),
    release_year INT
);

CREATE TABLE playlists (
    playlist_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP
);

CREATE TABLE playlist_songs (
    playlist_id INT REFERENCES playlists(playlist_id),
    song_id INT REFERENCES songs(song_id),
    added_at TIMESTAMP,
    PRIMARY KEY (playlist_id, song_id)
);

CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    plan VARCHAR(20),
    start_date DATE,
    end_date DATE
);

INSERT INTO music.artists (artist_name, genre, country) VALUES
('Drake', 'Hip-Hop', 'Canada'),
('Taylor Swift', 'Pop', 'USA'),
('Bad Bunny', 'Reggaeton', 'Puerto Rico'),
('Kendrick Lamar', 'Hip-Hop', 'USA'),
('The Weeknd', 'R&B', 'Canada'),
('Billie Eilish', 'Pop', 'USA'),
('J. Cole', 'Hip-Hop', 'USA'),
('Doja Cat', 'Pop', 'USA'),
('Tyler the Creator', 'Hip-Hop', 'USA'),
('SZA', 'R&B', 'USA'),
('Future', 'Hip-Hop', 'USA'),
('Olivia Rodrigo', 'Pop', 'USA'),
('Post Malone', 'Hip-Hop', 'USA'),
('Dua Lipa', 'Pop', 'UK'),
('Frank Ocean', 'R&B', 'USA'),
('Metro Boomin', 'Hip-Hop', 'USA'),
('Lana Del Rey', 'Indie Pop', 'USA'),
('Nav', 'Hip-Hop', 'Canada'),
('Arctic Monkeys', 'Indie Rock', 'UK'),
('Playboi Carti', 'Hip-Hop', 'USA');

INSERT INTO music.albums (title, artist_id, release_year) VALUES
('Certified Lover Boy', 1, 2021),
('Her Loss', 1, 2022),
('Midnights', 2, 2022),
('1989 (Taylors Version)', 2, 2023),
('Un Verano Sin Ti', 3, 2022),
('Mr. Morale & The Big Steppers', 4, 2022),
('After Hours', 5, 2020),
('Happier Than Ever', 6, 2021),
('KOD', 7, 2018),
('Planet Her', 8, 2021),
('Call Me If You Get Lost', 9, 2021),
('SOS', 10, 2022),
('Beerbongs & Bentleys', 13, 2018),
('Future Nostalgia', 14, 2020),
('Blonde', 15, 2016),
('Heroes & Villains', 16, 2022),
('Did You Know That There Is a Tunnel Under Ocean Blvd', 17, 2023),
('Whole Lotta Red', 20, 2020),
('Tranquility Base Hotel', 19, 2018),
('The Long Season', 18, 2021);

INSERT INTO music.songs (title, artist_id, duration_seconds, release_year) VALUES
('God''s Plan', 1, 198, 2018),
('Hotline Bling', 1, 267, 2015),
('Rich Flex', 1, 211, 2022),
('Anti-Hero', 2, 200, 2022),
('Shake It Off', 2, 219, 2014),
('Cruel Summer', 2, 178, 2019),
('Tití Me Preguntó', 3, 248, 2022),
('Moscow Mule', 3, 279, 2022),
('HUMBLE.', 4, 177, 2017),
('DNA.', 4, 185, 2017),
('Blinding Lights', 5, 200, 2019),
('Starboy', 5, 230, 2016),
('Bad Guy', 6, 194, 2019),
('Happier Than Ever', 6, 298, 2021),
('No Role Modelz', 7, 293, 2014),
('MIDDLE CHILD', 7, 213, 2019),
('Say So', 8, 238, 2019),
('Kiss Me More', 8, 208, 2021),
('EARFQUAKE', 9, 193, 2019),
('See You Again', 9, 261, 2021),
('Kill Bill', 10, 153, 2022),
('Good Days', 10, 274, 2020),
('Mask Off', 11, 184, 2017),
('Life Is Good', 11, 238, 2020),
('drivers license', 12, 242, 2021),
('good 4 u', 12, 178, 2021),
('Rockstar', 13, 218, 2017),
('Sunflower', 13, 158, 2018),
('Levitating', 14, 203, 2020),
('Don''t Start Now', 14, 183, 2019),
('Nights', 15, 307, 2016),
('Pink + White', 15, 183, 2016),
('Superhero', 16, 201, 2022),
('Creepin', 16, 217, 2022),
('Summertime Sadness', 17, 265, 2012),
('Video Games', 17, 274, 2011),
('Turks', 18, 224, 2021),
('No Debate', 18, 198, 2019),
('R U Mine?', 19, 202, 2013),
('Do I Wanna Know?', 19, 272, 2013),
('Magnolia', 20, 193, 2017),
('New Tank', 20, 147, 2020);

INSERT INTO music.users (username, plan, country, joined_date) VALUES
('drake_fan_99', 'premium', 'USA', '2021-03-15'),
('taylorswift4ever', 'premium', 'USA', '2020-06-01'),
('badbunny_lover', 'free', 'Puerto Rico', '2022-01-10'),
('kendrick_stan', 'premium', 'USA', '2019-11-23'),
('weeknd_vibes', 'free', 'Canada', '2021-08-14'),
('billie_fan', 'premium', 'UK', '2020-03-22'),
('jcole_world', 'free', 'USA', '2018-07-04'),
('dojacat_army', 'premium', 'USA', '2021-05-19'),
('tyler_enjoyer', 'premium', 'USA', '2020-12-31'),
('sza_listener', 'free', 'USA', '2022-09-08'),
('future_hendrix', 'free', 'USA', '2019-04-17'),
('olivia_fan', 'premium', 'USA', '2021-01-11'),
('posty_vibes', 'free', 'USA', '2018-10-05'),
('dua_lipa_fan', 'premium', 'UK', '2020-07-20'),
('frank_ocean_fan', 'free', 'USA', '2017-08-30'),
('metro_boomin', 'premium', 'USA', '2022-11-01'),
('lana_del_rey_fan', 'free', 'USA', '2019-02-14'),
('nav_fan', 'premium', 'Canada', '2021-06-25'),
('arcticmonkeys_uk', 'free', 'UK', '2018-03-11'),
('carti_fan', 'premium', 'USA', '2020-12-25'),
('music_lover_1', 'premium', 'USA', '2021-04-10'),
('chill_vibes', 'free', 'Canada', '2020-08-15'),
('beats_daily', 'premium', 'USA', '2019-05-22'),
('rhythm_nation', 'free', 'UK', '2022-02-28'),
('sound_wave', 'premium', 'USA', '2021-09-17'),
('night_owl', 'free', 'USA', '2020-11-03'),
('bass_head', 'premium', 'Canada', '2019-07-19'),
('melody_maker', 'free', 'USA', '2022-04-05'),
('vinyl_junkie', 'premium', 'UK', '2018-12-20'),
('stream_queen', 'free', 'USA', '2021-07-14');

INSERT INTO music.streams (user_id, song_id, streamed_at, device, completed) VALUES
(1, 1, '2024-01-01 08:23:00', 'mobile', true),
(1, 3, '2024-01-01 09:15:00', 'mobile', true),
(2, 4, '2024-01-01 10:00:00', 'desktop', true),
(3, 7, '2024-01-01 11:30:00', 'mobile', false),
(4, 9, '2024-01-01 12:00:00', 'desktop', true),
(5, 11, '2024-01-01 13:15:00', 'mobile', true),
(6, 13, '2024-01-01 14:00:00', 'tablet', true),
(7, 15, '2024-01-01 15:30:00', 'desktop', false),
(8, 17, '2024-01-01 16:00:00', 'mobile', true),
(9, 19, '2024-01-01 17:15:00', 'desktop', true),
(10, 21, '2024-01-01 18:00:00', 'mobile', true),
(11, 23, '2024-01-01 19:30:00', 'mobile', false),
(12, 25, '2024-01-01 20:00:00', 'desktop', true),
(13, 27, '2024-01-01 21:15:00', 'mobile', true),
(14, 29, '2024-01-01 22:00:00', 'tablet', true),
(15, 31, '2024-01-01 23:30:00', 'desktop', false),
(16, 33, '2024-01-02 08:00:00', 'mobile', true),
(17, 35, '2024-01-02 09:15:00', 'mobile', true),
(18, 37, '2024-01-02 10:00:00', 'desktop', true),
(19, 39, '2024-01-02 11:30:00', 'mobile', false),
(20, 41, '2024-01-02 12:00:00', 'desktop', true),
(21, 1, '2024-01-02 13:15:00', 'mobile', true),
(22, 4, '2024-01-02 14:00:00', 'tablet', true),
(23, 9, '2024-01-02 15:30:00', 'desktop', false),
(24, 11, '2024-01-02 16:00:00', 'mobile', true),
(25, 15, '2024-01-02 17:15:00', 'desktop', true),
(26, 19, '2024-01-02 18:00:00', 'mobile', true),
(27, 23, '2024-01-02 19:30:00', 'mobile', false),
(28, 27, '2024-01-02 20:00:00', 'desktop', true),
(29, 31, '2024-01-02 21:15:00', 'mobile', true),
(30, 35, '2024-01-02 22:00:00', 'tablet', true),
(1, 5, '2024-01-03 08:00:00', 'mobile', true),
(2, 6, '2024-01-03 09:00:00', 'desktop', true),
(3, 8, '2024-01-03 10:30:00', 'mobile', true),
(4, 10, '2024-01-03 11:00:00', 'desktop', false),
(5, 12, '2024-01-03 12:15:00', 'mobile', true),
(6, 14, '2024-01-03 13:00:00', 'tablet', true),
(7, 16, '2024-01-03 14:30:00', 'desktop', false),
(8, 18, '2024-01-03 15:00:00', 'mobile', true),
(9, 20, '2024-01-03 16:15:00', 'desktop', true),
(10, 22, '2024-01-03 17:00:00', 'mobile', true),
(11, 24, '2024-01-03 18:30:00', 'mobile', false),
(12, 26, '2024-01-03 19:00:00', 'desktop', true),
(13, 28, '2024-01-03 20:15:00', 'mobile', true),
(14, 30, '2024-01-03 21:00:00', 'tablet', true),
(15, 32, '2024-01-03 22:30:00', 'desktop', false),
(16, 34, '2024-01-04 08:00:00', 'mobile', true),
(17, 36, '2024-01-04 09:15:00', 'mobile', true),
(18, 38, '2024-01-04 10:00:00', 'desktop', true),
(19, 40, '2024-01-04 11:30:00', 'mobile', false),
(20, 42, '2024-01-04 12:00:00', 'desktop', true),
(1, 2, '2024-01-04 13:00:00', 'mobile', true),
(2, 5, '2024-01-04 14:00:00', 'desktop', true),
(3, 9, '2024-01-04 15:00:00', 'mobile', true),
(4, 13, '2024-01-04 16:00:00', 'desktop', false),
(5, 17, '2024-01-04 17:00:00', 'mobile', true),
(6, 21, '2024-01-04 18:00:00', 'tablet', true),
(7, 25, '2024-01-04 19:00:00', 'desktop', false),
(8, 29, '2024-01-04 20:00:00', 'mobile', true),
(9, 33, '2024-01-04 21:00:00', 'desktop', true),
(10, 37, '2024-01-04 22:00:00', 'mobile', true),
(11, 41, '2024-01-05 08:00:00', 'mobile', false),
(12, 1, '2024-01-05 09:00:00', 'desktop', true),
(13, 5, '2024-01-05 10:00:00', 'mobile', true),
(14, 9, '2024-01-05 11:00:00', 'tablet', true),
(15, 13, '2024-01-05 12:00:00', 'desktop', false),
(16, 17, '2024-01-05 13:00:00', 'mobile', true),
(17, 21, '2024-01-05 14:00:00', 'mobile', true),
(18, 25, '2024-01-05 15:00:00', 'desktop', true),
(19, 29, '2024-01-05 16:00:00', 'mobile', false),
(20, 33, '2024-01-05 17:00:00', 'desktop', true),
(21, 37, '2024-01-05 18:00:00', 'mobile', true),
(22, 41, '2024-01-05 19:00:00', 'tablet', true),
(23, 2, '2024-01-05 20:00:00', 'desktop', false),
(24, 6, '2024-01-05 21:00:00', 'mobile', true),
(25, 10, '2024-01-05 22:00:00', 'desktop', true),
(26, 14, '2024-01-06 08:00:00', 'mobile', true),
(27, 18, '2024-01-06 09:00:00', 'mobile', false),
(28, 22, '2024-01-06 10:00:00', 'desktop', true),
(29, 26, '2024-01-06 11:00:00', 'mobile', true),
(30, 30, '2024-01-06 12:00:00', 'tablet', true),
(1, 9, '2024-01-06 13:00:00', 'mobile', true),
(2, 11, '2024-01-06 14:00:00', 'desktop', false),
(3, 13, '2024-01-06 15:00:00', 'mobile', true),
(4, 15, '2024-01-06 16:00:00', 'desktop', true),
(5, 17, '2024-01-06 17:00:00', 'mobile', true),
(6, 19, '2024-01-06 18:00:00', 'tablet', false),
(7, 21, '2024-01-06 19:00:00', 'desktop', true),
(8, 23, '2024-01-06 20:00:00', 'mobile', true),
(9, 25, '2024-01-06 21:00:00', 'desktop', true),
(10, 27, '2024-01-06 22:00:00', 'mobile', false),
(11, 29, '2024-01-07 08:00:00', 'mobile', true),
(12, 31, '2024-01-07 09:00:00', 'desktop', true),
(13, 33, '2024-01-07 10:00:00', 'mobile', true),
(14, 35, '2024-01-07 11:00:00', 'tablet', false),
(15, 37, '2024-01-07 12:00:00', 'desktop', true),
(16, 39, '2024-01-07 13:00:00', 'mobile', true),
(17, 41, '2024-01-07 14:00:00', 'mobile', true),
(18, 1, '2024-01-07 15:00:00', 'desktop', false),
(19, 3, '2024-01-07 16:00:00', 'mobile', true),
(20, 5, '2024-01-07 17:00:00', 'desktop', true);

SELECT
    (SELECT COUNT(*) FROM music.artists) AS artists,
    (SELECT COUNT(*) FROM music.albums) AS albums,
    (SELECT COUNT(*) FROM music.songs) AS songs,
    (SELECT COUNT(*) FROM music.users) AS users,
    (SELECT COUNT(*) FROM music.streams) AS streams;

SELECT title, artist_name, count(songs.song_id) as stream_count
FROM music.streams
JOIN music.songs ON streams.song_id = songs.song_id
JOIN music.artists ON songs.artist_id = artists.artist_id
GROUP BY songs.song_id, title, artist_name
ORDER BY count(songs.song_id) desc
LIMIT 10;

SELECT artist_name, ROUND(COUNT(*) FILTER (WHERE completed = true)::numeric / COUNT(*) * 100, 2) as completion_rate
FROM music.streams
JOIN music.songs ON streams.song_id = songs.song_id
JOIN music.artists ON songs.artist_id = artists.artist_id
GROUP BY artist_name
ORDER BY count(songs.song_id) desc
LIMIT 10;

select
    plan, count(*) as total_streams, ROUND(COUNT(*) FILTER (WHERE completed = true)::numeric / COUNT(*) * 100, 2) as completion_rate
FROM music.streams
join music.users on streams.user_id = users.user_id
group by plan;

select
    device,
    count(device) as total_streams,
    ROUND(COUNT(*) FILTER (WHERE completed = true)::numeric / COUNT(*) * 100, 2) as completion_rate
from music.streams
group by device
order by total_streams desc;

SELECT
    to_char(streams.streamed_at, 'Day') as day_of_week, count(stream_id) as streams
from music.streams
group by day_of_week
order by streams desc;

select
    genre, count(streams.song_id) as stream_count
from music.artists
join music.songs on artists.artist_id = songs.artist_id
join music.streams on streams.song_id = songs.song_id
group by genre
order by stream_count desc;


