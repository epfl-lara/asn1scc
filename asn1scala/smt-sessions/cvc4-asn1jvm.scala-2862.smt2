; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68702 () Bool)

(assert start!68702)

(declare-fun i!943 () (_ BitVec 32))

(declare-fun e!222848 () Bool)

(declare-fun at!235 () (_ BitVec 32))

(declare-fun b!310020 () Bool)

(declare-datatypes ((T!58397 0))(
  ( (T!58398 (val!485 Int)) )
))
(declare-datatypes ((array!18837 0))(
  ( (array!18838 (arr!9255 (Array (_ BitVec 32) T!58397)) (size!8172 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18837)

(assert (=> b!310020 (= e!222848 (and (= i!943 at!235) (or (bvslt at!235 #b00000000000000000000000000000000) (bvsge at!235 (size!8172 a2!566)))))))

(declare-fun mapIsEmpty!3085 () Bool)

(declare-fun mapRes!3086 () Bool)

(assert (=> mapIsEmpty!3085 mapRes!3086))

(declare-fun mapNonEmpty!3085 () Bool)

(declare-fun tp!3086 () Bool)

(declare-fun tp_is_empty!971 () Bool)

(assert (=> mapNonEmpty!3085 (= mapRes!3086 (and tp!3086 tp_is_empty!971))))

(declare-fun mapValue!3086 () T!58397)

(declare-fun mapRest!3086 () (Array (_ BitVec 32) T!58397))

(declare-fun a1!566 () array!18837)

(declare-fun mapKey!3086 () (_ BitVec 32))

(assert (=> mapNonEmpty!3085 (= (arr!9255 a1!566) (store mapRest!3086 mapKey!3086 mapValue!3086))))

(declare-fun mapNonEmpty!3086 () Bool)

(declare-fun mapRes!3085 () Bool)

(declare-fun tp!3085 () Bool)

(assert (=> mapNonEmpty!3086 (= mapRes!3085 (and tp!3085 tp_is_empty!971))))

(declare-fun mapKey!3085 () (_ BitVec 32))

(declare-fun mapRest!3085 () (Array (_ BitVec 32) T!58397))

(declare-fun mapValue!3085 () T!58397)

(assert (=> mapNonEmpty!3086 (= (arr!9255 a2!566) (store mapRest!3085 mapKey!3085 mapValue!3085))))

(declare-fun res!254232 () Bool)

(assert (=> start!68702 (=> (not res!254232) (not e!222848))))

(declare-fun to!659 () (_ BitVec 32))

(declare-fun from!692 () (_ BitVec 32))

(assert (=> start!68702 (= res!254232 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8172 a1!566) (size!8172 a2!566)) (bvsle to!659 (size!8172 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68702 e!222848))

(assert (=> start!68702 true))

(declare-fun e!222846 () Bool)

(declare-fun array_inv!7739 (array!18837) Bool)

(assert (=> start!68702 (and (array_inv!7739 a2!566) e!222846)))

(declare-fun e!222847 () Bool)

(assert (=> start!68702 (and (array_inv!7739 a1!566) e!222847)))

(declare-fun mapIsEmpty!3086 () Bool)

(assert (=> mapIsEmpty!3086 mapRes!3085))

(declare-fun b!310021 () Bool)

(assert (=> b!310021 (= e!222846 (and tp_is_empty!971 mapRes!3085))))

(declare-fun condMapEmpty!3085 () Bool)

(declare-fun mapDefault!3085 () T!58397)

