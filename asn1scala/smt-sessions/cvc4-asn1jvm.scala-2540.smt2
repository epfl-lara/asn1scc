; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64014 () Bool)

(assert start!64014)

(declare-fun mapIsEmpty!1310 () Bool)

(declare-fun mapRes!1312 () Bool)

(assert (=> mapIsEmpty!1310 mapRes!1312))

(declare-fun mapNonEmpty!1310 () Bool)

(declare-fun mapRes!1310 () Bool)

(declare-fun tp!1310 () Bool)

(declare-fun tp_is_empty!455 () Bool)

(assert (=> mapNonEmpty!1310 (= mapRes!1310 (and tp!1310 tp_is_empty!455))))

(declare-fun mapKey!1312 () (_ BitVec 32))

(declare-datatypes ((T!51441 0))(
  ( (T!51442 (val!227 Int)) )
))
(declare-fun mapRest!1311 () (Array (_ BitVec 32) T!51441))

(declare-fun mapValue!1310 () T!51441)

(declare-datatypes ((array!16733 0))(
  ( (array!16734 (arr!8214 (Array (_ BitVec 32) T!51441)) (size!7218 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16733)

(assert (=> mapNonEmpty!1310 (= (arr!8214 a3!68) (store mapRest!1311 mapKey!1312 mapValue!1310))))

(declare-fun b!284911 () Bool)

(declare-fun e!203593 () Bool)

(assert (=> b!284911 (= e!203593 (and tp_is_empty!455 mapRes!1310))))

(declare-fun condMapEmpty!1312 () Bool)

(declare-fun mapDefault!1311 () T!51441)

