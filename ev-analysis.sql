-- checking the number of records in the table 
select count(*)
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