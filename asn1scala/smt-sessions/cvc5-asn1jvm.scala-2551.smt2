; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64076 () Bool)

(assert start!64076)

(declare-fun mapNonEmpty!1589 () Bool)

(declare-fun mapRes!1589 () Bool)

(declare-fun tp!1589 () Bool)

(declare-fun tp_is_empty!517 () Bool)

(assert (=> mapNonEmpty!1589 (= mapRes!1589 (and tp!1589 tp_is_empty!517))))

(declare-datatypes ((T!51723 0))(
  ( (T!51724 (val!258 Int)) )
))
(declare-fun mapRest!1589 () (Array (_ BitVec 32) T!51723))

(declare-fun mapValue!1590 () T!51723)

(declare-fun mapKey!1590 () (_ BitVec 32))

(declare-datatypes ((array!16795 0))(
  ( (array!16796 (arr!8245 (Array (_ BitVec 32) T!51723)) (size!7249 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16795)

(assert (=> mapNonEmpty!1589 (= (arr!8245 a3!68) (store mapRest!1589 mapKey!1590 mapValue!1590))))

(declare-fun mapIsEmpty!1589 () Bool)

(declare-fun mapRes!1590 () Bool)

(assert (=> mapIsEmpty!1589 mapRes!1590))

(declare-fun b!285986 () Bool)

(declare-fun e!203990 () Bool)

(assert (=> b!285986 (= e!203990 (and tp_is_empty!517 mapRes!1589))))

(declare-fun condMapEmpty!1590 () Bool)

(declare-fun mapDefault!1591 () T!51723)

