(define-module (test-output-collections)
  #:use-module (srfi srfi-64)
  #:use-module (yaml))

(test-begin "output-collections")

(test-equal "output-pair"
  "key: \"val\""
  (scm->yaml (cons 'key "val") #f))

(test-equal "output-list"
  "- \"item 1\"
- 42
- 3.14"
  (scm->yaml (list "item 1" 42 3.14) #f))

(test-end "output-collections")
