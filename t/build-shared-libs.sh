# cw: These will need to be build via <configuration> of some sort...
#     maybe Config.raku?
gcc 00-struct-sizes.c -Wno-deprecated-declarations \
  -fPIC                                            \
  --shared                                         \
  -I/usr/include/glib-2.0                          \
  -I/usr/lib/x86_64-linux-gnu/glib-2.0/include     \
  -L/usr/lib/gnome-shell                           \
  -lgvc                                            \
  -lglib
