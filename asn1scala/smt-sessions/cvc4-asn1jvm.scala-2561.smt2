; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64156 () Bool)

(assert start!64156)

(declare-fun b!287157 () Bool)

(declare-fun res!237543 () Bool)

(declare-fun e!204470 () Bool)

(assert (=> b!287157 (=> (not res!237543) (not e!204470))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!287157 (= res!237543 (not (= i!964 mid!71)))))

(declare-fun b!287158 () Bool)

(declare-fun res!237541 () Bool)

(declare-fun e!204467 () Bool)

(assert (=> b!287158 (=> res!237541 e!204467)))

(declare-datatypes ((T!51987 0))(
  ( (T!51988 (val!290 Int)) )
))
(declare-datatypes ((array!16862 0))(
  ( (array!16863 (arr!8277 (Array (_ BitVec 32) T!51987)) (size!7281 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16862)

(declare-fun a1!647 () array!16862)

(declare-fun arrayRangesEq!1416 (array!16862 array!16862 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287158 (= res!237541 (not (arrayRangesEq!1416 a1!647 a2!647 (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun mapNonEmpty!1892 () Bool)

(declare-fun mapRes!1894 () Bool)

(declare-fun tp!1894 () Bool)

(declare-fun tp_is_empty!581 () Bool)

(assert (=> mapNonEmpty!1892 (= mapRes!1894 (and tp!1894 tp_is_empty!581))))

(declare-fun mapValue!1894 () T!51987)

(declare-fun mapKey!1893 () (_ BitVec 32))

(declare-fun mapRest!1893 () (Array (_ BitVec 32) T!51987))

(assert (=> mapNonEmpty!1892 (= (arr!8277 a2!647) (store mapRest!1893 mapKey!1893 mapValue!1894))))

(declare-fun b!287160 () Bool)

(declare-fun e!204469 () Bool)

(declare-fun mapRes!1892 () Bool)

(assert (=> b!287160 (= e!204469 (and tp_is_empty!581 mapRes!1892))))

(declare-fun condMapEmpty!1892 () Bool)

(declare-fun a3!68 () array!16862)

(declare-fun mapDefault!1894 () T!51987)

