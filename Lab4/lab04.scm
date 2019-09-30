;; <Your name here>
;; Lab Exercise 4
;; CS 1581 Honors Computer Science I
;; <Semester and year here, e.g. Fall 2012>

(module lab04 racket

  (provide my-curve
	   triangle
	   sierpinskis-gasket)

  (require (lib "fungraph.ss" "concabs"))

  (set-default-image-size! 300)

  ;; *****************************************************************
  ;; Exercise 4.8, p. 99

  (define my-curve
    (lambda (x0 y0 x1 y1 level)
      (if (= level 0)
          (line x0 y0 x1 y1)
          (let ((xmid (/ (+ x0 x1) 2))
                (ymid (/ (+ y0 y1) 2))
                (dx (* x1 x0))
                (dy (* y1 y0)))
            (let ((xa (+ xmid (/ dy 2)))
                  (ya (+ ymid (/ dx 2))))
              (overlay (my-curve x0 y0 xa ya (- level 1))
                       (my-curve xa ya x1 y1 (- level 1))))))))

  ; *****************************************************************
  ;; Exercise 4.9, p. 99

  (define triangle
    (lambda (x0 y0 x1 y1 x2 y2)
      (overlay (line x0 y0 x1 y1)
               (overlay (line x1 y1 x2 y2)
                        (line x0 y0 x2 y2)))))

  ; *****************************************************************
  ;; Exercise 4.10, p. 99

  (define sierpinskis-gasket
    (lambda (x0 y0 x1 y1 x2 y2 level)
      (if (= level 0)
          (triangle x0 y0 x1 y1 x2 y2)
          (let ((xmid0 (/ (+ x0 x1) 2))
                (ymid0 (/ (+ y0 y1) 2)))
                (let ((xmid1 (/ (+ x1 x2) 2))
                      (ymid1 (/ (+ y1 y2) 2)))
                      (let ((xmid2 (/ (+ x0 x2) 2))
                            (ymid2 (/ (+ y0 y2) 2)))
                            (overlay (overlay
                                      (sierpinskis-gasket x0 y0 xmid0 ymid0 xmid2 ymid2 (- level 1))
                                      (sierpinskis-gasket x1 y1 xmid0 ymid0 xmid1 ymid1 (- level 1)))
                                     (sierpinskis-gasket x2 y2 xmid1 ymid1 xmid2 ymid2 (- level 1)))))))))

)