# Structure for Lilypond - UI mockup

# produce a score
lyp sly -s

# produce a score for a specific movement
lyp sly -s 04-aria
lyp sly -s BWV12/04-aria

# produce a part
lyp sly -p oboe

# produce a part for a specific movement
lyp sly -p oboe -m 04-aria

# typeset measure range
lyp sly -p oboe -m 04-aria -M31-35

# typeset an edition
lyp sly -e chorton/score

lyp sly -e 