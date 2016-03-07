# Architecture

## Why daemon client?

Note that it is not typical client server: communication between them is done via D-Bus, which cannot cross computers. So this could not be used to host one server on a supercomputer + clients: daemon and client must be on the same PC?

TODO: what about Window and Mac? What do they have instead of D-Bus?

## ffmpeg vs libav

ffmpeg for all clients except Mac OS X for some reason.

## D-Bus

Only for Linux. This is how client and daemon communicate.

On Windows, Mac, and Android, libdring is linked statically into a single executable. Threads are not used, which means that if the daemon part stops working there, the UI freezes.

The advantage is that this opens up in Linux the possibility of interacting with libdring differently, example to debug.
