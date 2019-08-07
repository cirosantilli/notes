# My hardware

Mine, or that I've had access to at some point.

-   Recon Jet

## ThinkPad

### W540

I don't have access to this anymore.

Released 2014, given to me 2016 by from Savoir-faire Linux.

Specs: <http://shop.lenovo.com/us/en/laptops/thinkpad/w-series/w540/#tab-tech_specs>

<https://en.wikipedia.org/wiki/ThinkPad_W_Series#W540>

Camera: `v4l2-ctl --list-formats-ext` says 720p 30 FPS.

Display: 1080p 60FPS 15.6"

Graphics: NVIDIA GK107GLM [Quadro K1100M] http://silicongenesis.stanford.edu/complete_listing.html

### P710 with NVIDIA GTX 1080

Ubuntu 16.10:

`__GL_SYNC_TO_VBLANK=0 glxgears`: 27k FPS :-)

`glmark2`:

    =======================================================
        glmark2 2014.03+git20150611.fa71af2d
    =======================================================
        OpenGL Information
        GL_VENDOR: 	NVIDIA Corporation
        GL_RENDERER:   GeForce GTX 1080/PCIe/SSE2
        GL_VERSION:	4.5.0 NVIDIA 375.39
    =======================================================
    [build] use-vbo=false: FPS: 11541 FrameTime: 0.087 ms
    [build] use-vbo=true: FPS: 24095 FrameTime: 0.042 ms
    [texture] texture-filter=nearest: FPS: 23185 FrameTime: 0.043 ms
    [texture] texture-filter=linear: FPS: 23179 FrameTime: 0.043 ms
    [texture] texture-filter=mipmap: FPS: 23209 FrameTime: 0.043 ms
    [shading] shading=gouraud: FPS: 22256 FrameTime: 0.045 ms
    [shading] shading=blinn-phong-inf: FPS: 22304 FrameTime: 0.045 ms
    [shading] shading=phong: FPS: 21591 FrameTime: 0.046 ms
    [shading] shading=cel: FPS: 21558 FrameTime: 0.046 ms
    [bump] bump-render=high-poly: FPS: 17197 FrameTime: 0.058 ms
    [bump] bump-render=normals: FPS: 24586 FrameTime: 0.041 ms
    [bump] bump-render=height: FPS: 23935 FrameTime: 0.042 ms
    [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 20152 FrameTime: 0.050 ms
    [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 15354 FrameTime: 0.065 ms
    [pulsar] light=false:quads=5:texture=false: FPS: 23693 FrameTime: 0.042 ms
    [desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: FPS: 7046 FrameTime: 0.142 ms
    [desktop] effect=shadow:windows=4: FPS: 9241 FrameTime: 0.108 ms
    [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 1270 FrameTime: 0.787 ms
    [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: FPS: 1370 FrameTime: 0.730 ms
    [buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 1365 FrameTime: 0.733 ms
    [ideas] speed=duration: FPS: 11825 FrameTime: 0.085 ms
    [jellyfish] <default>: FPS: 17647 FrameTime: 0.057 ms
    [terrain] <default>: FPS: 1683 FrameTime: 0.594 ms
    [shadow] <default>: FPS: 17168 FrameTime: 0.058 ms
    [refract] <default>: FPS: 6382 FrameTime: 0.157 ms
    [conditionals] fragment-steps=0:vertex-steps=0: FPS: 22375 FrameTime: 0.045 ms
    [conditionals] fragment-steps=5:vertex-steps=0: FPS: 22355 FrameTime: 0.045 ms
    [conditionals] fragment-steps=0:vertex-steps=5: FPS: 22480 FrameTime: 0.044 ms
    [function] fragment-complexity=low:fragment-steps=5: FPS: 22616 FrameTime: 0.044 ms
    [function] fragment-complexity=medium:fragment-steps=5: FPS: 22500 FrameTime: 0.044 ms
    [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 22584 FrameTime: 0.044 ms
    [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 22530 FrameTime: 0.044 ms
    [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 22352 FrameTime: 0.045 ms
    =======================================================
                                    glmark2 Score: 17352
    =======================================================

### P51

Summary string:

    Lenovo ThinkPad P51 laptop with CPU: Intel Core i7-7820HQ CPU (4 cores / 8 threads, 2.90 GHz base, 8 MB cache), RAM: 2x Samsung M471A2K43BB1-CRC (2x 16GiB, 2400 Mbps), SSD: Samsung MZVLB512HAJQ-000L7 (512GB, 3,000 MB/s).

Bought: 2017.

HW specs:

- 32GB(16+16) DDR4 2400MHz SODIMM
- 512GB SSD PCIe TLC OPAL2
- 1TB hard disk
- Windows 10 Pro 64
- Windows 10 Pro 64 WE (EN/FR/DE/NL/IT)
- 15.6" FHD (1920x1080), anti-glare, IPS
- NVIDIA Quadro M1200 4GB GDDR5 GPU
- With Color Sensor
- 720p HD Camera with Microphone
- Keyboard with Number Pad - Euro English
- 3+3BCP, Fingerprint Reader,Color Sensor
- Integrated Fingerprint Reader
- Hardware dTPM2.0 Enabled
- 1TB 5400rpm HDD
- 170W AC Adapter - UK(3pin)
- 6 Cell Li-Polymer Battery, 90Wh
- Intel Dual Band Wireless AC(2x2) 8265, Bluetooth Version 4.1, vPro

Ubuntu 17.10 setup fun:

- partition setup: https://askubuntu.com/questions/343268/how-to-use-manual-partitioning-during-installation/976430#976430
- BIOS:
    - for NVIDIA driver: https://askubuntu.com/questions/343268/how-to-use-manual-partitioning-during-installation/976430#976430
    - for KVM, required by Android Emulator: enable virtualization extensions
- TODO fix the brightness keys:
    - failed: https://askubuntu.com/questions/769006/brightness-key-not-working-ubuntu-16-04-lts/770100#770100

Reddit threads:

- https://www.reddit.com/r/linux4noobs/comments/5zyejw/update_1604_tp_1610_boot_hangs_at_started_nvidia/
- https://www.reddit.com/r/Lenovo/comments/6g8m9w/ubuntu_on_lenovo_p51/
- https://www.reddit.com/r/thinkpad/comments/6hi0zn/if_youre_thinking_of_running_linux_on_a_p51_read/

Battery life:

- before GPU: 8h
- after GPU: 6.5h

lshw: [p51-lshw](p51-lshw)

hwinfo: [p51-hwinfo](p51-hwinfo)

dmidecode: [p51-dmidecode](p51-dmidecode)

2019-04-17: popup asking about "ThinkPad P51 Management Engine Update" from from 182.29.3287 to 184.60.3561, said yes.

#### P51 CPU

Intel Core i7-7820HQ.

https://ark.intel.com/products/97496/Intel-Core-i7-7820HQ-Processor-8M-Cache-up-to-3-90-GHz- | http://web.archive.org/web/20181224203737/https://ark.intel.com/products/97496/Intel-Core-i7-7820HQ-Processor-8M-Cache-up-to-3-90-GHz-

8MB Cache, up to 3.90GHz, 4 cores / 8 threads.

Recommended customer price: 378.00 USD. Launch date: Q1'17, process: 14 nm.

`cat /proc/cpuinfo`:

    processor       : 0
    vendor_id       : GenuineIntel
    cpu family      : 6
    model           : 158
    model name      : Intel(R) Core(TM) i7-7820HQ CPU @ 2.90GHz
    stepping        : 9
    microcode       : 0x8e
    cpu MHz         : 1029.568
    cache size      : 8192 KB
    physical id     : 0
    siblings        : 8
    core id         : 0
    cpu cores       : 4
    apicid          : 0
    initial apicid  : 0
    fpu             : yes
    fpu_exception   : yes
    cpuid level     : 22
    wp              : yes
    flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_g
    ood nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsav
    e avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx rdseed a
    dx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp flush_l1d
    bugs            : cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf
    bogomips        : 5808.00
    clflush size    : 64
    cache_alignment : 64
    address sizes   : 39 bits physical, 48 bits virtual
    power management:

`getconf -a | grep CACHE`:

    LEVEL1_ICACHE_SIZE                 32768
    LEVEL1_ICACHE_ASSOC                8
    LEVEL1_ICACHE_LINESIZE             64
    LEVEL1_DCACHE_SIZE                 32768
    LEVEL1_DCACHE_ASSOC                8
    LEVEL1_DCACHE_LINESIZE             64
    LEVEL2_CACHE_SIZE                  262144
    LEVEL2_CACHE_ASSOC                 4
    LEVEL2_CACHE_LINESIZE              64
    LEVEL3_CACHE_SIZE                  8388608
    LEVEL3_CACHE_ASSOC                 16
    LEVEL3_CACHE_LINESIZE              64
    LEVEL4_CACHE_SIZE                  0
    LEVEL4_CACHE_ASSOC                 0
    LEVEL4_CACHE_LINESIZE              0

#### P51 RAM

2x Samsung M471A2K43BB1-CRC (2x 16GiB)

https://www.samsung.com/semiconductor/dram/module/M471A2K43BB1-CRC/ | http://web.archive.org/web/20181224202657/https://www.samsung.com/semiconductor/dram/module/M471A2K43BB1-CRC/

https://www.amazon.co.uk/Samsung-DDR4-16-GB-DDR4-2400-MHz-Memory-Module/dp/B016N24XKQ | http://web.archive.org/web/20181224203214/https://www.amazon.co.uk/Samsung-DDR4-16-GB-DDR4-2400-MHz-Memory-Module/dp/B016N24XKQ 355.43 UK Pounds for 2x 16 GiB.

#### P51 SSD

Samsung MZVLB512HAJQ-000L7, 512GB.

https://www.samsung.com/semiconductor/ssd/client-ssd/MZVLB512HAJQ/ | http://web.archive.org/web/20181224225400/https://www.samsung.com/semiconductor/ssd/client-ssd/MZVLB512HAJQ/

https://www.samsung.com/semiconductor/global.semi/file/resource/2018/05/PM981_M.2_SSD_Datasheet_v1.3_for_General.pdf | http://web.archive.org/web/20181224225410/https://www.samsung.com/semiconductor/global.semi/file/resource/2018/05/PM981_M.2_SSD_Datasheet_v1.3_for_General.pdf

hdparam

    Timing cached reads:   30426 MB in  1.99 seconds = 15273.67 MB/sec
    Timing buffered disk reads: 4570 MB in  3.00 seconds = 1523.14 MB/sec

Nominal maximum sequential read speed: 3,000 MB/s

#### P51 Hard disk

Seagate ST1000LM035-1RK1, 1TB.

https://www.disctech.com/Seagate-ST1000LM035-1TB-SATA-Hard-Drive 80 USD | http://web.archive.org/web/20181224201408/https://www.disctech.com/Seagate-ST1000LM035-1TB-SATA-Hard-Drive

https://www.seagate.com/www-content/datasheets/pdfs/mobile-hddDS1861-2-1603-en_US.pdf | http://web.archive.org/web/20181225095438/https://www.seagate.com/www-content/datasheets/pdfs/mobile-hddDS1861-2-1603-en_US.pdf

hdparam

    Timing cached reads:   34128 MB in  1.99 seconds = 17136.31 MB/sec
    Timing buffered disk reads: 388 MB in  3.01 seconds = 129.00 MB/sec

Nominal maximum speed: 140MB/s

### T430

<http://shop.lenovo.com/us/en/laptops/thinkpad/t-series/t430/#tab-tech_specs>

TYPE 2344-CTO PBXGKXD 12/10

- Serial Number: 2344CTO
- Machine Type: PBXG
- Machine Type Model: PBXGKXD

Released 2012.

Graphics: NVIDIA NVS 5400M.

1600x900 max resolution.

#### Intel i5-3210M CPU

<https://ark.intel.com/products/67355/Intel-Core-i5-3210M-Processor-3M-Cache-up-to-3_10-GHz-rPGA>

Launch date: Q2'12

Price: 225 USD

TDP: 35W

2.5GHz

Cores: 2

AVX extension (4 32-bit floats).

FMA GFLOPS: 2.5 * 2 * 4 = 20

Ubuntu 16.10 `glmark2`:

    =======================================================
        glmark2 2014.03+git20150611.fa71af2d
    =======================================================
        OpenGL Information
        GL_VENDOR:     NVIDIA Corporation
        GL_RENDERER:   NVS 5400M/PCIe/SSE2
        GL_VERSION:    4.5.0 NVIDIA 375.39
    =======================================================
    [build] use-vbo=false: FPS: 2341 FrameTime: 0.427 ms
    [build] use-vbo=true: FPS: 2286 FrameTime: 0.437 ms
    [texture] texture-filter=nearest: FPS: 2146 FrameTime: 0.466 ms
    [texture] texture-filter=linear: FPS: 2261 FrameTime: 0.442 ms
    [texture] texture-filter=mipmap: FPS: 2366 FrameTime: 0.423 ms
    [shading] shading=gouraud: FPS: 2028 FrameTime: 0.493 ms
    [shading] shading=blinn-phong-inf: FPS: 1846 FrameTime: 0.542 ms
    [shading] shading=phong: FPS: 1521 FrameTime: 0.657 ms
    [shading] shading=cel: FPS: 1554 FrameTime: 0.644 ms
    [bump] bump-render=high-poly: FPS: 956 FrameTime: 1.046 ms
    [bump] bump-render=normals: FPS: 2265 FrameTime: 0.442 ms
    [bump] bump-render=height: FPS: 2228 FrameTime: 0.449 ms
    [effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 1180 FrameTime: 0.847 ms
    [effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 504 FrameTime: 1.984 ms
    [pulsar] light=false:quads=5:texture=false: FPS: 1205 FrameTime: 0.830 ms
    [desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: FPS: 401 FrameTime: 2.494 ms
    [desktop] effect=shadow:windows=4: FPS: 634 FrameTime: 1.577 ms
    [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 464 FrameTime: 2.155 ms
    [buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: FPS: 709 FrameTime: 1.410 ms
    [buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 685 FrameTime: 1.460 ms
    [ideas] speed=duration: FPS: 1336 FrameTime: 0.749 ms
    [jellyfish] <default>: FPS: 605 FrameTime: 1.653 ms
    [terrain] <default>: FPS: 64 FrameTime: 15.625 ms
    [shadow] <default>: FPS: 745 FrameTime: 1.342 ms
    [refract] <default>: FPS: 199 FrameTime: 5.025 ms
    [conditionals] fragment-steps=0:vertex-steps=0: FPS: 1065 FrameTime: 0.939 ms
    [conditionals] fragment-steps=5:vertex-steps=0: FPS: 769 FrameTime: 1.300 ms
    [conditionals] fragment-steps=0:vertex-steps=5: FPS: 1168 FrameTime: 0.856 ms
    [function] fragment-complexity=low:fragment-steps=5: FPS: 1196 FrameTime: 0.836 ms
    [function] fragment-complexity=medium:fragment-steps=5: FPS: 1080 FrameTime: 0.926 ms
    [loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 1216 FrameTime: 0.822 ms
    [loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 1172 FrameTime: 0.853 ms
    [loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 1077 FrameTime: 0.929 ms
    =======================================================
                                    glmark2 Score: 1250
    =======================================================

### T400

Thrown out: 2017

Sometimes it does not turn on.

TYPE 2764-CTO S/N R8-07DF 10/03

<https://support.lenovo.com/us/en/find-product-name> says:

- Serial Number: R807DF
- Machine Type: 2668
- Machine Type Model: 2668KHU

#### NVIDIA NVS 310 GPU

Release date: 2012

Price: 130 dollars.

GFLOPS: TODO.

#### Intel Xeon E5-1660 v3 CPU

<https://ark.intel.com/products/82766/Intel-Xeon-Processor-E5-1660-v3-20M-Cache-3_00-GHz>

Price: 1000 dollars.

TDP: 140 W

Release date: Q3'14

3.0GHz

Cores: 16

AVX2 extension (8 32-bit floats).

FMA GFLOPS: 3.0 * 16 * 8 = 384

## Sony Xperia

### Sony Xperia Z3 D6643

Specs:

- <http://www.sonymobile.com/us/products/phones/xperia-z3/#specifications>
- <http://www.gsmarena.com/sony_xperia_z3-6539.php>

Display: 5.2" FHD 1080p (1920x1080) TODO 60FPS?

Carrier: Vivo.

Camera:

- video: 2160p@30fps, 1080p@60fps, 720p@120fps, HDR, check quality

Released 2015, bought dec 2015 in Brazil.

Brazil only model it seems, <http://forum.xda-developers.com/z3/help/how-to-proceed-d6643-model-t2960099>, but very similar to the more international D6653.

Battery removal is non trivial if you have no experience: <https://www.youtube.com/watch?v=lKkqT5nF7Yw> Requires the sucking

Service menu review: <https://www.youtube.com/watch?v=msHrHeLX1Ok>

SoC: Qualcomm MSM8974AC Snapdragon 801, Quad-core 2.5GHz, 64-bit.

CPU: Krait 400 <https://en.wikipedia.org/wiki/Krait_%28CPU%29> ARMv7-A architecture custom core (architecture license).

GPU: Adreno 330

2018: I think the SD card got pulled out, then:

- it takes a while for display to show up after phone sleeps (power button, and wait a few minutes. Immediate wakeup works, it must enter some sleep mode afterwards)
- there are random flickers / static after it comes back, or when some actions come up:
    - <https://www.youtube.com/watch?v=y-BYsu1h7RA>
    - <https://www.youtube.com/watch?v=9LBR9cGs_xs>
    - <https://talk.sonymobile.com/t5/Xperia-Z2/Colored-Lines-on-Screen-and-Flickering/td-p/1096112>

I removed SD card, and did factory reset, but nothing.

Safe mode: hold power button, then hold power off on screen, then it asks you. Disables all third party apps (non-pre installed).

Tried opening it, it was hard, all glued crap. Managed, but could see nothing wrong with display cable.

### Sony Xperia L1 G3311

Bought: 2017.

<https://www.gsmarena.com/sony_xperia_l1-8619.php>

### Sony Xperia U ST25i

Released May 2012, stuck at Android 4.0.4. The second smartphone released by Sony, after it bought Motorola mobile.

No SD card slot <http://forum.xda-developers.com/xperia-u/issues/micro-sd-card-slot-t1860365>

CyanogenMod: no official image, but there is an XDA hack: <https://www.youtube.com/watch?v=jMJrLbzU2pI>

TODO: lost 2019?

## Logitech C920 webcam

Savoir-faire Linux, given to me 2016.

Specs:

- <http://business.logitech.com/en-us/product/c920-hd-pro-webcam-business>
- <http://www.logitech.com/en-us/product/hd-pro-webcam-c920>

Exact part number: PN 960-000764

1080p, 30FPS

H.264 encoding on board

Implements the <https://en.wikipedia.org/wiki/USB_video_device_class> standard, which has an implementation on the Linux kernel.

## Keyboard

### Kinesis Advantage 2

Serial: 45470A2

Buy date: 2018-04-10

Supplier: Osmond Group Limited

## Motorola 6G

https://www.gsmarena.com/motorola_moto_g6-9000.php

Bought: 2018. Price: ~150 USD.

2018-11: screen broken when a bowl fell on it from just one foot height...

Cannot get compass working... seems to work only when on a car moving fast.

## Logitech k400r wireless keyboard

Bought: 2015

Disable horrible Fn key behaviour: <http://askubuntu.com/questions/170819/how-to-program-logitech-function-keys>

Some other k models can configure hardware directly: <http://www.logitech.com/en-us/manuals/k380-setup-guide>

## Logitech k400r wireless keyboard

## Washing machine

Laden EV1049

The filter is very small: https://www.youtube.com/watch?v=NQquRaHuGLw

## Orange Pi PC

<http://www.orangepi.org/orangepipc/>

Board LED does not turn on (turned on on first plug, Ethernet always turns on):

- <http://www.orangepi.org/orangepibbsen/forum.php?mod=viewthread&tid=470>
- <https://www.youtube.com/watch?v=ZtUn-dnJFdU> says only one specific supply worked..
- <https://www.reddit.com/r/raspberry_pi/comments/3jamn1/any_orange_pi_owners_here_help_with_power_imput/> Comment <https://www.reddit.com/r/raspberry_pi/comments/3jamn1/any_orange_pi_owners_here_help_with_power_imput/cy79a7w> says it only worked with the official supply...

Now just HDMI does not work. Possibly a monitor vs television problem:

- <http://www.orangepi.org/orangepibbsen/forum.php?mod=viewthread&tid=475>

## TTL to USB

- https://web.archive.org/web/20160903121838/http://www.ebay.co.uk/itm/CP2102-Micro-USB-to-UART-TTL-Serial-Adapter-3-3V-5V-6Pin-for-ESP8266-Arduino-Pi-/181919478543 idVendor=10c4  idProduct=ea60

## Raspberry Pi

### Raspberry Pi 2

Model B V 1.1.

SoC: BMC2836

<https://www.raspberrypi.org/products/raspberry-pi-2-model-b/>

As of 2018-12, I believe that I might have fried the UART on this board when I burnt my last UART to USB converter by connecting ground to 5V.

Linux kernel logs don't show, but do show with the exact same components on the Pi 3 (SD card with `enable_uart=1` + image Raspbian Lite 2018-11-03 and UART cables).

Linux on SSH and bare metal blinker both work on this board, so the rest of the board seems alive.

Serial from `cat /proc/cpuinfo`: 00000000a50c1f69

### Raspberry Pi 3

Model B V 1.2.

SoC: BCM2837

Serial from `cat /proc/cpuinfo`: 00000000c77ddb77

## BBC Micro Bit

<https://en.wikipedia.org/wiki/Micro_Bit>

## Internet speed

Home 2017/08 TalkTalk 38Mbps nominal, Google M-lab speed test:

- 36.4 Mbps download
- 9.15 Mbps up
- 58 ms latency over 80km of first world

## Kindle

Kindle D01100

## House

### How to block sunlight from windows

https://diy.stackexchange.com/questions/27669/how-can-i-thoroughly-blackout-a-bedroom-window-on-a-budget

### House 2018-01

#### House 2018-01 aluminium extractor filter

This is the exact model: https://shop.elica.com/en/accessori/filtro-grassi-in-alluminio-cod-gf03fc.html | http://web.archive.org/web/20190707053526/https://shop.elica.com/en/accessori/filtro-grassi-in-alluminio-cod-gf03fc.html

Brand on extractor glass: Elica: https://elica.com

Dimensions: 45.9cm x 17.6cm on the exterior. Too long to fit into any container that we have.

Brand on filter itself: "ARMA Filtre a.s." based on markings: http://www.armafiltre.com.tr/uygulamalar/7/3/en/Home-Appliances.html Cannot find any model on website however... looks like Elica's B2B supplier only.

Marker inside after removing filter: 12NC: 208298104403 Model: CIAK GR/A/56.

2018: noticed that it was unbearably greasy, tried to clean, but even boiling water didn't help.

July 2019 message:

Aluminium extractor filter for 208298104403

Hi there,

I'm trying to buy a spare aluminium extractor filter for an Elica extractor, but I can't find the right size on the website.

My 12NC is : 208298104403

My filter looks a lot like this: https://shop.elica.com/en/accessori/filtro-grassi-in-alluminio-cod-GRI0077330A.html but the dimensions are different: I measured 45.9cm x 17.6cm on my old one.

Do you have that for sale?

#### House 2018-01 kitchen tap

Looks a lot like: Bristan Monza EF Sink Mixer Chrome https://www.bathroomsensations.co.uk/Bristan-Monza-EF-Sink-Mixer-Chrome.html

How to open: https://www.youtube.com/watch?v=oHTpOG1Uhzw

#### House 2018-01 extractor light bulb

2019-05: left one burnt. Was: DURA G4 12V20W: https://www.amazon.co.uk/Halogen-Light-Bulbs-Lamps-5watt/dp/B003IVP12A Replaced: Sainsbury's halogen G4 20W12V.

#### Toilet mirror lamps

When I came, two Bell GU4 (MR11) 20W 12v.

One burnt. Put in an ASDA halogen one.

ASDA burnt, put in TopLux on right, old Bell left.

2019-01-24, right one burnt a few days ago, old Bell still works. Inner part black, and black dot on the wire. Putting new TopLux again, but this time on the left, old bell on right.

2019-01-24 toilet top lamp also burnt a few days ago, but not at the same time as mirror. Diall, 240V 40W, GU10. Putting in IKEA 240V 35W.

2019-02-02 toilet mirror lamp left (TopLux) burnt. Don't know what to do anymore. Only the magic Bell lamp works.

2019-03-06 toilet top lamp left burnt, IKEA 240V 35W GU10. Putting in another one.

2019-03-28 toilet top lamp right burnt, IKEA 240V 35W GU10. Waiting for people to come to look at transformer, there is definitely something wrong.

2019-04-03 top lamps: replaced with LED (LAP GU10 3W) since lower power, transformer not changed. Mirror lamps: transformer changed, left one replaced with Homebase Halogen 20W 12V. When I came back lamps flickering badly and sometimes not turning on, recalled technician.

2019-04-12 mirror lamp: it was just he connector that was bad, it was changed, also put LEDs there to make it less warm and hopefully have less tear on connector.

## Bicycle

### Kross

TODO exact model. Polish brand. Hybrid style bike: https://en.wikipedia.org/wiki/Hybrid_bicycle

2019-07-26: the front crank was sometimes making loud cracking noises when I pedalled hard. Then, after two weeks, it also started making very loud screeching noises, and then finally I couldn't pedal anymore, and I took it to the shop. They changed the bottom bracket, 45 pounds, 30 for the piece, a BB UN55 Shimano bottom bracket: https://www.chainreactioncycles.com/shimano-un55-square-taper-bottom-bracket/rp-prod71369 | http://web.archive.org/web/20190726190947/https://www.chainreactioncycles.com/shimano-un55-square-taper-bottom-bracket/rp-prod71369 Photo of the piecet that was taken out, notice some broken metal pieces and one of the ball bearing that were left: https://photos.app.goo.gl/6sqbM4kgDG5Pm7p58

2019-06-30: fill tires, using 90PSI, was TODO

2019-06-20: right gear wire broke, when opened for fixing was rusty near hand shifter

2019-04-07: fill tires, using 90PSI, was 40PSI. Also on Giant Flourish.

2019-03-30: repair bearings back wheel, true back wheel, remove rust from chain. Result: 50 pounds:

- cassette Shimano HG50 8 speed: https://bike.shimano.com/en-NZ/product/component/claris-r2000/CS-HG50-8.html tooth counts: 11-13-15-18-21-24-28-34T
- chain KMC Z51 7-8X Chain because 0.7 stretch reached (limit 0.5)
- oil on back wheel bearings no replace

Tick on back wheel stopped. Back break did not get better. Gears not improved. Rust remained, was told too hard to remove, and not on teeth, so should not matter.

2018-09-02: spoke https://www.dtswiss.com/en/products/spokes-nipples/spokes/dt-champion/ + minor brake work 41 pounds full work

2018: front tire blew up and was replaced by TODO.

2017: bought used 100 pounds. Specs when bought follow:

Back tire: Schwalbe Marathon Plus Tour 42-622 (28 x 1.60, 700x40C) https://www.schwalbe.com/en/unplattbar.html Schrader valve.

Back hub: Shimano FH-RM30

Front tire: did not take note, was later changed.

Front hub: Shimano DH-3N20 dynamo front hub https://www.fawkes-cycles.co.uk/2912/products/shimano-nexus-dh-3n20-6v-30w-nutted-dynamo-front-hub-for-use-with-rim-brakes-36h.aspx

Speed meter: Speedmaster 5000, CR2032 battery. https://26bikes.com/shop/accessories/computers/wire/prod/speedmaster-5000 | http://web.archive.org/web/20190418182410/https://26bikes.com/shop/accessories/computers/wire/prod/speedmaster-5000

Front light: AXA Sprint 10 Switch LED Front Light https://www.bike24.com/p213267.html

### Giant Flourish FS 2

Bought: 2019-01, 400 pounds, XS. Hybrid style bike.

https://www.liv-cycling.com/ie/flourish-fs-2 | http://web.archive.org/web/20190124201848/https://www.liv-cycling.com/ie/flourish-fs-2

#### Kryptonite NEW-U - KRYPTOLOK STANDARD

https://www.kryptonitelock.com/content/kryt-us-2/en/products/product-information/current-key/002031.html | http://web.archive.org/web/20190124201119/https://www.kryptonitelock.com/content/kryt-us-2/en/products/product-information/current-key/002031.html

### Bike pump

2019-03: Giant control tower 3 floor pump 20 pounds. Works on both Schrader and Presta.

## Shoes

### Nike Flex Experience RN 6 Grey

Amazing shoes! Bought: 2017Q4.

https://www.amazon.in/Nike-Mens-Experience-Running-Shoes/dp/B07CQLHV9C | http://web.archive.org/web/20190504122243/https://www.amazon.in/Nike-Mens-Experience-Running-Shoes/dp/B07CQLHV9C

Shoestring length: 1.185m

Replaced with after bicycle ate it: 1.0m, also worked but at limit.

Size: EUR 45.

## Glasses

### Jaeger 307

53 18-145 C.16

Bought: 2019-04, 300 pounds from Boots.

Finish: Boots Protect Plus

Glazing: Supra.

https://www.boots.com/mens-designer-jaeger-mod-307-mens-glasses---gunmetal-10254829 | http://web.archive.org/web/20190506090045/https://www.boots.com/mens-designer-jaeger-mod-307-mens-glasses---gunmetal-10254829

## Mechanical tools

6 10/11/12/13/14/17 mm Combination Wrench Set WRENCH SET COMBINATION Open-Ended Spanner/Ring Spanner Set https://www.amazon.co.uk/gp/product/B07BZLVGX8 But they sent one wrong, 8 instead of 11. Chrome Vanadium Steel

Magnusson AMS49 5M TAPE MEASURE 5m retractable flexible rule. https://www.screwfix.com/p/magnusson-ams49-5m-tape-measure/5315v

## Body

Hand great span <https://en.wikipedia.org/wiki/Span_(unit)>: 0.22m
