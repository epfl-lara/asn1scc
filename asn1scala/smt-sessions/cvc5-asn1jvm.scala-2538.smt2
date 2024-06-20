; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63998 () Bool)

(assert start!63998)

(declare-fun mapIsEmpty!1239 () Bool)

(declare-fun mapRes!1238 () Bool)

(assert (=> mapIsEmpty!1239 mapRes!1238))

(declare-fun b!284702 () Bool)

(declare-fun e!203497 () Bool)

(declare-fun tp_is_empty!439 () Bool)

(assert (=> b!284702 (= e!203497 (and tp_is_empty!439 mapRes!1238))))

(declare-fun condMapEmpty!1240 () Bool)

(declare-datatypes ((T!51385 0))(
  ( (T!51386 (val!219 Int)) )
))
(declare-datatypes ((array!16717 0))(
  ( (array!16718 (arr!8206 (Array (_ BitVec 32) T!51385)) (size!7210 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16717)

(declare-fun mapDefault!1238 () T!51385)

