; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64108 () Bool)

(assert start!64108)

(declare-fun b!286437 () Bool)

(declare-fun e!204173 () Bool)

(declare-fun tp_is_empty!545 () Bool)

(declare-fun mapRes!1720 () Bool)

(assert (=> b!286437 (= e!204173 (and tp_is_empty!545 mapRes!1720))))

(declare-fun condMapEmpty!1720 () Bool)

(declare-datatypes ((T!51831 0))(
  ( (T!51832 (val!272 Int)) )
))
(declare-datatypes ((array!16824 0))(
  ( (array!16825 (arr!8259 (Array (_ BitVec 32) T!51831)) (size!7263 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16824)

(declare-fun mapDefault!1720 () T!51831)

