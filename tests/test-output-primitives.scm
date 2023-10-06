(define-module (test-output-primitives)
  #:use-module (srfi srfi-64)
  #:use-module (yaml))

(test-begin "output-primitive")

(test-equal "output-string"
  "\"some kind of test string\""
  (scm->yaml "some kind of test string" #f))

(test-equal "output-number"
  "42"
  (scm->yaml 42 #f))

(test-equal "output-boolean-false"
  "false"
  (scm->yaml #f #f))

(test-equal "output-boolean-true"
  "true"
  (scm->yaml #t #f))

(test-equal "output-null"
  ""
  (scm->yaml (list) #f))

(test-equal "output-pair"
  "key: \"val\""
  (scm->yaml (cons 'key "val") #f))

(test-end "output-primitive")
