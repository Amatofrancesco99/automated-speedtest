#!/bin/bash

# Function to run the speed test and append data to the CSV file
run_speed_test() {
    datetime=$(date +"%Y-%m-%d %H:%M:%S")
    output=$(speedtest-cli --secure --simple --no-upload)
    ping=$(echo "$output" | awk '/Ping:/ {print $2}')
    download=$(echo "$output" | awk '/Download:/ {print $2}')
    output=$(speedtest-cli --secure --simple --no-download --single)
    upload=$(echo "$output" | awk '/Upload:/ {print $2}')
    # If speedtest didn't get issues store the data, otherwise execute it again
    if [ ! -z "$ping" ] && [ ! -z "$download" ] && [ ! -z "$upload" ]; then
        echo "$datetime, $ping, $download, $upload" >> history.csv
    else
        run_speed_test
    fi
}

while true; do
    current_time=$(date +"%H:%M")

    case $current_time in
        05:00)
            # Execute the store_data_gdrive.py script
            python3 store_data_gdrive.py
            sleep 12  # Sleep for 12 seconds (retry, to solve the case an error happens)
            ;;
        02:15|09:30|12:45|16:15|18:30|21:15|23:00)
            run_speed_test
            sleep 3600  # Sleep for 1 hour
            ;;
        *)
            sleep 30  # Sleep for 30 seconds and check again
            ;;
    esac
done