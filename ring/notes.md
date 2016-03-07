# Notes

Dump of personal notes I didn't have the time to improve on.

## Android Video

### Notes

-   benchmark:
    - hardware:
        - Logitech C920 webcam
        - Sony Xperia Z3 D6643
    - setup
        - compile dring with `EXTRA_CFLAGS=-DDEBUG_FPS ./compile.sh`
        - `adb logcat -s libdring`
    - results:
        - GNOME 240p 30FPS : Android 25 FPS
        - GNOME 1080p 30FPS : 

### Hardware ideas

Things that could be used (to be seen):

How to test it:

- http://stackoverflow.com/questions/10983486/fps-testing-in-android-application
- http://developer.android.com/training/testing/performance.html

First step to build the existing patch after checking out to it:

    diff --git a/extras/tools/packages.mak b/extras/tools/packages.mak
    index 74e6c9e..e08fbf6 100644
    --- a/extras/tools/packages.mak
    +++ b/extras/tools/packages.mak
    @@ -1,5 +1,5 @@
    GNU=http://ftp.gnu.org/gnu
    -APACHE=http://mir2.ovh.net/ftp.apache.org/dist
    +APACHE=http://archive.apache.org/dist/
    SF= http://downloads.sourceforge.net/project

    YASM_VERSION=1.2.0

But it still fails with:

    ./libtool: 1569: ./libtool: preserve_args+= --silent: not found

### External APIs I will learn

-   ffmpeg
    -   audio/video decoding centerpiece: `MediaDecoder::decode` -> `avcodec_decode_video2` / `avcodec_decode_audio4`
-   android
    -   ListView
    -   Fragment <http://developer.android.com/guide/components/fragments.html>
    -   Intent <http://developer.android.com/guide/components/intents-filters.html> <http://developer.android.com/reference/android/content/Intent.html> IPC method.
    -   SurfaceView <http://developer.android.com/reference/android/view/SurfaceView.html>
    -   LayoutInflator
        - <http://developer.android.com/reference/android/view/LayoutInflater.html>
        - <http://stackoverflow.com/questions/5026926/making-sense-of-layoutinflater>
        - <http://stackoverflow.com/questions/4735847/help-for-using-layoutinflator-to-add-views-at-runtime>
        - <http://stackoverflow.com/questions/3477422/what-does-layoutinflater-in-android-do>
    -   Service <http://developer.android.com/guide/components/services.html>
    -   import android.hardware.Camera;
        - I'd rather use camera2 since that is deprecated.
        - public class VideoManagerCallback extends VideoCallback implements Camera.PreviewCallback {
    -   RecyclerView http://developer.android.com/reference/android/support/v7/widget/RecyclerView.html
    -   android.support.v7.widget.DefaultItemAnimator;
    -   android.support.v7.widget.LinearLayoutManager;
-   swig
    - %header
    - %feature
    - %native
    - %typemap
-   ndk
    - http://developer.android.com/ndk/index.html
-   C++ code
    -   class VideoCallback: videomanager.i
    -   class ConfigurationCallback: configurationmanager.i
    -   class Callback: callmanager.i
    -   TODO where are those defined?
            long obtainFrame(int length);
            void releaseFrame(long frame);

Centerpieces of the change:

- ring-android/app/src/main/java/cs/ring/service/VideoManagerCallback.java
- ring-android/app/src/main/jni/videomanager.i

Facts:

-   Ringservice is defined at: jni_interface.i `%module (directors="1") Ringservice`

    - It is compiled to `/app/src/main/java/cx/ring/service/Ringservice.java`
    - which forwards everything to `RingserviceJNI.java`.
    - which forwards to dring's C++ calls

-   interesting paths
    -   DRingService#onCreate
        - Ringservice.init at jni_interface.i
            - const std::map<std::string, SharedCallback> videoEvHandlers = {
                - registerVideoHandlers adds the callbacks to ring::getSignalHandlers(), part of ring_signal.cpp
                    - The same is done on GNOME.

-   `DRingService` the event loop is setup at:

        private Runnable pollEvents = new Runnable() {
            @Override
            public void run() {
                getExecutor().execute(new SipRunnable() {
                    @Override
                    protected void doRun() throws SameThreadException {
                        Ringservice.pollEvents();
                    }
                });
                handler.postDelayed(this, POLLING_TIMEOUT);
            }
        };

    This automatically polls events forever because of the `handler.postDelayed` call to self.

    The initial call on `pollEvents` is done at:

        handler.postDelayed(pollEvents, POLLING_TIMEOUT);

    `pollEvents` is defined at `manager.cpp`:

        // Must be invoked periodically by a timer from the main event loop
        void Manager::pollEvents()

    Adrien told me that video runs on yet another thread.

-   android app overview:

    - client/HomeActivity.java onCreate: Entry point

-   src/client/videomanager.cpp#registerSinkTarget: register a callback that gets video data

    - sets the `target_` of the sink of given id
    - only used from `SinkClient::update(Observable<std::shared_ptr<VideoFrame>>* /*obs*/,`

-   where is `acquireNativeWindow` defined?

---

I am debugging two executables that communicate through D-BUS: `exe1` and `exe2`.

`exe1` must be running before `exe2` so that it will be found by `exe2`.

To automate the process, and avoid opening two shells manually, I want to write a script like:

    gdb exe1 &
    exe2 &>/dev/null &
    fg

such that both executables will get started, and I will be left debugging `exe1` while `exe2` runs on the background.

The problem is that I have to use `fg` *4 times* for that to work, and I have no idea why.

I could just add 4 `fg` to the script, but I'm worried it might not work at some point since I don't know what is going on.

Questions:

-   why do I have to hit `fg` multiple times?
-   how to avoid it? I'd rather not use `tmux` as it adds a dependency.

## Error

03-07 09:31:22.113 F/libc    (19063): jni/ring_wrapper.cpp:1405: void FrameAvailable(AVPacket*, int&, int&): assertion "false" failed

