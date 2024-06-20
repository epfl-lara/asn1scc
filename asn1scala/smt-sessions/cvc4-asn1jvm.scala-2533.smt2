; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63968 () Bool)

(assert start!63968)

(declare-fun mapNonEmpty!1116 () Bool)

(declare-fun mapRes!1117 () Bool)

(declare-fun tp!1118 () Bool)

(declare-fun tp_is_empty!413 () Bool)

(assert (=> mapNonEmpty!1116 (= mapRes!1117 (and tp!1118 tp_is_empty!413))))

(declare-datatypes ((T!51259 0))(
  ( (T!51260 (val!206 Int)) )
))
(declare-datatypes ((array!16690 0))(
  ( (array!16691 (arr!8193 (Array (_ BitVec 32) T!51259)) (size!7197 (_ BitVec 32))) )
))
(declare-fun a1!623 () array!16690)

(declare-fun mapRest!1116 () (Array (_ BitVec 32) T!51259))

(declare-fun mapValue!1118 () T!51259)

(declare-fun mapKey!1118 () (_ BitVec 32))

(assert (=> mapNonEmpty!1116 (= (arr!8193 a1!623) (store mapRest!1116 mapKey!1118 mapValue!1118))))

(declare-fun b!284433 () Bool)

(declare-fun e!203330 () Bool)

(declare-fun mapRes!1118 () Bool)

(assert (=> b!284433 (= e!203330 (and tp_is_empty!413 mapRes!1118))))

(declare-fun condMapEmpty!1117 () Bool)

(declare-fun a3!63 () array!16690)

(declare-fun mapDefault!1117 () T!51259)

