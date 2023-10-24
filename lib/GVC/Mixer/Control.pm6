use v6.c;

use GVC::Raw::Types;
use GVC::Raw::MixerControl;

use GLib::GSList;

use GLib::Roles::Object;
use GLib::Roles::Implementor;

use GVC::Roles::Signals::MixerControl;

our subset GvcMixerControlAncestry is export of Mu
  where GvcMixerControl | GObject;

class GVC::Mixer::Conmtrol {
  also does GLib::Roles::Object;
  also does GVC::Roles::Signals::MixerControl;

  has GvcMixerControl $!gmc is implementor;

  submethod BUILD ( :$gvc-mixer-control ) {
    self.setGvcMixerControl($gvc-mixer-control) if $gvc-mixer-control
  }

  method setGvcMixerControl (GvcMixerControlAncestry $_) {
    my $to-parent;

    $!gmc = do {
      when GvcMixerControl {
        $to-parent = cast(GObject, $_);
        $_;
      }

      default {
        $to-parent = $_;
        cast(GvcMixerControl, $_);
      }
    }
    self!setObject($to-parent);
  }

  method GVC::Raw::Definitions::GvcMixerControl
    is also<GvcMixerControl>
  { $!gmc }

  multi method new (
     $gvc-mixer-control where * ~~ GvcMixerControlAncestry,

    :$ref = True
  ) {
    return unless $gvc-mixer-control;

    my $o = self.bless( :$gvc-mixer-control );
    $o.ref if $ref;
    $o;
  }
  multi method new (Str() $name = 'mixer') {
    my $gvc-mixer-control = gvc_mixer_control_new($name);

    $gvc-mixer-control ?? self.bless( :$gvc-mixer-control ) !! Nil;
  }

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

