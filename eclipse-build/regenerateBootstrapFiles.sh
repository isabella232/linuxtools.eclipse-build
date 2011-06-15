#!/bin/sh
set -e 

usage='usage: $0 <launcherDir>'

launcherDir=$1

if [ "x$launcherDir"x = 'xx' ]; then
   echo >&2 "$usage"
   exit 1
fi

java -jar \
$launcherDir/org.eclipse.equinox.launcher_*.jar \
-debug \
-consolelog \
-data /home/zx/eclipses/eclipse \
-application org.eclipse.ant.core.antRunner \
-f pdebuild.xml generateScripts \
-DskipBase=true \
-DsdkSource=build/eclipse-3.7.0-I20110613-1736-src \
2>&1 | tee ./generatePdeBuildScripts.log
