#!/usr/bin/env bash
flatpak-spawn --host flatpak run org.chromium.Chromium -enable-features=UseOzonePlatform -ozone-platform=wayland "$@"
