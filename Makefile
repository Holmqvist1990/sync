install:
	crystal build --release src/main.cr
	sudo mv main /usr/bin/sync
	@echo Installed sync OK.
