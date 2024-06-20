; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64008 () Bool)

(assert start!64008)

(declare-fun b!284830 () Bool)

(declare-fun res!235809 () Bool)

(declare-fun e!203554 () Bool)

(assert (=> b!284830 (=> (not res!235809) (not e!203554))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!284830 (= res!235809 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapNonEmpty!1283 () Bool)

(declare-fun mapRes!1285 () Bool)

(declare-fun tp!1285 () Bool)

(declare-fun tp_is_empty!449 () Bool)

(assert (=> mapNonEmpty!1283 (= mapRes!1285 (and tp!1285 tp_is_empty!449))))

(declare-datatypes ((T!51415 0))(
  ( (T!51416 (val!224 Int)) )
))
(declare-datatypes ((array!16727 0))(
  ( (array!16728 (arr!8211 (Array (_ BitVec 32) T!51415)) (size!7215 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16727)

(declare-fun mapKey!1283 () (_ BitVec 32))

(declare-fun mapRest!1285 () (Array (_ BitVec 32) T!51415))

(declare-fun mapValue!1285 () T!51415)

(assert (=> mapNonEmpty!1283 (= (arr!8211 a2!647) (store mapRest!1285 mapKey!1283 mapValue!1285))))

(declare-fun b!284831 () Bool)

(declare-fun e!203557 () Bool)

(declare-fun mapRes!1283 () Bool)

(assert (=> b!284831 (= e!203557 (and tp_is_empty!449 mapRes!1283))))

(declare-fun condMapEmpty!1283 () Bool)

(declare-fun a1!647 () array!16727)

(declare-fun mapDefault!1285 () T!51415)

