(define-module (yamlpp)
  #:export (scm->yaml))

(define* (scm->yaml scm
                    #:optional (port (current-output-port))
                    #:key (unicode #t))
  (format port "scm->yaml~%"))
