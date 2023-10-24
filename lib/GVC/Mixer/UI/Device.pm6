use v6.c;

use Method::Also;

use GVC::Raw::Types;
use GVC::Raw::UI::Device;

use GLib::GList;

use GLib::Roles::Object;
use GLib::Roles::Implementor;
use GIO::Roles::Icon;

our subset GvcMixerUIDeviceAncestry is export of Mu
  where GvcMixerUIDevice | GObject;

class GVC::Mixer::UI::Device {
  also does GLib::Roles::Object;

  has GvcMixerUIDevice $!gmd is implementor;

  submethod BUILD ( :$gvc-mixer-device ) {
    self.setGvcMixerUIDevice($gvc-mixer-device) if $gvc-mixer-device
  }

  method setGvcMixerUIDevice (GvcMixerUIDeviceAncestry $_) {
    my $to-parent;

    $!gmd = do {
      when GvcMixerUIDevice {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GvcMixerUIDevice, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GVC::Raw::Definitions::GvcMixerUIDevice
    is also<
      GvcMixerUIDevice
      GvcMixerUiDevice
    >
  { $!gmd }

  multi method new (
     $gvc-mixer-device where * ~~ GvcMixerUIDeviceAncestry,

    :$ref = True
  ) {
    return unless $gvc-mixer-device;

    my $o = self.bless( :$gvc-mixer-device );
    $o.ref if $ref;
    $o;
  }

  # Type: string
  method description is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('description', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('description', $gv);
      }
    );
  }

  # Type: string
  method origin is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('origin', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('origin', $gv);
      }
    );
  }

  # Type: pointer
  method card is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('card', $gv);
        $gv.pointer;
      },
      STORE => -> $,  $val is copy {
        $gv.pointer = $val;
        self.prop_set('card', $gv);
      }
    );
  }

  # Type: string
  method port-name is rw  is g-property is also<port_name> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('port-name', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('port-name', $gv);
      }
    );
  }

  # Type: uint
  method stream-id is rw  is g-property is also<stream_id> {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('stream-id', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('stream-id', $gv);
      }
    );
  }

  # Type: uint
  method type is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_UINT );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('type', $gv);
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = $val;
        self.prop_set('type', $gv);
      }
    );
  }

  # Type: boolean
  method port-available is rw  is g-property is also<port_available> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('port-available', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('port-available', $gv);
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

  method get_active_profile
    is also<
      get-active-profile
      active-profile
      active_profile
    >
  {
    gvc_mixer_ui_device_get_active_profile($!gmd);
  }

  method get_best_profile (Str() $selected, Str() $current)
    is also<get-best-profile>
  {
    gvc_mixer_ui_device_get_best_profile($!gmd, $selected, $current);
  }

  method get_description is also<get-description> {
    gvc_mixer_ui_device_get_description($!gmd);
  }

  method get_gicon ( :$raw = False )
    is also<
      get-gicon
      gicon
      icon
    >
  {
    propReturnObject(
      gvc_mixer_ui_device_get_gicon($!gmd),
      $raw,
      |GIO::Icon.getTypePair
    );
  }

  method get_icon_name is also<get-icon-name> {
    gvc_mixer_ui_device_get_icon_name($!gmd);
  }

  method get_id is also<get-id> {
    gvc_mixer_ui_device_get_id($!gmd);
  }

  method get_matching_profile (Str() $profile) is also<get-matching-profile> {
    gvc_mixer_ui_device_get_matching_profile($!gmd, $profile);
  }

  method get_origin is also<get-origin> {
    gvc_mixer_ui_device_get_origin($!gmd);
  }

  method get_port is also<get-port> {
    gvc_mixer_ui_device_get_port($!gmd);
  }

  method get_profiles ( :$raw = False, :$glist = False )
    is also<
      get-profiles
      profiles
    >
  {
    returnGList(
      gvc_mixer_ui_device_get_profiles($!gmd),
      $raw,
      $glist,
      |GVC::Mixer::CardProfile.getTypePair
    );
  }

  method get_stream_id is also<get-stream-id> {
    gvc_mixer_ui_device_get_stream_id($!gmd);
  }

  method get_supported_profiles ( :$raw = False, :$glist = False )
    is also<
      get-supported-profiles
      supported_profiles
      supported-profiles
    >
  {
    returnGList(
      gvc_mixer_ui_device_get_supported_profiles($!gmd),
      $raw,
      $glist,
      |GVC::Mixer::CardProfile.getTypePair
    );
  }

  method get_top_priority_profile is also<get-top-priority-profile> {
    gvc_mixer_ui_device_get_top_priority_profile($!gmd);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gvc_mixer_ui_device_get_type, $n, $t );
  }

  method get_user_preferred_profile
    is also<
      get-user-preferred-profile
      user_preferred_profiles
      user-preferred-profiles
    >
  {
    gvc_mixer_ui_device_get_user_preferred_profile($!gmd);
  }

  method has_ports is also<has-ports> {
    so gvc_mixer_ui_device_has_ports($!gmd);
  }

  method invalidate_stream is also<invalidate-stream> {
    gvc_mixer_ui_device_invalidate_stream($!gmd);
  }

  method is_output is also<is-output> {
    so gvc_mixer_ui_device_is_output($!gmd);
  }

  method set_profiles (GList() $in_profiles) is also<set-profiles> {
    gvc_mixer_ui_device_set_profiles($!gmd, $in_profiles);
  }

  method set_user_preferred_profile (Str() $profile)
    is also<set-user-preferred-profile>
  {
    gvc_mixer_ui_device_set_user_preferred_profile($!gmd, $profile);
  }

  method should_profiles_be_hidden is also<should-profiles-be-hidden> {
    so gvc_mixer_ui_device_should_profiles_be_hidden($!gmd);
  }

}
