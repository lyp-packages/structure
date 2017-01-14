\version "2.19.37"
\require "assert"
\require "structure:.."

#(begin
  (assert:string=? (sly:instrument-class "oboe1") "oboe")
  (assert:string=? (sly:instrument-class "oboe2") "oboe")
  (assert:string=? (sly:instrument-class "oboe") "oboe")
  
  (define parts '(oboe violino2 violino1 viola1 viola2 continuo))
  (assert:equal? (sly:order-parts sly:default-score-order parts)
    '((oboe) (violino1 violino2) (viola1 viola2) (continuo)))
)