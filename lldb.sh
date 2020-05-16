# Generate a test executable
cargo test --no-run
test_exe=$(find target/debug/deps -perm +111 -type f)
echo "Run test: $test_exe"

# Regular tests
lldb --batch --one-line run --source-on-crash dump.txt $test_exe

# General aggregate tests
agrs="test_aggregate --ignored --test-threads=1"
lldb --batch --one-line run --source-on-crash dump.txt $test_exe -- $agrs

# A specific one aggregate test
agrs="test_aggregate_activate_clock_drift_compensation_for_a_blank_aggregate_device --ignored --test-threads=1"
lldb --batch --one-line run --source-on-crash dump.txt $test_exe -- $agrs