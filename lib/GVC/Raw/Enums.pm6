use v6.c;

use GLib::Raw::Definitions;

unit package GVC::Raw::Enums;

constant GvcHeadsetPortChoice is export := guint32;
our enum GvcHeadsetPortChoiceEnum is export <
  GVC_HEADSET_PORT_CHOICE_NONE
  GVC_HEADSET_PORT_CHOICE_HEADPHONES
  GVC_HEADSET_PORT_CHOICE_HEADSET
  GVC_HEADSET_PORT_CHOICE_MIC
>;

constant GvcMixerControlState is export := guint32;
our enum GvcMixerControlStateEnum is export <
  GVC_STATE_CLOSED
  GVC_STATE_READY
  GVC_STATE_CONNECTING
  GVC_STATE_FAILED
>;

constant GvcMixerStreamState is export := guint32;
our enum GvcMixerStreamStateEnum is export <
  GVC_STREAM_STATE_INVALID
  GVC_STREAM_STATE_RUNNING
  GVC_STREAM_STATE_IDLE
  GVC_STREAM_STATE_SUSPENDED
>;

constant GvcMixerUIDeviceDirection is export := guint32;
our enum GvcMixerUIDeviceDirectionEnum is export <
  UIDeviceInput
  UIDeviceOutput
>;
