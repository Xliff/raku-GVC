use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GVC::Raw::Definitions;
use GVC::Raw::Enums;

unit package GVC::Raw::MixerControl;

### /usr/src/libgnome-volume1-control/gvc-mixer-control.h

sub gvc_mixer_control_change_input (
  GvcMixerControl  $control,
  GvcMixerUIDevice $input
)
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_change_output (
  GvcMixerControl  $control,
  GvcMixerUIDevice $output
)
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_change_profile_on_selected_device (
  GvcMixerControl  $control,
  GvcMixerUIDevice $device,
  Str              $profile
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_close (GvcMixerControl $control)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_cards (GvcMixerControl $control)
  returns GSList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_default_sink (GvcMixerControl $control)
  returns GvcMixerStream
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_default_source (GvcMixerControl $control)
  returns GvcMixerStream
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_event_sink_input (GvcMixerControl $control)
  returns GvcMixerStream
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_sink_inputs (GvcMixerControl $control)
  returns GSList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_sinks (GvcMixerControl $control)
  returns GSList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_source_outputs (GvcMixerControl $control)
  returns GSList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_sources (GvcMixerControl $control)
  returns GSList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_state (GvcMixerControl $control)
  returns GvcMixerControlState
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_stream_from_device (
  GvcMixerControl  $control,
  GvcMixerUIDevice $device
)
  returns GvcMixerStream
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_streams (GvcMixerControl $control)
  returns GSList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_type
  returns GType
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_vol_max_amplified (GvcMixerControl $control)
  returns gdouble
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_get_vol_max_norm (GvcMixerControl $control)
  returns gdouble
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_lookup_card_id (
  GvcMixerControl $control,
  guint           $id
)
  returns GvcMixerCard
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_lookup_device_from_stream (
  GvcMixerControl $control,
  GvcMixerStream  $stream
)
  returns GvcMixerUIDevice
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_lookup_input_id (
  GvcMixerControl $control,
  guint           $id
)
  returns GvcMixerUIDevice
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_lookup_output_id (
  GvcMixerControl $control,
  guint           $id
)
  returns GvcMixerUIDevice
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_lookup_stream_id (
  GvcMixerControl $control,
  guint           $id
)
  returns GvcMixerStream
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_new (Str $name)
  returns GvcMixerControl
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_open (GvcMixerControl $control)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_set_default_sink (
  GvcMixerControl $control,
  GvcMixerStream  $stream
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_set_default_source (
  GvcMixerControl $control,
  GvcMixerStream  $stream
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_control_set_headset_port (
  GvcMixerControl      $control,
  guint                $id,
  GvcHeadsetPortChoice $choices
)
  is      native(gvc)
  is      export
{ * }
