#!/bin/bash -l
set -e
cd $(dirname $0)
echo | pwd

svn upgrade

SHCEME=$1
CONFIGURATION=$2
WORKSPACE_PATH=WFProject.xcworkspace #EFunShop.xcworkspace
PROFILE_NAME='WFProject'
TEAM_ID='JF549H673D'
#BundleFilePath=ReactNative/release_ios

echo ${SHCEME}
echo ${CONFIGURATION}

pod install
#
TIME_STAMP=`date "+%Y%m%d%H"`
echo $TIME_STAMP

ArchivePath=JenkinsPackage/${SHCEME}.xcarchive
PacktName=JenkinsPackage/${SHCEME}_${TIME_STAMP}

xcodebuild archive -workspace WFProject.xcworkspace -scheme ${SHCEME} -sdk iphoneos -archivePath ${ArchivePath} -allowProvisioningUpdates

xcodebuild -exportArchive -archivePath ${ArchivePath} -exportPath ${PacktName} -exportOptionsPlist ExportOptions_ADHoc.plist -allowProvisioningUpdates

fir publish ${PacktName}/${SHCEME}.ipa -T 71b353f5b2d6467e807d0d2eddb29b87
