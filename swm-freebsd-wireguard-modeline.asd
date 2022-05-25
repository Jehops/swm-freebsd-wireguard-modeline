;;;; swm-freebsd-wireguard-modeline.asd

(asdf:defsystem #:swm-freebsd-wireguard-modeline
  :description "StumpWM mode-line Wireguard status for FreeBSD"
  :author "Joseph Mingrone <jrm@ftfl.ca>"
  :license "2-CLAUSE BSD (see COPYRIGHT file for details)"
  :depends-on (#:stumpwm)
  :serial t
  :components ((:file "package")
               (:file "swm-freebsd-wireguard-modeline")))

