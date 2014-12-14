#!/bin/sh
# This will only run the quickhit tests.

i=0; t=2; d=5; r=0;
echo enabled > /sys/devices/platform/imx-uart.0/tty/ttymxc0/power/wakeup;

while [ "$i" -lt 20 ];
do ./scripts/rtcwakeup.out -d rtc0 -m mem -s $t;
sleep $d;
echo suspend $i times;
i=`expr $i + 1`; r=`date +%s`; t=`expr $r % 2 + 6`; d=`expr $r % 2 + 3`;
done
