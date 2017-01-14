\version "2.19.37"
\pinclude "music.ly"

\cd "bwv12/aria"

#(sly:set! 'titles/composer "Johann Sebastian Bach")
#(sly:set! 'titles/opus "BWV 12")

#(sly:set! 'editions/chorton/music 'bwv12/aria)

% can also set nested entries using an alist
#(sly:set! 'editions/chorton
  '((transpose . "f g")
    (titles/edition . Chorton)))