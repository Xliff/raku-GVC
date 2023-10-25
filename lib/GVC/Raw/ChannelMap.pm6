use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GVC::Raw::Definitions;
use GVC::Raw::Structs;

unit package GVC::Raw::ChannelMap;

### /usr/src/libgnome-volume-control/gvc-channel-map.h

sub gvc_channel_map_can_balance (GvcChannelMap $map)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_channel_map_can_fade (GvcChannelMap $map)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_channel_map_get_mapping (GvcChannelMap $map)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_channel_map_get_num_channels (GvcChannelMap $map)
  returns guint
  is      native(gvc)
  is      export
{ * }

sub gvc_channel_map_get_type
  returns GType
  is      native(gvc)
  is      export
{ * }

sub gvc_channel_map_get_volume (GvcChannelMap $map)
  returns gdouble
  is      native(gvc)
  is      export
{ * }

sub gvc_channel_map_has_position (
  GvcChannelMap         $map,
  pa_channel_position_t $position
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_channel_map_new
  returns GvcChannelMap
  is      native(gvc)
  is      export
{ * }
