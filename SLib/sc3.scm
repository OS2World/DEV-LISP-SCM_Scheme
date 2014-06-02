;"sc3.scm" Implementation of rev3 procedures eliminated in subsequent versions.
;Copyright (C) 1991 Aubrey Jaffer
;
;Permission to copy this software, to redistribute it, and to use it
;for any purpose is granted, subject to the following restrictions and
;understandings.
;
;1.  Any copy made of this software must include this copyright notice
;in full.
;
;2.  I have made no warrantee or representation that the operation of
;this software will be error-free, and I am under no obligation to
;provide any services, by way of maintenance, update, or otherwise.
;
;3.  In conjunction with products arising from the use of this
;material, there shall be no use of my name in any advertising,
;promotional, or sales literature without prior written consent in
;each case.

(define (last-pair l)
  (if (pair? (cdr l)) (last-pair (cdr l)) l))

(define t #t)

(define nil #f)

;;;I can't find procedure APPROXIMATE in the Revised^3 Report.
