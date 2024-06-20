; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64040 () Bool)

(assert start!64040)

(declare-fun b!285329 () Bool)

(declare-fun e!203747 () Bool)

(assert (=> b!285329 (= e!203747 (not true))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-datatypes ((T!51567 0))(
  ( (T!51568 (val!240 Int)) )
))
(declare-datatypes ((array!16759 0))(
  ( (array!16760 (arr!8227 (Array (_ BitVec 32) T!51567)) (size!7231 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16759)

(declare-fun a3!68 () array!16759)

(declare-fun arrayRangesEq!1373 (array!16759 array!16759 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285329 (arrayRangesEq!1373 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19927 0))(
  ( (Unit!19928) )
))
(declare-fun lt!418572 () Unit!19927)

(declare-fun arrayRangesEqAppend!6 (array!16759 array!16759 (_ BitVec 32) (_ BitVec 32)) Unit!19927)

(assert (=> b!285329 (= lt!418572 (arrayRangesEqAppend!6 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285330 () Bool)

(declare-fun e!203748 () Bool)

(declare-fun tp_is_empty!481 () Bool)

(declare-fun mapRes!1427 () Bool)

(assert (=> b!285330 (= e!203748 (and tp_is_empty!481 mapRes!1427))))

(declare-fun condMapEmpty!1427 () Bool)

(declare-fun mapDefault!1429 () T!51567)

