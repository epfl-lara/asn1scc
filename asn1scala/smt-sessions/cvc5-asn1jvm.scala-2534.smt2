; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63970 () Bool)

(assert start!63970)

(declare-fun b!284454 () Bool)

(declare-fun e!203340 () Bool)

(assert (=> b!284454 (= e!203340 (not true))))

(declare-datatypes ((T!51281 0))(
  ( (T!51282 (val!207 Int)) )
))
(declare-datatypes ((array!16692 0))(
  ( (array!16693 (arr!8194 (Array (_ BitVec 32) T!51281)) (size!7198 (_ BitVec 32))) )
))
(declare-fun a1!623 () array!16692)

(declare-fun from!749 () (_ BitVec 32))

(declare-fun mid!66 () (_ BitVec 32))

(declare-fun a3!63 () array!16692)

(declare-fun arrayRangesEq!1349 (array!16692 array!16692 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284454 (arrayRangesEq!1349 a1!623 a3!63 from!749 mid!66)))

(declare-fun a2!623 () array!16692)

(declare-fun to!716 () (_ BitVec 32))

(declare-datatypes ((Unit!19911 0))(
  ( (Unit!19912) )
))
(declare-fun lt!418527 () Unit!19911)

(declare-fun rec!60 (array!16692 array!16692 array!16692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19911)

(assert (=> b!284454 (= lt!418527 (rec!60 a1!623 a2!623 a3!63 from!749 mid!66 to!716 from!749))))

(declare-fun res!235586 () Bool)

(assert (=> start!63970 (=> (not res!235586) (not e!203340))))

(assert (=> start!63970 (= res!235586 (and (bvsle #b00000000000000000000000000000000 from!749) (bvsle from!749 mid!66) (bvsle mid!66 to!716) (bvsle (size!7198 a1!623) (size!7198 a2!623)) (bvsle (size!7198 a2!623) (size!7198 a3!63)) (bvsle mid!66 (size!7198 a1!623)) (bvsle to!716 (size!7198 a2!623))))))

(assert (=> start!63970 e!203340))

(declare-fun e!203343 () Bool)

(declare-fun array_inv!6886 (array!16692) Bool)

(assert (=> start!63970 (and (array_inv!6886 a2!623) e!203343)))

(declare-fun e!203341 () Bool)

(assert (=> start!63970 (and (array_inv!6886 a1!623) e!203341)))

(assert (=> start!63970 true))

(declare-fun e!203342 () Bool)

(assert (=> start!63970 (and (array_inv!6886 a3!63) e!203342)))

(declare-fun mapIsEmpty!1125 () Bool)

(declare-fun mapRes!1126 () Bool)

(assert (=> mapIsEmpty!1125 mapRes!1126))

(declare-fun mapNonEmpty!1125 () Bool)

(declare-fun mapRes!1125 () Bool)

(declare-fun tp!1126 () Bool)

(declare-fun tp_is_empty!415 () Bool)

(assert (=> mapNonEmpty!1125 (= mapRes!1125 (and tp!1126 tp_is_empty!415))))

(declare-fun mapRest!1125 () (Array (_ BitVec 32) T!51281))

(declare-fun mapKey!1126 () (_ BitVec 32))

(declare-fun mapValue!1127 () T!51281)

(assert (=> mapNonEmpty!1125 (= (arr!8194 a1!623) (store mapRest!1125 mapKey!1126 mapValue!1127))))

(declare-fun b!284455 () Bool)

(declare-fun res!235588 () Bool)

(assert (=> b!284455 (=> (not res!235588) (not e!203340))))

(assert (=> b!284455 (= res!235588 (arrayRangesEq!1349 a1!623 a3!63 from!749 from!749))))

(declare-fun mapIsEmpty!1126 () Bool)

(declare-fun mapRes!1127 () Bool)

(assert (=> mapIsEmpty!1126 mapRes!1127))

(declare-fun b!284456 () Bool)

(assert (=> b!284456 (= e!203343 (and tp_is_empty!415 mapRes!1127))))

(declare-fun condMapEmpty!1126 () Bool)

(declare-fun mapDefault!1127 () T!51281)

