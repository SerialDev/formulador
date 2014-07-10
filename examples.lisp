;;;; examples.lisp
;;;;
;;;; Copyright (c) 2014 Robert Smith
;;;;
;;;; This file contains some examples of typeset formulas.

(in-package #:formulador)

(defun pow (a b)
  (script-box a :superscript b))


;;; > (draw *chudnovsky*)
;;;
;;; +------------------------------------------------------------------------+
;;; |         _______    ∞                                                   |
;;; |        |      3   ===                                                 k|
;;; | 1     \|640320    \     (6k)! (545140134k + 13591409)  /       1     \ |
;;; |--- = -----------   >   ------------------------------- | - --------- | |
;;; | π        12       /                        3           |          3  | |
;;; |                   ===            (3k)! (k!)            \    640320   / |
;;; |                  k = 0                                                 |
;;; +------------------------------------------------------------------------+


(defparameter *chudnovsky*
  (let ((pi-letter (code-char #x3C0)))
    (tape
     (frac-box "1" pi-letter)
     "="
     (frac-box (sqrt-box (pow "640320" "3"))
               "12")
     (limits-box +sigma+
                 :above "∞"
                 :below "k = 0")
     (frac-box (tape "(6k)!" "(545140134k + 13591409)")
               (tape "(3k)!" (pow "(k!)" "3")))
     (pow (parens-box
           (tape "-" (frac-box "1"
                               (pow "640320" "3"))))
          "k"))))

(defparameter *gauss-law*
  (let ((rho (code-char #x03C1))
        (S "S")
        (dS (glue +partial+ "S")))
    (tape (limits-box +triple-integral+ :below S) rho "dV"
          "="
          (limits-box +double-integral+ :below dS) (glue "E" +center-dot+ "dA"))))
