#! /usr/bin/python3
""" Version Reporter - a class to provide version identity reporting for
    Python programs that is integerated with git.

Started 2020-04-24 by Marc Donner

Copyright (C) 2020 Marc Donner

"""

# This keeps pylint from bitching about the python3 print() calls.
from __future__ import print_function

class VersionReporter(object):
    """ Report version and description for version for git python
        projects.
    """

    VERSION = 'v1.2'
    DESCRIPTION = 'Version 1.2 2020-04-27 mdd - automatically created'
    VERSIONTAG = 'v1.2-1-gb3640ec'

    def __init__(self, debug):
        """ initialize the class """
        self.debug = debug

    def get_version(self):
        """ Return the value of VERSION """
        return self.VERSION

    def get_versiontag(self):
        """ Return the value of VERSIONTAG """
        return self.VERSIONTAG

    def get_description(self):
        """ Return the value of DESCRIPTION """
        return self.DESCRIPTION

def main():
    """Main"""
    version_reporter = VersionReporter(False)
    print("version_reporter.get_version(): " + \
            str(version_reporter.get_version()))
    print("version_reporter.get_description(): " + \
            str(version_reporter.get_description()))
    print("version_reporter.get_versiontag(): " + \
            str(version_reporter.get_versiontag()))

if __name__ == '__main__':
    main()
