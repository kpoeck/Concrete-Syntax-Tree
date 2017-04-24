(cl:in-package #:concrete-syntax-tree)

(defgeneric canonicalize-declaration-specifier
    (system declaration-identifier declaration-identifier-cst declaration-data))

(defmethod  canonicalize-declaration-specifier
    (system declaration-identifier declaration-identifier-cst declaration-data)
  '())

;;; Given a PREFIX P and a list of ITEMS, say (I1 I2 ... In), return a
;;; list of the items prefixed with P, i.e. ((P I1) (P I2) ... (P
;;; In)).  The twist is that the list of items is represented in the
;;; form of a concrete syntax tree.
(defun map-prefix (prefix items)
  (loop for remaining = items then (rest remaining)
        until (null remaining)
        collect (list prefix (first remaining))))

(defmethod  canonicalize-declaration-specifier
    (system
     (declaration-identifier (eql 'optimize))
     declaration-identifier-cst
     declaration-data)
  (map-prefix declaration-identifier-cst declaration-data))
