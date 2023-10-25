use v6.c;

use Method::Also;

use GVC::Raw::Types;
use GVC::Raw::ChannelMap;

use GLib::Roles::Implementor;
use GLib::Roles::Object;

our subset GvcChannelMapAncestry is export of Mu
  where GvcChannelMap | GObject;

class GVC::ChannelMap {
  also does GLib::Roles::Object;

  has GvcChannelMap $!gcm is implementor;

  submethod BUILD ( :$gvc-channel-map ) {
    self.setGvcChannelMap($gvc-channel-map) if $gvc-channel-map
  }

  method setGvcChannelMap (GvcChannelMapAncestry $_) {
    my $to-parent;

    $!gcm = do {
      when GvcChannelMap {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GvcChannelMap, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GVC::Raw::Definitions::GvcChannelMap
    is also<GvcChannelMap>
  { $!gcm }

  multi method new (
     $gvc-channel-map where * ~~ GvcChannelMapAncestry,

    :$ref = True
  ) {
    return unless $gvc-channel-map;

    my $o = self.bless( :$gvc-channel-map );
    $o.ref if $ref;
    $o;
  }
  multi method new {
    my $gvc-channel-map = gvc_channel_map_new();

    $gvc-channel-map ?? self.bless( :$gvc-channel-map ) !! Nil;
  }

  method volume-changed is also<volume_changed> {
    self.connect($!gcm, 'volume-changed');
  }

  method can_balance is also<can-balance> {
    so gvc_channel_map_can_balance($!gcm);
  }

  method can_fade is also<can-fade> {
    so gvc_channel_map_can_fade($!gcm);
  }

  method get_mapping
    is also<
      get-mapping
      mapping
    >
  {
    gvc_channel_map_get_mapping($!gcm);
  }

  method get_num_channels
    is also<
      get-num-channels
      num_channels
      num-channels
    >
  {
    gvc_channel_map_get_num_channels($!gcm);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^bame, &gvc_channel_map_get_type, $n, $t );
  }

  method get_volume
    is also<
      get-volume
      volume
      vol
    >
  {
    gvc_channel_map_get_volume($!gcm);
  }

  method has_position (
    pa_channel_position_t() $position
  )
    is also<has-position>
  {
    gvc_channel_map_has_position($!gcm, $position);
  }

}
