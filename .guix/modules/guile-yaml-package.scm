;;; Commentary:
;;
;; GNU Guix development package.  To build and install, run:
;;
;;   guix package -f guix.scm
;;
;; To use as the basis for a development environment, run:
;;
;;   guix shell -D -f guix.scm
;;
;;; Code:

(define-module (guile-yaml-package)
  #:use-module (guix packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages texinfo)
  #:use-module (guix licenses)
  #:use-module (guix utils)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (synnax packages resume))

(define vcs-file?
  ;; Return true if the given file is under version control.
  (or (git-predicate (string-append (current-source-directory) "/../.."))
      (const #t)))                                ;not in a Git checkout

(define-public guile-yaml
  (package
    (name "guile-yaml")
    (version "checkout")
    (source (local-file "../.." "guile-yaml-checkout"
                        #:recursive? #t
                        #:select? vcs-file?))
    (build-system gnu-build-system)
    (native-inputs
     (list autoconf automake pkg-config texinfo guile-3.0))
    (home-page "https://github.com/KarlJoad/guile-yaml.git")
    (synopsis "YAML/YML module for Guile")
    (description "Guile-YAML supports parsing and building YAML files according
to the specification.")
    (license gpl3+)))

guile-yaml
