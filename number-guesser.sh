#!/bin/bash

numbers=("one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten")
index=$(( RANDOM % ${#numbers[@]} ))
NUMBER="${numbers[$index]}"

VOSK_MODEL_PATH="$HOME/.local/share/vosk-models/vosk-model-en-us-0.22/"

talk() {
    notify-send "AI" "$1"
    bark "$1" >/dev/null
}

listen() {
    talk "I am listening for 3 seconds."
    notify-send "AI" "listening..."
    timeout 3s pw-record --target 121 ~/.cache/audio.wav # WIP get record source
    talk "Stop talking. I am thinking... "

    vosk-transcriber -m "$VOSK_MODEL_PATH" -i ~/.cache/audio.wav 2>/dev/null
}

isFirstRound=true

while true; do
    if [ "$isFirstRound" = true ]; then
        talk "Please guess a number between 1 and 10."
    else
        talk "[sighs] Incorrect number, you guessed: $user_number. ... Please try again to guess the correct number between 1 and 10."
    fi

    user_number="$(listen)"

    if [[ "$user_number" == "$NUMBER" ]]; then
        talk "[laughs] ♪ Congratulations! $user_number is the correct number."
        break
    else
        isFirstRound=false
    fi
done


