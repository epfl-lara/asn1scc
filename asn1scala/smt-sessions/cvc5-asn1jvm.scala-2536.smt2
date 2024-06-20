; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63986 () Bool)

(assert start!63986)

(declare-fun b!284583 () Bool)

(declare-fun res!235661 () Bool)

(declare-fun e!203423 () Bool)

(assert (=> b!284583 (=> (not res!235661) (not e!203423))))

(declare-datatypes ((T!51333 0))(
  ( (T!51334 (val!213 Int)) )
))
(declare-datatypes ((array!16705 0))(
  ( (array!16706 (arr!8200 (Array (_ BitVec 32) T!51333)) (size!7204 (_ BitVec 32))) )
))
(declare-fun a2!623 () array!16705)

(declare-fun a3!63 () array!16705)

(declare-fun to!716 () (_ BitVec 32))

(declare-fun from!749 () (_ BitVec 32))

(declare-fun arrayRangesEq!1354 (array!16705 array!16705 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284583 (= res!235661 (arrayRangesEq!1354 a2!623 a3!63 from!749 to!716))))

(declare-fun mapIsEmpty!1184 () Bool)

(declare-fun mapRes!1186 () Bool)

(assert (=> mapIsEmpty!1184 mapRes!1186))

(declare-fun mapIsEmpty!1185 () Bool)

(declare-fun mapRes!1184 () Bool)

(assert (=> mapIsEmpty!1185 mapRes!1184))

(declare-fun b!284584 () Bool)

(declare-fun res!235659 () Bool)

(assert (=> b!284584 (=> (not res!235659) (not e!203423))))

(declare-fun a1!623 () array!16705)

(declare-fun mid!66 () (_ BitVec 32))

(assert (=> b!284584 (= res!235659 (arrayRangesEq!1354 a1!623 a2!623 from!749 mid!66))))

(declare-fun b!284585 () Bool)

(declare-fun e!203425 () Bool)

(declare-fun tp_is_empty!427 () Bool)

(assert (=> b!284585 (= e!203425 (and tp_is_empty!427 mapRes!1184))))

(declare-fun condMapEmpty!1184 () Bool)

(declare-fun mapDefault!1185 () T!51333)

