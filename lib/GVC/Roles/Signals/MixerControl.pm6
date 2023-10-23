use v6.c;

use NativeCall;

use GVC::Raw::Types;

use GLib::Object::Supplyish;

role GVC::Roles::Signals::MixerControl {
  has %!signals-gvc;

  #  guint id,  gboolean show_dialog,  GvcHeadsetPortChoice choices --> void
  method connect-audio-device-selection-needed (
    $obj,
    $signal = 'audio-device-selection-needed',
    &handler?
  ) {
    my $hid;
    %!signals-gvc{$signal} //= do {
      my \𝒮 = Supplier.new;
      $hid = g-connect-audio-device-selection-needed($obj, $signal,
        -> $, $g1, $g2, $ghpc {
          CATCH {
            default { 𝒮.note($_) }
          }

          𝒮.emit( [self, $g1, $g2, $ghpc] );
        },
        Pointer, 0
      );
      [ self.create-signal-supply( $signal, 𝒮 ), $obj, $hid ];
    };
    %!signals-gvc{$signal}[0].tap(&handler) with &handler;
    %!signals-gvc{$signal}[0];
  }

}

# GvcMixerControl *control,  guint id,  gboolean show_dialog,  GvcHeadsetPortChoice choices
sub g-connect-audio-device-selection-needed (
  Pointer $app,
  Str     $name,
          &handler (Pointer,  guint, gboolean, GvcHeadsetPortChoice),
  Pointer $data,
  uint32  $flags
)
  returns uint64
  is native(gobject)
  is symbol('g_signal_connect_object')
{ * }
