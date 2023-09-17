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
    

-- Fuel Economy Analysis --

-- Calculate and compare the average conventional fuel economy combined for different vehicle manufacturers.
SELECT
    Manufacturer,   
    AVG(`ConventionalFuelEconomyCombined`) AS AvgFuelEconomy  -- Calculate the average fuel economy
FROM
    afvus                          
GROUP BY
    Manufacturer  -- Group the results by 'Manufacturer'
ORDER BY
    AvgFuelEconomy DESC;  -- Sort the results by average fuel economy in descending order


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
