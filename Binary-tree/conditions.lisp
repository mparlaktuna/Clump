(cl:in-package #:clump-binary-tree)

(define-condition binary-tree-error (error acclimation:condition)
  ())

(define-condition invalid-binary-tree (binary-tree-error)
  ((%tree :initarg :tree :reader tree)))

(define-condition right-subtree-must-be-non-nil (binary-tree-error)
  ((%tree :initarg :tree :reader tree)))
