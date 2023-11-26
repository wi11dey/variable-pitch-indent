(require 'cl-lib)

(defgroup )

(defcustom )

(define-globalized-minor-mode global-variable-pitch-indent-mode
  variable-pitch-indent-mode
  variable-pitch-indent-mode)



(cl-defstruct variable-pitch-indent-column
  ""
  )

(defun variable-pitch-indent-current-column ()
  (make-column (point-marker)
	       (current-column)))

(cl-defgeneric variable-pitch-indent-= (number-or-marker-or-column &rest numbers-or-markers-or-columns))

(cl-defgeneric variable-pitch-indent-=/ (number-or-marker-or-column &rest numbers-or-markers-or-columns))

(cl-defgeneric variable-pitch-indent-< (number-or-marker-or-column &rest numbers-or-markers-or-columns))

(cl-defgeneric variable-pitch-indent-<= (number-or-marker-or-column &rest numbers-or-markers-or-columns))

(cl-defgeneric variable-pitch-indent-> (number-or-marker-or-column &rest numbers-or-markers-or-columns))

(cl-defgeneric variable-pitch-indent->= (number-or-marker-or-column &rest numbers-or-markers-or-columns))

(defmacro variable-pitch-indent-rewrite (library)
  (require 'names)
  (macroexpand-all
   `(define-namespace variable-pitch-indent-
,@(with-temp-buffer
    (insert-file-contents (find-library-name (symbol-name library)) :visit)
    (goto-char (point-min))
    (insert ?\()
    (goto-char (point-max))
    (insert ?\))
    (goto-char (point-min))
    (read (current-buffer))))
   (mapcar (lambda (f)
	     (cons f (lambda (&rest args)
		       (cons (intern (concat "variable-pitch-indent-" (symbol-name f)))
			     args))))
	   '(current-column
	     =
	     =/
	     <
	     <=
	     >
	     >=))))
