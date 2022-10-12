#!/usr/bin/env bash

pushd testapp > /dev/null || exit 1
export FASTLANE_SKIP_UPDATE_CHECK=true
export FASTLANE_HIDE_PLUGINS_TABLE=true
export FASTLANE_SKIP_ACTION_SUMMARY=true
bundle exec fastlane ios tests
diff SerialTestPlan.xctestplan ParallelTestPlan.xctestplan > ../test_plans.diff || true 
diff reports/serial/report.html reports/parallel/report.html > ../html_reports.diff || true
diff reports/serial/report.junit reports/parallel/report.junit > ../junit_reports.diff || true
diff reports/serial/testapp-testapp.log reports/parallel/testapp-testapp.log > ../buildlog.diff || true
popd > /dev/null || exit 0
