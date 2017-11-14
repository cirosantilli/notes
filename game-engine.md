# Game engine

C++ lightweight options 2017: good starting point: <https://github.com/fffaraz/awesome-cpp#game-engine>:

-   https://github.com/urho3d/Urho3D just work C++ examples, no bullshit.

    Box2D and Bullet backends, SDL based.

    No official platformer example :-( https://github.com/urho3d/Urho3D/pull/641

    Has a headless mode, and frame limiting removal.

-   https://github.com/ivansafrin/Polycode

    sudo apt-get install libphysfs-dev libopenal-dev

    Bleh, was annoying to compile on Ubuntu, so I quit for a while.

-   Cocos2d-x: by far the most popular FOSS engine, but build is annoying on Ubuntu.

    Tons of minimal examples inside the source tree.

    Surprisingly few larger game examples on GitHub however.

    Fix this build failure:


        relocation R_X86_64_32 against symbol_ZN15CProfileManager4RootE' can not be used when making a shared object; recompile with -fPIC`

    - https://github.com/cocos2d/cocos2d-x/issues/18177#issuecomment-336246283 wontfix!!!
    - http://discuss.cocos2d-x.org/t/cocos2d-v3-out-of-the-box-build-hello-world-bullet-linker-error-ubuntu-16-10/39104

    Cocos is downloading pre-built deps from: https://github.com/cocos2d/cocos2d-x-3rd-party-libs-bin which are built with: https://github.com/cocos2d/cocos2d-x-3rd-party-libs-src instead of using the repo builds :-(

    TODO: don't rebuild the entire thing for every new project! `make install` inexistent???

    Relies on fmod for sound which is closed source... but devs seem keen to make the dependency optional https://github.com/cocos2d/cocos2d-x/issues/16355 This likely also blocks Debian inclusion. An old request (does not mention fmod): https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=577236

    Demo games:

    Worked:

    - https://github.com/crosslife/OpenBird after https://github.com/crosslife/OpenBird/pull/36

    Couldn't make work:

    - <https://github.com/wilhantian/BadGame>
    - <https://github.com/cocos2d/cocos2d-x-samples>
    - <https://github.com/OneGameAMonth/Cocos2d-x>

    Using:

        sudo make install

    fails and makes me sad.

-   Godot: too much emphasis on scripting BS :-)
