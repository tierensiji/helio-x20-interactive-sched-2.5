#!/system/bin/sh
/su/bin/su
#重挂载system
mount -o remount,rw /system
#清除开机一次性代码
sed -i "s#sh ./data/app/exit20.sh#sh ./data/app/28IN20.sh#g" /system/bin/install-recovery.sh
#重挂载system
mount -o remount,ro /system
#执行脚本
sh ./data/app/28IN20.sh
#清理多余脚本
rm -f zzz.prop
rm -f change20.sh
#弹出成功提示
am start -n com.android.htmlviewer/com.android.htmlviewer.HTMLViewerActivity -d file:///data/app/2820.html
sleep 10
am force-stop com.android.htmlviewer &
#删除剩余文件
rm -f 2820.html
rm $0