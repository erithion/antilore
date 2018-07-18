﻿#include "vlc_helper.h"
#include <mutex>

template < typename T >
using scoped_do = std::unique_ptr< T, std::function< void( T* ) > >;

char* mY_hACkY_wACky_StRDuP( const char* str )
{
    // Внутри функция text_segment_New дублирует С-строку с помощью strdup и сохраняет указатель внутри сегмента в psz_text. 
    // Копируем строку, забираем указатель и "выкидываем" ненужный сегмент.
    scoped_do< text_segment_t > unneeded_( text_segment_New( str ), [] ( text_segment_t* p )
    {
        text_segment_Delete( p );
    } );

    char*  ptr = unneeded_->psz_text;
    unneeded_->psz_text = 0;
    return ptr;
}