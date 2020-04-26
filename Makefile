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

FILES := Makefile

.PHONY: help commit

help:
	cat Makefile

commit:
	git commit
