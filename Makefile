ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

run:
	env CHROME_EXECUTABLE=$(ROOT_DIR)/chrome.sh flutter run -d chrome
