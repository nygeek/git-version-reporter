#
# Git Version Reporter for Python
#

# 
# This tiny little Python module with attendant make machinery
# is intended to provide the sort of version ID tagging for Python
# code managed with git that the RCS $Id$ machinery offers.
#

#
# Started 2020 April 25 by Marc Donner
# Copyright (C) 2020 Marc Donner
#

LOG := ./version-log.txt
FILES := \
	Makefile \
	version_reporter.py \
       	version_reporter.py.front \
       	version_reporter.py.back

VERSION := $(shell tail -1 $(LOG) | cut -f 1 -d \|)
DESCRIPTION := $(shell tail -1 $(LOG) | cut -f 2 -d \|)
VERSIONTAG := $(shell git describe --always --tags --long)

.PHONY: help commit description tag test version versiontag

help:
	cat Makefile

test:
	python3 version_reporter.py

pylint:
	- pylint version_reporter.py

commit: ${FILES}
	git add $?
	git commit

version:
	echo ${VERSION}

description:
	echo ${DESCRIPTION}

retag: ${LOG}
	git tag -a ${VERSION} -m ${DESCRIPTION}

versiontag:
	echo ${VERSIONTAG}

version_reporter.py: version_reporter.py.front version_reporter.py.back
	cat version_reporter.py.front > working.py
	echo "    VERSION = '"${VERSION}"'" >> working.py
	echo "    DESCRIPTION = '"${DESCRIPTION}"'" >> working.py
	echo "    VERSIONTAG = '"${VERSIONTAG}"'" >> working.py
	cat version_reporter.py.back >> working.py
	mv working.py version_reporter.py

