use v6.c;

use NativeCall;

use GLib::Object::Class;

unit package GVC::Raw::Class;

class GvcMixerCardClass is repr<CStruct> is export {
	HAS GObjectClass $!parent_class;
}

class GvcMixerUIDeviceClass is repr<CStruct> is export {
	HAS GObjectClass $!parent_class;
}

class GvcMixerStreamClass is repr<CStruct> is export {
	HAS GObjectClass $!parent_class;
}

class GvcMixerSinkClass is repr<CStruct> is export {
	HAS GvcMixerStreamClass $!parent_class;
}

class GvcMixerSourceClass is repr<CStruct> is export {
	HAS GvcMixerStreamClass $!parent_class;
}

class GvcMixerSourceOutputClass is repr<CStruct> is export {
	HAS GvcMixerStreamClass $!parent_class;
}

class GvcMixerEventRoleClass is repr<CStruct> is export {
	HAS GvcMixerStreamClass $!parent_class;
}

class GvcMixerSinkInputClass is repr<CStruct> is export {
	HAS GvcMixerStreamClass $!parent_class;
}
