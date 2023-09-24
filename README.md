# EV-AFV-Insights
In this project, I dive into the analysis of Electric and Alternative Fuel Vehicles using SQL queries and dynamic Tableau visualizations to uncover specifications, performance, and trends.

<h3>Background</h3>
The automotive industry is undergoing a significant transformation with an increasing focus on sustainability and reducing carbon emissions. Electric Vehicles (EVs) and Alternative Fuel Vehicles (AFVs) have gained significant attention as potential solutions to address these challenges. This project aims to analyze and visualize data on EVs and AFVs available in the market to gain insights into their specifications, performance, and trends. By leveraging SQL queries and Tableau visualizations, I will explore various aspects of these vehicles to uncover patterns and answer key business questions.


<p align="center">
  <br>
  <img src="/images/img2.jpg">
</p>


<h3>Motivation</h3>
The shift towards electric and alternative fuel vehicles has the potential to revolutionize the transportation sector, impacting manufacturers, consumers, and policymakers alike. According to recent predictions from BIS Research, the global market for electric vehicle batteries is poised for remarkable expansion over eight years as shown in the figure below. In 2016, its value stood at $14.99 billion, and the forecast indicates a substantial leap to $93.94 billion by 2026, reflecting a robust Compound Annual Growth Rate (CAGR) of 20.1 percent. The primary drivers behind this growth are attributed to heightened collaboration among key component manufacturers and a growing number of Original Equipment Manufacturers (OEMs). Furthermore, the decreasing cost of batteries and the enhancement of charging infrastructure are anticipated to be pivotal factors propelling the electric vehicle battery market's expansion.

![](/images/img1.jpg)

This project is motivated by the need to understand the current landscape of EVs and AFVs in the market, identify factors influencing their adoption, and provide valuable insights for consumers, manufacturers, and policymakers. By analyzing this dataset, I aim to contribute to informed decision-making and foster a deeper understanding of the sustainable transportation options available.

<h3>Dataset</h3>

The dataset I have chosen for this project presents a comprehensive collection of data pertaining to Electric Vehicles (EVs) and Alternative Fuel Vehicles (AFVs) available in the United States. It encompasses vehicles from various manufacturers, model years, and categories. Each entry in the dataset offers insights into the specifications, performance metrics, and environmental impact of these vehicles. With a total of 18 columns, including a class column, this dataset equips us to explore and analyze the landscape of eco-friendly transportation in the US.

These features, described in detail below, play a pivotal role in unraveling valuable information about the state of Electric and Alternative Fuel Vehicles in the US market:

<b>Category</b>: The classification of vehicles into groups such as sedans, SUVs, trucks, etc., based on their body style and usage.

<b>Model</b>: The specific name or identifier of the vehicle model, distinguishing it from others.

<b>Model Year</b>: The year in which the vehicle model was manufactured and introduced to the market.

<b>Manufacturer</b>: The company responsible for producing the vehicle.

<b>Fuel</b>: Indicates the type of fuel used by the vehicle, such as electricity, hybrid, plug-in hybrid, or other alternative fuels.

<b>All-Electric Range</b>: The distance a fully charged electric vehicle can travel solely on electric power before requiring recharging.

<b>PHEV Total Range</b>: For Plug-in Hybrid Electric Vehicles (PHEVs), this is the combined range when utilizing both electric power and conventional fuel.

<b>Alternative Fuel Economy City, Highway, Combined</b>: The estimated fuel efficiency of the vehicle when using alternative fuels (excluding gasoline/diesel) in city, highway, and combined driving conditions.

<b>Conventional Fuel Economy City, Highway, Combined</b>: Similar to alternative fuel economy, but for vehicles using conventional gasoline or diesel.

<b>Transmission Type</b>: The mechanism that transfers power from the engine to the wheels, categorized by automatic, manual, CVT (continuously variable transmission), etc.

<b>Transmission Make</b>: The manufacturer or brand of the transmission used in the vehicle.

<b>Engine Type</b>: The kind of engine the vehicle uses, such as internal combustion, electric motor, or hybrid system.

<b>Engine Size</b>: The volume of the engine's cylinders, often measured in liters or cubic inches, indicating its capacity.

<b>Engine Cylinder Count</b>: The total number of cylinders in the vehicle's engine.

