#(begin
  (define sly:tree-ptr #f)
  (define (sly:qualify-var-path path)
    (if sly:tree-ptr (format "~a/~a" sly:tree-ptr path) path))
)

cd = #(define-void-function (path) (string-or-symbol?)
  (set! sly:tree-ptr path))

tset = #(define-void-function (path expr) (string-or-symbol? scheme?)
  (sly:set! (sly:qualify-var-path path) expr))

tref = #(define-scheme-function (path) (string-or-symbol?)
  (sly:ref (sly:qualify-var-path path)))

global = #(define-void-function (expr) (scheme?)
  (tset 'global expr))

part = #tset