use v6.c;

use Method::Also;

use GVC::Raw::Types;
use GVC::Raw::Mixer::Card;

use GLib::Roles::Object;
use GLib::Roles::Implementor;
use GIO::Roles::Icon;

our subset GvcMixerCardAncestry is export of Mu
  where GvcMixerCard | GObject;

class GVC::Mixer::Card {
  also does GLib::Roles::Object;

  has GvcMixerCard $!gmc is implementor;

  submethod BUILD ( :$gvc-mixer-card ) {
    self.setGvcMixerCard($gvc-mixer-card) if $gvc-mixer-card
  }

  method setGvcMixerCard (GvcMixerCardAncestry $_) {
    my $to-parent;

    $!gmc = do {
      when GvcMixerCard {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GvcMixerCard, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GVC::Raw::Definitions::GvcMixerCard
    is also<GvcMixerCard>
  { $!gmc }

  multi method new (
     $gvc-mixer-card where * ~~ GvcMixerCardAncestry,

    :$ref = True
  ) {
    return unless $gvc-mixer-card;

    my $o = self.bless( :$gvc-mixer-card );
    $o.ref if $ref;
    $o;
  }

  # Type: string
  method human-profile is rw  is g-property is also<human_profile> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('human-profile', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        warn 'human-profile does not allow writing'
      }
    );
  }

  # Type: string
  method icon-name is rw  is g-property is also<icon_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('icon-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('icon-name', $gv);
      }
    );
  }

  # Type: ulong
  method id is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_ULONG );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('id', $gv);
        $gv.ulong;
      },
      STORE => -> $, Int() $val is copy {
        $gv.ulong = $val;
        self.prop_set('id', $gv);
      }
    );
  }

  # Type: ulong
  method index is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_ULONG );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('index', $gv);
        $gv.ulong;
      },
      STORE => -> $, Int() $val is copy {
        $gv.ulong = $val;
        self.prop_set('index', $gv);
      }
    );
  }

  # Type: string
  method name is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('name', $gv);
      }
    );
  }

  # Type: pointer
  method pa-context is rw  is g-property is also<pa_context> {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('pa-context', $gv);
        $gv.pointer;
      },
      STORE => -> $,  $val is copy {
        $gv.pointer = $val;
        self.prop_set('pa-context', $gv);
      }
    );
  }

  # Type: string
  method profile is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('profile', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('profile', $gv);
      }
    );
  }

  method change_profile (Str() $profile) is also<change-profile> {
    so gvc_mixer_card_change_profile($!gmc, $profile);
  }

  method get_gicon ( :$raw = False )
    is also<
      get-gicon
      gicon
      icon
    >
  {
    propReturnObject(
      gvc_mixer_card_get_gicon($!gmc),
      $raw.
      |GIO::Icon.getTypePair
    );
  }

  method get_icon_name is also<get-icon-name> {
    gvc_mixer_card_get_icon_name($!gmc);
  }

  method get_id is also<get-id> {
    gvc_mixer_card_get_id($!gmc);
  }

  method get_index is also<get-index> {
    gvc_mixer_card_get_index($!gmc);
  }

  method get_name is also<get-name> {
    gvc_mixer_card_get_name($!gmc);
  }

  method get_ports ( :$raw = False, :$glist = False )
    is also<
      get-ports
      ports
    >
  {
    returnGList(
      gvc_mixer_card_get_ports($!gmc),
      $raw,
      $glist,
      |GVC::Mixer::Card::Port.getTypePair
    );
  }

  method get_profile ( :$raw = False ) is also<get-profile> {
    propReturnObject(
      gvc_mixer_card_get_profile($!gmc),
      $raw,
      |GVC::Mixer::Card::Profile.getTypePair
    );
  }

  method get_profiles ( :$raw = False, :$glist = False )
    is also<
      get-profiles
      profiles
    >
  {
    returnGList(
      gvc_mixer_card_get_profiles($!gmc),
      $raw,
      $glist,
      |GVC::Mixer::Card::Profile.getTypePair;
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gvc_mixer_card_get_type, $n, $t );
  }

  method profile_compare (GvcMixerCardProfile() $b) is also<profile-compare> {
    gvc_mixer_card_profile_compare($!gmc, $b);
  }

  method set_icon_name (Str() $name) is also<set-icon-name> {
    gvc_mixer_card_set_icon_name($!gmc, $name);
  }

  method set_name (Str() $name) is also<set-name> {
    gvc_mixer_card_set_name($!gmc, $name);
  }

  proto method set_ports (|)
    is also<set-ports>
  { * }

  multi method set_ports (@ports) {
    samewith(
      GLib::GList.new(@ports, type => GvcMixerCardPort)
    );
  }
  multi method set_ports (GList() $ports) {
    gvc_mixer_card_set_ports($!gmc, $ports);
  }

  method set_profile (Str() $profile) is also<set-profile> {
    gvc_mixer_card_set_profile($!gmc, $profile);
  }

  proto method set_profiles (|)
    is also<set-profiles>
  { * }

  multi method set_profiles (@profiles) {
    samewith(
      GLib::GList.new(@profiles, type => GvcMixerCardProfile)
    );
  }
  multi method set_profiles (GList() $profiles) {
    gvc_mixer_card_set_profiles($!gmc, $profiles);
  }

}
