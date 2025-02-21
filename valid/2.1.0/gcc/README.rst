Examples of .sarif files either generated by GCC, or hand-written as part
of GCC's test suite.

Notes
*****

* 3.11.5-escaped-braces.sarif:

  Hand-written example of SARIF containing escaped ``{`` and ``}`` within
  the ``text`` of a ``message``.

* 3.11.6-embedded-links.sarif:

  Hand-written examples of message ``text``, some with embedded links.
  Example 2 is without the fix from
  https://github.com/oasis-tcs/sarif-spec/issues/656,
  whereas example 3 has the fix.

* 3.20.21-{ice,ice-in-header,ice-write-through-null}.sarif

  Examples of ``toolExecutionNotifications`` generated via a plugin in
  GCC's testsuite.

  The ``ice-in-header`` example is reported on a location in a header file
  to show the v2.1 behavior from before https://github.com/oasis-tcs/sarif-spec/issues/540
  Compare with :file:`valid/2.2-experimental/gcc/3.20.21-ice-in-header.sarif`

* 3.27.30-fixes-{1,2,3}.sarif:

  Examples of GCC 15 SARIF output for fix-it hints (replacement,
  deletion, and insertion, respectively), simplified somewhat by hand.

* 3.28.6-annotations-1.sarif:

  Example of GCC 15 SARIF output from the C compiler for bad types passed to
  infix binary ``+``, where ``annotations`` are used to highlight the types
  of the operands.  Simplified somewhat by hand.

* 3.36-diagnostic-test-paths-5.sarif

  Example of ``codeFlow`` output via a plugin in GCC's testsuite.

  For reference, GCC prints it like this::

      diagnostic-test-paths-5.c:30:5: error: passing NULL as argument 1 to 'PyList_Append' which requires a non-NULL parameter [error]
         30 |     PyList_Append(list, item);
            |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
        'make_a_list_of_random_ints_badly': events 1-3
         26 |   list = PyList_New(0);
            |          ^~~~~~~~~~~~~~
            |          |
            |          (1) when 'PyList_New' fails, returning NULL
         27 | 
         28 |   for (i = 0; i < count; i++) {
            |               ~~~~~~~~~~
            |               |
            |               (2) when 'i < count'
         29 |     item = PyLong_FromLong(random());
         30 |     PyList_Append(list, item);
            |     ~~~~~~~~~~~~~~~~~~~~~~~~~~
            |     |
            |     (3) when calling 'PyList_Append', passing NULL from (1) as argument 1

* 3.36-diagnostic-test-paths-multithreaded.sarif

  Example of ``codeFlow`` output via a plugin in GCC's testsuite, containing
  a pair of threads.

  For reference, GCC 15 prints it textually like this::

      diagnostic-test-paths-multithreaded-inline-events.c:17:3: warning: deadlock due to inconsistent lock acquisition order
         17 |   acquire_lock_a (); /* { dg-warning "deadlock due to inconsistent lock acquisition order" } */
            |   ^~~~~~~~~~~~~~~~~
      Thread: 'Thread 1'
        'foo': event 1
          |
          |    9 | {
          |      | ^
          |      | |
          |      | (1) entering 'foo'
          |
          +--> 'foo': event 2
                 |
                 |   10 |   acquire_lock_a ();
                 |      |   ^~~~~~~~~~~~~~~~~
                 |      |   |
                 |      |   (2) lock a is now held by thread 1
                 |
      
      Thread: 'Thread 2'
        'bar': event 3
          |
          |   15 | {
          |      | ^
          |      | |
          |      | (3) entering 'bar'
          |
          +--> 'bar': event 4
                 |
                 |   16 |   acquire_lock_b ();
                 |      |   ^~~~~~~~~~~~~~~~~
                 |      |   |
                 |      |   (4) lock b is now held by thread 2
                 |
      
      Thread: 'Thread 1'
               'foo': event 5
                 |
                 |   11 |   acquire_lock_b ();
                 |      |   ^~~~~~~~~~~~~~~~~
                 |      |   |
                 |      |   (5) deadlocked due to waiting for lock b in thread 1 (acquired by thread 2 at (4))...
                 |
      
      Thread: 'Thread 2'
               'bar': event 6
                 |
                 |   17 |   acquire_lock_a (); /* { dg-warning "deadlock due to inconsistent lock acquisition order" } */
                 |      |   ^~~~~~~~~~~~~~~~~
                 |      |   |
                 |      |   (6) ...whilst waiting for lock a in thread 2 (acquired by thread 1 at (2))
                 |

* bad-pragma.c.sarif:

  Example of GCC 15 output from its sarif-output DejaGnu testsuite.

* error-with-note.sarif:

  Hand-written example of GCC SARIF output for an ``error`` followed by a
  ``note``, with the latter represented via an element of ``relatedLocations``
  with a ``message``.

* include-chain-{1,2}.c.sarif

  Examples of GCC 15 output from its sarif-output DejaGnu testsuite
  showing chains of ``include`` (both in a result, and in a codeFlow).

* missing-semicolon.c.sarif

  Example of GCC 15 output from its sarif-output DejaGnu testsuite.

* no-diagnostics.c.sarif

  Example of GCC 15 output from its sarif-output DejaGnu testsuite.

* werror.c.sarif

  Example of GCC 15 output from its sarif-output DejaGnu testsuite
  where ``-Werror=unused-variable`` was used to promote a warning to
  an error.
