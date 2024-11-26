# Configuration Setup

This project provides an automated way to install and manage custom configuration files for your development environment. 
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

### Installing Configuration Files

To install the configuration files and update `.bashrc`, run the following command:

```bash
make install

