#!/bin/bash

# make output dir
mkdir bin/DebianPackage/
chmod 777 bin/DebianPackage/

# set environment vars
export UPSTREAMNAME="Bananpiren"
#export PKGNAME="Bananpiren.
export SHORTDESCRIPTION="Live the dream as a banana boat captain!"
export VERSION="0.33"
export MAINTAINER="Sebastian Nilsson <me@sebastiannilsson.com>"
export HOMEPAGE="http://crocoraff.com"
export YEAR="2017"
export COPYRIGHT="Crocoraff"

# prepare
./u2deb prepare bin/Linux Universal --output=bin/DebianPackage
