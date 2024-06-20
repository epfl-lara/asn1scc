; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64058 () Bool)

(assert start!64058)

(declare-fun mapNonEmpty!1508 () Bool)

(declare-fun mapRes!1509 () Bool)

(declare-fun tp!1508 () Bool)

(declare-fun tp_is_empty!499 () Bool)

(assert (=> mapNonEmpty!1508 (= mapRes!1509 (and tp!1508 tp_is_empty!499))))

(declare-datatypes ((T!51645 0))(
  ( (T!51646 (val!249 Int)) )
))
(declare-datatypes ((array!16777 0))(
  ( (array!16778 (arr!8236 (Array (_ BitVec 32) T!51645)) (size!7240 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16777)

(declare-fun mapRest!1509 () (Array (_ BitVec 32) T!51645))

(declare-fun mapKey!1510 () (_ BitVec 32))

(declare-fun mapValue!1510 () T!51645)

(assert (=> mapNonEmpty!1508 (= (arr!8236 a2!647) (store mapRest!1509 mapKey!1510 mapValue!1510))))

(declare-fun b!285686 () Bool)

(declare-fun res!236441 () Bool)

(declare-fun e!203876 () Bool)

(assert (=> b!285686 (=> (not res!236441) (not e!203876))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun a3!68 () array!16777)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1382 (array!16777 array!16777 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285686 (= res!236441 (arrayRangesEq!1382 a2!647 a3!68 i!964 to!740))))

(declare-fun mapIsEmpty!1508 () Bool)

(declare-fun mapRes!1508 () Bool)

(assert (=> mapIsEmpty!1508 mapRes!1508))

(declare-fun b!285687 () Bool)

(declare-fun e!203877 () Bool)

(declare-fun mapRes!1510 () Bool)

(assert (=> b!285687 (= e!203877 (and tp_is_empty!499 mapRes!1510))))

(declare-fun condMapEmpty!1510 () Bool)

(declare-fun a1!647 () array!16777)

(declare-fun mapDefault!1509 () T!51645)

