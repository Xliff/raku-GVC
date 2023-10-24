use v6;

use GLib::Raw::Exports;
use GIO::Raw::Exports;
use GVC::Raw::Exports;

my constant forced = 347;

unit package GIO::Raw::Types;

need GLib::Raw::Debug;
need GLib::Raw::Definitions;
need GLib::Raw::Enums;
need GLib::Raw::Exceptions;
need GLib::Raw::Object;
need GLib::Raw::Structs;
need GLib::Raw::Struct_Subs;
need GLib::Raw::Subs;
need GLib::Roles::Pointers;
need GLib::Roles::Implementor;
need GIO::Raw::Definitions;
need GIO::Raw::Enums;
need GIO::Raw::Structs;
need GIO::Raw::Subs;
need GIO::Raw::Quarks;
need GIO::DBus::Raw::Types;
need GVC::Raw::Definitions;
need GVC::Raw::Enums;
need GVC::Raw::Structs;

BEGIN {
  glib-re-export($_) for |@glib-exports, |@gio-exports, |@gvc-exports;
}
