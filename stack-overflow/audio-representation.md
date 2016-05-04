# Audio representation

http://stackoverflow.com/questions/732699/how-is-audio-represented-with-numbers/36510894#36510894

**Minimal C audio generation example**

The example below generates a pure 1000k Hz sinus in that format at 44.1kHz sampling rate, and lasting 4 seconds:

    #include <math.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <stdint.h>
    
    int main(void) {
        FILE *f;
        const double PI2 = 2 * acos(-1.0);
        const double SAMPLE_FREQ = 44100;
        const unsigned int NSAMPLES = 4 * SAMPLE_FREQ;
        uint16_t ampl;
        uint8_t bytes[2];
        unsigned int t;

        f = fopen("out.raw", "wb");
        for (t = 0; t < NSAMPLES; ++t) {
            ampl = UINT16_MAX * 0.5 * (1.0 + sin(PI2 * t * 1000.0 / SAMPLE_FREQ));
            bytes[0] = ampl >> 8;
            bytes[1] = ampl & 8;
            fwrite(bytes, 2, sizeof(uint8_t), f);
        }
        fclose(f);
        return EXIT_SUCCESS;
    }

Play with:

    sudo apt-get install ffmpeg
    ffplay -autoexit -f u16be -ar 44100 -ac 1 out.raw

Parameters explained at: http://superuser.com/a/1063230/128124

Tested on Ubuntu 15.10. More [fun examples on GitHub](https://github.com/cirosantilli/cpp-cheat/blob/f734a2e76fbcfc67f707ae06be7a2a2ef5db47d1/c/interactive/audio_gen.c), including a simple Canon synth.

**Physics**

Audio is encoded as a single number for every moment in time. Compare that to a video, which needs WIDTH * HEIGHT numbers per moment in time.

This number is then converted to the linear displacement of the [diaphragm](https://en.wikipedia.org/wiki/Diaphragm_%28acoustics%29) of your speaker.

The displacement pushes air backwards and forwards, creating pressure differences, which travel through air as [P-waves](https://en.wikipedia.org/wiki/P-wave).

Only displacement matters: a constant signal, even if maximal, produces no sound: the diaphragm just stays at a fixed position.

The [sampling frequency](https://en.wikipedia.org/wiki/Sampling_%28signal_processing%29) determines how fast the displacements should be done.

[44,1kHz](https://en.wikipedia.org/wiki/44,100_Hz) is a common sampling frequency because humans can hear up to 20kHz and because of the [Nyquist–Shannon sampling theorem](https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem).

The sampling frequency is analogous to the FPS for video, although it has a much higher value compared to the 25 (cinema) - 144 (hardcore gaming monitors) range we commonly see for video.

**Formats**

`.raw` is an underspecified format that contains just the amplitude bytes, and no metadata.

We have to pass a few meta-data parameters on the command line like the sampling frequency because the format does not contain that data.

There are also other uncompressed formats which contain all needed metadata, e.g. `.wav`, see: http://stackoverflow.com/questions/10844122/wav-file-synthesis-from-scratch-c

**Biology**

Humans perceive sound mostly by their frequency decomposition (AKA [Fourier transform](https://en.wikipedia.org/wiki/Fourier_transform)).

I think this is because the inner ear has parts which resonate to different frequencies (TODO confirm). 

Therefore, when synthesizing music, we think more in terms of adding up frequencies instead of points in time. This is illustrated [in this example](https://github.com/cirosantilli/cpp-cheat/blob/f734a2e76fbcfc67f707ae06be7a2a2ef5db47d1/c/interactive/audio_gen.c#L123).

This leads to thinking in terms of a 1D vector between 20Hz and 20kHz for each point in time. 

The mathematical Fourier transform loses the notion of time, so what we do when synthesizing is to take groups of points, and sum up frequencies for that group, and take the Fourier transform there, like so:

Luckily, the Fourier transform is linear, so we can just add up and normalize displacements directly.

The size of each group of points leads to a time - frequency precision tradeoff, mediated by the same mathematics as [Heisenberg's uncertainty principle](https://en.wikipedia.org/wiki/Uncertainty_principle).

[Wavelets](http://math.stackexchange.com/questions/279980/difference-between-fourier-transform-and-wavelets) may be a more precise mathematical description of this intermediary time - frequency description.
