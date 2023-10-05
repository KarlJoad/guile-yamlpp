(define-module (yaml)
  #:export (scm->yaml))

;; (define test '((colors (primary (background . "#000000") (foreground . "#ffffff")) (normal (red . "#ff5f59") (green "#44bc44")))))

(define (yml-atom? v)
  "YAML atoms are one of either strings, integers, floats, or null."
  (or (string? v)
      (number? v)
      (null? v)))

(define (output-yaml scm port indent-level)
  (let ((next-indent-level (+ indent-level 2)))
    (cond ((string? scm) (format port "~s" scm))
          ((number? scm) (format port "~a" scm))
          ((boolean? scm) (format port "~a" (if scm "true" "false")))
          ((null? scm) (format port ""))
          ((list? scm) (string-join (map (lambda (e) (output-yaml e port next-indent-level)) scm) "\n" 'infix))
          ((and (pair? scm)
                (symbol? (car scm)))
           (format port "~a: ~a" (symbol->string (car scm))
                   (output-yaml (cdr scm) port next-indent-level)))
          (#t (error "Invalid alist element!")))))


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

(define* (scm->yaml scm
                    #:optional (port (current-output-port))
                    #:key (unicode #t))
  (format port "scm->yaml~%"))
