#!/bin/bash

# Android SDK ফোল্ডার তৈরি
mkdir -p /home/vscode/android-sdk/cmdline-tools
cd /home/vscode/android-sdk/cmdline-tools

# Android Command Line Tools ডাউনলোড (Linux version)
wget https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip -O cmdline-tools.zip

# ফাইল আনজিপ করা
unzip cmdline-tools.zip
rm cmdline-tools.zip

# ফোল্ডারের নাম পরিবর্তন করে 'latest' রাখা (SDK Manager এর রুলস অনুযায়ী)
mv cmdline-tools latest

# এনভায়রনমেন্ট ভেরিয়েবল সেট করা
export ANDROID_HOME=/home/vscode/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# লাইসেন্স গ্রহণ করা এবং প্রয়োজনীয় SDK Platform ও Build Tools ইনস্টল করা (PRD অনুযায়ী SDK 34)
yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

echo "✅ Android SDK Setup Completed Successfully!"