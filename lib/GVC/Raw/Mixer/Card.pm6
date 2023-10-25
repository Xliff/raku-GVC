use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GLib::Raw::Structs;
use GIO::Raw::Definitions;
use GVC::Raw::Definitions;
use GVC::Raw::Structs;

unit package GVC::Raw::Mixer::Card;

### /usr/src/libgnome-volume-control/gvc-mixer-card.h

sub gvc_mixer_card_change_profile (
  GvcMixerCard $card,
  Str          $profile
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_get_gicon (GvcMixerCard $card)
  returns GIcon
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_get_icon_name (GvcMixerCard $card)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_get_id (GvcMixerCard $card)
  returns guint
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_get_index (GvcMixerCard $card)
  returns guint
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_get_name (GvcMixerCard $card)
  returns Str
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_get_ports (GvcMixerCard $card)
  returns GList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_get_profile (GvcMixerCard $card)
  returns GvcMixerCardProfile
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_get_profiles (GvcMixerCard $card)
  returns GList
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_get_type
  returns GType
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_profile_compare (
  GvcMixerCardProfile $a,
  GvcMixerCardProfile $b
)
  returns gint
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_set_icon_name (
  GvcMixerCard $card,
  Str          $name
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_set_name (
  GvcMixerCard $card,
  Str          $name
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_set_ports (
  GvcMixerCard $stream,
  GList        $ports
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_set_profile (
  GvcMixerCard $card,
  Str          $profile
)
  returns uint32
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_card_set_profiles (
  GvcMixerCard $card,
  GList        $profiles
)
  returns uint32
  is      native(gvc)
  is      export
{ * }
