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
		@bash ~/.bashrc \
		echo  "$(COLOR_SUCCESS)Added source command for .mycfg to .bashrc$(COLOR_RESET)"; \
	else \
		echo  "$(COLOR_INFO).bashrc already contains source command for .mycfg$(COLOR_RESET)"; \
	fi
	
	@vim plugins.vim -c 'source %' -c 'PlugInstall' -c 'qa!'
	@echo "$(COLOR_SUCCESS)All Vim-plugins in ~/.vimrc was installed!$(COLOR_RESET)"
	
	@cp zed/settings.json ~/.config/zed
	@echo "$(COLOR_SUCCESS)The Zed editor has been set up successfully!$(COLOR_RESET)"
	
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

show:
	@echo ""
	@echo "$(COLOR_INFO)Available commands:$(COLOR_RESET)"
	@echo ""
	@echo "\033[1;33mTerminal Commands:$(COLOR_RESET)"
	@printf "\033[1;32mc:\033[0m %-40s | \033[1;32mb:\033[0m %-30s\n" "Clear the terminal" "Go back to the previous directory"
	@printf "\033[1;32mx:\033[0m %-40s | \033[1;32mq:\033[0m %-30s\n" "Go up one directory" "Exit the terminal"
	@printf "\033[1;32mp:\033[0m %-40s |\n" "Copy current directory to clipboard"
	@echo ""
	@echo "\033[1;33mSystem Commands:$(COLOR_RESET)"
	@printf "\033[1;32mns:\033[0m %-40s | \033[1;32mbsh:\033[0m %-30s\n" "Show network statistics" "Edit bashrc with sudo"
	@printf "\033[1;32msb:\033[0m %-40s | \033[1;32mmk:\033[0m %-30s\n" "Source bashrc to apply changes" "Run make command"
	@printf "\033[1;32mrr:\033[0m %-40s | \033[1;32mcs:\033[0m %-30s\n" "Run rustrover" "Cursor command"
	@printf "\033[1;32mo:\033[0m %-40s | \033[1;32mn:\033[0m %-30s\n" "Open files with default application" "Open nano text editor"
	@printf "\033[1;32m~:\033[0m %-40s | \033[1;32mr:\033[0m %-30s\n" "Go to home directory" "Go to root directory"
	@printf "\033[1;32mm:\033[0m %-40s\n" "Open ncdu for disk usage"
	@echo ""
	@echo "\033[1;33mPackage Management Commands:$(COLOR_RESET)"
	@printf "\033[1;32msi:\033[0m %-40s | \033[1;32msr:\033[0m %-30s\n" "Install package with apt" "Remove package with apt"
	@printf "\033[1;32mss:\033[0m %-40s | \033[1;32msuu:\033[0m %-30s\n" "Search for package with apt" "Update and upgrade packages"
	@echo ""
	@echo "\033[1;33mTmux Commands:$(COLOR_RESET)"
	@printf "\033[1;32mt:\033[0m %-40s | \033[1;32mtl:\033[0m %-30s\n" "Start tmux session" "List tmux sessions"
	@printf "\033[1;32mtk:\033[0m %-40s | \033[1;32mtn:\033[0m %-30s\n" "Kill specified tmux session" "Create new tmux session"
	@echo ""
	@echo "\033[1;33mFile Management Commands:$(COLOR_RESET)"
	@printf "\033[1;32mrg:\033[0m %-40s | \033[1;32mbt:\033[0m %-30s\n" "Open ranger file manager" "Open btop for system monitoring"
	@printf "\033[1;32mnf:\033[0m %-40s | \033[1;32mipy:\033[0m %-30s\n" "Display system information" "Start IPython shell"
	@printf "\033[1;32mh:\033[0m %-40s | \033[1;32mi:\033[0m %-30s\n" "Show command history" "Show simplified man pages"
	@printf "\033[1;32md:\033[0m %-40s | \033[1;32mqq:\033[0m %-30s\n" "Go to Desktop directory" "Shutdown the system"
	@printf "\033[1;32mst:\033[0m %-40s | \033[1;32mpy:\033[0m %-30s\n" "Open Sublime Text" "Run Python"
	@printf "\033[1;32mbp:\033[0m %-40s | \033[1;32mpsp:\033[0m %-30s\n" "Run bpython" "Search processes"
	@printf "\033[1;32mhd:\033[0m %-40s | \033[1;32mnv:\033[0m %-30s\n" "Go to specific directory" "Open Neovim"
	@printf "\033[1;32mv:\033[0m %-40s | \033[1;32mvc:\033[0m %-30s\n" "Open Vim" "Edit Vim configuration"
	@echo ""
	@echo "\033[1;33mFuzzy Finding Commands:$(COLOR_RESET)"
	@printf "\033[1;32mf:\033[0m %-40s | \033[1;32mfo:\033[0m %-30s\n" "Fuzzy find and copy to clipboard" "Fuzzy find and open file"
	@printf "\033[1;32mnff:\033[0m %-40s | \033[1;32mvff:\033[0m %-30s\n" "Fuzzy find and edit with nano" "Fuzzy find and edit with Neovim"
	@printf "\033[1;32mfdc:\033[0m %-40s | \033[1;32mfd:\033[0m %-30s\n" "Fuzzy find and change directory" "Find directory and copy to clipboard"
	@printf "\033[1;32mfhd:\033[0m %-40s | \033[1;32mfhdc:\033[0m %-30s\n" "Find home directory and copy to clipboard" "Fuzzy find home directory and change"
	@printf "\033[1;32mvfd:\033[0m %-40s | \033[1;32mvfhd:\033[0m %-30s\n" "Fuzzy find directory and edit with Neovim" "Fuzzy find home directory and edit with Neovim"
	@printf "\033[1;32mpfhd:\033[0m %-40s | \033[1;32mpfd:\033[0m %-30s\n" "Fuzzy find home directory and open with Nautilus" "Fuzzy find directory and open with Nautilus"
	@echo ""
	@echo "\033[1;33mEnvironment Management Commands:$(COLOR_RESET)"
	@printf "\033[1;32mbase:\033[0m %-40s | \033[1;32mds:\033[0m %-30s\n" "Activate base environment" "Activate data science environment"
	@printf "\033[1;32mgeo:\033[0m %-40s | \033[1;32mapp:\033[0m %-30s\n" "Activate geo environment" "Activate app environment"
	@printf "\033[1;32mjn:\033[0m %-40s | \033[1;32mcondad:\033[0m %-30s\n" "Start Jupyter Notebook" "Deactivate conda environment"
	@printf "\033[1;32mpt:\033[0m %-40s | \033[1;32mpl:\033[0m %-30s\n" "Run poetry command" "List installed pip packages"
	@printf "\033[1;32mpi:\033[0m %-40s | \033[1;32mpir:\033[0m %-30s\n" "Install package with pip" "Install packages from requirements file"
	@printf "\033[1;32mpui:\033[0m %-40s\n" "Uninstall package with pip"
	@echo ""
	@echo "\033[1;33mGit Commands:$(COLOR_RESET)"
	@printf "\033[1;32mglog:\033[0m %-40s | \033[1;32mglg:\033[0m %-30s\n" "Show git log graph" "Show git log graph in one line"
	@printf "\033[1;32mgst:\033[0m %-40s | \033[1;32mgac:\033[0m %-30s\n" "Show git status" "Add and commit changes"
	@printf "\033[1;32mgbr:\033[0m %-40s | \033[1;32mgnb:\033[0m %-30s\n" "Show git branches" "Create and switch to new branch"
	@printf "\033[1;32mgch:\033[0m %-40s | \033[1;32mgds:\033[0m %-30s\n" "Switch branches" "Show difference statistics"
	@printf "\033[1;32mgd:\033[0m %-40s\n" "Show difference"
	@echo ""
	@echo "\033[1;33mDocker Commands:$(COLOR_RESET)"
	@printf "\033[1;32mdr:\033[0m %-40s\n" "Run Docker with sudo"
	@echo ""
	@echo "\033[1;33mPython Environment Commands:$(COLOR_RESET)"
	@printf "\033[1;32mcv:\033[0m %-40s | \033[1;32mav:\033[0m %-30s\n" "Create Python virtual environment" "Activate virtual environment"
	@printf "\033[1;32madv:\033[0m %-40s | \033[1;32mipython:\033[0m %-30s\n" "Activate another virtual environment" "Start IPython with environment"
	@printf "\033[1;32mcize:\033[0m %-40s\n" "Build Cython extension in place"
	@echo ""
	@echo "\033[1;33mFile Listing Commands:$(COLOR_RESET)"
	@printf "\033[1;32mll:\033[0m %-40s | \033[1;32mla:\033[0m %-30s\n" "List files in long format" "List all files including hidden"
	@printf "\033[1;32mlla:\033[0m %-40s | \033[1;32ml:\033[0m %-30s\n" "List all files in long format including hidden" "List files with classification"
	@echo ""
	@echo "\033[1;33mMiscellaneous Commands:$(COLOR_RESET)"
	@printf "\033[1;32mpsql:\033[0m %-40s | \033[1;32mupm:\033[0m %-30s\n" "Run psql as postgres user" "Update mirror list"
	@printf "\033[1;32meval:\033[0m %-40s\n" "Initialize Zoxide for directory navigation"
	@echo ""
