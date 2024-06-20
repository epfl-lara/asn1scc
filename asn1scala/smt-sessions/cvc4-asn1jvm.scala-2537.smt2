; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63996 () Bool)

(assert start!63996)

(declare-fun mapNonEmpty!1229 () Bool)

(declare-fun mapRes!1229 () Bool)

(declare-fun tp!1230 () Bool)

(declare-fun tp_is_empty!437 () Bool)

(assert (=> mapNonEmpty!1229 (= mapRes!1229 (and tp!1230 tp_is_empty!437))))

(declare-datatypes ((T!51363 0))(
  ( (T!51364 (val!218 Int)) )
))
(declare-fun mapValue!1230 () T!51363)

(declare-datatypes ((array!16715 0))(
  ( (array!16716 (arr!8205 (Array (_ BitVec 32) T!51363)) (size!7209 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16715)

(declare-fun mapKey!1229 () (_ BitVec 32))

(declare-fun mapRest!1229 () (Array (_ BitVec 32) T!51363))

(assert (=> mapNonEmpty!1229 (= (arr!8205 a1!647) (store mapRest!1229 mapKey!1229 mapValue!1230))))

(declare-fun b!284680 () Bool)

(declare-fun e!203484 () Bool)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!284680 (= e!203484 (and (bvsle from!773 i!964) (bvsle i!964 mid!71) (bvsgt #b00000000000000000000000000000000 i!964)))))

(declare-fun mapIsEmpty!1229 () Bool)

(declare-fun mapRes!1231 () Bool)

(assert (=> mapIsEmpty!1229 mapRes!1231))

(declare-fun b!284681 () Bool)

(declare-fun res!235711 () Bool)

(assert (=> b!284681 (=> (not res!235711) (not e!203484))))

(declare-fun a2!647 () array!16715)

(declare-fun a3!68 () array!16715)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1358 (array!16715 array!16715 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284681 (= res!235711 (arrayRangesEq!1358 a2!647 a3!68 from!773 to!740))))

(declare-fun mapNonEmpty!1230 () Bool)

(declare-fun tp!1229 () Bool)

(assert (=> mapNonEmpty!1230 (= mapRes!1231 (and tp!1229 tp_is_empty!437))))

(declare-fun mapKey!1230 () (_ BitVec 32))

(declare-fun mapRest!1230 () (Array (_ BitVec 32) T!51363))

(declare-fun mapValue!1229 () T!51363)

(assert (=> mapNonEmpty!1230 (= (arr!8205 a3!68) (store mapRest!1230 mapKey!1230 mapValue!1229))))

(declare-fun b!284682 () Bool)

(declare-fun e!203483 () Bool)

(assert (=> b!284682 (= e!203483 (and tp_is_empty!437 mapRes!1231))))

(declare-fun condMapEmpty!1229 () Bool)

(declare-fun mapDefault!1229 () T!51363)

