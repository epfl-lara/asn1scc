; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64182 () Bool)

(assert start!64182)

(declare-fun mapNonEmpty!1971 () Bool)

(declare-fun mapRes!1971 () Bool)

(declare-fun tp!1972 () Bool)

(declare-fun tp_is_empty!607 () Bool)

(assert (=> mapNonEmpty!1971 (= mapRes!1971 (and tp!1972 tp_is_empty!607))))

(declare-datatypes ((T!52113 0))(
  ( (T!52114 (val!303 Int)) )
))
(declare-fun mapValue!1971 () T!52113)

(declare-fun mapRest!1971 () (Array (_ BitVec 32) T!52113))

(declare-fun mapKey!1972 () (_ BitVec 32))

(declare-datatypes ((array!16888 0))(
  ( (array!16889 (arr!8290 (Array (_ BitVec 32) T!52113)) (size!7294 (_ BitVec 32))) )
))
(declare-fun a1!580 () array!16888)

(assert (=> mapNonEmpty!1971 (= (arr!8290 a1!580) (store mapRest!1971 mapKey!1972 mapValue!1971))))

(declare-fun b!287359 () Bool)

(declare-fun e!204577 () Bool)

(declare-fun mapRes!1972 () Bool)

(assert (=> b!287359 (= e!204577 (and tp_is_empty!607 mapRes!1972))))

(declare-fun condMapEmpty!1971 () Bool)

(declare-fun a2!580 () array!16888)

(declare-fun mapDefault!1972 () T!52113)

