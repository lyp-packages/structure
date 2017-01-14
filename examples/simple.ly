\version "2.19.37"
\require "structure:.."

% music.ly contains the actual music
\pinclude "music.ly"

% create a score
\make-score #'bwv12/aria

% create a part
\make-part #'bwv12/aria oboe