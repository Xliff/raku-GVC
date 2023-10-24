use v6.c;

use Method::Also;

use GVC::Raw::Types;
use GVC::Raw::Mixer::Stream;

use GLib::GList;

use GLib::Roles::Object;
use GLib::Roles::Implementor;
use GIO::Roles::Icon;

our subset GvcMixerStreamAncestry is export of Mu
  where GvcMixerStream | GObject;

class GVC::Mixer::Stream {
  also does GLib::Roles::Object;

  has GvcMixerStream $!gms is implementor;

  submethod BUILD ( :$gvc-mixer-stream ) {
    self.setGvcMixerStream($gvc-mixer-stream) if $gvc-mixer-stream
  }

  method setGvcMixerStream (GvcMixerStreamAncestry $_) {
    my $to-parent;

    $!gms = do {
      when GvcMixerStream {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GvcMixerStream, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GVC::Raw::Definitions::GvcMixerStream
    is also<GvcMixerStream>
  { $!gms }

  multi method new (
     $gvc-mixer-stream where * ~~ GvcMixerStreamAncestry,

    :$ref = True
  ) {
    return unless $gvc-mixer-stream;

    my $o = self.bless( :$gvc-mixer-stream );
    $o.ref if $ref;
    $o;
  }

  # Type: ulong
  method index is rw is g-property {
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

  # Type: ulong
  method id is rw is g-property {
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

  # Type: GvcChannelMap
  method channel-map ( :$raw = False )
    is rw
    is g-property
    is also<channel_map>
  {
    my $gv = GLib::Value.new( GVC::ChannelMap.get_type );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('channel-map', $gv);
        propReturnObject(
          $gv.object,
          $raw,
          |GVC::ChannelMap.getTypePair
        )
      },
      STORE => -> $, GvcChannelMap() $val is copy {
        $gv.object = $val;
        self.prop_set('channel-map', $gv);
      }
    );
  }

  # Type: pointer
  method pa-context is rw is g-property is also<pa_context> {
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

  # Type: ulong
  method volume is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_ULONG );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('volume', $gv);
        $gv.ulong;
      },
      STORE => -> $, Int() $val is copy {
        $gv.ulong = $val;
        self.prop_set('volume', $gv);
      }
    );
  }

