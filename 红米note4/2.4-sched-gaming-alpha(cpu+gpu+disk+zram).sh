su
#2.4智能调度，for 360 n4 x20
#cpu,gpu,disk,zram included
#作者：铁人司机

#开启热插拔
echo 1 > /proc/hps/enabled
#设定interactive为当前调度器
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
#调节interactive调度器具体参数
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/boost
echo 1 > /sys/devices/system/cpu/cpufreq/interactive/boost
#调节升频时延
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "38000 559000:48000 715000:58000 897000:68000 1092000:78000 1222000:88000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
#调节升频频率
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 1391000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
#调节升频所需负载条件
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo 85 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
#调节最小降频间隔
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 8000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
#调节负载频率对应关系
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo "10 221000:20 338000:30 4818000:40 715000:60 897000:70 1118000:80 1391000:90 10 325000:20 559000:30 741000:40 1092000:50 1274000:60 1495000:70 1703000:80 1846000:90 10 304200:20 7410000:30 101000:40 1222000:50 1495000:60 1768000:70 1963000:80 2106000:90" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
#调节CPU负载采样间隔
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
chmod 0666 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
#开启CPU提升I/O性能
chmod 0666 /sys/devices/system/cpu/cpufreq/io_is_busy
echo 0 > /sys/devices/system/cpu/cpufreq/io_is_busy

#限制boost核心数量
chmod 0666 /proc/hps/input_boost_cpu_num
echo 4 > /proc/hps/input_boost_cpu_num
chmod 0666 /proc/hps/heavy_task_enabled
echo 1 > /proc/hps/heavy_task_enabled
#设置降频阈值
chmod 0666 /proc/hps/down_threshold
echo 40 > /proc/hps/down_threshold
#设置降频积极度（千万不能为零，不然重启……）
chmod 0666 /proc/hps/down_times
echo 4 > /proc/hps/down_times
#设置升频阈值
chmod 0666 /proc/hps/up_threshold
echo 30 > /proc/hps/up_threshold
#设置升频积极度（千万不能为零，不然重启……）
chmod 0666/proc/hps/up_times
echo 6 > /proc/hps/up_times
#禁用加速
chmod 0666 /proc/hps/rush_boost_enabled
chmod 0666 /proc/hps/input_boost_enabled
chmod 0666 /proc/hps/rush_boost_threshold
echo 1 > /proc/hps/rush_boost_enabled
echo 1 > /proc/hps/input_boost_enabled
echo 80 > /proc/hps/rush_boost_threshold
#启用休眠
chmod 0666 /proc/hps/suspend_enabled
chmod 0666 /sys/power/autosleep
chmod 0666 /sys/power/pm_freeze_timeout
echo 1 > /proc/hps/suspend_enabled
echo 1 > /sys/power/autosleep
echo 3000 > /sys/power/pm_freeze_timeout

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
echo 90 > /proc/cpufreq/cpufreq_up_threshold_b
echo 90 > /proc/cpufreq/cpufreq_up_threshold_l
echo 90 > /proc/cpufreq/cpufreq_up_threshold_ll
echo 1 > /proc/cpufreq/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
echo 1 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode
#开启cpu动态调节电压
echo 1 > /proc/cpufreq/enable_cpuhvfs
#开启性能模式
echo 1 > /proc/cpufreq/cpufreq_power_mode
#修改不同场景核心开启情况
chmod 0666  /dev/cpuset/background/cpus

echo "0-3" > /dev/cpuset/background/cpus

chmod 0666  /dev/cpuset/foreground/cpus

echo "0-2,4-7,8" > /dev/cpuset/foreground/cpus

chmod 0666  /dev/cpuset/cpus

echo "0-8" > /dev/cpuset/cpus

#调节默认核心idx
chmod 0666 /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
chmod 0666 /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
chmod 0666 /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
chmod 0666 /proc/cpufreq/cpufreq_oppidx
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_oppidx
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_oppidx
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_oppidx
echo 0 > /proc/cpufreq/cpufreq_oppidx

#moudle/ged
chmod 0666 /sys/module/ged/parameters/boost_gpu_enable
chmod 0666 /sys/module/ged/parameters/ged_boost_enable
chmod 0666 /sys/module/ged/parameters/gpu_bottom_freq
chmod 0666 /sys/module/ged/parameters/gpu_cust_upbound_freq
chmod 0777 /sys/module/ged/parameters/gpu_debug_enable
chmod 0666 /sys/module/ged/parameters/gpu_dvfs_enbale
chmod 0666 /sys/module/ged/parameters/gpu_idle
echo 1 > /sys/module/ged/parameters/boost_gpu_enable
echo 1 > /sys/module/ged/parameters/ged_boost_enable
echo 238000 > /sys/module/ged/parameters/gpu_bottom_freq
echo 850000 > /sys/module/ged/parameters/gpu_cust_upbound_freq
echo 1 > /sys/module/ged/parameters/gpu_debug_enable
echo 1 > /sys/module/ged/parameters/gpu_dvfs_enbale
echo 1 > /sys/module/ged/parameters/gpu_idle

