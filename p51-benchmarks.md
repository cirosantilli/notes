# P51 benchmarks

    vbank_mode=0 glxgears

no NVIDIA driver: 9k FPS

    __GL_SYNC_TO_VBLANK=0 glxgears NVIDIA driver

when it magically booted (only managed once) before setting BIOS discrete graphics: 14k FPS

After setting BIOS discrete graphics: 22k FPS

    sysbench --test=cpu --cpu-max-prime=20000 run
    WARNING: the --test option is deprecated. You can pass a script name or path on the command line without any options.
    sysbench 1.0.8 (using system LuaJIT 2.0.4)

    Running the test with following options:
    Number of threads: 1
    Initializing random number generator from current time


    Prime numbers limit: 20000

    Initializing worker threads...

    Threads started!

    CPU speed:
        events per second:   515.64

    General statistics:
        total time:                          10.0018s
        total number of events:              5158

    Latency (ms):
            min:                                  1.91
            avg:                                  1.94
            max:                                  2.65
            95th percentile:                      2.00
            sum:                              10000.66

    Threads fairness:
        events (avg/stddev):           5158.0000/0.

## Disk benchmarks

gnome-disks:

- average read write: 99.4 MB/s (100 samples)
- average write rate: 2.8 MB/s (100 samples)
- average access time: 18.81 msec (1000 samples)
