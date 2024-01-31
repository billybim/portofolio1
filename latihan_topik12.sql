SELECT * FROM air_quality;

-- 1. coba cari apakah ada data yang menunjukan country = indonesia?
SELECT * FROM air_quality WHERE Country = "Indonesia";

-- 2. tunjukan rata-rata air quality dan water polution di indonesia
SELECT AVG(AirQuality) AS avg_air_quality_indonesia, AVG(WaterPollution) AS avg_waterPollution_indonesia
FROM air_quality WHERE Country = "Indonesia";

-- 3. tunjukan rata-rata air quality dan water polution di indonesia tiap region
SELECT Region, AVG(AirQuality) AS avg_air_quality, AVG(WaterPollution) AS avg_waterPollution
FROM air_quality WHERE Country = "Indonesia" GROUP BY Region ORDER BY Region;

-- 4. Urutkan region di indonesia mana yang memiliki rata2 air quality bagus (tinggi)
-- ke jelek (rendah)
SELECT Region, AVG(AirQuality) AS avg_air_quality
FROM air_quality WHERE Country = "Indonesia" GROUP BY Region ORDER BY avg_air_quality DESC;

-- 5. Urutkan region di indonesia mana yang memiliki rata2 water pollution bagus (rendah)
-- ke jelek (tinggi)
SELECT Region, AVG(WaterPollution) AS avg_water_pollution
FROM air_quality WHERE Country = "Indonesia" GROUP BY Region ORDER BY avg_water_pollution ASC;

-- 6. coba gabungkan output dari soal nomor 4 dan nomor 5 pada satu tabel
WITH air AS (
	SELECT Region, AVG(AirQuality) AS avg_air_quality
	FROM air_quality WHERE Country = "Indonesia" GROUP BY Region
), water AS (
	SELECT Region, AVG(WaterPollution) AS avg_water_pollution
    FROM air_quality WHERE Country = "Indonesia" GROUP BY Region
) SELECT air.Region, air.avg_air_quality, water.avg_water_pollution FROM air
LEFT JOIN water ON air.Region = water.Region;

-- 7. Rata-rata air quality yang terbaik (tinggi) ke terjelek (rendah) per negara
SELECT Country, AVG(AirQuality) AS avg_air_quality FROM air_quality
GROUP BY Country ORDER BY avg_air_quality DESC;

-- 8. Rata-rata water pollution yang terbaik (rendah) ke terjelek (tinggi) per negara
SELECT Country, AVG(WaterPollution) AS avg_water_pollution FROM air_quality
GROUP BY Country ORDER BY avg_water_pollution ASC;

-- 9. tunjukan rata-rata air quality dan water polution di dunia
SELECT AVG(AirQuality) AS avg_air_quality_world, AVG(WaterPollution) AS avg_waterPollution_world
FROM air_quality;
