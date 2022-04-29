#!/bin/sh
flutter clean
[[ -d ./debug ]] && echo "Directory already exists" || mkdir ./debug
flutter build apk --release --obfuscate --split-debug-info=./debug
[[ -d ./build_apks ]] && echo "Directory already exists" || mkdir ./build_apks
mv build/app/outputs/apk/release/app-release.apk ./build_apks/ama-`date +%d-%m-%Y-%H-%M-%S`.apk