\version "2.19.37"
\require "assert"
\require "structure:.."

#(begin
  (assert:string=? (->string "abc") "abc")
  (assert:string=? (->string 'abc) "abc")

  (assert:eq? (->symbol "abc") 'abc)
  (assert:eq? (->symbol 'abc) 'abc)
  
  (assert (->symbol-eq? "abc" 'abc))
  (assert (not (->symbol-eq? "abc" "abcd")))
  
  (assert:equal? (->symbol-list '("abc" "def" ghi)) '(abc def ghi))
  
  (assert:equal? (append-item '(1 2 3) 5) '(1 2 3 5))

  (assert:equal? (safe-car '(3 4 5)) 3)
  (assert:equal? (safe-car '()) #f)
  
  (define h (make-hash-table))
  (assert:eq? (hash-keys h) '())
  (hash-set! h 'a 'b)
  (hash-set! h 'c 'd)
  (assert:equal? (sort (hash-keys h) symbol<?) '(a c))
  
  (hash-set! h "abc" 'def)
  (assert:eq? (hash-ref-indiff h 'a) 'b)
  (assert:eq? (hash-ref-indiff h 'abc) 'def)
  (assert:eq? (hash-ref-indiff h "a") 'b)
  (assert:eq? (hash-ref-indiff h "abc") 'def)
)