# Configuration Setup

This project offers an automated solution for installing and managing custom configuration files for the Linux terminal and the Vim text editor.  
It includes configuration for `.mycfg` and `.vimrc`, and it automates the setup of these files in your home directory.  
Additionally, the setup includes modifying your `.bashrc` to source the `.mycfg` file if it exists.

## Features

- **Install Configuration Files**: Automatically copies `.mycfg` and `.vimrc` to your home directory.
- **Update `.bashrc`**: Ensures that the `.mycfg` file is sourced in `.bashrc` if it exists.
- **Uninstall Configuration Files**: Removes the configuration files from your home directory and cleans up the `.bashrc` changes.
- **Colorized Output**: All terminal output is colorized for better readability and visibility.

## Requirements

- Make sure you have a working `bash` shell.
- The `cp` and `sed` commands must be available on your system.

## Usage

### Cloning the Repository and Navigating to the Directory

1. Clone the repository using the `git` command:

    ```bash
    git clone https://github.com/ImKairat/configs.git
    ```

2. Change into the project directory:

    ```bash
    cd configs
    ```

### Installing Configuration Files

To install the configuration files and update `.bashrc`, run the following command:

```bash
make install
