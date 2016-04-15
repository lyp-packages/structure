(use-modules (ice-9 regex))

(define sly:instruments (make-hash-table))

(define (sly:define-instrument! name settings)
  (hash-set! sly:instruments name settings))
  
(define (sly:instrument-class name)
  (regexp-substitute #f (string-match "^([^0-9]+)" name) 1))

(define (sly:instrument-settings name)
  (let ((name (sly:instrument-class name)))
    (or (hash-ref sly:instruments name) '())))

(sly:define-instrument! "viola" '((clef . "alto")))
(sly:define-instrument! "continuo" '((clef . "bass")))

(define sly:default-score-order '(
  ((trumpet tromba trumpet1 trumpet2 trumpet3 tromba1 tromba2 tromba3))
  ((flute flauto flute1 flute2 flauto1 flauto2))
  ((oboe hautbois oboe1 oboe2 oboe3 hautbois1 hautbois2 hautbois3))
  ((violin violino violin1 violin2 violin3 violino1 violino2 violino3))
  ((viola viola1 viola2))
  ((soprano alto tenor tenore bass basso soprano1 soprano2 alto1 alto2
    tenor1 tenor2 tenore1 tenore2 bass1 bass2 basso1 basso2))
  ((continuo))))

(define (sly:order-parts proper-order part-list)
  (let loop ((definite-order '())
             (proper-order proper-order)
             (part-list (->symbol-list part-list)))
    (let* ((next-group (car (car proper-order)))
           (remaining-groups (cdr proper-order))
           (intersection (lset-intersection eq? next-group part-list))
           (difference (lset-difference eq? part-list next-group)))
      (if (not (null? intersection))
          (set! definite-order (append definite-order (list intersection))))
      (if (or (null? difference) (null? remaining-groups))
          (if (null? difference) 
            definite-order
            (append-item definite-order difference))
          (loop definite-order remaining-groups difference)))))