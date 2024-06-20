; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68540 () Bool)

(assert start!68540)

(declare-fun b!308071 () Bool)

(declare-fun e!221885 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!308071 (= e!221885 (and (= i!932 fromSlice!46) (bvsgt #b00000000000000000000000000000000 fromSlice!46)))))

(declare-fun mapNonEmpty!2627 () Bool)

(declare-fun mapRes!2628 () Bool)

(declare-fun tp!2627 () Bool)

(declare-fun tp_is_empty!821 () Bool)

(assert (=> mapNonEmpty!2627 (= mapRes!2628 (and tp!2627 tp_is_empty!821))))

(declare-fun mapKey!2627 () (_ BitVec 32))

(declare-datatypes ((T!57747 0))(
  ( (T!57748 (val!410 Int)) )
))
(declare-datatypes ((array!18685 0))(
  ( (array!18686 (arr!9180 (Array (_ BitVec 32) T!57747)) (size!8097 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18685)

(declare-fun mapRest!2627 () (Array (_ BitVec 32) T!57747))

(declare-fun mapValue!2628 () T!57747)

(assert (=> mapNonEmpty!2627 (= (arr!9180 a2!524) (store mapRest!2627 mapKey!2627 mapValue!2628))))

(declare-fun b!308072 () Bool)

(declare-fun e!221884 () Bool)

(assert (=> b!308072 (= e!221884 (and tp_is_empty!821 mapRes!2628))))

(declare-fun condMapEmpty!2627 () Bool)

(declare-fun mapDefault!2628 () T!57747)

