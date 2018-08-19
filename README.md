# play-sound

## Prerequisites

### Ubuntu

```bash
sudo apt-get install \
  freeglut3-dev \
  libalut0 \
  libalut-dev \
  libglu1-mesa-dev \
  libopenal1 \
  libopenal-dev \
  mesa-common-dev
```

If the program bails with output like the following, OpenAL may be misconfigured:

```text
AL lib: (WW) alcCloseDevice: Releasing context 0x24cb9e0
AL lib: (WW) FreeContext: (0x24cb9e0) Deleting 1 Source(s)
AL lib: (WW) FreeDevice: (0x24cd890) Deleting 2 Buffer(s)
```

One possible problem ([see][stack-overflow]) can be addressed by modifying `/etc/openal/alsoft.conf` and setting `drivers=pulse,alsa`.

### macOS

```bash
brew install alut
```

## Build and run

```bash
stack build --fast
stack exec play-sound
```

[stack-overflow]: https://stackoverflow.com/questions/39167975/no-sound-with-haskell-openal
