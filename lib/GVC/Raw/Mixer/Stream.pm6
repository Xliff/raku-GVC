use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use GVC::Raw::Definitions;
use GVC::Raw::Enums;
use GVC::Raw::Structs;

unit package GVC::Raw::Mixer::Stream;

### /usr/src/libgnome-volume-control/gvc-mixer-stream.h

sub gvc_mixer_stream_change_is_muted (
  GvcMixerStream $stream,
  gboolean       $is_muted
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_change_port (
  GvcMixerStream $stream,
  Str            $port
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_application_id (GvcMixerStream $stream)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_base_volume (GvcMixerStream $stream)
  returns pa_volume_t
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_can_decibel (GvcMixerStream $stream)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_card_index (GvcMixerStream $stream)
  returns guint
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_channel_map (GvcMixerStream $stream)
  returns GvcChannelMap
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_decibel (GvcMixerStream $stream)
  returns gdouble
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_description (GvcMixerStream $stream)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_form_factor (GvcMixerStream $stream)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_gicon (GvcMixerStream $stream)
  returns GIcon
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_icon_name (GvcMixerStream $stream)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_id (GvcMixerStream $stream)
  returns guint
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_index (GvcMixerStream $stream)
  returns guint
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_is_muted (GvcMixerStream $stream)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_name (GvcMixerStream $stream)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_port (GvcMixerStream $stream)
  returns GvcMixerStreamPort
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_ports (GvcMixerStream $stream)
  returns GList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_state (GvcMixerStream $stream)
  returns GvcMixerStreamState
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_sysfs_path (GvcMixerStream $stream)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_type
  returns GType
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_get_volume (GvcMixerStream $stream)
  returns pa_volume_t
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_is_event_stream (GvcMixerStream $stream)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_is_running (GvcMixerStream $stream)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_is_virtual (GvcMixerStream $stream)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_push_volume (GvcMixerStream $stream)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_application_id (
  GvcMixerStream $stream,
  Str            $application_id
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_base_volume (
  GvcMixerStream $stream,
  pa_volume_t    $base_volume
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_can_decibel (
  GvcMixerStream $stream,
  gboolean       $can_decibel
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_card_index (
  GvcMixerStream $stream,
  guint          $card_index
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_decibel (
  GvcMixerStream $stream,
  gdouble        $db
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_description (
  GvcMixerStream $stream,
  Str            $description
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_form_factor (
  GvcMixerStream $stream,
  Str            $form_factor
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_icon_name (
  GvcMixerStream $stream,
  Str            $name
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_is_event_stream (
  GvcMixerStream $stream,
  gboolean       $is_event_stream
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_is_muted (
  GvcMixerStream $stream,
  gboolean       $is_muted
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_is_virtual (
  GvcMixerStream $stream,
  gboolean       $is_event_stream
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_name (
  GvcMixerStream $stream,
  Str            $name
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_port (
  GvcMixerStream $stream,
  Str            $port
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_ports (
  GvcMixerStream $stream,
  GList          $ports
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_state (
  GvcMixerStream      $stream,
  GvcMixerStreamState $state
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_sysfs_path (
  GvcMixerStream $stream,
  Str            $sysfs_path
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_stream_set_volume (
  GvcMixerStream $stream,
  pa_volume_t    $volume
)
  returns uint32
  is      native(gvc)
  is      export
{ * }
