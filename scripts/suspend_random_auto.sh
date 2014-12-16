#!/bin/sh
i=0;
t=2;
d=2;
r=0;
while [ "$i" -lt 5000 ];
do
	if [ "$t" -lt 5 ]; then
		./scripts/rtcwakeup.out -d rtc0 -m standby -s $t;
	else
		./scripts/rtcwakeup.out -d rtc0 -m mem -s $t;
	fi

	sleep $d;
	echo =============================
	echo    suspend $i times;
	echo =============================
	i=`expr $i + 1`;
	r=`date +%s`;
	t=`expr $r % 6 + 3`;
	d=`expr $r % 2 + 1`;
	echo wakeup $t seconds, sleep $d seconds;
done
