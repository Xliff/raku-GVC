use v6.c;

use Method::Also;

use NativeCall;

use GLib::Raw::Traits;
use GVC::Raw::Types;

use GVC::Mixer::Stream;

our subset GvcMixerEventRoleAncestry is export of Mu
  where GvcMixerEventRole | GvcMixerStreamAncestry;

class GVC::Mixer::EventRole is GVC::Mixer::Stream {
  has GvcMixerEventRole $!ger is implementor;

  submethod BUILD ( :$gvc-event-role ) {
    self.setGvcMixerEventRole($gvc-event-role) if $gvc-event-role
  }

  method setGvcMixerEventRole (GvcMixerEventRoleAncestry $_) {
    my $to-parent;

    $!ger = do {
      when GvcMixerEventRole {
        $to-parent = cast(GvcMixerStream, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GvcMixerEventRole, $_);
      }
    }
    self.setGvcMixerStream($to-parent);
  }

  method GVC::Raw::Definitions::GvcMixerEventRole
    is also<GvcMixerEventRole>
  { $!ger }

  multi method new (
    $gvc-event-role where * ~~ GvcMixerEventRoleAncestry,

    :$ref = True
  ) {
    return unless $gvc-event-role;

    my $o = self.bless( :$gvc-event-role );
    $o.ref if $ref;
    $o;
  }
  multi method new (
    pa_context()    $context,
    Str()           $device,
    GvcChannelMap() $channel_map
  ) {
    my $gvc-event-role = gvc_mixer_event_role_new(
      $context,
      $device,
      $channel_map
    );

    $gvc-event-role ?? self.bless( :$gvc-event-role ) !! Nil;
  }

  # Type: string
  method device is rw  is g-property {
    my $gv = GLib::Value.new( G_TYPE_STRING );
    Proxy.new(
      FETCH => sub ($) {
        self.prop_get('device', $gv);
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('device', $gv);
      }
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gvc_mixer_event_role_get_type, $n, $t );
  }

}

### /usr/src/libgnome-volume-control/gvc-mixer-event-role.h

sub gvc_mixer_event_role_get_type
  returns GType
  is      native(gvc)
  is      export
{ * }

sub gvc_mixer_event_role_new (
  pa_context    $context,
  Str           $device,
  GvcChannelMap $channel_map
)
  returns GvcMixerEventRole
  is      native(gvc)
  is      export
{ * }
