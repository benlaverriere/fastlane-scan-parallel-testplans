# fastlane-scan-parallel-testplans
sandbox app for reproducing an unexpected `scan` behavior

## tl;dr

A test plan with `"parallelizable": true` won't produce the right reports when run with `run_tests` (a.k.a. `scan`) and parsed by `xcpretty`. Parsing the build output with `xcbeautify` instead will work, as I ultimately discovered in the [docs](https://docs.fastlane.tools/best-practices/xcodebuild-formatters/#:~:text=Supports%20Xcode%27s%20parallel%20testing%20output).

## reproducing

Expects `diff` and `xcbeautify` to be installed.

Run 'test.sh' and review the (many) diffs produced. Under `xcpretty`: the test plans are identical apart from their parallelization setting, but the reports only contain real test results when run in serial. Under `xcbeautify`: the reports match, although no HTML report is currently available.
