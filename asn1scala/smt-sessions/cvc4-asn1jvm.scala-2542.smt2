; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64026 () Bool)

(assert start!64026)

(declare-fun mapNonEmpty!1364 () Bool)

(declare-fun mapRes!1364 () Bool)

(declare-fun tp!1366 () Bool)

(declare-fun tp_is_empty!467 () Bool)

(assert (=> mapNonEmpty!1364 (= mapRes!1364 (and tp!1366 tp_is_empty!467))))

(declare-datatypes ((T!51493 0))(
  ( (T!51494 (val!233 Int)) )
))
(declare-fun mapRest!1364 () (Array (_ BitVec 32) T!51493))

(declare-fun mapValue!1365 () T!51493)

(declare-datatypes ((array!16745 0))(
  ( (array!16746 (arr!8220 (Array (_ BitVec 32) T!51493)) (size!7224 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16745)

(declare-fun mapKey!1366 () (_ BitVec 32))

(assert (=> mapNonEmpty!1364 (= (arr!8220 a3!68) (store mapRest!1364 mapKey!1366 mapValue!1365))))

(declare-fun mapNonEmpty!1365 () Bool)

(declare-fun mapRes!1365 () Bool)

(declare-fun tp!1364 () Bool)

(assert (=> mapNonEmpty!1365 (= mapRes!1365 (and tp!1364 tp_is_empty!467))))

(declare-fun mapKey!1364 () (_ BitVec 32))

(declare-fun mapValue!1366 () T!51493)

(declare-fun a1!647 () array!16745)

(declare-fun mapRest!1365 () (Array (_ BitVec 32) T!51493))

(assert (=> mapNonEmpty!1365 (= (arr!8220 a1!647) (store mapRest!1365 mapKey!1364 mapValue!1366))))

(declare-fun b!285098 () Bool)

(declare-fun res!235994 () Bool)

(declare-fun e!203663 () Bool)

(assert (=> b!285098 (=> (not res!235994) (not e!203663))))

(declare-fun a2!647 () array!16745)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun arrayRangesEq!1368 (array!16745 array!16745 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285098 (= res!235994 (arrayRangesEq!1368 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!285099 () Bool)

(declare-fun res!235999 () Bool)

(assert (=> b!285099 (=> (not res!235999) (not e!203663))))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!285099 (= res!235999 (arrayRangesEq!1368 a2!647 a3!68 i!964 to!740))))

(declare-fun b!285100 () Bool)

(declare-fun res!235998 () Bool)

(assert (=> b!285100 (=> (not res!235998) (not e!203663))))

(declare-fun from!773 () (_ BitVec 32))

(assert (=> b!285100 (= res!235998 (arrayRangesEq!1368 a1!647 a3!68 from!773 i!964))))

(declare-fun mapIsEmpty!1364 () Bool)

(assert (=> mapIsEmpty!1364 mapRes!1365))

(declare-fun mapIsEmpty!1365 () Bool)

(declare-fun mapRes!1366 () Bool)

(assert (=> mapIsEmpty!1365 mapRes!1366))

(declare-fun b!285101 () Bool)

(declare-fun res!235997 () Bool)

(assert (=> b!285101 (=> (not res!235997) (not e!203663))))

(assert (=> b!285101 (= res!235997 (not (= i!964 mid!71)))))

(declare-fun b!285102 () Bool)

(declare-fun e!203664 () Bool)

(assert (=> b!285102 (= e!203664 (and tp_is_empty!467 mapRes!1366))))

(declare-fun condMapEmpty!1365 () Bool)

(declare-fun mapDefault!1366 () T!51493)

