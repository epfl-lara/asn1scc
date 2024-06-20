; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64074 () Bool)

(assert start!64074)

(declare-fun b!285954 () Bool)

(declare-fun res!236636 () Bool)

(declare-fun e!203977 () Bool)

(assert (=> b!285954 (=> (not res!236636) (not e!203977))))

(declare-datatypes ((T!51701 0))(
  ( (T!51702 (val!257 Int)) )
))
(declare-datatypes ((array!16793 0))(
  ( (array!16794 (arr!8244 (Array (_ BitVec 32) T!51701)) (size!7248 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16793)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16793)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1390 (array!16793 array!16793 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285954 (= res!236636 (arrayRangesEq!1390 a2!647 a3!68 from!773 to!740))))

(declare-fun b!285955 () Bool)

(declare-fun res!236634 () Bool)

(assert (=> b!285955 (=> (not res!236634) (not e!203977))))

(declare-fun a1!647 () array!16793)

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285955 (= res!236634 (arrayRangesEq!1390 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!285956 () Bool)

(declare-fun res!236635 () Bool)

(assert (=> b!285956 (=> (not res!236635) (not e!203977))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!285956 (= res!236635 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285957 () Bool)

(assert (=> b!285957 (= e!203977 (bvslt (bvsub to!740 i!964) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1580 () Bool)

(declare-fun mapRes!1582 () Bool)

(declare-fun tp!1582 () Bool)

(declare-fun tp_is_empty!515 () Bool)

(assert (=> mapNonEmpty!1580 (= mapRes!1582 (and tp!1582 tp_is_empty!515))))

(declare-fun mapKey!1582 () (_ BitVec 32))

(declare-fun mapRest!1581 () (Array (_ BitVec 32) T!51701))

(declare-fun mapValue!1581 () T!51701)

(assert (=> mapNonEmpty!1580 (= (arr!8244 a2!647) (store mapRest!1581 mapKey!1582 mapValue!1581))))

(declare-fun b!285959 () Bool)

(declare-fun res!236639 () Bool)

(assert (=> b!285959 (=> (not res!236639) (not e!203977))))

(assert (=> b!285959 (= res!236639 (arrayRangesEq!1390 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285960 () Bool)

(declare-fun res!236637 () Bool)

(assert (=> b!285960 (=> (not res!236637) (not e!203977))))

(assert (=> b!285960 (= res!236637 (arrayRangesEq!1390 a1!647 a2!647 i!964 mid!71))))

(declare-fun mapNonEmpty!1581 () Bool)

(declare-fun mapRes!1581 () Bool)

(declare-fun tp!1581 () Bool)

(assert (=> mapNonEmpty!1581 (= mapRes!1581 (and tp!1581 tp_is_empty!515))))

(declare-fun mapRest!1580 () (Array (_ BitVec 32) T!51701))

(declare-fun mapValue!1580 () T!51701)

(declare-fun mapKey!1580 () (_ BitVec 32))

(assert (=> mapNonEmpty!1581 (= (arr!8244 a1!647) (store mapRest!1580 mapKey!1580 mapValue!1580))))

(declare-fun b!285961 () Bool)

(declare-fun e!203980 () Bool)

(declare-fun mapRes!1580 () Bool)

(assert (=> b!285961 (= e!203980 (and tp_is_empty!515 mapRes!1580))))

(declare-fun condMapEmpty!1582 () Bool)

(declare-fun mapDefault!1581 () T!51701)

