SARIF Examples
==============

A collection of examples of SARIF data:

  * intended for use by SARIF consumers for testing interoperability

  * intended to be freely redistributable

Every file is likely under a different license; see the individual
README.rst files in the appropriate subdirectory.  Note that we need
to cover the licensing of any artifacts with a ``contents``, or where
a ``snippet`` is large enough to require licensing.

Structure: {malformed, invalid, valid}, then version, then producer/publisher,
with README.rst files in each pertinent subdir to give license, explanation,
motivation, provenance, etc

Some with accompanying source, some without.

TODO:
  * licensing for example files:

    * so far all the invalid, malformed and gcc files are from files
      created by me (dmalcolm) for the gcc testsuite for which I retain
      ownership of the copyright.  I can grant them under a license
      for whichever open-source license is agreeable to the SARIF community.

    * the examples from the sarif spec and the sarif tutorial

  * populate

  * do we want to permit comments (of some kind) within the example files?
    (rather than being forced to put them in README.rst files)

This is unofficial, but I've proposed pursuing it as
https://github.com/oasis-tcs/sarif-spec/issues/677
