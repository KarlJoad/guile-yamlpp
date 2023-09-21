(define-module (test-example)
  #:use-module (srfi srfi-64))

(test-begin "example")

(test-equal "1 plus 1"
  (+ 1 1)
  2)

(test-end "example")
