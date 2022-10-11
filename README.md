# fastlane-scan-parallel-testplans
sandbox app for reproducing a `scan` bug

## tl;dr

A test plan with `"parallelizable": true` won't produce the right reports when run with `run_tests` (a.k.a. `scan`).

## reproducing

Run 'test.sh' and review the two diffs produced: the test plans are identical apart from their parallelization setting, but the reports only contain real test results when run in serial.
