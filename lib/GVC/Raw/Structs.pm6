use v6.c;

use NativeCall;
use Method::Also;

use GLib::Raw::Definitions;
use GLib::Raw::Object;
use GLib::Raw::Structs;
use GLib::Raw::Subs;
use GVC::Raw::Definitions;

unit package GVC::Raw::Structs;

class GvcChannelMap is repr<CStruct> is export {
	HAS GObject  $!parent;
	has gpointer $!priv  ;
}

class GvcMixerCard is repr<CStruct> is export {
	HAS GObject  $!parent;
	has gpointer $!priv  ;
}

class GvcMixerCardPort is repr<CStruct> is export {
	has Str   $!port      ;
	has Str   $!human_port;
	has Str   $!icon_name ;
	has guint $.priority   is rw;
	has gint  $.available  is rw;
	has gint  $.direction  is rw;
	has GList $!profiles  ;

	method port {
		Proxy.new:
			FETCH => -> $     { $!port      }
			STORE => -> $, \v { $!port := v }
	}

	method human_port is also<human-port> {
		Proxy.new:
			FETCH => -> $     { $!human_port      }
			STORE => -> $, \v { $!human_port := v }
	}

	method icon_name is also<icon-name> {
		Proxy.new:
			FETCH => -> $     { $!icon_name      }
			STORE => -> $, \v { $!icon_name := v }
	}

}

class GvcMixerCardProfile is repr<CStruct> is export {
	has Str   $!profile      ;
	has Str   $!human_profile;
	has Str   $!status       ;
	has guint $.priority      is rw;
	has guint $.n_sinks       is rw;
	has guint $.n_sources     is rw;

	method profile {
		Proxy.new:
			FETCH => -> $     { $!profile      }
			STORE => -> $, \v { $!profile := v }
	}

	method human_profile is also<human-profile> {
		Proxy.new:
			FETCH => -> $     { $!human_profile      }
			STORE => -> $, \v { $!human_profile := v }
	}

	method status {
		Proxy.new:
			FETCH => -> $     { $!status      }
			STORE => -> $, \v { $!status := v }
	}
}

class GvcMixerControl is repr<CStruct> is export {
	HAS GObject  $!parent;
	has gpointer $!priv  ;
}

class GvcMixerStream is repr<CStruct> is export {
	HAS GObject  $!parent;
	has gpointer $!priv  ;
}

class GvcMixerEventRole is repr<CStruct> is export {
	HAS GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerSink is repr<CStruct> is export {
	HAS GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerSinkInput is repr<CStruct> is export {
	HAS GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerSource is repr<CStruct> is export {
	HAS GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerSourceOutput is repr<CStruct> is export {
	HAS GvcMixerStream $!parent;
	has gpointer       $!priv  ;
}

class GvcMixerStreamPort is repr<CStruct> is export {
	has Str      $!port      ;
	has Str      $!human_port;
	has guint    $.priority   is rw;
	has gboolean $.available  is rw;

	method port {
		Proxy.new:
			FETCH => -> $     { $!port      }
			STORE => -> $, \v { $!port := v }
  }

	method human_port is also<human-port> {
		Proxy.new:
			FETCH => -> $     { $!port      }
			STORE => -> $, \v { $!port := v }
  }

	method get_type is also<get-type> {
		sub gvc_mixer_stream_port_get_type
		  returns GType
		  is      native(gvc)
		  is      export
		{ * }

		state ($n, $t);

		unstable_get_type(
			self.^name,
			&gvc_mixer_stream_port_get_type,
			$n,
			$t
		);
	}
}

class GvcMixerUIDevice is repr<CStruct> is export {
	HAS GObject  $!parent_instance;
	has gpointer $!priv           ;
}
