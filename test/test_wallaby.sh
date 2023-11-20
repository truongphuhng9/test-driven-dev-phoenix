#!/usr/bin/env bash

chromedriver_path=$(command -v chromedriver)

chrome_path="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
chromedriver_version=$("${chromedriver_path}" --version)
chrome_version=$("${chrome_path}" --version)

chromedriver_major_version=$("${chromedriver_path}" --version | cut -f 2 -d " " | cut -f 1 -d ".")
chrome_major_version=$("${chrome_path}" --version | cut -f 3 -d " " | cut -f 1 -d ".")

if [ "${chromedriver_major_version}" == "${chrome_major_version}" ]; then
  exit 0
else
  echo "Wallaby often fails with 'invalid session id' if Chromedriver and Chrome have different versions."
  echo "Chromedriver version: ${chromedriver_version} (${chromedriver_path})"
  echo "Chrome version      : ${chrome_version} (${chrome_path})"
  exit 1
fi
