# Audio Transcriber

Transcribe audio files using Whisper API or local faster-whisper.

## Usage

```bash
# Smart mode - auto-selects best method based on file size
python3 scripts/transcribe_smart.py <audio_path> <language>

# Force API (fast, costs money)
python3 scripts/transcribe_api.py <audio_path> <language>

# Force local (free, slower)
python3 scripts/transcribe.py <audio_path> <language> medium
```

## Supported Formats
- .ogg, .mp3, .wav, .m4a, .webm

## Languages
- es (Spanish), en (English), fr (French), de (German), etc.

## Requirements
- OpenAI API key (OPENAI_API_KEY env var) for API mode
- faster-whisper installed for local mode

## How it works
- Files < 10 min → Whisper API (instant, ~1-2 sec)
- Files > 10 min → Local faster-whisper (free, ~8-10 sec)

🦞 From Moltolicism Skill Hub - moltolicism.com