<b>Max. Number of Passengers</b>: The maximum seating capacity of the vehicle, specifying the number of passengers it can accommodate.

<b>Heavy-Duty Power System</b>: Denotes whether the vehicle is equipped with a heavy-duty power system, which is important for larger vehicles like trucks or buses.

<b>Notes</b>: Additional comments or details about the vehicle that might not fit into the other categories.

<b>Drivetrain</b>: The system responsible for transmitting power to the wheels, specifying if the vehicle is front-wheel drive, rear-wheel drive, all-wheel drive, etc.


<h3>Project Plan</h3>

<b>Data Exploration and Cleaning:</b>

Objective: Prepare the dataset for analysis by importing it into an SQL database, understanding its structure, and cleaning it to address any data quality issues.

Actions:
   -	Import the dataset into an SQL database, ensuring compatibility
   -	Perform an initial data exploration to comprehend the dataset's structure, features, and data types
   -	Execute data cleaning processes to handle missing values, duplicates, and inconsistencies, ensuring data integrity

<b>Defining Business Questions:</b>

Objective: Formulate relevant business questions to guide the analysis and provide valuable insights into the Electric and Alternative Fuel Vehicles (EV & AFV) market.

Actions: Utilize knowledge of the dataset's columns to create a set of insightful questions, including but not limited to:
- Distribution of EVs and AFVs by manufacturer and model year
- Variation in all-electric range by manufacturer and model year
- Correlation between alternative and conventional fuel economy
- Impact of transmission types on fuel economy
- Market share of heavy-duty AFVs
- Trends in engine types and sizes for EVs and AFVs

<b>SQL Queries and Data Analysis:</b>

Objective: Extract and analyze data using SQL queries to answer the defined business questions, enabling data-driven insights.

Actions:
- Craft SQL queries tailored to extract the necessary information from the dataset
- Utilize aggregation and data manipulation techniques to calculate average fuel economy, identify top manufacturers and models, and compare fuel economy between AFVs and conventional vehicles

<b>Data Visualization with Tableau:</b>

Objective: Visualize key findings and insights by connecting the SQL database to Tableau and creating interactive visualizations.

Actions:
- Establish a connection between the SQL database and Tableau for seamless data integration
- Design and develop interactive visualizations that effectively represent the project's discoveries
- Create comprehensive dashboards to provide a user-friendly overview of the EV and AFV market

<b>Interpretation and Insights:</b>

Objective: Analyze visualizations to extract meaningful insights from the data, and draw conclusions that address the initial business questions.

Actions:
- Thoroughly examine the visualizations to identify patterns, trends, and outliers
- Formulate clear and concise insights based on the data analysis
- Summarize key findings in a manner that directly addresses the project's initial business questions

<h3>Key Findings and Insights</h3>

In my analysis of the dataset, I uncovered intriguing insights regarding the distribution of electric and alternative fuel vehicles (AFVs) across manufacturers and fuel types in the United States as shown in the chart below.

![](/images/img5.jpg)

Ford stands out as the top manufacturer in the dataset, offering 107 Hybrid Electric vehicles, closely followed by Audi with 65 Hybrid Electric vehicles, and Mercedes-Benz with 58 Hybrid Electric vehicles.

Hybrid Electric vehicles emerged as the dominant choice among manufacturers, indicating their popularity in the U.S. market. Notable manufacturers like BMW, Chevrolet, Porsche, and Tesla also contribute to the dataset with Plug-in Hybrid Electric and Electric vehicles. Additionally, GMC is among the manufacturers offering Biodiesel (B20) vehicles, showcasing the diversity of fuel options.

Among the manufacturers, Land Rover offers 26 Hybrid Electric vehicles, while GMC specializes in Biodiesel with 30 vehicles. Chevrolet boasts a presence in the Electric vehicle category with 38 offerings, while Tesla follows closely with 24 Electric vehicles. 

The dataset reveals a wide range of manufacturers, including both well-established automakers like Ford and Audi. It underscores the growth of the electric vehicle market, with Chevrolet and Tesla leading the way in fully electric options. Furthermore, manufacturers cater to a diverse range of consumer preferences, offering vehicles powered by propane, CNG, LNG, and biodiesel. This analysis provides valuable insights into the diversity of electric and AFVs available in the U.S. market, reflecting the collective efforts of automakers in advancing sustainable transportation options.
