<div align="center">

# **Automated Speed Testing System for <br> Real-Time Evaluation of Network Performances**

![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Google Drive](https://img.shields.io/badge/Google%20Drive-4285F4?style=for-the-badge&logo=googledrive&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=Tableau&logoColor=white)

</div>

## Overview

> The Automated Speedtest is a script designed to periodically measure and record internet connection speed metrics, including ping, download, and upload speeds. This project aims to address potential discrepancies between the promised and actual internet speeds provided by service providers. The gathered data can be leveraged for analytics and visualization through a dashboard generated with Tableau, utilizing Google Drive for data storage.

## Prerequisites

Before using the Automated Speedtest, ensure you have the following dependencies installed:

```bash
pip install speedtest-cli gspread oauth2client
```

## Usage

1. Clone the repository:
```bash 
git clone https://github.com/Amatofrancesco99/automated-speedtest.git
cd automated-speedtest
```

2. Setup credentials (later on described) and execute the speed test script:
```bash
./speed_test.sh
```
The script will continuously run speed tests at specific intervals, storing the results in a CSV file named `history.csv`. <br>
Ensure the speed test is conducted with a LAN connection or as close as possible to the Wi-Fi router for accurate results.

3. Analyze the Data
* The gathered data is automatically uploaded to Google Drive - `history.csv` file - daily at 5AM.
* To visualize the data, you can use Tableau and connect it to the Google Sheets spreadsheet: [live example](https://public.tableau.com/app/profile/giuseppe.amato/viz/SpeedtestAnalytics/Dashboard?publish=yes)

## Script Details

### Bash Script: [`speed_test.sh`](speedtest.sh)
* Periodically runs the speed test using `speedtest-cli`
* Appends the results to `history.csv` file
* Executes `store_data_gdrive.py` to store gathered data to Google Drive daily, at 5AM.

### Python Script: [`store_data_gdrive.py`](store_data_gdrive.py)
* Imports necessary libraries: `gspread`, `oauth2client`, `datetime`
* Loads Google Sheets API credentials from `credentials.json`
* Authorizes the client for accessing Google Sheets
* Defines the path to the CSV file: `history.csv`
* Opens the specified Google Sheets spreadsheet: `history.csv`
* Imports the CSV data into the Google Sheets spreadsheet
* Logs errors, if any, during the upload process

If you have issues, for example on how to obtain the credentials json file, here's a useful description: [csv-to-gsheet-python](https://medium.com/craftsmenltd/from-csv-to-google-sheet-using-python-ef097cb014f9).

## Disclaimer

The authors and contributors of the Automated Speedtest project explicitly state that they do not assume any responsibility for the distribution, execution, or consequences arising from the use of this software. Users are encouraged to review and comply with the terms and conditions of relevant service providers and adhere to local regulations regarding network testing.

By utilizing this software, users agree to do so at their own risk and acknowledge that the authors and contributors shall not be held liable for any issues, disruptions, or inaccuracies in the data collected by the Automated Speedtest project.

Please exercise caution and responsibility when using this tool.
