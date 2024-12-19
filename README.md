# Log Archiver CLI Tool

A simple command-line tool to archive log files. This tool compresses logs from a specified directory into a `tar.gz` file with a timestamped name, stores it in a designated archive directory, and maintains a log of operations. The tool is useful for automating log management and keeping the system clean while maintaining backups.

## Features

- Archives logs from a specified directory into a `.tar.gz` file.
- Automatically appends a timestamp to the archive name.
- Stores archives in a dedicated directory (`~/log_archives` by default).
- Logs each operation (with timestamps) to `archive_log.txt`.
- Simple and lightweight.


Make the script executable:
   ```bash
   chmod +x log-archive.sh
   ```


## Usage

Run the script with the log directory as an argument:

```bash
./log-archive.sh <log-directory>
```

### Example:

To archive logs in `/var/log`, run:
```bash
sudo ./log-archive.sh /var/log
```


## Output

1. The archived log file will be stored in the `~/log_archives/` directory with a timestamped name:
   ```
   logs_archive_YYYYMMDD_HHMMSS.tar.gz
   ```

2. The script logs each operation in `~/log_archives/archive_log.txt`:
   ```
   [YYYY-MM-DD HH:MM:SS] Archived logs from <log-directory> to ~/log_archives/logs_archive_YYYYMMDD_HHMMSS.tar.gz
   ```
   

## Example Output
![Output](https://github.com/user-attachments/assets/3fad338c-7220-416d-99d6-ae9a6b180e21)


## Troubleshooting

**Missing `tar` Command:**
   - Ensure `tar` is installed on the system:
     ```bash
     which tar
     ```
   - If missing, install it:
     - Debian/Ubuntu:
       ```bash
       sudo apt install tar
       ```
     - CentOS/Red Hat:
       ```bash
       sudo yum install tar
       ```
