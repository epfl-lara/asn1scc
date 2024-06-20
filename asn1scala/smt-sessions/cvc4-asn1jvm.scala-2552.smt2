; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64086 () Bool)

(assert start!64086)

(declare-fun mapNonEmpty!1634 () Bool)

(declare-fun mapRes!1635 () Bool)

(declare-fun tp!1635 () Bool)

(declare-fun tp_is_empty!527 () Bool)

(assert (=> mapNonEmpty!1634 (= mapRes!1635 (and tp!1635 tp_is_empty!527))))

(declare-datatypes ((T!51753 0))(
  ( (T!51754 (val!263 Int)) )
))
(declare-fun mapRest!1634 () (Array (_ BitVec 32) T!51753))

(declare-fun mapValue!1635 () T!51753)

(declare-fun mapKey!1636 () (_ BitVec 32))

(declare-datatypes ((array!16805 0))(
  ( (array!16806 (arr!8250 (Array (_ BitVec 32) T!51753)) (size!7254 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16805)

(assert (=> mapNonEmpty!1634 (= (arr!8250 a3!68) (store mapRest!1634 mapKey!1636 mapValue!1635))))

(declare-fun b!286143 () Bool)

(declare-fun e!204052 () Bool)

(declare-fun mapRes!1636 () Bool)

(assert (=> b!286143 (= e!204052 (and tp_is_empty!527 mapRes!1636))))

(declare-fun condMapEmpty!1636 () Bool)

(declare-fun a2!647 () array!16805)

(declare-fun mapDefault!1635 () T!51753)

