; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64038 () Bool)

(assert start!64038)

(declare-fun mapIsEmpty!1418 () Bool)

(declare-fun mapRes!1418 () Bool)

(assert (=> mapIsEmpty!1418 mapRes!1418))

(declare-fun b!285296 () Bool)

(declare-fun e!203735 () Bool)

(assert (=> b!285296 (= e!203735 (not true))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-datatypes ((T!51545 0))(
  ( (T!51546 (val!239 Int)) )
))
(declare-datatypes ((array!16757 0))(
  ( (array!16758 (arr!8226 (Array (_ BitVec 32) T!51545)) (size!7230 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16757)

(declare-fun a3!68 () array!16757)

(declare-fun arrayRangesEq!1372 (array!16757 array!16757 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285296 (arrayRangesEq!1372 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19925 0))(
  ( (Unit!19926) )
))
(declare-fun lt!418569 () Unit!19925)

(declare-fun arrayRangesEqAppend!5 (array!16757 array!16757 (_ BitVec 32) (_ BitVec 32)) Unit!19925)

(assert (=> b!285296 (= lt!418569 (arrayRangesEqAppend!5 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285297 () Bool)

(declare-fun res!236141 () Bool)

(assert (=> b!285297 (=> (not res!236141) (not e!203735))))

(declare-fun a2!647 () array!16757)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!285297 (= res!236141 (arrayRangesEq!1372 a2!647 a3!68 i!964 to!740))))

(declare-fun b!285298 () Bool)

(declare-fun res!236142 () Bool)

(assert (=> b!285298 (=> (not res!236142) (not e!203735))))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285298 (= res!236142 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapNonEmpty!1418 () Bool)

(declare-fun tp!1418 () Bool)

(declare-fun tp_is_empty!479 () Bool)

(assert (=> mapNonEmpty!1418 (= mapRes!1418 (and tp!1418 tp_is_empty!479))))

(declare-fun mapKey!1420 () (_ BitVec 32))

(declare-fun mapRest!1419 () (Array (_ BitVec 32) T!51545))

(declare-fun mapValue!1419 () T!51545)

(assert (=> mapNonEmpty!1418 (= (arr!8226 a1!647) (store mapRest!1419 mapKey!1420 mapValue!1419))))

(declare-fun mapNonEmpty!1419 () Bool)

(declare-fun mapRes!1419 () Bool)

(declare-fun tp!1420 () Bool)

(assert (=> mapNonEmpty!1419 (= mapRes!1419 (and tp!1420 tp_is_empty!479))))

(declare-fun mapRest!1418 () (Array (_ BitVec 32) T!51545))

(declare-fun mapKey!1419 () (_ BitVec 32))

(declare-fun mapValue!1418 () T!51545)

(assert (=> mapNonEmpty!1419 (= (arr!8226 a3!68) (store mapRest!1418 mapKey!1419 mapValue!1418))))

(declare-fun b!285299 () Bool)

(declare-fun res!236143 () Bool)

(assert (=> b!285299 (=> (not res!236143) (not e!203735))))

(assert (=> b!285299 (= res!236143 (arrayRangesEq!1372 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!285300 () Bool)

(declare-fun e!203734 () Bool)

(assert (=> b!285300 (= e!203734 (and tp_is_empty!479 mapRes!1419))))

(declare-fun condMapEmpty!1418 () Bool)

(declare-fun mapDefault!1419 () T!51545)

