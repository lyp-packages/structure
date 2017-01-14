(define sly:root (make-hash-table))

(define (sly:tree-ref tree path)
  (let ((path (if (symbol? path) (symbol->string path) path)))
    (let loop ((leaf tree) (path-parts (string-split path #\/)))
      (let* ((key (car path-parts))
             (value (hash-ref leaf key))
             (path-parts (cdr path-parts))
           )
        (if (null? path-parts)
            value
            (if (hash-table? value)
                (loop value path-parts)
                #f))))))

(define (sly:tree-set! tree path value)
  (let ((path (if (symbol? path) (symbol->string path) path)))
    (let loop ((leaf tree) (path-parts (string-split path #\/)))
      (let* ((key (car path-parts))
             (path-parts (cdr path-parts))
           )
        (if (null? path-parts)
            (hash-set! leaf key value)
            (let* ((subleaf (hash-ref leaf key)))
              (if (not (hash-table? subleaf))
                (begin
                  (set! subleaf (make-hash-table))
                  (hash-set! leaf key subleaf)))
              (loop subleaf path-parts)))))))



(define (sly:recursive-hash-table->alist hash-table)
  (hash-fold
    (lambda (k v r)
      (let ((v (if (hash-table? v) (sly:recursive-hash-table->alist v) v)))
        (append r (list (cons k v)))
      )
      ;(if (hash-table? v)
        ;'(k (sly:recursive-hash-table->alist v))
        ;'(k v)
      
    ) '() hash-table)
)

(define (sly:tree-alist-ref tree path)
  (let ((path (if (symbol? path) (symbol->string path) path)))
    (let loop ((leaf tree) (path-parts (string-split path #\/)))
      (let* ((key (car path-parts))
             (value (hash-ref leaf key))
             (path-parts (cdr path-parts))
           )
        (if (null? path-parts) ; reached target
            (if (hash-table? value)
                (sly:recursive-hash-table->alist value)
                value)
            (if (hash-table? value)
                (loop value path-parts)
                #f))))))

(define (sly:ref path) (sly:tree-ref sly:root path))
(define (sly:set! path value) (sly:tree-set! sly:root path value))

(define (sly:alist-ref path) (sly:tree-alist-ref sly:root path))