  # Is originally:
  # GvcMixerControl *control,  guint id,  gboolean show_dialog,  GvcHeadsetPortChoice choices --> void
  method audio-device-selection-needed {
    self.connect-audio-device-selection-needed($!gmc);
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method active-input-update {
    self.connect($!gmc, 'active-input-update');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method output-removed {
    self.connect($!gmc, 'output-removed');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method stream-added {
    self.connect($!gmc, 'stream-added');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method default-source-changed {
    self.connect($!gmc, 'default-source-changed');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method active-output-update {
    self.connect($!gmc, 'active-output-update');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method stream-changed {
    self.connect($!gmc, 'stream-changed');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method card-removed {
    self.connect($!gmc, 'card-removed');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method card-added {
    self.connect($!gmc, 'card-added');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method output-added {
    self.connect($!gmc, 'output-added');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method default-sink-changed {
    self.connect($!gmc, 'default-sink-changed');
  }

  # Is originally:
  # GvcMixerControl *control,  GvcMixerControlState new_state --> void
  method state-changed {
    self.connect-uint($!gmc, 'state-changed');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method input-removed {
    self.connect($!gmc, 'input-removed');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method input-added {
    self.connect($!gmc, 'input-added');
  }

  # Is originally:
  # GvcMixerControl *control,  guint id --> void
  method stream-removed {
    self.connect($!gmc, 'stream-removed');
  }

  method change_input (GvcMixerUIDevice() $input) is also<change-input> {
    gvc_mixer_control_change_input($!gmc, $input);
  }

  method change_output (GvcMixerUIDevice() $output) is also<change-output> {
    gvc_mixer_control_change_output($!gmc, $output);
  }

  method change_profile_on_selected_device (
    GvcMixerUIDevice() $device,
    Str()              $profile
  )
    is also<change-profile-on-selected-device>
  {
    so gvc_mixer_control_change_profile_on_selected_device(
      $!gmc,
      $device,
      $profile
    );
  }

  method close {
    gvc_mixer_control_close($!gmc);
  }

  method get_cards ( :$raw = False, :glist(:$gslist) = False )
    is also<get-cards>
  {
    returnGSList(
      gvc_mixer_control_get_cards($!gmc),
      $raw,
      $gslist,
      |GVC::Mixer::Card.getTypePair
    );
  }

  method get_default_sink ( :$raw = False, :glist(:$gslist) = False )
    is static
    is also<get-default-sink>
  {
    propReturnObject(
      gvc_mixer_control_get_default_sink($!gmc),
      $raw,
      |$.getTypePair
    );
  }

  method get_default_source ( :$raw = False)
    is static
    is also<get-default-source>
  {
    propReturnObject(
      gvc_mixer_control_get_default_source($!gmc),
      $raw,
      |$.getTypePair
    );
  }

  method get_event_sink_input is also<get-event-sink-input> {
    gvc_mixer_control_get_event_sink_input($!gmc);
  }

  method get_sink_inputs ( :$raw = False, :glist(:$gslist) = False )
    is also<get-sink-inputs>
  {
    returnGSList(
      gvc_mixer_control_get_sink_inputs($!gmc),
      $raw,
      $gslist,
      |GVC::Mixer::Sink::Input.getTypePair
    );
  }

  method get_sinks ( :$raw = False, :glist(:$gslist) = False )
    is also<get-sinks>
  {
    returnGSList(
      gvc_mixer_control_get_sinks($!gmc),
      $raw,
      $gslist,
      |GVC::Mixer::Sink.getTypePair
    );
  }

  method get_source_outputs ( :$raw = False, :glist(:$gslist) = False )
    is also<get-source-outputs>
  {
    returnGSList(
      gvc_mixer_control_get_source_outputs($!gmc),
      $raw,
      $gslist,
      |GVC::Mixer::Sink::Output.getTypePair
    );
  }

  method get_sources ( :$raw = False, :glist(:$gslist) = False )
    is also<get-sources>
  {
    returnGSList(
      gvc_mixer_control_get_sources($!gmc),
      $raw,
      $gslist,
      |GVC::Mixer::Source.getTypePair
    );
  }

  method get_state ( :$enum = True ) is also<get-state> {
    my $s = gvc_mixer_control_get_state($!gmc);
    return $s unless $enum;
    GvcMixerStreamStateEnum($s);
  }

  method get_stream_from_device (GvcMixerUIDevice() $device, :$raw = False)
    is also<get-stream-from-device>
  {
    propReturnObject(
      gvc_mixer_control_get_stream_from_device($!gmc, $device),
      $raw,
      |GVC::Mixer::Stream.getTypePair
    );
  }

  method get_streams ( :$raw = False, :glist(:$gslist) = False )
    is also<get-streams>
  {
    returnGSList(
      gvc_mixer_control_get_streams($!gmc),
      $raw,
      $gslist,
      |GVC::Mixer::Stream.getTypePair
    );
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &gvc_mixer_control_get_type, $n, $t );
  }

  method get_vol_max_amplified is also<get-vol-max-amplified> {
    gvc_mixer_control_get_vol_max_amplified($!gmc);
  }

  method get_vol_max_norm is also<get-vol-max-norm> {
    gvc_mixer_control_get_vol_max_norm($!gmc);
  }

  method lookup_card_id (Int() $id, :$raw = False) is also<lookup-card-id> {
    my guint $i = $id;

    propReturnObject(
      gvc_mixer_control_lookup_card_id($!gmc, $i),
      $raw,
      |GVC::MixerCard.getTypePair
    )
  }

  method lookup_device_from_stream (GvcMixerStream()  $stream, :$raw = False)
    is also<lookup-device-from-stream>
  {
    propReturnObject(
      gvc_mixer_control_lookup_device_from_stream($!gmc, $stream),
      $raw,
      |GVC::Mixer::UIDevice.getTypePair
    );
  }

  method lookup_input_id (Int() $id, :$raw = False)
    is also<lookup-input-id>
  {
    my guint $i = $id;

    propReturnObject(
      gvc_mixer_control_lookup_input_id($!gmc, $i),
      $raw,
      |GVC::Mixer::UIDevice.getTypePair
    );
  }

  method lookup_output_id (Int() $id, :$raw = False)
    is also<lookup-output-id>
  {
    my guint $i = $id;

    propReturnObject(
      gvc_mixer_control_lookup_output_id($!gmc, $i),
      $raw,
      |GVC::Mixer::UIDevice.getTypePair
    );
  }

  method lookup_stream_id (Int() $id, :$raw = False)
    is also<lookup-stream-id>
  {
    my guint $i = $id;

    propReturnObject(
      gvc_mixer_control_lookup_stream_id($!gmc, $i),
      $raw,
      |GVC::Mixer::Stream.getTypePair
    );
  }

  method open {
    so gvc_mixer_control_open($!gmc);
  }

  method set_default_sink (GvcMixerStream() $stream)
    is also<set-default-sink>
  {
    so gvc_mixer_control_set_default_sink($!gmc, $stream);
  }

  method set_default_source (GvcMixerStream() $stream)
    is also<set-default-source>
  {
    so gvc_mixer_control_set_default_source($!gmc, $stream);
  }

  method set_headset_port (Int() $id, Int() $choices)
    is also<set-headset-port>
  {
    my guint                $i = $id;
    my GvcHeadsetPortChoice $c = $choices;

    so gvc_mixer_control_set_headset_port($!gmc, $i, $c);
  }

}
