;;; "strcase.scm" String casing functions.
; Copyright (C) Feb 1992 Dirk Lutzebaeck (lutzeb@cs.tu-berlin.de)

; Modified by Aubrey Jaffer Nov 1992.
; Authors of the original version were Ken Dickey and Aubrey Jaffer.

;string-upcase, string-downcase, string-capitalize
; are obvious string conversion procedures and are non destructive.
;string-upcase!, string-downcase!, string-capitalize!
; are destructive versions.

(define (string-upcase! str)
  (do ((i (- (string-length str) 1) (- i 1)))
      ((< i 0) str)
    (string-set! str i (char-upcase (string-ref str i)))))

(define (string-upcase str)
  (string-upcase! (string-copy str)))
  
(define (string-downcase! str)
  (do ((i (- (string-length str) 1) (- i 1)))
      ((< i 0) str)
    (string-set! str i (char-downcase (string-ref str i)))))

(define (string-downcase str)
  (string-downcase! (string-copy str)))

(define (string-capitalize! str)	; "hello" -> "Hello"
  (let ((non-first-alpha #f)		; "hELLO" -> "Hello"
	(str-len (string-length str)))	; "*hello" -> "*Hello"
    (do ((i 0 (+ i 1)))			; "hello you" -> "Hello You"
	((= i str-len) str)
      (let ((c (string-ref str i)))
	(if (char-alphabetic? c)
	    (if non-first-alpha
		(string-set! str i (char-downcase c))
		(begin
		  (set! non-first-alpha #t)
		  (string-set! str i (char-upcase c))))
	    (set! non-first-alpha #f))))))

(define (string-capitalize str)
  (string-capitalize! (string-copy str)))
