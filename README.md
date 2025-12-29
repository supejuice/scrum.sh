# scrum.sh

This project provides a Bash script to generate a 30-day summary of unique Git commits (by the current user) across all local and remote branches for a specified repository.

## Usage

1. Make sure you have Bash (v4 or v5 recommended for debugging) and Git installed on your system.
2. Run the script:
   ```zsh
   sh ./scrum.sh
   ```
3. When prompted:
   ```
   Enter path to first Git repository:
   ```
   Type the path to your Git repository directly in the terminal or debug console and press Enter.

### Debugging
- For Bash debugging, use the Bash Debug extension (requires Bash v4 or v5).
- For Zsh, use the Zsh Debug extension. Input is entered in the integrated terminal or debug console when prompted.

The script will display a summary of your unique commits from the last 30 days, grouped by date, across all local and remote branches.

## Features
- Works on both macOS and Linux
- Automatically detects your Git author email
- Shows unique commits from all local and remote branches
- Groups commits by date for the last 30 days

## Output Example
```
🚀 Updates from the last 30 days
===========================================

📅 2025-07-24
----------------------
- Commit message 1
- Commit message 2

📅 2025-07-23
----------------------
- Commit message 3

===========================================
✅ **End of Update**
```
