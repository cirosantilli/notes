# Game engine

C++ lightweight options 2017: good starting point: <https://github.com/fffaraz/awesome-cpp#game-engine>:

-   https://github.com/urho3d/Urho3D just work C++ examples, no bullshit.

    Box2D and Bullet backends, SDL based. Feels elegant.

    No official platformer example :-( Very few examples overall: https://github.com/urho3d/Urho3D/pull/641

    2D feels second-rate compared to 3D:

    - https://stackoverflow.com/questions/47488411/how-to-scale-a-sprite2d-in-urho3d-without-rescaling-the-entire-node
    - no arbitrary shaders? Only bitmaps?
        - https://discourse.urho3d.io/t/2d-lights-shaders-glow-shadows/251
        - https://github.com/urho3d/Urho3D/issues/462

    Has a headless mode, and frame limiting removal.

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

-   https://github.com/ivansafrin/Polycode

    sudo apt-get install libphysfs-dev libopenal-dev libfreetype6-dev

    Bleh, was annoying to compile on Ubuntu, so I quit for a while.

        CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
        Please set them or make sure they are set and tested correctly in the CMake files:                       
        ASSIMP_INCLUDE_DIR
          used as include directory in directory /home/ciro/git/Polycode/Tools/Contents/polyimport

    Dead since 2015.

    Demos seem promising, actual platformers and pong: https://www.youtube.com/watch?v=Ik3ImYElcD0

    Bullet and box2d frontends.

-   https://github.com/oxygine/oxygine-framework

    Well, the distinctively named "Game" example compiled fine, but I get bad vibes from that project for some reason. Not that many examples either.

    Box2D is not integrated apparently, one of the examples copy pastes Box2D source into the tree to use it.

-   Godot: too much emphasis on scripting BS :-)

-   irrilicht: no rigid body physics, only hard collision, and some bullet3d hacks which I dare not touch ever :-)

-   atomic: Urho3D fork, which was later re-open sourced. More focus on scripting apparently? Fail :-(
