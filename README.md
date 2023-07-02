# NumberGuesserAI
Play the "Guess the correct number" -game with an "AI" (by communitacting with vosk and bark)

## Installation
### Install vosk (speech-to-text) 
`yay -S python-vosk-bin`
### Download the model used for vosk
1. Download the [model](https://alphacephei.com/vosk/models/vosk-model-en-us-0.22.zip) used in the code. You can choose another model from https://alphacephei.com/vosk/models.
2. Save the model to `~/.local/share/vosk-models/` or change the `VOSK_MODEL_PATH` in `number-guesser.sh`.
3. Dont forgett to unzip.

### Install bark (text-to-audio) (yes text to audio and not speech)
`pip install git+https://github.com/suno-ai/bark.git --break-system-packages`

DO NOT install with pip install bark. This is a different package!!!

Run bark to check for the missing dependencies and install with `yay -S python-<pkg-name>`

Warning: First time running bark will download muliple 3G+ big files.
## Play audio
The bark script uses `mpv` to play the audio.
`sudo pacman -S mpv` if not installed
