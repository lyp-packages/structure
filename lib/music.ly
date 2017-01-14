make-score = #(define-scheme-function (path) (string-or-symbol?)
  (begin
    (display (format "\npath: ~a\n" path))
    (scorify-music (sly:make-score-music path))))
  
make-part = #(define-scheme-function (path part) (string-or-symbol? string-or-symbol?)
  (scorify-music (sly:make-partial-score-music path (list part))))
