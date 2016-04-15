; debug
(define d display)
(define (df . params) (display (apply format params)))
(define-macro (p ref) `(display (format "~a: ~a\n" (quote ,ref) ,ref)))

; coerce values
(define (->string x) (if (string? x) x (symbol->string x)))
(define (->symbol x) (if (symbol? x) x (string->symbol x)))

; coerced symbol equality
(define (->symbol-eq? x y) (eq? (->symbol x) (->symbol y)))

; coerce lists
(define (->symbol-list l) (map ->symbol l))

; list operations
(define (append-item l i) (append l (list i)))
(define (safe-car l) (if (null? l) #f (car l)))

; hash-table operations
(define (hash-keys h) (hash-map->list (lambda (k v) k) h))
(define (hash-ref-indiff h s)
  (or (hash-ref h s)
      (and (symbol? s) (hash-ref h (symbol->string s)))
      (and (string? s) (hash-ref h (string->symbol s)))))