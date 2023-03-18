#!/bin/bash
# Run script with command: bash get_data.sh
# Link to data: https://lab.osai.ai

mkdir train
cd train

for i in 1 2 3 4 5
do
    # Create seperate directory
    mkdir game_$i
    cd game_$i
    
    # Labels
    printf "Get labels for game $i \n"
    wget https://lab.osai.ai/datasets/openttgames/data/game_$i.zip
    unzip game_$i.zip
    rm game_$i.zip

    # Download video and convert frames
    printf "Get video for game $i \n"
    wget https://lab.osai.ai/datasets/openttgames/data/game_$i.mp4
    mkdir frames
    ffmpeg -i game_$i.mp4 frames/%d.jpeg
    rm game_$i.mp4
    cd ..
done

cd ..
mkdir test
cd test

for j in 1 2 3 4 5 6 7
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
done