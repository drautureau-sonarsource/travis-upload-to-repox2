#download SQ
wget -c https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.3-RC4.zip --auth-no-challenge

# Change SHA1
rm sonarqube-6.3-RC4 sonarqube-6.3-RC4-new.zip -Rf
unzip sonarqube-6.3-RC4.zip
zip -r sonarqube-6.3-RC4-new.zip sonarqube-6.3-RC4/
sha1sum sonarqube-6.3-RC4-new.zip

# set project version
PROJECT_VERSION=1.$TRAVIS_BUILD_NUMBER
mvn versions:set -DgenerateBackupPoms=false -DnewVersion=$PROJECT_VERSION

#upload SQ
mvn deploy -Pdeploy-sonarsource -B -e -V

