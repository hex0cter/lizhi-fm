# lizhi-fm

[![Gem Version](https://badge.fury.io/rb/lizhi-fm.svg)](https://badge.fury.io/rb/lizhi-fm)
[![Build Status](https://travis-ci.org/hex0cter/lizhi-fm.svg?branch=master)](https://travis-ci.org/hex0cter/lizhi-fm)

This Ruby gem allows you to download music files from lizhi.fm from command line.

## How to install it

```bash
  gem install lizhi-fm
```

## How to download music files

```bash
  lizhi download <yaml>
```

Your yaml file defines the list of music you wanna download and has to follow certain formats. Below is an example of it:

```yaml
headers:
  Referer: http://www.lizhi.fm/box
resources:
  - name: 01-01.mp3
    url: http://cdn5.lizhi.fm/audio/2016/10/25/2564306333261015558_hd.mp3
  - name: 01-02.mp3
    url: http://cdn5.lizhi.fm/audio/2015/11/11/2499655571385248262_hd.mp3
```

After running this command, all the files list by ```url``` will be downloaded to your current diretory.

## License

This code is free to use under the terms of the MIT license.
