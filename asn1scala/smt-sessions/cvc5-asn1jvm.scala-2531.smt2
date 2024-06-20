; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63952 () Bool)

(assert start!63952)

(declare-fun mapIsEmpty!1044 () Bool)

(declare-fun mapRes!1045 () Bool)

(assert (=> mapIsEmpty!1044 mapRes!1045))

(declare-fun mapNonEmpty!1044 () Bool)

(declare-fun tp!1046 () Bool)

(declare-fun tp_is_empty!397 () Bool)

(assert (=> mapNonEmpty!1044 (= mapRes!1045 (and tp!1046 tp_is_empty!397))))

(declare-datatypes ((T!51203 0))(
  ( (T!51204 (val!198 Int)) )
))
(declare-datatypes ((array!16674 0))(
  ( (array!16675 (arr!8185 (Array (_ BitVec 32) T!51203)) (size!7189 (_ BitVec 32))) )
))
(declare-fun a2!623 () array!16674)

(declare-fun mapRest!1044 () (Array (_ BitVec 32) T!51203))

(declare-fun mapValue!1045 () T!51203)

(declare-fun mapKey!1046 () (_ BitVec 32))

(assert (=> mapNonEmpty!1044 (= (arr!8185 a2!623) (store mapRest!1044 mapKey!1046 mapValue!1045))))

(declare-fun mapNonEmpty!1045 () Bool)

(declare-fun mapRes!1044 () Bool)

(declare-fun tp!1045 () Bool)

(assert (=> mapNonEmpty!1045 (= mapRes!1044 (and tp!1045 tp_is_empty!397))))

(declare-fun a1!623 () array!16674)

(declare-fun mapValue!1046 () T!51203)

(declare-fun mapRest!1046 () (Array (_ BitVec 32) T!51203))

(declare-fun mapKey!1044 () (_ BitVec 32))

(assert (=> mapNonEmpty!1045 (= (arr!8185 a1!623) (store mapRest!1046 mapKey!1044 mapValue!1046))))

(declare-fun b!284279 () Bool)

(declare-fun e!203234 () Bool)

(assert (=> b!284279 (= e!203234 (and tp_is_empty!397 mapRes!1045))))

(declare-fun condMapEmpty!1045 () Bool)

(declare-fun mapDefault!1046 () T!51203)

