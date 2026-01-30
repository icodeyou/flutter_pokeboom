#!/bin/bash

if [ -n "$1" ]; then
  originalName="$1"
else
  echo "Enter the name of the project (ex: Kitten Land): "
  read originalName
fi

if [[ $originalName == "" ]] || [[ ! "$originalName" =~ ^[a-zA-Z[:space:]]+$ ]]; then
    echo "The name of your project is invalid. Please start again."
    exit
fi
nameSnakeCase=$(echo "$originalName" | awk '{gsub(/[[:space:]]+/, "_"); print tolower($0)}')
nameLowercase=$(echo "$originalName" | awk '{print tolower($0)}' | tr -d ' ')

mkdir "${nameSnakeCase}_builder"
cd "${nameSnakeCase}_builder"

# Get Bundle ID for project
org="com.$nameLowercase"
echo "⚠️ Your organization is by default : $org"
echo "If this is OK, press enter. Otherwise type the name of your new org :"
read newOrg
if [[ $newOrg != '' ]]; then org="$newOrg"; fi
bundleId="$org.$nameLowercase"
echo ""
echo "✨ ✨ ✨ ✨ ✨"
echo "The name of the Flutter app will be : $nameSnakeCase"
echo "The Bundle ID of the project will be : $bundleId"
echo "Are you okay with that ? Press enter to confirm, type NO otherwise :"
read bundleIdAnswer
if [[ $bundleIdAnswer == 'NO' ]]; then
  echo "The last part of your bundle ID has to be your app name (so that we can run 'flutter create .' in the future)"
  echo "Please start again."
  exit
fi

echo ""

# Mason step
mason init
mason add pokeboom --projectName "$originalName"
mkdir "$nameSnakeCase"
mason make pokeboom -o "$nameSnakeCase"

# Flutter create step
echo "🔥 Creating project '$nameSnakeCase' with bundle ID '$bundleId'"
cd "$nameSnakeCase"
flutter create --platforms=ios,android --org $org .

# Add post generation actions
dart run slang