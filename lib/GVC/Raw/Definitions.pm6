use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Roles::Pointers;

unit package GVC::Raw::Definitions;

# cw: This will need Distro support!
constant gvc is export = '/usr/lib/gnome-shell/libgvc.so';

constant pa_volume_t           is export := guint32;
constant pa_context            is export := Pointer;
constant pa_channel_position_t is export := guint32;
