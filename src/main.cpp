#include "vlc_helper.h"

vlc_module_begin( )
    set_shortname( N_( "antilore" ) )
    set_subcategory( SUBCAT_AUDIO_AFILTER )
    set_category( CAT_AUDIO )
    set_capability( "audio filter", 0 )
    set_callbacks( antilore::module< filter_t >::open, antilore::module< filter_t >::close )
    set_description( N_( "antilore audio filter" ) )

vlc_module_end( )

template <>
int antilore::module< filter_t >::open( module< filter_t >::in_type* flt )
{
    return VLC_SUCCESS;
}

template <>
void antilore::module< filter_t >::close( module< filter_t >::in_type* filter )
{
}
