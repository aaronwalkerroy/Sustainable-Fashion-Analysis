SELECT * FROM fashion_strategy.brand_data;

SELECT
    Brand,
    Avg_Item_Price_USD,
    Avg_Worker_Wage_USD
FROM
    fashion_strategy.brand_data
WHERE
    Avg_Worker_Wage_USD IS NOT NULL;

SET SQL_SAFE_UPDATES = 0;
UPDATE fashion_strategy.brand_data SET Brand = 'H&M' WHERE Brand = 'H and M';

ALTER TABLE fashion_strategy.brand_data ADD COLUMN Waste_per_Item FLOAT;
ALTER TABLE fashion_strategy.brand_data ADD COLUMN Carbon_per_Item FLOAT;
ALTER TABLE fashion_strategy.brand_data ADD COLUMN Water_Usage_per_Item FLOAT;

UPDATE fashion_strategy.brand_data SET Waste_per_Item = Landfill_Waste_Tonnes / (Monthly_Production_Tonnes * 1000);
UPDATE fashion_strategy.brand_data SET Carbon_per_Item = Carbon_Emissions_tCO2e / (Monthly_Production_Tonnes * 1000);
UPDATE fashion_strategy.brand_data SET Water_Usage_per_Item = Water_Usage_Million_Litres / (Monthly_Production_Tonnes * 1000);

SELECT * FROM fashion_strategy.brand_data;