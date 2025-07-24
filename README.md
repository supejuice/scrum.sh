# scrum.sh

This project provides a Bash script to generate a daily summary of Git commits for a specified repository and author.

## Usage

1. Make sure you have Bash (v4 or v5 recommended for debugging) and Git installed on your system.
2. Run the script:
   ```bash
   bash scrum.sh
   ```
   Or use Zsh:
   ```zsh
   zsh scrum.sh
   ```
3. When prompted:
   ```
   Enter path to first Git repository:
   ```
   Type the path to your Git repository directly in the terminal or debug console and press Enter.

### Debugging
- For Bash debugging, use the Bash Debug extension (requires Bash v4 or v5).
- For Zsh, use the Zsh Debug extension. Input is entered in the integrated terminal or debug console when prompted.

The script will display a summary of your commits for the current day (or previous day if run before noon), with weekend adjustments to show Friday's commits.

## Features
- Works on both macOS and Linux
- Automatically detects your Git author email
- Handles weekend logic to show Friday's summary

## Output Example
```
🚀 What we did on 2025-07-24
===========================================
Start Timestamp: 2025-07-24T00:00:00
End Timestamp: 2025-07-24T23:59:59
- Commit message 1
- Commit message 2
===========================================
✅ **End of Update**
```
