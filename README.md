# Log Archiver CLI Tool

**Log Archiver CLI Tool** is a straightforward command-line utility designed to simplify log file management. It compresses logs from a specified directory into a timestamped `tar.gz` archive, stores it in a dedicated directory, and logs each operation for easy tracking. This tool is ideal for automating log backups, ensuring your system remains organized while preserving important log data.

## Features

- **Archive Creation:** Compresses log files from a specified directory into a `.tar.gz` archive.
- **Timestamped Naming:** Automatically generates a unique, timestamped name for each archive.
- **Dedicated Storage:** Saves archives in a designated directory (`~/log_archives` by default).
- **Operation Logging:** Records each archiving operation with timestamps in `archive_log.txt`.
- **Efficiency:** Designed to be simple, lightweight, and easy to integrate into automated workflows.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/chintanboghara/Log-Archive-Tool-roadmap.sh.git
   cd Log-Archive-Tool-roadmap.sh
   ```

2. Make the script executable:
   ```bash
   chmod +x log-archive.sh
   ```

## Usage

Execute the script by providing the path to the log directory you wish to archive:

```bash
./log-archive.sh <log-directory>
```

### Example:

To archive logs located in `/var/log`, use the following command (sudo may be required for restricted directories):
```bash
sudo ./log-archive.sh /var/log
```

**Note:** Ensure you have the necessary permissions to access the log directory and write to the archive directory.

## Output

- **Archive File:** The compressed log archive is saved in `~/log_archives/` with a name format:
  ```
  logs_archive_YYYYMMDD_HHMMSS.tar.gz
  ```
  where `YYYYMMDD_HHMMSS` is the timestamp of the archiving operation.

- **Operation Log:** Each archiving action is recorded in `~/log_archives/archive_log.txt` with the following format:
  ```
  [YYYY-MM-DD HH:MM:SS] Archived logs from <log-directory> to ~/log_archives/logs_archive_YYYYMMDD_HHMMSS.tar.gz
  ```
  This log helps track when and which directories were archived.

![Output](https://github.com/user-attachments/assets/3fad338c-7220-416d-99d6-ae9a6b180e21)

## Troubleshooting

- **Missing `tar` Command:**
  - Verify if `tar` is installed:
    ```bash
    which tar
    ```
  - If not found, install it using your distribution's package manager:
    - **Debian/Ubuntu:**
      ```bash
      sudo apt update
      sudo apt install tar
      ```
    - **CentOS/Red Hat:**
      ```bash
      sudo yum install tar
      ```

- **Permission Denied:**
  - Ensure you have read access to the log directory and write access to the archive directory.
  - Use `sudo` if necessary, especially for system directories like `/var/log`.

- **Archive Directory Not Found:**
  - The script automatically creates `~/log_archives` if it doesn’t exist. If issues persist, check for permission problems in your home directory.

- **Log File Not Updating:**
  - Confirm that the script has write permissions to `~/log_archives/archive_log.txt`.
  - Check if the archive directory path is correctly set in the script.
