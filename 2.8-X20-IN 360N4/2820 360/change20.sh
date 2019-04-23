#!/system/bin/sh
/su/bin/su  
#重挂载system
mount -o remount,rw /system 
#替换温控
mv -f -p thermal.conf /etc/.tp/thermal.conf
#备份build.prop到sd卡
cp -p -f /system/build.prop /storage/emulated/0/backup/build.prop
#复制build.prop以便修改
cp -p -f /system/build.prop /data/app/zzz.prop
#具体修改步骤
sed -i "s#ro.mtk_perf_simple_start_win=0#ro.mtk_perf_simple_start_win=1#g" /data/app/zzz.prop
sed -i "s#ro.mtk_perf_fast_start_win=1#ro.mtk_perf_fast_start_win=0#g" /data/app/zzz.prop
sed -i "s#ro.mtk_perf_response_time=0#ro.mtk_perf_response_time=1#g" /data/app/zzz.prop
sed -i "s#ro.mtk_perfservice_support=1#ro.mtk_perfservice_support=0#g" /data/app/zzz.prop
#覆盖原build.prop
cp -p -f /data/app/zzz.prop /system/build.prop
#写入重启后执行代码
echo "
sleep 60
sh ./data/app/exit20.sh
am start -n com.digibites.accubattery/com.digibites.abatterysaver.BatterySaverActivity &" >> /system/bin/install-recovery.sh
#重挂载system
mount -o remount,ro /system
#重启
am restart
