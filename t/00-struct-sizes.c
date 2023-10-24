/*
  List created from the output of:
    ( find . -name \*.h -exec grep -Hn 'typedef struct'} \; 1>&2 ) 2>&1 | \
       cut -d\  -f 4 | grep -v \{
*/

/* Strategy provided by p6-XML-LibXML:author<FROGGS> */
#ifdef _WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT extern
#endif

s(GvcChannelMap);
s(GvcMixerCard);
s(GvcMixerCardPort);
s(GvcMixerCardProfile);
s(GvcMixerControl);
s(GvcMixerStream);
s(GvcMixerEventRole);
s(GvcMixerSink);
s(GvcMixerSinkInput);
s(GvcMixerSource);
s(GvcMixerSourceOutput);
s(GvcMixerStreamPort);
s(GvcMixerUIDevice);
