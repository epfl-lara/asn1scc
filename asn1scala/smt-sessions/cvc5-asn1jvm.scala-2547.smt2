; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64052 () Bool)

(assert start!64052)

(declare-fun b!285560 () Bool)

(declare-fun res!236340 () Bool)

(declare-fun e!203829 () Bool)

(assert (=> b!285560 (=> (not res!236340) (not e!203829))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285560 (= res!236340 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapNonEmpty!1481 () Bool)

(declare-fun mapRes!1481 () Bool)

(declare-fun tp!1481 () Bool)

(declare-fun tp_is_empty!493 () Bool)

(assert (=> mapNonEmpty!1481 (= mapRes!1481 (and tp!1481 tp_is_empty!493))))

(declare-datatypes ((T!51619 0))(
  ( (T!51620 (val!246 Int)) )
))
(declare-datatypes ((array!16771 0))(
  ( (array!16772 (arr!8233 (Array (_ BitVec 32) T!51619)) (size!7237 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16771)

(declare-fun mapRest!1481 () (Array (_ BitVec 32) T!51619))

(declare-fun mapValue!1482 () T!51619)

(declare-fun mapKey!1481 () (_ BitVec 32))

(assert (=> mapNonEmpty!1481 (= (arr!8233 a2!647) (store mapRest!1481 mapKey!1481 mapValue!1482))))

(declare-fun mapNonEmpty!1482 () Bool)

(declare-fun mapRes!1482 () Bool)

(declare-fun tp!1482 () Bool)

(assert (=> mapNonEmpty!1482 (= mapRes!1482 (and tp!1482 tp_is_empty!493))))

(declare-fun mapKey!1483 () (_ BitVec 32))

(declare-fun mapRest!1482 () (Array (_ BitVec 32) T!51619))

(declare-fun a1!647 () array!16771)

(declare-fun mapValue!1481 () T!51619)

(assert (=> mapNonEmpty!1482 (= (arr!8233 a1!647) (store mapRest!1482 mapKey!1483 mapValue!1481))))

(declare-fun b!285561 () Bool)

(declare-fun res!236339 () Bool)

(declare-fun e!203832 () Bool)

(assert (=> b!285561 (=> res!236339 e!203832)))

(declare-fun arrayRangesEq!1379 (array!16771 array!16771 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285561 (= res!236339 (not (arrayRangesEq!1379 a1!647 a2!647 (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun b!285562 () Bool)

(declare-fun e!203833 () Bool)

(assert (=> b!285562 (= e!203833 (and tp_is_empty!493 mapRes!1481))))

(declare-fun condMapEmpty!1481 () Bool)

(declare-fun mapDefault!1481 () T!51619)

