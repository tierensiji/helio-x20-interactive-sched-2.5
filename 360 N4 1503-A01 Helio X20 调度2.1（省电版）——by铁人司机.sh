su
#2.1智能调度，360 n4 x20 仿魅族pro7H x30 调度移植版
#作者：铁人司机
#开工时间：2019年3月30日 16:37

#开启热插拔
echo 1 > /proc/hps/enabled
#设定interactive为当前调度器
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu8/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu9/cpufreq/scaling_governor
echo 100 > /sys/devices/system/cpu/power/autosuspend_delay_ms
chmod 0777 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 325000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 0777 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo 221000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chmod 0777 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo 304200 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
#调节interactive调度器具体参数
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/boost
#调节升频时延
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "48000 1080000:58000 1180000:68000 1280000:78000 1380000:98000 1480000:108000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
#调节升频频率
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 1092000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
#调节升频所需负载条件
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_freq
echo 95 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_freq
#调节最小降频间隔
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 4000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
#调节负载频率对应关系
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo "15 221000:25 338000:30 4818000:50 715000:70 1092000:85 1222000:91 1339000:99 50 832000:70 1092000:85 1417000:91 1703000:99 50 1766000:70 2057000:85 2450000:99" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
#echo 93 > /sys/devices/system/cpu/cpufreq/interactive/target_loads
#调节CPU负载采样间隔
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
chmod 0777 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
#开启CPU提升I/O性能
chmod 0777 /sys/devices/system/cpu/cpufreq/io_is_busy
echo 0 > /sys/devices/system/cpu/cpufreq/io_is_busy


#开启hps_eas动态调节
echo 1 > /proc/hps/eas_enabled
#限制基本核心数量
chmod 0666 /proc/hps/num_base_perf_serv
echo "3 3 1" > /proc/hps/num_base_perf_serv
#限制boost核心数量
chmod 0666 /proc/hps/input_boost_cpu_num
echo 8 > /proc/hps/input_boost_cpu_num
chmod 0666 /proc/hps/big_task_enabled
echo 1 > /proc/hps/big_task_enabled
chmod 0666 /proc/hps/heavy_task_enabled
echo 1 > /proc/hps/heavy_task_enabled
#设置降频阈值
chmod 0666 /proc/hps/down_threshold
echo 80 > /proc/hps/down_threshold
#设置降频积极度（千万不能为零，不然重启……）
chmod 0666 /proc/hps/down_times
echo 4 > /proc/hps/down_times
#设置升频阈值
chmod 0666 /proc/hps/up_threshold
echo 80 > /proc/hps/up_threshold
#设置升频积极度（千万不能为零，不然重启……）
chmod 0666/proc/hps/up_times
echo 6 > /proc/hps/up_times
#禁用加速
chmod 0666 /proc/hps/rush_boost_enabled
chmod 0666 /proc/hps/input_boost_enabled
chmod 0666 /proc/hps/rush_boost_threshold
echo 1 > /proc/hps/rush_boost_enabled
echo 1> /proc/hps/input_boost_enabled
echo 99 > /proc/hps/rush_boost_threshold
#启用休眠
chmod 0666 /proc/hps/suspend_enabled
chmod 0666 /sys/power/autosleep
chmod 0666 /sys/power/pm_freeze_timeout
echo 1 > /proc/hps/suspend_enabled
echo 1 > /sys/power/autosleep
echo 2000 > /sys/power/pm_freeze_timeout

#修改动态机制
echo 0 > /proc/cpufreq/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_sched_disable
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_sched_disable
#设置升频阈值
chmod 0666 /proc/cpufreq/cpufreq_up_threshold_b
chmod 0666 /proc/cpufreq/cpufreq_up_threshold_l
chmod 0666 /proc/cpufreq/cpufreq_up_threshold_ll
echo 95 > /proc/cpufreq/cpufreq_up_threshold_b
echo 95 > /proc/cpufreq/cpufreq_up_threshold_l
echo 95 > /proc/cpufreq/cpufreq_up_threshold_ll
echo 0 > /proc/cpufreq/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode
#echo 2117000 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_freq
#修改不同场景核心开启情况
chmod 0666  /dev/cpuset/background/cpus

echo "2-3" > /dev/cpuset/background/cpus

chmod 0666  /dev/cpuset/foreground/cpus

echo "4-7,8" > /dev/cpuset/foreground/cpus

chmod 0666  /dev/cpuset/cpus

echo "0-9" > /dev/cpuset/cpus

#调节默认核心idx
chmod 0666 /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
chmod 0666 /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
chmod 0666 /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
chmod 0666 /proc/cpufreq/cpufreq_oppidx
echo 7 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
echo 7 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
echo 7 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
echo 7 > /proc/cpufreq/cpufreq_oppidx

#设置gpu自动调节，解锁315，按需分配
#echo 166000 > /proc/gpufreq/gpufreq_opp_freq
chmod 0666 /proc/gpufreq/gpufreq_debug
chmod 0666 /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
chmod 0666 /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
chmod 0666 /proc/gpufreq/gpufreq_limited_power
chmod 0666 /proc/gpufreq/gpufreq_limited_thermal_ignore
chmod 0666 /proc/gpufreq/gpufreq_volt_enable
chmod 0666 /proc/gpufreq/gpufreq_opp_max_freq
chmod 0666 /proc/gpufreq/gpufreq_opp_freq
chmod 0666 /proc/gpufreq/gpufreq_input_boost
echo 1 > /proc/gpufreq/gpufreq_debug
echo "0 0" > /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
echo "0 0" > /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
echo "5 301500" > /proc/gpufreq/gpufreq_limited_power
echo "0 0" > /proc/gpufreq/gpufreq_limited_thermal_ignore
echo 1 > /proc/gpufreq/gpufreq_volt_enable
echo 301500 > /proc/gpufreq/gpufreq_opp_max_freq
echo 0 > /proc/gpufreq/gpufreq_opp_freq
#echo 166000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_input_boost
chmod 0666 /d/ged/hal/fps_upper_bound
echo 60 > /d/ged/hal/fps_upper_bound

#BY 铁人司机
#完成日期：2019年3月30日 17:23