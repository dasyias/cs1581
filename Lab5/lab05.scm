;; <Your name here>
;; Lab Exercise 5
;; CS 1581 Honors Computer Science I
;; <Semester and year here, e.g. Fall 2012>

(module lab05 racket

  (provide sum-func
	   make-exponentiator
	   make-series
	   make-verifier
	   f-upc)


  ;; ****************************************************************************
  ;; Exercise 5.6, p. 113

  (define sum-func
    (lambda (low high f)
      (if (= low high)
          (f low)
          (+ (f low) (sum-func (+ low 1) high f)))))


  ;; ****************************************************************************
  ;; Exercise 5.7, p. 119

  (define make-exponentiator
    (lambda (e)
      (lambda (x) (expt x e))))


  ;; ****************************************************************************
  ;; Exercise 5.8, p. 120

  (define make-series
    (lambda (f)
      (lambda (n)
        (if (= n 1)
            1
            (f ((make-series f) (- n 1)) n)))))


  ;; ****************************************************************************
  ;; Exercise 5.11, p. 121

  (define make-verifier
    (lambda (f m)
      (lambda (n)
        (define (do x y)
          (if (= y 0)
              0
              (+ (do (+ x 1) (quotient y 10)) (f x (modulo y 10)))))
        (= (remainder (do 1 n) m) 0))))


  ;; ****************************************************************************
  ;; Exercise 5.12, p. 122

  (define f-upc 
    (lambda (i di)
      (if (odd? i)
          di
          (* 3 di))))

)