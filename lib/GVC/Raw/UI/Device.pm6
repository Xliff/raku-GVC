use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use GVC::Raw::Definitions;
use GVC::Raw::Structs;

unit package GVC::Raw::UI::Device;

### /usr/src/libgnome-volume-control/gvc-mixer-ui-device.h

sub gvc_mixer_ui_device_get_active_profile (GvcMixerUIDevice $device)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_best_profile (
  GvcMixerUIDevice $device,
  Str              $selected,
  Str              $current
)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_description (GvcMixerUIDevice $device)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_gicon (GvcMixerUIDevice $device)
  returns GIcon
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_icon_name (GvcMixerUIDevice $device)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_id (GvcMixerUIDevice $device)
  returns guint
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_matching_profile (
  GvcMixerUIDevice $device,
  Str              $profile
)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_origin (GvcMixerUIDevice $device)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_port (GvcMixerUIDevice $device)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_profiles (GvcMixerUIDevice $device)
  returns GList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_stream_id (GvcMixerUIDevice $device)
  returns guint
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_supported_profiles (GvcMixerUIDevice $device)
  returns GList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_top_priority_profile (GvcMixerUIDevice $device)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_type
  returns GType
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_get_user_preferred_profile (GvcMixerUIDevice $device)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_has_ports (GvcMixerUIDevice $device)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_invalidate_stream (GvcMixerUIDevice $device)
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_is_output (GvcMixerUIDevice $device)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_set_profiles (
  GvcMixerUIDevice $device,
  GList            $in_profiles
)
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_set_user_preferred_profile (
  GvcMixerUIDevice $device,
  Str              $profile
)
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_ui_device_should_profiles_be_hidden (GvcMixerUIDevice $device)
  returns uint32
  is      native(gvc)
  is      export
{ * }
