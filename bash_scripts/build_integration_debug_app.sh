## Build a debug version of the app from the command line using FastLane
#!/bin/bash
echo "Go to iOS project"
cd ~/Sites/..../....

echo "Reset and clean directory"
git reset --hard
git clean -d -f

echo "Checkout and pull from selected branch"
git fetch root
git checkout origin/master
git pull origin master

echo "Replace iOS Fastfile for my edited one"
rm fastlane/Fastfile 
cp -r ~/Sites/...../..../bash_scripts/Fastfile ~/Sites/...../...../fastlane/

echo "Run Cocoapods"
pp ios pods --force

echo "Build the app"
fastlane debug

echo "Go back to the Appium project"
cd ~/Sites/...../.....