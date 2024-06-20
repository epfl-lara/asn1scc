; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64022 () Bool)

(assert start!64022)

(declare-fun b!285032 () Bool)

(declare-fun res!235950 () Bool)

(declare-fun e!203638 () Bool)

(assert (=> b!285032 (=> (not res!235950) (not e!203638))))

(declare-datatypes ((T!51489 0))(
  ( (T!51490 (val!231 Int)) )
))
(declare-datatypes ((array!16741 0))(
  ( (array!16742 (arr!8218 (Array (_ BitVec 32) T!51489)) (size!7222 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16741)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun a3!68 () array!16741)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1366 (array!16741 array!16741 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285032 (= res!235950 (arrayRangesEq!1366 a2!647 a3!68 i!964 to!740))))

(declare-fun b!285033 () Bool)

(declare-fun res!235952 () Bool)

(assert (=> b!285033 (=> (not res!235952) (not e!203638))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16741)

(assert (=> b!285033 (= res!235952 (arrayRangesEq!1366 a1!647 a3!68 from!773 i!964))))

(declare-fun mapIsEmpty!1346 () Bool)

(declare-fun mapRes!1347 () Bool)

(assert (=> mapIsEmpty!1346 mapRes!1347))

(declare-fun b!285034 () Bool)

(declare-fun e!203640 () Bool)

(declare-fun tp_is_empty!463 () Bool)

(declare-fun mapRes!1348 () Bool)

(assert (=> b!285034 (= e!203640 (and tp_is_empty!463 mapRes!1348))))

(declare-fun condMapEmpty!1346 () Bool)

(declare-fun mapDefault!1347 () T!51489)

