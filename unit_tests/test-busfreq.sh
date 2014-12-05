echo 8 > /proc/sys/kernel/printk;
ifconfig eth0 down;
echo 1 > /sys/class/graphics/fb0/blank;
while [ 1 ];do echo 1 > /sys/class/graphics/fb0/blank;sleep 10;echo 0 > /sys/class/graphics/fb0/blank;sleep 6;done&
while [ 1 ];do cat /sys/kernel/debug/clk/clk_summary | grep mmdc;sleep 3;done&
while [ 1 ];do aplay /unit_tests/audio8k16S.wav;sleep 10;done&
