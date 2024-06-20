; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64004 () Bool)

(assert start!64004)

(declare-fun b!284776 () Bool)

(declare-fun e!203531 () Bool)

(declare-fun tp_is_empty!445 () Bool)

(declare-fun mapRes!1267 () Bool)

(assert (=> b!284776 (= e!203531 (and tp_is_empty!445 mapRes!1267))))

(declare-fun condMapEmpty!1267 () Bool)

(declare-datatypes ((T!51411 0))(
  ( (T!51412 (val!222 Int)) )
))
(declare-datatypes ((array!16723 0))(
  ( (array!16724 (arr!8209 (Array (_ BitVec 32) T!51411)) (size!7213 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16723)

(declare-fun mapDefault!1265 () T!51411)

