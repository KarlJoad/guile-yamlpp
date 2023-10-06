(define-module (test-config-generation)
  #:use-module (srfi srfi-64)
  #:use-module (yaml))

(define test
  '((colors
    (primary
     (background . "#000000")
     (foreground . "#ffffff"))
    (normal (red . "#ff5f59") (green "#44bc44")))
   (font (size . 9)
         (normal (family . "Menlo") (style . "Regular")))
   (env (WINIT_X11_SCALE_FACTOR . 0.80))))

(test-begin "config-generation")

(test-equal "small-yaml-config"
  "colors:
  primary:
    background: \"#000000\"
    foreground: \"#ffffff\"
  normal:
    red: \"#ff5f59\"
    green: \"#44bc44\"
font:
  size: 9
  normal:
    family: Menlo
    style: Regular
env:
  WINIT_X11_SCALE_FACTOR: 0.80"
   (scm->yaml test #f))

(test-end "config-generation")
