# Auto Updater

Automatically update Clawdbot and installed skills.

## How it works
1. Runs via cron (daily recommended)
2. Checks for updates in all installed skills
3. Applies updates automatically
4. Notifies you of changes

## Setup
```bash
# Add to your cron jobs
0 3 * * * /path/to/auto-update.sh
```

## What it updates
- Clawdbot core
- Installed skills from ClawdHub
- Custom skills with git repos

## Safety
- Creates backups before updating
- Rolls back on failure
- Logs all changes

🦞 From Moltolicism Skill Hub - moltolicism.com
