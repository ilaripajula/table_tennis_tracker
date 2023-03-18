#!/bin/bash
# Run script with command: bash get_data.sh
# Link to data: https://lab.osai.ai

mkdir test
cd test

for j in 2 3
do
    # Create seperate directory
    mkdir game_$j
    cd game_$j

    #Labels
    printf "Get labels for test game $j \n"
    wget https://lab.osai.ai/datasets/openttgames/data/test_$j.zip
    unzip test_$j.zip
    rm test_$j.zip
    
    # Download video and convert frames
    printf "Get video for test game $j \n"
    wget https://lab.osai.ai/datasets/openttgames/data/test_$j.mp4
    mkdir frames
    ffmpeg -i test_$j.mp4 frames/%d.jpeg
    rm test_$j.mp4
    
    cd ..

cd ..
printf("------------Done!!!----------")