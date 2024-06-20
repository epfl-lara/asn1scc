; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68656 () Bool)

(assert start!68656)

(declare-fun b!309674 () Bool)

(declare-fun e!222639 () Bool)

(declare-fun tp_is_empty!925 () Bool)

(declare-fun mapRes!2947 () Bool)

(assert (=> b!309674 (= e!222639 (and tp_is_empty!925 mapRes!2947))))

(declare-fun condMapEmpty!2948 () Bool)

(declare-datatypes ((T!58211 0))(
  ( (T!58212 (val!462 Int)) )
))
(declare-datatypes ((array!18791 0))(
  ( (array!18792 (arr!9232 (Array (_ BitVec 32) T!58211)) (size!8149 (_ BitVec 32))) )
))
(declare-fun a2!555 () array!18791)

(declare-fun mapDefault!2947 () T!58211)

