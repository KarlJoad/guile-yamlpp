(define-module (yamlpp)
  #:export (scm->yaml))

;; (define test '((colors (primary (background . "#000000") (foreground . "#ffffff")) (normal (red . "#ff5f59") (green "#44bc44")))))

(define (yml-atom? v)
  "YAML atoms are one of either strings, integers, floats, or null."
  (or (string? v)
      (number? v)
      (null? v)))

(define yml-list? list?)

(define (yml-map? k v)
  (and (symbol? k)
       (yml-object? v)))

(define (mapping m)
  ;; TODO: Replace with match-let?
  (let ((k (car m))
        (v (cdr m)))
  (if (and (symbol? k) (yml-atom? v))
      (format #f "~a: ~a" k v)
      (map (lambda (sub-v)
             (mapping sub-v))
           v))))

(define (yml-object? o)
  (or (yml-atom? o)
      (yml-list? o)
      (yml-map? (car o) (cdr o))))

(define alist->yml (config)
  (map alist->yml ...))

(define* (scm->yaml scm
                    #:optional (port (current-output-port))
                    #:key (unicode #t))
  (format port "scm->yaml~%"))
