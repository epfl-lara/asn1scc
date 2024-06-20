; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68618 () Bool)

(assert start!68618)

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun e!222408 () Bool)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun b!309195 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!309195 (= e!222408 (not (and (bvsle fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsle (bvsub i!932 #b00000000000000000000000000000001) to!617))))))

(declare-datatypes ((T!58085 0))(
  ( (T!58086 (val!449 Int)) )
))
(declare-datatypes ((array!18763 0))(
  ( (array!18764 (arr!9219 (Array (_ BitVec 32) T!58085)) (size!8136 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18763)

(declare-fun a2!524 () array!18763)

(assert (=> b!309195 (= (select (arr!9219 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9219 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21481 0))(
  ( (Unit!21482) )
))
(declare-fun lt!440367 () Unit!21481)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun arrayRangesEqImpliesEq!311 (array!18763 array!18763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21481)

(assert (=> b!309195 (= lt!440367 (arrayRangesEqImpliesEq!311 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun mapNonEmpty!2861 () Bool)

(declare-fun mapRes!2861 () Bool)

(declare-fun tp!2862 () Bool)

(declare-fun tp_is_empty!899 () Bool)

(assert (=> mapNonEmpty!2861 (= mapRes!2861 (and tp!2862 tp_is_empty!899))))

(declare-fun mapValue!2861 () T!58085)

(declare-fun mapRest!2861 () (Array (_ BitVec 32) T!58085))

(declare-fun mapKey!2861 () (_ BitVec 32))

(assert (=> mapNonEmpty!2861 (= (arr!9219 a1!524) (store mapRest!2861 mapKey!2861 mapValue!2861))))

(declare-fun b!309196 () Bool)

(declare-fun e!222405 () Bool)

(declare-fun mapRes!2862 () Bool)

(assert (=> b!309196 (= e!222405 (and tp_is_empty!899 mapRes!2862))))

(declare-fun condMapEmpty!2861 () Bool)

(declare-fun mapDefault!2861 () T!58085)

