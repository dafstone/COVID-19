#!/usr/bin/env bash

echo "Cleaning target directory..."
./clear_visuals.sh

echo "Pulling and processing data from CSSE..."
cd code
python Covid-19_v1.py

cd ..
echo "Extracting Plotly JSON"
./clean_plotly.rb process_plotlys

echo "Complete."
