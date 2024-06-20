; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63176 () Bool)

(assert start!63176)

(declare-fun mapNonEmpty!848 () Bool)

(declare-fun mapRes!849 () Bool)

(declare-fun tp!848 () Bool)

(declare-fun tp_is_empty!335 () Bool)

(assert (=> mapNonEmpty!848 (= mapRes!849 (and tp!848 tp_is_empty!335))))

(declare-datatypes ((T!50261 0))(
  ( (T!50262 (val!167 Int)) )
))
(declare-fun mapValue!848 () T!50261)

(declare-fun mapKey!849 () (_ BitVec 32))

(declare-fun mapRest!849 () (Array (_ BitVec 32) T!50261))

(declare-datatypes ((array!16369 0))(
  ( (array!16370 (arr!8064 (Array (_ BitVec 32) T!50261)) (size!7068 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16369)

(assert (=> mapNonEmpty!848 (= (arr!8064 a1!471) (store mapRest!849 mapKey!849 mapValue!848))))

(declare-fun b!282890 () Bool)

(declare-fun e!202092 () Bool)

(declare-fun mapRes!848 () Bool)

(assert (=> b!282890 (= e!202092 (and tp_is_empty!335 mapRes!848))))

(declare-fun condMapEmpty!849 () Bool)

(declare-fun a2!471 () array!16369)

(declare-fun mapDefault!848 () T!50261)

