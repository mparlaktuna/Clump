(cl:in-package #:clump-test)

(defclass size-mixin ()
  ((%size :initarg :size :accessor size)))

(defclass leaf-size (size-mixin clump-2-3-tree:leaf)
  ()
  (:default-initargs :size 1))

(defclass 2-node-size (size-mixin clump-2-3-tree:2-node)
  ())

(defgeneric recompute-size (node))

(defmethod recompute-size ((node 2-node-size))
  (setf (size node)
	(+ (size (clump-2-3-tree:left node))
	   (size (clump-2-3-tree:right node)))))

(defmethod initialize-instance :after ((object 2-node-size) &key)
  (recompute-size object))

(defclass 3-node-size (size-mixin clump-2-3-tree:3-node)
  ())

(defmethod initialize-instance :after ((object 3-node-size) &key)
  (reinitialize-instance
   object
   :size (+ (size (clump-2-3-tree:left object))
	    (size (clump-2-3-tree:middle object))
	    (size (clump-2-3-tree:right object)))))

(defclass size-tree (clump-2-3-tree:tree)
  ()
  (:default-initargs
   :2-node-class '2-node-size
   :3-node-class '3-node-size))
