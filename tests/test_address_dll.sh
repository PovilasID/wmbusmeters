#!/bin/sh

PROG="$1"

mkdir -p testoutput
TEST=testoutput

TESTNAME="Test addresses dll"
TESTRESULT="OK"

# Test that selecting the meter using the dll id instead of the tpl id works.
OUT=$($PROG --format=fields --selectfields=total_m3 6644496A1064035514377251345015496A0007EE0050052F2F_0C1359000000026CBE2B82046CA12B8C0413FFFFFFFF8D0493132CFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF02FD1700002F2F W minomess 55036410 NOKEY)

if [ "$OUT" != "0.059" ]
then
    echo "ERROR: Test addresses dll failed"
else
    echo "OK: Test addresses dll"
fi

# Test that selecting the meter using the tpl id instead of the dll id works.
OUT=$($PROG --format=fields --selectfields=total_m3 6644496A1064035514377251345015496A0007EE0050052F2F_0C1359000000026CBE2B82046CA12B8C0413FFFFFFFF8D0493132CFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF02FD1700002F2F W minomess 15503451 NOKEY)

if [ "$OUT" != "0.059" ]
then
    echo "ERROR: Test addresses tpl failed"
else
    echo "OK: Test addresses tpl"
fi

OUT=$($PROG --format=fields --selectfields=total_m3 6644496A1064035514377251345015496A0007EE0050052F2F_0C1359000000026CBE2B82046CA12B8C0413FFFFFFFF8D0493132CFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF02FD1700002F2F W minomess '*.T=07' NOKEY)

if [ "$OUT" != "0.059" ]
then
    echo "ERROR: Test addresses *.T=07 failed"
else
    echo "OK: Test addresses *.T=07"
fi

OUT=$($PROG --format=fields --selectfields=total_m3 6644496A1064035514377251345015496A0007EE0050052F2F_0C1359000000026CBE2B82046CA12B8C0413FFFFFFFF8D0493132CFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF02FD1700002F2F W minomess '*.T=37' NOKEY)

if [ "$OUT" != "0.059" ]
then
    echo "ERROR: Test addresses *.T=37 failed"
else
    echo "OK: Test addresses *.T=37"
fi
