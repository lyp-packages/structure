make-score = #(define-scheme-function (path) (string-or-symbol?)
  (scorify-music (sly:make-score-music path)))