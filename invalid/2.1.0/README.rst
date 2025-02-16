Examples of .sarif files that are *not* valid according to the 2.1.0
schema or spec.

The first part of the filename expresses the subsection of the spec that
is violated by the file.

Notes
=====

3.1: General
************

* 3.1-not-an-object.sarif

  Top-level object is an array, not an object.

3.11: ``message`` object
************************

* 3.11.11-malformed-placeholder.sarif

  Unescaped ``{`` within message ``text``.

* 3.11.11-missing-arguments-for-placeholders.sarif:

  Message ``text`` string contains placeholder ``{0}`` but the message object
  has no ``arguments`` property.

* 3.11.11-not-enough-arguments-for-placeholders.sarif:

  Message ``text`` string contains placeholders ``{0}``, ``{1}``, and ``{2}``
  thus requiring 3 arguments, but the ``arguments`` array only has 2 elements.

3.13: ``sarifLog`` object
*************************

* 3.13.2-no-version.sarif:

  Empty object, without even a ``version`` property.

* 3.13.2-version-not-a-string.sarif:

  Top-level object's ``version`` property isn't a string, to catch missing
  JSON type-checking.

* 3.13.4-bad-runs.sarif:

  Top-level object's ``runs`` property isn't ``null`` or an array, to catch
  missing JSON type-checking.

* 3.13.4-non-object-in-runs.sarif:

  Top-level object's ``runs`` array has an element that isn't an object,
  to catch missing JSON type-checking.

* 3.13.4-no-runs.sarif:

  Top-level object doesn't have a ``runs`` property.

3.27: ``result`` object
***********************

* 3.27.10-bad-level.sarif:

  String value for ``level`` property of a result object isn't one of the
  ones in the spec.

3.33: ``logicalLocation`` object
********************************

* 3.33.3-index-out-of-range.sarif:

  Index value within a logicalLocation within a result is out of range
  for theRun.logicalLocations.
