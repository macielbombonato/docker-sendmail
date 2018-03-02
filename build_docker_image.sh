#!/usr/bin/env bash
CONDITION='1'

IMAGE_NAME='docker-sendmail'

if [[ ("$CONDITION" == "1") ]]; then
	VERSION="1"

	echo '################################################'
	echo '#        building latest version image         #'
	echo '################################################'
	docker image rm $(docker image ls macielbombonato/${IMAGE_NAME}:latest -q)
	docker image build --rm -t macielbombonato/${IMAGE_NAME}:latest -f 1/Dockerfile .
fi

echo 'Choosed version: ' $VERSION

echo '#######################################'
echo '#         deleting old images         #'
echo '#######################################'
docker image rm $(docker image ls macielbombonato/${IMAGE_NAME}:$VERSION -q)

echo '#################################'
echo '#        building image         #'
echo '#################################'
docker build --rm -t macielbombonato/${IMAGE_NAME}:$VERSION -f $VERSION/Dockerfile .
