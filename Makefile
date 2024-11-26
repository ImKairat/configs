# Define source and destination paths
CONFIG_FILES = .mycfg .vimrc
DEST_DIR = $(HOME)
BASHRC = $(HOME)/.bashrc

# ANSI color codes
COLOR_RESET = \033[0m
COLOR_HEADER = \033[1;34m  # Blue bold
COLOR_TARGET = \033[1;32m  # Green bold
COLOR_DESCRIPTION = \033[0;33m  # Yellow
COLOR_INFO = \033[0;36m  # Cyan
COLOR_SUCCESS = \033[0;32m  # Green
COLOR_ERROR = \033[0;31m  # Red

# Default target: install the configuration files
.PHONY: install
install:
	@echo ""
	@echo  "$(COLOR_INFO)Installing configuration files...$(COLOR_RESET)"
	@for file in $(CONFIG_FILES); do \
		cp -v $$file $(DEST_DIR)/; \
	done
	@echo  "$(COLOR_INFO)Updating .bashrc...$(COLOR_RESET)"
	@if ! grep -q 'source ~/.mycfg' $(BASHRC); then \
		echo "if [ -f ~/.mycfg ]; then" >> $(BASHRC); \
		echo "    source ~/.mycfg" >> $(BASHRC); \
		echo "fi" >> $(BASHRC); \
		echo  "$(COLOR_SUCCESS)Added source command for .mycfg to .bashrc$(COLOR_RESET)"; \
	else \
		echo  "$(COLOR_INFO).bashrc already contains source command for .mycfg$(COLOR_RESET)"; \
	fi
	@vim plugins.vim -c 'source %' -c 'PlugInstall' -c 'qa!'
	@echo "$(COLOR_SUCCESS)All Vim-plugins in ~/.vimrc was installed!$(COLOR_RESET)"
	@echo ""

# Target to remove the installed files
.PHONY: uninstall
uninstall:
	@echo ""
	@echo  "$(COLOR_INFO)Removing configuration files...$(COLOR_RESET)"
	@for file in $(CONFIG_FILES); do \
		rm -v $(DEST_DIR)/$$file; \
	done
	@echo  "$(COLOR_INFO)Removing .mycfg source command from .bashrc...$(COLOR_RESET)"
	@sed -i '/if \[ -f ~\/.mycfg \]; then/,+2d' $(BASHRC)
	@echo  "$(COLOR_SUCCESS)Uninstallation completed.$(COLOR_RESET)"
	@echo ""

# Target to clean up temporary files or backups (optional)
.PHONY: clean
clean:
	@echo ""
	@echo  "$(COLOR_INFO)Cleaning up...$(COLOR_RESET)"
	@echo ""
	# Add cleanup steps here if needed

# Target to display help
.PHONY: help
help:
	@echo ""
	@echo  "$(COLOR_HEADER)Available targets:$(COLOR_RESET)"
	@echo  "$(COLOR_TARGET)  install   $(COLOR_DESCRIPTION)Install the configuration files and update .bashrc$(COLOR_RESET)"
	@echo  "$(COLOR_TARGET)  uninstall $(COLOR_DESCRIPTION)Remove the installed configuration files and update .bashrc$(COLOR_RESET)"
	@echo  "$(COLOR_TARGET)  clean     $(COLOR_DESCRIPTION)Clean up temporary files or backups$(COLOR_RESET)"
	@echo ""

