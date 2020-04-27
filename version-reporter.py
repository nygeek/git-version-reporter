""" Version Reporter - a class to provide version identity reporting for
    Python programs that is integerated with git.

Started 2020-04-24 by Marc Donner

Copyright (C) 2020 Marc Donner

"""

class VersionReporter(object):

    VERSION = "1.1"
    DESCRIPTION = "Version 1.1 2020-04-24 mdd - first version bump"

    def __init__(self, debug): 
        """ initialize the class """
        self.debug = debug
        pass
    
    def get_version(self):
        """ Return the value of VERSION """
        return(self.VERSION)

    def get_description(self):
        """ Return the value of DESCRIPTION """
        return(self.DESCRIPTION)

def main():
    """Main"""
    vr = VersionReporter(False)
    print("vr.get_version(): " + str(vr.get_version()))
    print("vr.get_description(): " + str(vr.get_description()))

if __name__ == '__main__':
    main()
