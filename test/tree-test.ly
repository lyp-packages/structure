\version "2.19.37"
\require "assert"
\pinclude "../package.ly"

#(begin
  (sly:set! "life" 42)
  (assert:eq? (sly:ref "life") 42)

  (sly:set! "x/y/z" 123)
  (assert:eq? (sly:ref "x/y/z") 123)

  (sly:set! "abc" 1)
  (sly:set! "def/ghi" 2)
  (sly:set! 'def/jkl/mno 3)
  
  (assert:eq? (sly:ref "xxx") #f)
  (assert:eq? (sly:ref "abc") 1)
  (assert:eq? (sly:ref "abc/ddd") #f)
  (assert:eq? (sly:ref 'def/ghi) 2)
  (assert:eq? (sly:ref "def/xxx") #f)
  (assert:eq? (sly:ref "def/jkl/mno") 3)
)