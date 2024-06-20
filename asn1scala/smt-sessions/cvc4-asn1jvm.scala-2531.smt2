; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63956 () Bool)

(assert start!63956)

(declare-fun mapNonEmpty!1062 () Bool)

(declare-fun mapRes!1063 () Bool)

(declare-fun tp!1063 () Bool)

(declare-fun tp_is_empty!401 () Bool)

(assert (=> mapNonEmpty!1062 (= mapRes!1063 (and tp!1063 tp_is_empty!401))))

(declare-fun mapKey!1063 () (_ BitVec 32))

(declare-datatypes ((T!51207 0))(
  ( (T!51208 (val!200 Int)) )
))
(declare-fun mapValue!1062 () T!51207)

(declare-datatypes ((array!16678 0))(
  ( (array!16679 (arr!8187 (Array (_ BitVec 32) T!51207)) (size!7191 (_ BitVec 32))) )
))
(declare-fun a1!623 () array!16678)

(declare-fun mapRest!1063 () (Array (_ BitVec 32) T!51207))

(assert (=> mapNonEmpty!1062 (= (arr!8187 a1!623) (store mapRest!1063 mapKey!1063 mapValue!1062))))

(declare-fun b!284309 () Bool)

(declare-fun e!203256 () Bool)

(declare-fun mapRes!1062 () Bool)

(assert (=> b!284309 (= e!203256 (and tp_is_empty!401 mapRes!1062))))

(declare-fun condMapEmpty!1063 () Bool)

(declare-fun a2!623 () array!16678)

(declare-fun mapDefault!1062 () T!51207)

