#!/usr/bin/env bash

pushd testapp > /dev/null || exit 1
export FASTLANE_SKIP_UPDATE_CHECK=true
export FASTLANE_HIDE_PLUGINS_TABLE=true
export FASTLANE_SKIP_ACTION_SUMMARY=true
bundle exec fastlane ios tests

diff SerialTestPlan.xctestplan ParallelTestPlan.xctestplan > ../test_plans.diff || true 

formatters=( xcpretty xcbeautify )
for formatter in "${formatters[@]}"; do
  diff "reports/$formatter/serial/report.html" "reports/$formatter/parallel/report.html" > ../"${formatter}_html_reports.diff" || true
  diff "reports/$formatter/serial/report.junit" "reports/$formatter/parallel/report.junit" > "../${formatter}_junit_reports.diff" || true
  diff "reports/$formatter/serial/testapp-testapp.log" "reports/$formatter/parallel/testapp-testapp.log" > "../${formatter}_buildlog.diff" || true
done

popd > /dev/null || exit 0
