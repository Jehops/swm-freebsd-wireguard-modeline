;; swm-freebsd-wireguard-modeline.lisp
;;
;; Put %V in your mode-line format string to get the status of wireguard
;;

(in-package #:swm-freebsd-wireguard-modeline)

(defvar *wireguard-status* nil)
(defvar *wireguard-stream* nil)

(defun set-wireguard-stream ()
  (setf *wireguard-stream*
	(sb-ext:process-output
	 (sb-ext:run-program "ml_wireguard.sh" nil
			     :output :stream
			     :search t
			     :wait nil))))

(defun fmt-freebsd-wireguard-status (ml)
  "Return the status of Wireguard."
  (declare (ignore ml))
  (when (not *wireguard-stream*)
    (set-wireguard-stream))
  (when (listen *wireguard-stream*)
    (setf *wireguard-status* (read-line *wireguard-stream* nil "")))
  (format nil "~1a" *wireguard-status*))

;; Install formatter
(stumpwm::add-screen-mode-line-formatter #\V #'fmt-freebsd-wireguard-status)
