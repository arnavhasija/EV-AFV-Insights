-- checking the number of records in the table 
select *
from afvus;


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
    

