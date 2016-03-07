# Source tree

-   `bin/main.cpp`: `main` entry point

    Then passes to:

    - `DBusClientdbusClient::event_loop();`
    - `BusDispatcher::enter();`: TODO then? This is part of DBus.
    - I think then `timeout_->expired = new EventCallback {DRing::pollEvents};` sets up calling poll events every 10ms. That is the main event loop.

## poll_events

`manager.cpp`

The main event loop. Must be called periodically.

There are two types of callbacks it runs:

-   events: run every loop.

    Added with:

        Manager::registerEventHandler(uintptr_t handlerId, EventHandler handler)

    Some links are defined on XML introspect files, e.g.:

        exportable_callback<VideoSignal::DecodingStarted>(bind(&DBusVideoManager::startedDecoding, videoM, _1, _2, _3, _4, _5)),

    at: `videomanager-introspect`, which seems to be a Telepathy standardized interface: <https://en.wikipedia.org/wiki/Telepathy_%28software%29>

-   tasks: run only once, and then removed from the TODO list

    Added only with:

        Manager::addTask(const std::function<bool()>&& task)

    which also has a helper:

        runOnMainThread

Events are setup at `DBusClient::initLibrary(int flags)` called from `DBusClient` constructor.

### Signals

There are also signals, which are events that don't happen on `poll_event`. E.g., when you get or make a call.

Signals are registered by the client, and called by the daemon when something happens. They just call client functions directly from the daemon thread (TODO check. The daemon does run on a thread no?)

On Android, they can be used to call Android Java or JNI functions.

## Audio video

-   audio/video decoding centerpiece: `MediaDecoder::decode` which calls  `avcodec_decode_video2` / `avcodec_decode_audio4`, which are FFMpeg functions with packet inputs (sent over the network).

-   gets called by `VideoReceiveThread::decodeFrame`

    only called from `process`, only called on a separate thread from:

        , loop_(std::bind(&VideoReceiveThread::setup, this),
                std::bind(&VideoReceiveThread::process, this),
                std::bind(&VideoReceiveThread::cleanup, this))
        {}

        VideoReceiveThread::~VideoReceiveThread()
        {
            loop_.join();
        }

        void
        VideoReceiveThread::startLoop()
        {
            loop_.start();
        }

        void VideoReceiveThread::process()
        { decodeFrame(); }

    -   `process` then gets called infinitely from that separate thread because `loop_.start` leads to:

                while (state_ == RUNNING)
                    process();

    - `VideoReceiveThread` is created at: `video_rtp_session.cpp#startReceiver`

    - only called from `VideoRtpSession::start`

    - only used at `sipcall.h#video::VideoRtpSession videortp_;`

    - `start` only called at `SIPCall::startAllMedia`

                RtpSession* rtp = local.type == MEDIA_AUDIO
                    ? static_cast<RtpSession*>(avformatrtp_.get())
        #ifdef RING_VIDEO
                    : static_cast<RtpSession*>(&videortp_);

                rtp->start()

    - only called on `SIPCall::onMediaUpdate()`

### Notify client that a new frame has been decoded to be shown

When a frame is finished `VideoReceiveThread::decodeFrame()` does:

    switch (ret) {
        case MediaDecoder::Status::FrameFinished:
            publishFrame();
            return true;

which leads to an `Observer.notify(lastFrame_);` `VideoReceiveThread` inherits `Observable`.

`notify` then calls `SinkClient::update`, which is an `Observer`, which calls sink push

    `videomanager_interface.h`:

        struct SinkTarget {
            using FrameBufferPtr = std::unique_ptr<FrameBuffer>;
            std::function<FrameBufferPtr(std::size_t bytes)> pull;
            std::function<void(FrameBufferPtr)> push;
        };

pull is not set at `videomanager.i`

    DRing::registerSinkTarget((std::string const &)*arg1, DRing::SinkTarget {.pull=nullptr, .push=f_display_cb});

pull and push are only used from `sinkclient.cpp#SinkClient::update(Observable<std::shared_ptr<VideoFrame>>* /*obs*/,`, and `push` is never called because of a previous:

    if (target_.pull) {

## Android

TODO: why `DEBUG`_FPS shows two measures? Local and a huge number?

Start android from CLI:

    adb shell am start -n cx.ring/cx.ring.client.HomeActivity

## contrib

-   `contrib`: dependencies.

    They are downloaded at runtime from git or as tar balls. Hash is checked for each, and some patches applied if needed for out project.

    TODO: list major dependencies. Try out all of them.

        MediaDecoder::decode -> audio/video decoding -> avcodec_decode_video2 / avcodec_decode_audio4
