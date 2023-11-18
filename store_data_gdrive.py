# Import necessary libraries
import gspread
from oauth2client.service_account import ServiceAccountCredentials
from datetime import datetime

# Define the scope of access for Google Sheets API
scope = ["https://spreadsheets.google.com/feeds", 'https://www.googleapis.com/auth/spreadsheets',
         "https://www.googleapis.com/auth/drive.file", "https://www.googleapis.com/auth/drive"]

# Load Google Sheets API credentials from a JSON file
credentials = ServiceAccountCredentials.from_json_keyfile_name('credentials.json', scope)
# Authorize the client using the credentials
client = gspread.authorize(credentials)

# Define the path to the CSV file to be uploaded
csv_path='history.csv'
# Open the specified Google Sheets spreadsheet
spreadsheet = client.open('history.csv')

# Get the current timestamp for logging
timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

try:
    # Try to open and read the CSV file
    with open(csv_path, 'r') as file_obj:
        content = file_obj.read()
        # Import the CSV data into the Google Sheets spreadsheet
        client.import_csv(spreadsheet.id, data=content)
except Exception as e:
    # Print error message if there is an exception during the upload
    print("\033[1m{}\033[0m: \033[91mError uploading {} file to GDrive:\033[0m {}".format(timestamp, csv_path, str(e)))