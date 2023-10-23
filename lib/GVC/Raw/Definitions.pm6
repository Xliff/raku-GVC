use v6.c;

use NativeCall;

use GLib::Roles::Pointers;

unit package GVC::Raw::Definitions;

# cw: This will need Distro support!
constant gvc is export = '/usr/lib/gnome-shell/libgvc.so';

class GvcMixerControl      is repr<CPointer> does GLib::Roles::Pointers is export {}
class GvcMixerUIDevice     is repr<CPointer> does GLib::Roles::Pointers is export {}
class GvcMixerStream       is repr<CPointer> does GLib::Roles::Pointers is export {}
class GvcMixerCard         is repr<CPointer> does GLib::Roles::Pointers is export {}
