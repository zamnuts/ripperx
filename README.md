# ripperx in a web-based X session

A [ripperx](https://sourceforge.net/projects/ripperx/) web-based GUI based
on [jlesage/baseimage-gui](https://github.com/jlesage/docker-baseimage-gui).
Rip CDs to wav using cdparanoia III, and can encode to mp3, flac,
and other formats. Integrates with CDDB for audio  CD information.
Writes id3 tags. Creates m3u playlists.

- To override the default configuration, mount to `/config/.ripperXrc`. 
  Embeds a [`.ripperXrc`](ripperX.rc) containing a default configuration.
- Access via `http://localhost:5800`. HTTPS is supported, see the [README in jlesage/baseimage-gui](https://github.com/jlesage/docker-baseimage-gui/blob/master/README.md).
- Outputs files to the volume declared at path `/output`.
- Bundles a handful of encoders: `flac`, `lame`, `mppenc`, and `ogg`
