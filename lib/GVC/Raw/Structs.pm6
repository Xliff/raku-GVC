use v6.c;

use NativeCall;

use GLib::Raw::Definitions;
use GVC::Raw::Definitions;

unit package GVC::Raw::Structs;

class GvcChannelMap is repr<CStruct> is export {
	has GObject  $!parent;
	has gpointer $!priv  ;
}

class GvcMixerCard is repr<CStruct> is export {
	has GObject  $!parent;
	has gpointer $!priv  ;
}

class GvcMixerCardClass is repr<CStruct> is export {
	has GObjectClass $!parent_class;
}

class GvcMixerCardPort is repr<CStruct> is export {
	has Str   $!port      ;
	has Str   $!human_port;
	has Str   $!icon_name ;
	has guint $.priority   is rw;
	has gint  $.available  is rw;
	has gint  $.direction  is rw;
	has GList $!profiles  ;
}

class GvcMixerCardProfile is repr<CStruct> is export {
	has Str   $!profile      ;
	has Str   $!human_profile;
	has Str   $!status       ;
	has guint $.priority      is rw;
	has guint $.n_sinks       is rw;
	has guint $.n_sources     is rw;
}

class GvcMixerControl is repr<CStruct> is export {
	has GObject  $!parent;
	has gpointer $!priv  ;
}

class GvcMixerEventRole is repr<CStruct> is export {
	has GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerEventRoleClass is repr<CStruct> is export {
	has GvcMixerStreamClass $!parent_class;
}

class GvcMixerSink is repr<CStruct> is export {
	has GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerSinkClass is repr<CStruct> is export {
	has GvcMixerStreamClass $!parent_class;
}

class GvcMixerSinkInput is repr<CStruct> is export {
	has GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerSinkInputClass is repr<CStruct> is export {
	has GvcMixerStreamClass $!parent_class;
}

class GvcMixerSource is repr<CStruct> is export {
	has GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerSourceClass is repr<CStruct> is export {
	has GvcMixerStreamClass $!parent_class;
}

class GvcMixerSourceOutput is repr<CStruct> is export {
	has GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerSourceOutputClass is repr<CStruct> is export {
	has GvcMixerStreamClass $!parent_class;
}

class GvcMixerStream is repr<CStruct> is export {
	has GObject  $!parent;
	has gpointer $!priv  ;
}

class GvcMixerStreamPort is repr<CStruct> is export {
	has Str      $!port      ;
	has Str      $!human_port;
	has guint    $.priority   is rw;
	has gboolean $!available ;
}

class GvcMixerUIDevice is repr<CStruct> is export {
	has GObject  $!parent_instance;
	has gpointer $!priv           ;
}

class GvcMixerUIDeviceClass is repr<CStruct> is export {
	has GObjectClass $!parent_class;
}
