#pragma once

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

// get rid of vlc_fs.h(243): error C2061: syntax error: identifier 'mode_t'
typedef int mode_t;
#define __PLUGIN__
// external to emulated poll
int poll(struct pollfd *fds, unsigned nfds, int timeout);
// this is to get rid of various errors due to the missing ssize_t type 
#if defined(_MSC_VER) 
#include <BaseTsd.h> 
typedef SSIZE_T ssize_t;
#endif
// this is to get rid of the error C3861: 'N_': identifier not found 
#define N_(str) (str) 

#include <cstddef>
// Let us hope for the best :)
#pragma warning( disable : 4244 ) 
#pragma warning( disable : 4200 ) 
#include <vlc_common.h>
//#include <vlc_objects.h>
#include <vlc_plugin.h>
#include <vlc_filter.h>
//#include <vlc_block.h>
//#include <vlc_fs.h>
//#include <vlc_strings.h>
//#include <vlc_subpicture.h>
//#include <vlc_actions.h>
//#include <vlc_mouse.h>
//#include <vlc_interface.h>
//#include <vlc_codec.h>
//#include <vlc_fourcc.h>
//#include <vlc_modules.h>
//#include <vlc_dialog.h>
//#include <vlc_playlist.h>
//#include <vlc_input.h>
//#include <vlc_extensions.h>
//#include <include/vlc_spu.h>
#include <libvlc.h>

#define MODULE_STRING "antilore"

namespace antilore 
{
    template< typename T >
    struct module
    {
        typedef T in_type;

        static int open( in_type* );
        static void close( in_type* );
    };

    char* mY_hACkY_wACky_StRDuP( const char* str );
}