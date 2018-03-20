\version "2.19.37"

\require "structure"

\cd "aria"

% global context - put tempo, key, meter, other structure here
\global { \tempo "Adagio assai"
          \key c \minor
          \time 4/4
          s1*1 \bar "|." }

% define parts, in whatever order (following is the first bar of Bach's BWV 12)
\part "oboe"     \relative c' { d'4 ~ d32( d e fis g16 a32 bes) fis4\trill ~ fis16( g32 fis e g fis a64 g) }
\part "violino2" \relative c' { aes'16( g) f( g) aes8 r g16( f) e( f) g8 r }
\part "violino1" \relative c' { c'16( bes) aes( bes) c8 r bes16( aes) g( aes) bes8 r }
\part "viola1"   \relative c' { f8( f) c( c) g' g e e }
\part "viola2"   \relative c' { aes8( aes) f( f) b b g g }
\part "continuo" \relative c { f,4 r g r }

% get a nice score, with proper staff groups and staff ordering
\make-score "aria"