#设置gpu满频解放
chmod 0777 /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
chmod 0777 /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
chmod 0777 /proc/gpufreq/gpufreq_limited_power
chmod 0777 /proc/gpufreq/gpufreq_limited_thermal_ignore
chmod 0777 /proc/gpufreq/gpufreq_volt_enable
chmod 0777 /proc/gpufreq/gpufreq_opp_max_freq
chmod 0777 /proc/gpufreq/gpufreq_opp_freq
chmod 0777 /proc/gpufreq/gpufreq_input_boost
chmod 0777 /d/ged/hal/fps_upper_bound
echo "0 0" > /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
echo "0 0" > /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
echo "0 850000" > /proc/gpufreq/gpufreq_limited_power
echo "0 0" > /proc/gpufreq/gpufreq_limited_thermal_ignore
echo 1 > /proc/gpufreq/gpufreq_volt_enable
echo 850000 > /proc/gpufreq/gpufreq_opp_max_freq
echo 238000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_opp_freq
echo 1 > /proc/gpufreq/gpufreq_input_boost
echo 60 > /d/ged/hal/fps_upper_bound

#开启ksm
busybox mkdir /sys/kernel/mm/ksm
busybox touch /sys/kernel/mm/ksm/run
echo 1 > /sys/kernel/mm/ksm/run
#开启zram
echo 1536m > /sys/block/zram0/disksize
busybox mkswap /dev/block/zram0
busybox swapon /dev/block/zram0
echo 0 > /proc/sys/vm/swappiness
sh ./enableswap.sh

#修改硬盘读写
chmod 0777 /sys/block/mmcblk0/queue/scheduler
chmod 0777 /sys/block/mmcblk0boot0/queue/scheduler
chmod 0777 /sys/block/mmcblk0boot1/queue/scheduler
chmod 0777 /sys/block/mmcblk0rpmb/queue/scheduler
chmod 0777 /sys/block/ram0/queue/scheduler
echo "deadline" > /sys/block/mmcblk0/queue/scheduler
echo "deadline" > /sys/block/mmcblk0boot0/queue/scheduler
echo "deadline" > /sys/block/mmcblk0boot1/queue/scheduler
echo "deadline" > /sys/block/mmcblk0rpmb/queue/scheduler
echo "deadline" > /sys/block/ram0/queue/scheduler
chmod 0777 /sys/block/mmcblk0/queue/nr_requests
chmod 0777 /sys/block/mmcblk0boot0/queue/nr_requests
chmod 0777 /sys/block/mmcblk0boot1/queue/nr_requests
chmod 0777 /sys/block/mmcblk0/queue/read_ahead_kb
chmod 0777 /sys/block/mmcblk0boot0/queue/read_ahead_kb
chmod 0777 /sys/block/mmcblk0boot1/queue/read_ahead_kb
echo 1024 > /sys/block/mmcblk0/queue/nr_requests
echo 1024 > /sys/block/mmcblk0boot0/queue/nr_requests
echo 1024 > /sys/block/mmcblk0boot1/queue/nr_requests
echo 1024 > /sys/block/mmcblk0/queue/read_ahead_kb
echo 1024 > /sys/block/mmcblk0boot0/queue/read_ahead_kb
echo 1024 > /sys/block/mmcblk0boot1/queue/read_ahead_kb

#优化ZRAM
chmod 0777 /proc/sys/vm/dirty_ratio
chmod 0777 /proc/sys/vm/dirty_background_ratio
chmod 0777 /proc/sys/vm/dirty_writeback_centisecs
chmod 0777 /proc/sys/vm/dirtytime_expire_seconds
chmod 0777 /proc/sys/vm/swappiness
chmod 0777 /proc/sys/vm/vfs_cache_pressure
echo 10 > /proc/sys/vm/dirty_ratio
echo 5 > /proc/sys/vm/dirty_background_ratio
echo 400 > /proc/sys/vm/dirty_writeback_centisecs
echo 1000 > /proc/sys/vm/dirtytime_expire_seconds
echo 0 > /proc/sys/vm/swappiness
echo 200 > /proc/sys/vm/vfs_cache_pressure

#POWERED BY 铁人司机
#完成日期：2019年4月12日 1:05