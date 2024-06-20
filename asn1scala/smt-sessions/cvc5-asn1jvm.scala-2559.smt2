; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64140 () Bool)

(assert start!64140)

(declare-fun mapNonEmpty!1820 () Bool)

(declare-fun mapRes!1820 () Bool)

(declare-fun tp!1822 () Bool)

(declare-fun tp_is_empty!565 () Bool)

(assert (=> mapNonEmpty!1820 (= mapRes!1820 (and tp!1822 tp_is_empty!565))))

(declare-datatypes ((T!51931 0))(
  ( (T!51932 (val!282 Int)) )
))
(declare-fun mapRest!1822 () (Array (_ BitVec 32) T!51931))

(declare-datatypes ((array!16846 0))(
  ( (array!16847 (arr!8269 (Array (_ BitVec 32) T!51931)) (size!7273 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16846)

(declare-fun mapKey!1820 () (_ BitVec 32))

(declare-fun mapValue!1821 () T!51931)

(assert (=> mapNonEmpty!1820 (= (arr!8269 a3!68) (store mapRest!1822 mapKey!1820 mapValue!1821))))

(declare-fun b!286842 () Bool)

(declare-fun e!204354 () Bool)

(assert (=> b!286842 (= e!204354 (and tp_is_empty!565 mapRes!1820))))

(declare-fun condMapEmpty!1820 () Bool)

(declare-fun mapDefault!1820 () T!51931)

