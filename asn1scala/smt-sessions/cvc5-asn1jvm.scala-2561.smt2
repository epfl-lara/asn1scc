; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64152 () Bool)

(assert start!64152)

(declare-fun mapNonEmpty!1874 () Bool)

(declare-fun mapRes!1875 () Bool)

(declare-fun tp!1874 () Bool)

(declare-fun tp_is_empty!577 () Bool)

(assert (=> mapNonEmpty!1874 (= mapRes!1875 (and tp!1874 tp_is_empty!577))))

(declare-datatypes ((T!51983 0))(
  ( (T!51984 (val!288 Int)) )
))
(declare-fun mapValue!1874 () T!51983)

(declare-fun mapKey!1874 () (_ BitVec 32))

(declare-fun mapRest!1876 () (Array (_ BitVec 32) T!51983))

(declare-datatypes ((array!16858 0))(
  ( (array!16859 (arr!8275 (Array (_ BitVec 32) T!51983)) (size!7279 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16858)

(assert (=> mapNonEmpty!1874 (= (arr!8275 a3!68) (store mapRest!1876 mapKey!1874 mapValue!1874))))

(declare-fun mapNonEmpty!1875 () Bool)

(declare-fun mapRes!1876 () Bool)

(declare-fun tp!1876 () Bool)

(assert (=> mapNonEmpty!1875 (= mapRes!1876 (and tp!1876 tp_is_empty!577))))

(declare-fun a2!647 () array!16858)

(declare-fun mapKey!1876 () (_ BitVec 32))

(declare-fun mapValue!1875 () T!51983)

(declare-fun mapRest!1875 () (Array (_ BitVec 32) T!51983))

(assert (=> mapNonEmpty!1875 (= (arr!8275 a2!647) (store mapRest!1875 mapKey!1876 mapValue!1875))))

(declare-fun b!287073 () Bool)

(declare-fun res!237468 () Bool)

(declare-fun e!204440 () Bool)

(assert (=> b!287073 (=> (not res!237468) (not e!204440))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1414 (array!16858 array!16858 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287073 (= res!237468 (arrayRangesEq!1414 a2!647 a3!68 i!964 to!740))))

(declare-fun b!287074 () Bool)

(declare-fun e!204436 () Bool)

(assert (=> b!287074 (= e!204436 true)))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16858)

(assert (=> b!287074 (arrayRangesEq!1414 a1!647 a3!68 from!773 mid!71)))

(declare-datatypes ((Unit!19959 0))(
  ( (Unit!19960) )
))
(declare-fun lt!418697 () Unit!19959)

(declare-fun rec!68 (array!16858 array!16858 array!16858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19959)

(assert (=> b!287074 (= lt!418697 (rec!68 a1!647 a2!647 a3!68 from!773 mid!71 to!740 (bvadd #b00000000000000000000000000000001 i!964)))))

(declare-fun mapNonEmpty!1876 () Bool)

(declare-fun mapRes!1874 () Bool)

(declare-fun tp!1875 () Bool)

(assert (=> mapNonEmpty!1876 (= mapRes!1874 (and tp!1875 tp_is_empty!577))))

(declare-fun mapRest!1874 () (Array (_ BitVec 32) T!51983))

(declare-fun mapValue!1876 () T!51983)

(declare-fun mapKey!1875 () (_ BitVec 32))

(assert (=> mapNonEmpty!1876 (= (arr!8275 a1!647) (store mapRest!1874 mapKey!1875 mapValue!1876))))

(declare-fun mapIsEmpty!1874 () Bool)

(assert (=> mapIsEmpty!1874 mapRes!1874))

(declare-fun b!287075 () Bool)

(declare-fun res!237470 () Bool)

(assert (=> b!287075 (=> (not res!237470) (not e!204440))))

(assert (=> b!287075 (= res!237470 (arrayRangesEq!1414 a2!647 a3!68 from!773 to!740))))

(declare-fun b!287076 () Bool)

(declare-fun e!204437 () Bool)

(assert (=> b!287076 (= e!204437 (and tp_is_empty!577 mapRes!1874))))

(declare-fun condMapEmpty!1874 () Bool)

(declare-fun mapDefault!1875 () T!51983)

