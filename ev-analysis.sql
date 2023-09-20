-- checking the number of records in the table 
select *
from afvus;

-- This query retrieves the name of the first column in the 'afvus' table
-- This is necessary because one of the columns did not get its name transferred over properly during the CSV to SQL import
-- So checking its name so I can rename it with the proper column name
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'afvus'
AND ORDINAL_POSITION = 1;


-- Query below renames the column 'ï»¿Category' to 'Category'
-- This is done to correct the column name, which did not get imported properly during the data import process
ALTER TABLE afvus
RENAME COLUMN ï»¿Category TO Category;

-- First looking at the distribution of EVs by manufacturer and model year
SELECT
    Manufacturer,
    ModelYear,
    COUNT(*) AS VehicleCount
FROM
    afvus
WHERE
    Fuel IN ('Electric')  -- Filter for Electric Vehicles (EV)
GROUP BY
    Manufacturer,
    ModelYear
ORDER BY
    VehicleCount DESC;  -- Sort by number of vehicles  in descending order
    

-- Now calculating the frequency of cars categorized by their fuel type and presenting the results
-- in descending order of frequency. This would provide insights into which fuel types are most prevalent in the dataset.
SELECT
    Fuel,                   
    COUNT(*) AS Frequency  -- Count the occurrences of each fuel type and name the result column 'Frequency'
FROM
    afvus           
GROUP BY
    Fuel                    -- Group the results by the 'Fuel' column
ORDER BY
    Frequency DESC;         -- Sort the results by frequency in descending order
    

-- Fuel Economy Analysis for Conventional Vehicles --


-- Calculate and compare the average conventional fuel economy combined for different vehicle manufacturers.

WITH RankedManufacturers AS (
    SELECT
        Manufacturer,
        AVG(`ConventionalFuelEconomyCombined`) AS AvgFuelEconomy
    FROM
        afvus
    WHERE
        `ConventionalFuelEconomyCombined` IS NOT NULL
    GROUP BY
        Manufacturer
)
SELECT
    Manufacturer,
    AvgFuelEconomy,
    RANK() OVER (ORDER BY AvgFuelEconomy DESC) AS rank_
FROM
    RankedManufacturers
ORDER BY
    rank_;



-- Calculate and compare the average conventional fuel economy combined for different vehicle categories
SELECT
    Category, 
    AVG(`ConventionalFuelEconomyCombined`) AS AvgFuelEconomy  -- Calculate the average fuel economy
FROM
    afvus  
WHERE
    Category IS NOT NULL  -- Exclude records with NULL category
GROUP BY
    Category   -- Group the results by 'Category'
ORDER BY
    AvgFuelEconomy DESC;   -- Sort the results by average fuel economy in descending order


-- Now calculating and comparing the average conventional fuel economy combined for different fuel types
SELECT
    Fuel, 
    AVG(`ConventionalFuelEconomyCombined`) AS AvgFuelEconomy  -- Calculate the average fuel economy
FROM
    afvus                          
WHERE
    Fuel IS NOT NULL -- Exclude records with NULL fuel type
GROUP BY
    Fuel   -- Group the results by 'Fuel'
ORDER BY
    AvgFuelEconomy DESC;  -- Sort the results by average fuel economy in descending order
    
-- Fuel Economy Analysis for Alternative Fuel Vehicles --


-- Calculate and compare the average alternative fuel economy combined for different vehicle manufacturers.
SELECT
    Manufacturer,   
    AVG(`AlternativeFuelEconomyCombined`) AS AvgFuelEconomy  -- Calculate the average fuel economy
FROM
    afvus                          
GROUP BY
    Manufacturer  -- Group the results by 'Manufacturer'
ORDER BY
    AvgFuelEconomy DESC;  -- Sort the results by average fuel economy in descending order


-- Calculate and compare the average alternative fuel economy combined for different vehicle categories
SELECT
    Category, 
    AVG(`AlternativeFuelEconomyCombined`) AS AvgFuelEconomy  -- Calculate the average fuel economy
FROM
    afvus  
WHERE
    Category IS NOT NULL  -- Exclude records with NULL category
GROUP BY
    Category   -- Group the results by 'Category'
ORDER BY
    AvgFuelEconomy DESC;   -- Sort the results by average fuel economy in descending order
    

-- Now calculating and comparing the average alternative fuel economy combined for different fuel types
SELECT
    Fuel, 
    AVG(`AlternativeFuelEconomyCombined`) AS AvgFuelEconomy  -- Calculate the average fuel economy
FROM
    afvus                          
WHERE
    Fuel IS NOT NULL -- Exclude records with NULL fuel type
GROUP BY
    Fuel   -- Group the results by 'Fuel'
ORDER BY
    AvgFuelEconomy DESC;  -- Sort the results by average fuel economy in descending order


-- Next, checking how  the all-electric range of EVs varies by manufacturer and model year
SELECT
    Manufacturer,
    ModelYear,
    AVG(`All-ElectricRange`) AS AvgElectricRange
FROM
    afvus
WHERE
     Fuel IN ('Electric')  -- Filter for Electric Vehicles (EV)
GROUP BY
    Manufacturer,
    ModelYear
ORDER BY
    AvgElectricRange DESC;  -- Sort by average electric range in descending order
    
-- checking how  the all-electric range of EVs varies by the category (sedan/SUV/pickup)
SELECT
    Category,
    AVG(`All-ElectricRange`) AS AvgElectricRange
FROM
    afvus
WHERE
     Fuel IN ('Electric')  -- Filter for Electric Vehicles (EV)
GROUP BY
    Category
ORDER BY
    AvgElectricRange DESC;  -- Sort by average electric range in descending order


-- Calculate average and standard deviation of All-ElectricRange for each manufacturer.
-- Identify and label rows as outliers based on the specified criteria.

-- Common Table Expression (CTE) to calculate statistics by manufacturer

-- Calculate average and standard deviation of All-ElectricRange for each manufacturer.
-- Identify and label rows as outliers based on the specified criteria.
WITH ElectricRangeOutliers AS (
    SELECT
        *,
        -- Calculate the average (mean) All-ElectricRange for each manufacturer
        AVG(`All-ElectricRange`) OVER (PARTITION BY Manufacturer) AS AvgRange,
        -- Calculate the standard deviation of All-ElectricRange for each manufacturer
        STDDEV_SAMP(`All-ElectricRange`) OVER (PARTITION BY Manufacturer) AS StdDevRange
    FROM
        afvus
    WHERE
        `All-ElectricRange` IS NOT NULL
)

-- Main query to label and filter outliers
SELECT
    *
FROM
    ElectricRangeOutliers
WHERE
    (
        `All-ElectricRange` < AvgRange - 2 * StdDevRange
        OR `All-ElectricRange` > AvgRange + 2 * StdDevRange
    )
    AND (
        `All-ElectricRange` IS NOT NULL
    );