Smart City Traffic Analysis
Project Overview
This project analyses the Metro Interstate Traffic Volume dataset to explore relationships between traffic volume, weather conditions, time, and congestion. The project includes data cleaning, feature engineering, data visualisation, and a small command-line application that allows users to query the processed dataset.

Project Structure
smart-city-traffic-project/
│
├── Metro_Interstate_Traffic_Volume.csv
│       Raw traffic dataset
│
├── Metro_Interstate_Traffic_Volume_Cleaned.csv
│       Cleaned  dataset
│
├── Metro_Interstate_Traffic_Volume_Cleaned_FeatureEngineering.csv
│       Feature-engineered dataset
│
├── part2_pipeline.py
│       data cleaning code
│
├── pipeline.log
│       Log file containing the part2_pipeline logging output
│
├── part2_feature_engineering.py
│       feature engineering code
│
├── feature_engineering.log
│       Log file containing the part2_feature-engineering logging output│
|
├── part2_visualisations.py
│       matplotlib visualisations code
│
├── visualisation.log
│       Log file containing the part2_visualisation logging output
├── part2_application.py
│       interactive application code
│
├── application.log
│       Log file containing the part2_application logging output
│
└── README.md
        Project documentation
The filenames may differ depending on the final project submission.

Requirements
The project requires Python 3 and the following Python libraries:

pandas
matplotlib
numpy
logging

How to Run the Project
1. Prepare the dataset
Place the raw CSV file in the project folder

2. Run the Python program
Open a terminal or command prompt in the project folder and run:

part2_pipeline.py
If using Jupyter Notebook, open the notebook and run the cells from the beginning in sequence.

3. Run the command-line application
After the processed dataset has been created and loaded, the command-line application displays a menu:

4.Repeat above for part2_feature_engineering

5. Repeat 1-3 for part2_visualisations

6. Repeat 1-3 for part2_application

========================================
      part2_application  SMART CITY TRAFFIC ANALYSIS
========================================
A. Query traffic by date
B. Query congestion by day and hour
C. Query traffic by weather and day type
D. Display database
Q. Quit application
========================================

SELECT CHOICE:
The available queries allow the user to investigate:

Traffic volume and weather conditions for a selected date.
The most common congestion category for a selected weekday/weekend and hour.
Average traffic volume and the most common congestion category for a selected weather condition and weekday/weekend.
The processed dataset.
Data Processing
The data-processing pipeline performs several cleaning activities before feature engineering:

Standardises categorical values.
Parses and validates the date_time field.
Removes duplicate rows.
Removes invalid temperature readings where temperature equals 0.
Removes rainfall values above 9000 as invalid readings.
Handles invalid or impossible values identified during data cleaning.
The cleaned dataset is then exported as:

processed_traffic_data.csv
Feature Engineering
The project creates additional features to support analysis, including:

Time features
hour
day_of_week
is_weekend
Cyclical time encoding
Weather features
Encoded weather variables
weather_is_clear
weather_is_not_clear
Scaled features
Normalised temperature
Normalised traffic volume
Congestion category
A data-driven congestion category is created from traffic volume.

The traffic-volume distribution is used to calculate percentile-based thresholds. These thresholds divide traffic volume into congestion categories. The exact threshold values are calculated from the dataset during feature engineering rather than being manually selected.

The threshold values are recorded in the log at the DEBUG level.

Logging Configuration
The project uses a dedicated logger for each script. 
The application does not use the root logger.

The logger uses a formatter containing:

Timestamp - Log Level - Logger Name - Message
For example:

2026-10-08 20:15:01 - INFO - pipeline - Command invoked: A
Logging Levels
DEBUG
Used for detailed information that is useful for understanding the processing performed by the application but is not necessarily part of the final output.

Examples include:

Congestion percentile thresholds.
Intermediate values calculated during feature engineering.
Example:

DEBUG - traffic_pipeline - Congestion thresholds calculated: 33rd percentile = 2875.00, 67th percentile = 5120.00.
INFO
Used to record normal successful operations and important application events.

Examples include:

Successful loading of the dataset.
Dataset shape before and after feature engineering.
Completion of data cleaning.
Commands invoked by the user.
Successful figure creation and saving.
Successful query completion.
Example:

INFO - pipeline - Raw CSV file loaded successfully: 48204 rows and 9 columns.
WARNING
Used when data has to be modified, removed, or otherwise handled because of a data-quality issue.

Examples include:

Duplicate rows being removed.
Invalid temperature readings being removed.
Invalid rainfall readings being removed.
Invalid date/time values being removed.
Categorical values being standardised.
Warnings include both the number of affected rows and the reason for the change.

Example:

WARNING - pipeline - Dropped 25 rows. Reason: temperature value of 0 was identified as an invalid/impossible reading.
ERROR
Used when an operation cannot be completed because of an error or invalid user input.

Examples include:

Invalid menu selections.
Malformed dates.
Invalid hours.
Invalid weather conditions.
Missing or unreadable files.
The application records a clear error message rather than exposing a raw Python traceback to the user.

Example:

ERROR - traffic_pipeline - Invalid input for query_traffic. Malformed date supplied: 'hello'. Expected format: YYYY-MM-DD.
Command Logging
The application logs each command invoked by the user at the INFO level.

Where applicable, the user's arguments are also recorded.

For example:

INFO - traffic_pipeline - Command invoked: query_traffic | Argument: date=2012-10-02
Invalid inputs are recorded at the ERROR level.

Output Files
The project produces the following outputs:

processed_traffic_data.csv — cleaned and feature-engineered dataset.
pipeline.log — logging record of the data pipeline and command-line application.
Visualisation files such as traffic distribution and rainfall/traffic relationship charts.
The log file provides a confirmation trail showing that expected processing steps and output files were successfully completed.