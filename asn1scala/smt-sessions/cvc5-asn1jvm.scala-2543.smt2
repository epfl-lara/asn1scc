; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64028 () Bool)

(assert start!64028)

(declare-fun mapIsEmpty!1373 () Bool)

(declare-fun mapRes!1374 () Bool)

(assert (=> mapIsEmpty!1373 mapRes!1374))

(declare-fun mapNonEmpty!1373 () Bool)

(declare-fun tp!1374 () Bool)

(declare-fun tp_is_empty!469 () Bool)

(assert (=> mapNonEmpty!1373 (= mapRes!1374 (and tp!1374 tp_is_empty!469))))

(declare-datatypes ((T!51515 0))(
  ( (T!51516 (val!234 Int)) )
))
(declare-fun mapRest!1375 () (Array (_ BitVec 32) T!51515))

(declare-fun mapValue!1373 () T!51515)

(declare-fun mapKey!1373 () (_ BitVec 32))

(declare-datatypes ((array!16747 0))(
  ( (array!16748 (arr!8221 (Array (_ BitVec 32) T!51515)) (size!7225 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16747)

(assert (=> mapNonEmpty!1373 (= (arr!8221 a1!647) (store mapRest!1375 mapKey!1373 mapValue!1373))))

(declare-fun b!285131 () Bool)

(declare-fun e!203675 () Bool)

(assert (=> b!285131 (= e!203675 (not true))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16747)

(declare-fun arrayRangesEq!1369 (array!16747 array!16747 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285131 (arrayRangesEq!1369 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19919 0))(
  ( (Unit!19920) )
))
(declare-fun lt!418554 () Unit!19919)

(declare-fun arrayRangesEqAppend!2 (array!16747 array!16747 (_ BitVec 32) (_ BitVec 32)) Unit!19919)

(assert (=> b!285131 (= lt!418554 (arrayRangesEqAppend!2 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285132 () Bool)

(declare-fun res!236024 () Bool)

(assert (=> b!285132 (=> (not res!236024) (not e!203675))))

(declare-fun a2!647 () array!16747)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!285132 (= res!236024 (arrayRangesEq!1369 a2!647 a3!68 i!964 to!740))))

(declare-fun b!285133 () Bool)

(declare-fun e!203674 () Bool)

(assert (=> b!285133 (= e!203674 (and tp_is_empty!469 mapRes!1374))))

(declare-fun condMapEmpty!1375 () Bool)

(declare-fun mapDefault!1373 () T!51515)

