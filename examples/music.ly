\version "2.19.37"

% set namespace
\cd "bwv12/aria"

% global context - put tempo, key, meter, other structure here
\global { \tempo "Adagio assai"
          \key c \minor
          \time 4/4
          s1*1 \bar "|." }

% define parts, in whatever order
\part "oboe"     \relative c' { c'4 ~ c32( c d e f16 g32 aes) e4\trill ~ e16( f32 e d f e g64 f) }
\part "violino2" \relative c' { aes'16( g) f( g) aes8 r g16( f) e( f) g8 r }
\part "violino1" \relative c' { c'16( bes) aes( bes) c8 r bes16( aes) g( aes) bes8 r }
\part "viola1"   \relative c' { f8( f) c( c) g' g e e }
\part "viola2"   \relative c' { aes8( aes) f( f) b b g g }
\part "continuo" << \relative c { f,4 r g r }
                   \figures { s1 } >>
