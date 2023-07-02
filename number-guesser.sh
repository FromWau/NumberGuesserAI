#!/bin/bash

VOSK_MODEL_PATH="$HOME/.local/share/vosk-models/vosk-model-en-us-0.22/"
NUMBER=$(( RANDOM % 10 + 1 ))

talk() {
    notify-send "AI" "thinking..."
    notify-send "AI" "User input: $1"
    bark "$1"
}

listen() {
    notify-send "AI" "I am listening for 3s..."
    timeout 3s pw-record --target 121 ~/.cache/audio.wav # WIP get record source
    notify-send "AI" "stop talking"

    echo "$(vosk-transcriber -m $VOSK_MODEL_PATH -i ~/.cache/audio.wav)"
}

while true; do
    talk "Please guess a number between 1 and 10."

    user_number=$(listen)

    if [[ "$user_number" -eq "$NUMBER" ]]; then
        echo "Congratulations! $user_number is the correct number."
        break
    else
        echo "Incorrect number you guessed $user_number. Try again."
    fi
done


