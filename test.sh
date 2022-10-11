#!/usr/bin/env bash

pushd testapp > /dev/null || exit 1
bundle exec fastlane ios tests
diff SerialTestPlan.xctestplan ParallelTestPlan.xctestplan > ../test_plans.diff || true 
diff <(cat reports/serial/*) <(cat reports/parallel/*) > ../reports.diff || true
popd > /dev/null || exit 0
