#!/system/bin/sh
/su/bin/su
#2.8加入一键部署操作，自动安装，内测版暂时采用2.5改调度。
#作者：铁人司机————一个热爱安卓代码的北中医学生。
#一款优秀的调度首先体现在核心控制上，滑稽
#内测版暂时不做代码解释，节约时间，以最快速度，全力投入开发
echo "9 1" > /proc/ppm/policy_status
echo 0 > /proc/ppm/root_cluster
echo 2 > /proc/ppm/policy/hica_power_state
echo "0 1" > /proc/ppm/policy/userlimit_min_cpu_core
echo "1 0" > /proc/ppm/policy/userlimit_min_cpu_core
echo "2 0" > /proc/ppm/policy/userlimit_min_cpu_core
echo "0 3" > /proc/ppm/policy/userlimit_max_cpu_core
echo "1 2" > /proc/ppm/policy/userlimit_max_cpu_core
echo "2 2" > /proc/ppm/policy/userlimit_max_cpu_core
echo "0 221000" > /proc/ppm/policy/userlimit_min_cpu_freq
echo "1 325000" > /proc/ppm/policy/userlimit_min_cpu_freq
echo "2 304200" > /proc/ppm/policy/userlimit_min_cpu_freq
echo "0 1092000" > /proc/ppm/policy/userlimit_max_cpu_freq
echo "1 1417000" > /proc/ppm/policy/userlimit_max_cpu_freq
echo "2 1989000" > /proc/ppm/policy/userlimit_max_cpu_freq
#开启热插拔
echo 1 > /proc/hps/enabled
#设定interactive为当前调度器
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#调节interactive调度器具体参数
chmod 0755 /sys/devices/system/cpu/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/boost
#调节升频时延
chmod 0755 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "78000 559000:88000 715000:88000 897000:98000 1092000:108000 1222000:118000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
#调节升频频率
chmod 0755 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 832000 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
#调节升频所需负载条件
chmod 0755 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
#调节最小降频间隔
chmod 0755 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 2000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
#调节负载频率对应关系
chmod 0755 /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo "20 221000:30 338000:40 4818000:50 715000:60 897000:70 1118000:80 1391000:90 20 325000:30 559000:40 741000:50 1092000:60 1274000:70 1495000:80 1703000:90 1846000:95 20 304200:30 7410000:40 101000:50 1222000:60 1495000:70 1768000:80 1963000:90 2106000:95" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
#调节CPU负载采样间隔
chmod 0755 /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 80000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
chmod 0755 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 80000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
#开启CPU提升I/O性能
chmod 0755 /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
echo 0 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
#限制boost核心数量
chmod 0755 /proc/hps/input_boost_cpu_num
echo 8 > /proc/hps/input_boost_cpu_num
chmod 0755 /proc/hps/heavy_task_enabled
echo 1 > /proc/hps/heavy_task_enabled
#设置关核阈值
chmod 0755 /proc/hps/down_threshold
echo 30 > /proc/hps/down_threshold
#设置降撞墙次数（千万不能为零，不然重启……）
chmod 0755 /proc/hps/down_times
echo 1 > /proc/hps/down_times
#设置开核阈值
chmod 0755 /proc/hps/up_threshold
echo 20 > /proc/hps/up_threshold
#设置撞墙次数（千万不能为零，不然重启……）
chmod 0755/proc/hps/up_times
echo 1 > /proc/hps/up_times
#禁用加速
chmod 0755 /proc/hps/rush_boost_enabled
chmod 0755 /proc/hps/input_boost_enabled
chmod 0755 /proc/hps/rush_boost_threshold
echo 0 > /proc/hps/rush_boost_enabled
echo 0 > /proc/hps/input_boost_enabled
echo 50 > /proc/hps/rush_boost_threshold
#启用休眠
chmod 0755 /proc/hps/suspend_enabled
chmod 0755 /sys/power/autosleep
chmod 0755 /sys/power/pm_freeze_timeout
echo 1 > /proc/hps/suspend_enabled
echo 1 > /sys/power/autosleep
echo 3000 > /sys/power/pm_freeze_timeout
#CPUFREQ
echo 0 > /proc/cpufreq/cpufreq_debug
echo 1 > /proc/cpufreq/enable_cpuhvfs
echo 3 > /proc/cpufreq/cpufreq_power_mode
chmod 0755 /proc/cpufreq/cpufreq_up_threshold_b
chmod 0755 /proc/cpufreq/cpufreq_up_threshold_l
chmod 0755 /proc/cpufreq/cpufreq_up_threshold_ll
echo 0 > /proc/cpufreq/cpufreq_up_threshold_b
echo 20 > /proc/cpufreq/cpufreq_up_threshold_l
echo 5 > /proc/cpufreq/cpufreq_up_threshold_ll
echo 0 > /proc/cpufreq/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_CCL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_L/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_LL/cpufreq_turbo_mode
echo 0 > /proc/cpufreq/MT_CPU_DVFS_B/cpufreq_turbo_mode
#修改ctl
echo "0 3000 10 15 1 560 0 1000 0" > /proc/driver/thermal/clatm_setting
echo "1 2000 15 30 1 460 8000 700 0" > /proc/driver/thermal/clatm_setting
echo "4 60 50 40 30" > /proc/driver/thermal/clfps_level
#echo 10000 > /dev/cpuctl/bg_non_interactive/cpu.rt_runtime_us
#echo 950000 > /dev/cpuctl/cpu.rt_runtime_us
#echo 1000000 > /dev/cpuctl/cpu.rt_period_us
echo 1 > /proc/sys/kernel/sched_tunable_scaling
#使用thermal
thermal_manager /vendor/etc/.tp/thermal.conf
#moudle/ged
chmod 0755 /sys/module/ged/parameters/boost_gpu_enable
chmod 0755 /sys/module/ged/parameters/ged_boost_enable
chmod 0755 /sys/module/ged/parameters/gpu_bottom_freq
chmod 0755 /sys/module/ged/parameters/gpu_cust_upbound_freq
chmod 0755 /sys/module/ged/parameters/gpu_debug_enable
chmod 0755 /sys/module/ged/parameters/gpu_dvfs_enbale
chmod 0755 /sys/module/ged/parameters/gpu_idle
echo 0 > /sys/module/ged/parameters/boost_gpu_enable
echo 0 > /sys/module/ged/parameters/ged_boost_enable
echo 238000 > /sys/module/ged/parameters/gpu_bottom_freq
echo 850000 > /sys/module/ged/parameters/gpu_cust_upbound_freq
echo 1 > /sys/module/ged/parameters/gpu_debug_enable
echo 1 > /sys/module/ged/parameters/gpu_dvfs_enbale
echo 1 > /sys/module/ged/parameters/gpu_idle
#设置gpu满频解放
chmod 0755 /d/ged/hal/custom_boost_gpu_freq
chmod 0755 /d/ged/hal/custom_upbound_gpu_freq
chmod 0755 /proc/gpufreq/gpufreq_lpt_enable
chmod 0755 /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
chmod 0755 /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
chmod 0755 /proc/gpufreq/gpufreq_limited_power
chmod 0755 /proc/gpufreq/gpufreq_limited_thermal_ignore
chmod 0755 /proc/gpufreq/gpufreq_volt_enable
chmod 0755 /proc/gpufreq/gpufreq_opp_max_freq
chmod 0755 /proc/gpufreq/gpufreq_opp_freq
chmod 0755 /proc/gpufreq/gpufreq_input_boost
chmod 0755 /d/ged/hal/fps_upper_bound
chmod 0755 /proc/gpufreq/gpufreq_lpt_enable
echo 0 > /proc/gpufreq/gpufreq_lpt_enable
echo 0 > /d/ged/hal/custom_boost_gpu_freq
echo 6 > /d/ged/hal/custom_upbound_gpu_freq
echo 1 > /proc/gpufreq/gpufreq_limited_low_batt_volt_ignore
echo 1 > /proc/gpufreq/gpufreq_limited_low_batt_volume_ignore
echo "-1 850000" > /proc/gpufreq/gpufreq_limited_power
echo 1 > /proc/gpufreq/gpufreq_limited_thermal_ignore
echo 1 > /proc/gpufreq/gpufreq_volt_enable
echo 850000 > /proc/gpufreq/gpufreq_opp_max_freq
echo 238000 > /proc/gpufreq/gpufreq_opp_freq
echo 0 > /proc/gpufreq/gpufreq_opp_freq
echo 1 > /proc/gpufreq/gpufreq_input_boost
echo 60 > /d/ged/hal/fps_upper_bound
#开启zram
echo 1610612736 > /sys/block/zram0/disksize
/system/bin/tiny_mkswap /dev/block/zram0
/system/bin/tiny_swapon /dev/block/zram0
echo 50 > /proc/sys/vm/swappines
#修改硬盘读写
chmod 0755 /sys/block/mmcblk0/queue/scheduler
chmod 0755 /sys/block/mmcblk0boot0/queue/scheduler
chmod 0755 /sys/block/mmcblk0boot1/queue/scheduler
chmod 0755 /sys/block/mmcblk0rpmb/queue/scheduler
chmod 0755 /sys/block/ram0/queue/scheduler
chmod 0755 /sys/block/zram0/queue/scheduler
echo "deadline" > /sys/block/mmcblk0/queue/scheduler
echo "deadline" > /sys/block/mmcblk0boot0/queue/scheduler
echo "deadline" > /sys/block/mmcblk0boot1/queue/scheduler
echo "deadline" > /sys/block/mmcblk0rpmb/queue/scheduler
echo "deadline" > /sys/block/ram0/queue/scheduler
echo "deadline" > /sys/block/zram0/queue/scheduler
chmod 0755 /sys/block/mmcblk0/queue/nr_requests
chmod 0755 /sys/block/mmcblk0boot0/queue/nr_requests
chmod 0755 /sys/block/mmcblk0boot1/queue/nr_requests
chmod 0755 /sys/block/mmcblk0/queue/read_ahead_kb
chmod 0755 /sys/block/mmcblk0boot0/queue/read_ahead_kb
chmod 0755 /sys/block/mmcblk0boot1/queue/read_ahead_kb
echo 1024 > /sys/block/mmcblk0/queue/nr_requests
echo 1024 > /sys/block/mmcblk0boot0/queue/nr_requests
echo 1024 > /sys/block/mmcblk0boot1/queue/nr_requests
echo 1024 > /sys/block/mmcblk0/queue/read_ahead_kb
echo 1024 > /sys/block/mmcblk0boot0/queue/read_ahead_kb
echo 1024 > /sys/block/mmcblk0boot1/queue/read_ahead_kb
#优化ZRAM和SWAP
echo 70 > /proc/sys/vm/dirty_ratio
echo 50 > /proc/sys/vm/dirty_background_ratio
echo 4000 > /proc/sys/vm/dirty_writeback_centisecs
echo 1000 > /proc/sys/vm/dirtytime_expire_seconds
echo 200 > /proc/sys/vm/vfs_cache_pressure
echo 10000 > /proc/sys/vm/min_free_kbytes
echo 60 > /proc/sys/vm/overcommit_ratio
echo 30000 > /proc/sys/vm/extra_free_kbytes
#POWERED BY 铁人司机
#完成日期：2019年4月14日 16:12