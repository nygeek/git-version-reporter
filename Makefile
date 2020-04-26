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
FILES := Makefile 

VERSION := $(shell tail -1 $(LOG) | cut -f 1 -d \|)
DESCRIPTION := $(shell tail -1 $(LOG) | cut -f 2 -d \|)

.PHONY: help commit version tag description describe

help:
	cat Makefile

commit:
	git commit

version:
	echo ${VERSION}

description:
	echo ${DESCRIPTION}

retag: ${LOG}
	git tag -a ${VERSION} -m ${DESCRIPTION}

describe:
	git describe --always --tags --long
