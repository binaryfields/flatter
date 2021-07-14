#!/usr/bin/env bash
flatpak-spawn --host flatpak run com.google.Chrome -enable-features=UseOzonePlatform -ozone-platform=wayland "$@"
