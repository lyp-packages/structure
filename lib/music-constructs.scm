(define (sly:make-score-music path)
  (let* ((leaf (sly:ref path))
         (parts (->symbol-list (hash-keys leaf)))
         (parts (lset-difference eq? parts '(global))) ; remove global part
         (global (hash-ref-indiff leaf 'global))
         (order (sly:order-parts sly:default-score-order parts))
         (musics '())
       )
       
    ;(if global (set! musics (list global)))
    
    (for-each
      (lambda (group)
        (let* ((group-music (sly:make-staff-group-music group leaf global)))
          (set! musics (append-item musics group-music))))
      order)
    
    (make-simultaneous-music musics)))

(define (sly:make-staff-group-music group leaf global)
  (let* ((parts group)
         (musics (map
                   (lambda (p)
                     (let ((part-music (hash-ref-indiff leaf p)))
                     (sly:make-part (symbol->string p) part-music global))) 
                   parts))
         (musics (make-simultaneous-music musics)))
    #{ \new StaffGroup \with { } { #musics } #} ))

(define (sly:prefix-part-music name expr)
  (let* ((settings (sly:instrument-settings name))
         (clef (assoc-ref settings 'clef))
       (prefixes '()))
    
    (if clef (set! prefixes (append prefixes (list #{ \clef #clef #}))))
    
    (if (null? prefixes)
        expr
        (make-sequential-music (append prefixes (list expr))))))

(define (sly:make-part name expr global)
  (let* ((with-exprs #f)
         (expr (sly:prefix-part-music name expr))
         (expr (if global (make-simultaneous-music (list global expr)) expr))
       )
    #{ \new Staff \with { } { #expr } #}
  ))

