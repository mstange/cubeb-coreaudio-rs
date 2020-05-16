# Generate a test executable
cargo test --no-run
test_exe=$(find target/debug/deps -perm +111 -type f)
echo "Run test: $test_exe"

agrs=test_aggregate_activate_clock_drift_compensation_for_an_unknown_aggregate_device
lldb --batch --one-line run --source-on-crash dump.txt $test_exe -- $agrs

agrs="test_aggregate_activate_clock_drift_compensation_for_a_blank_aggregate_device --ignored --test-threads=1"
lldb --batch --one-line run --source-on-crash dump.txt $test_exe -- $agrs
