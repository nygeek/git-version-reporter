# git_version_reporter

#### Started: 2020-04-25
#### Language: Python 3.6

One of the features of RCS that I really miss now that I've moved
over to git is that provided by the $Id$ tag.  Insert that into an
RCS-managed file and it will be automatically updated with checkin
metadatda including most recent update number as well as the login ID
of the person who checked in the update.

Git does provide a unique ID for a point on the branch history.  This ID
is, however, a substring of a cryptographic hash.  As such it is useless
to help a browser to understand where a particular snapshot lives in
the life of a development artifact.  Is it the first change after the
third minor version?

This tiny little tool is the first installment on a set intended to
offer a lightly adequate feature to supplement git.

It relies on the manual tagging capability provided by git, along with a
few other simple tricks, to provide an automatic version identity token
that the software engineer can easily integrate into her code base to
provide a substitute for the RCS $Id$ function.

### The basic notions

#### The version

The version in this system is a free text string.  When we built the
machinery I used a version string with the structure:

+ v (for version, of course)
+ M (major number)
+ .
+ m (minor number)

In conventional software engineering parlance a major number change
indicates the introduction or removal of functionality from the next
previous number in such a way as to render the new version incompatible,
at least in places, with the previous version.

By contrast, a minor number change is used to signal small changes,
whether to correct previous errors and bugs or to introduce minor features
whose addition does not interfere with the correct functioning of the
systems relying on the older versions.

Git supports versions only insofar as it offers the ability to tag a point
in the history of the objects.

In this tool we use the git --tag option to associate a string with a
particular version.

#### The number of commits since the version tag was applied

Between one tagged release and another there will be one or more changes
applied to the software using the git commit subcommand.  It is helpful
in reviewing a piece of software to understand how many commits there have
been.  A small number suggests only a little work has been done on the
software, while a large number suggests that quite a bit has happened.

#### The unique ID of the commit

Git uses a cryptographic hash to uniquely (well, uniquely with high probability, but this is not a discrete math theory seminar) identify each commit.

The git log subcommand displays these identifiers.  Here's a sample:

```
commit 0b3cd0e7badebf7be1e682ef59a41cf5e21d5951 (HEAD -> master)
```

### The machinery

There are four primary objects (files) plus one derived object in this
package:

1. Makefile
2. version-log.txt
3. version_reporter.py
4. version_reporter.py.back
5. version_reporter.py.front
