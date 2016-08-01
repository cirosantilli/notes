# My hardware

-   Sony Xperia
    -   Sony Xperia U ST25i. Released May 2012, stuck at Android 4.0.4. The second smartphone released by Sony, after it bought Motorola mobile.
        -   No SD card slot <http://forum.xda-developers.com/xperia-u/issues/micro-sd-card-slot-t1860365>
        -   CyanogenMod: no official image, but there is an XDA hack: <https://www.youtube.com/watch?v=jMJrLbzU2pI>
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

### T430

<http://shop.lenovo.com/us/en/laptops/thinkpad/t-series/t430/#tab-tech_specs>

TYPE 2344-CTO PBXGKXD 12/10

- Serial Number: 2344CTO
- Machine Type: PBXG
- Machine Type Model: PBXGKXD

Released 2012.

Graphics: NVIDIA NVS 5400M.

### T400

Sometimes it does not turn on.

TYPE 2764-CTO S/N R8-07DF 10/03

<https://support.lenovo.com/us/en/find-product-name> says:

- Serial Number: R807DF
- Machine Type: 2668
- Machine Type Model: 2668KHU

## Sony Xperia

### Z3 D6643

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

## Logitech C920 webcam

Savoir-faire Linux, given to me 2016.

Specs:

- <http://business.logitech.com/en-us/product/c920-hd-pro-webcam-business>
- <http://www.logitech.com/en-us/product/hd-pro-webcam-c920>

Exact part number: PN 960-000764

1080p, 30FPS

H.264 encoding on board

Implements the <https://en.wikipedia.org/wiki/USB_video_device_class> standard, which has an implementation on the Linux kernel.

## Logitech k400r wireless keyboard

Bought: 2015

Disable horrible Fn key behaviour: <http://askubuntu.com/questions/170819/how-to-program-logitech-function-keys> 

Some other k models can configure hardware directly: <http://www.logitech.com/en-us/manuals/k380-setup-guide>

## Washing machine

Laden EV1049

The filter is very small: https://www.youtube.com/watch?v=NQquRaHuGLw

## Orange Pi PC

Board LED does not turn on (turned on on first plug, Ethernet always turns on):

- <http://www.orangepi.org/orangepibbsen/forum.php?mod=viewthread&tid=470>
- <https://www.youtube.com/watch?v=ZtUn-dnJFdU> says only one specific supply worked..
- <https://www.reddit.com/r/raspberry_pi/comments/3jamn1/any_orange_pi_owners_here_help_with_power_imput/> Comment <https://www.reddit.com/r/raspberry_pi/comments/3jamn1/any_orange_pi_owners_here_help_with_power_imput/cy79a7w> says it only worked with the official supply...

Now just HDMI does not work. Possibly a monitor vs television problem:

- <http://www.orangepi.org/orangepibbsen/forum.php?mod=viewthread&tid=475>