  # Type: double
  method decibel
    is rw
    is g-property
    is also<
      dB
      db
    >
  {
    my $gv = GLib::Value.new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('decibel', $gv);
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set('decibel', $gv);
      }
    );
  }

  # Type: string
  method name is rw is g-property {
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

  # Type: string
  method description is rw is g-property {
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
  method application-id
    is rw
    is g-property
    is also<
      application_id
      app_id
      app-id
    >
  {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('application-id', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('application-id', $gv);
      }
    );
  }

  # Type: string
  method icon-name is rw is g-property is also<icon_name> {
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

  # Type: string
  method form-factor is rw is g-property is also<form_factor> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('form-factor', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('form-factor', $gv);
      }
    );
  }

  # Type: string
  method sysfs-path is rw is g-property is also<sysfs_path> {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('sysfs-path', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('sysfs-path', $gv);
      }
    );
  }

  # Type: boolean
  method is-muted is rw is g-property is also<is_muted> {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-muted', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('is-muted', $gv);
      }
    );
  }

  # Type: boolean
  multi method can-decibel is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('can-decibel', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('can-decibel', $gv);
      }
    );
  }

  # Type: boolean
  proto method is-event-stream
    is also<is_event_stream>
  { * }

  multi method is-event-stream is rw is g-property  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-event-stream', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('is-event-stream', $gv);
      }
    );
  }

  proto method is-virtual
    is also<is_virtual>
  { * }

  # Type: boolean
  multi method is-virtual is rw is g-property  {
    my $gv = GLib::Value.new( G_TYPE_BOOLEAN );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('is-virtual', $gv);
        $gv.boolean;
      },
      STORE => -> $, Int() $val is copy {
        $gv.boolean = $val;
        self.prop_set('is-virtual', $gv);
      }
    );
  }

  # Type: string
  method port is rw is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('port', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('port', $gv);
      }
    );
  }

  # Type: GvcMixerStreamState
  method state is rw is g-property {
    my $gv = GLib::Value.new-enum( GvcMixerStreamState );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('state', $gv);
        $gv.valueFromEnum(GvcMixerStreamState);
      },
      STORE => -> $,  $val is copy {
        $gv.valueFromEnum(GvcMixerStreamState) = $val;
        self.prop_set('state', $gv);
      }
    );
  }

  # Type: long
  method card-index is rw is g-property is also<card_index> {
    my $gv = GLib::Value.new( G_TYPE_LONG );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('card-index', $gv);
        $gv.long;
      },
      STORE => -> $, Int() $val is copy {
        $gv.long = $val;
        self.prop_set('card-index', $gv);
      }
    );
  }

  method change_is_muted (Int() $is_muted) is also<change-is-muted> {
    my gboolean $i = $is_muted.so.Int;

    so gvc_mixer_stream_change_is_muted($!gms, $i);
  }

  method change_port (Str() $port) is also<change-port> {
    gvc_mixer_stream_change_port($!gms, $port);
  }

  method get_application_id is also<get-application-id> {
    gvc_mixer_stream_get_application_id($!gms);
  }

  method get_base_volume is also<get-base-volume> {
    gvc_mixer_stream_get_base_volume($!gms);
  }

  method get_can_decibel is also<get-can-decibel> {
    so gvc_mixer_stream_get_can_decibel($!gms);
  }

  method get_card_index is also<get-card-index>
  {
    gvc_mixer_stream_get_card_index($!gms);
  }

  method get_channel_map ( :$raw = False ) is also<get-channel-map> {
    propReturnObject(
      gvc_mixer_stream_get_channel_map($!gms),
      $raw,
      |GVC::ChannelMap.getTypePair
    );
  }

  method get_decibel is also<get-decibel> {
    gvc_mixer_stream_get_decibel($!gms);
  }

  method get_description is also<get-description> {
    gvc_mixer_stream_get_description($!gms);
  }

  method get_form_factor is also<get-form-factor> {
    gvc_mixer_stream_get_form_factor($!gms);
  }

  method get_gicon ( :$raw = False ) is also<get-gicon> {
    propReturnObject(
      gvc_mixer_stream_get_gicon($!gms),
      $raw,
      |GIO::Icon.getTypePair
    );
  }

  method get_icon_name is also<get-icon-name> {
    gvc_mixer_stream_get_icon_name($!gms);
  }

  method get_id is also<get-id> {
    gvc_mixer_stream_get_id($!gms);
  }

  method get_index is also<get-index> {
    gvc_mixer_stream_get_index($!gms);
  }

  method get_is_muted is also<get-is-muted> {
    so gvc_mixer_stream_get_is_muted($!gms);
  }

  method get_name is also<get-name> {
    gvc_mixer_stream_get_name($!gms);
  }

  method get_port is also<get-port> {
    gvc_mixer_stream_get_port($!gms);
  }

  method get_ports ( :gslist(:$glist) = False ) is also<get-ports> {
    returnGList(
      gvc_mixer_stream_get_ports($!gms),
      True,
      $glist,
      GvcMixerStreamPort
    );
  }

  method get_state ( :$enum = True ) is also<get-state> {
    my $s = gvc_mixer_stream_get_state($!gms);
    return $s unless $enum;
    GvcMixerStreamState($s);
  }

  method get_sysfs_path is also<get-sysfs-path> {
    gvc_mixer_stream_get_sysfs_path($!gms);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gvc_mixer_stream_get_type, $n, $t );
  }

  method get_volume is also<get-volume> {
    gvc_mixer_stream_get_volume($!gms);
  }

  multi method is_event_stream ( :m(:$method) is required ) {
    so gvc_mixer_stream_is_event_stream($!gms);
  }

  method is_running is also<is-running> {
    so gvc_mixer_stream_is_running($!gms);
  }

  multi method is_virtual ( :$method is required ) {
    so gvc_mixer_stream_is_virtual($!gms);
  }

  method push_volume is also<push-volume> {
    gvc_mixer_stream_push_volume($!gms);
  }

  # cw: Some of these marked "/* private */" in the header file, so might
  #     want to consider removal or a warn of some sort.

  method set_application_id (Str() $application_id)
    is also<set-application-id>
  {
    so gvc_mixer_stream_set_application_id($!gms, $application_id);
  }

  method set_base_volume (pa_volume_t() $base_volume)
    is also<set-base-volume>
  {
    so gvc_mixer_stream_set_base_volume($!gms, $base_volume);
  }

  method set_can_decibel (Int() $can_decibel) is also<set-can-decibel> {
    my gboolean $c = $can_decibel.so.Int();

    so gvc_mixer_stream_set_can_decibel($!gms, $c);
  }

  method set_card_index (Int() $card_index) is also<set-card-index> {
    my guint $c = $card_index.so.Int();

    so gvc_mixer_stream_set_card_index($!gms, $c);
  }

  method set_decibel (Int() $db) is also<set-decibel> {
    my gdouble $d = $db;

    so gvc_mixer_stream_set_decibel($!gms, $d);
  }

  method set_description (Str() $description) is also<set-description> {
    so gvc_mixer_stream_set_description($!gms, $description);
  }

  method set_form_factor (Str() $form_factor) is also<set-form-factor> {
    so gvc_mixer_stream_set_form_factor($!gms, $form_factor);
  }

  method set_icon_name (Str() $name) is also<set-icon-name> {
    so gvc_mixer_stream_set_icon_name($!gms, $name);
  }

  method set_is_event_stream (Int() $is_event_stream)
    is also<set-is-event-stream>
  {
    my gboolean $i = $is_event_stream.so.Int();

    so gvc_mixer_stream_set_is_event_stream($!gms, $i);
  }

  method set_is_muted (Int() $is_muted) is also<set-is-muted> {
    my gboolean $i = $is_muted.so.Int();

    so gvc_mixer_stream_set_is_muted($!gms, $i);
  }

  method set_is_virtual (Int() $is_event_stream) is also<set-is-virtual> {
    my gboolean $i = $is_event_stream.so.Int();

    so gvc_mixer_stream_set_is_virtual($!gms, $i);
  }

  method set_name (Str() $name) is also<set-name> {
    so gvc_mixer_stream_set_name($!gms, $name);
  }

  method set_port (Str() $port) is also<set-port> {
    so gvc_mixer_stream_set_port($!gms, $port);
  }

  method set_ports (GList() $ports) is also<set-ports> {
    so gvc_mixer_stream_set_ports($!gms, $ports);
  }

  method set_state (Int() $state) is also<set-state> {
    my GvcMixerStreamState $s = $state;

    so gvc_mixer_stream_set_state($!gms, $s);
  }

  method set_sysfs_path (Str() $sysfs_path) is also<set-sysfs-path> {
    so gvc_mixer_stream_set_sysfs_path($!gms, $sysfs_path);
  }

  method set_volume (pa_volume_t() $volume) is also<set-volume> {
    so gvc_mixer_stream_set_volume($!gms, $volume);
  }

}
