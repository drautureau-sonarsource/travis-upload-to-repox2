#download SQ
wget -c https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.3-RC4.zip --auth-no-challenge

# set project version
PROJECT_VERSION=1.$TRAVIS_BUILD_NUMBER
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=$PROJECT_VERSION

#upload SQ
mvn deploy -Pdeploy-sonarsource -B -e -V

