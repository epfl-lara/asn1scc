; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63238 () Bool)

(assert start!63238)

(declare-fun mapIsEmpty!1020 () Bool)

(declare-fun mapRes!1020 () Bool)

(assert (=> mapIsEmpty!1020 mapRes!1020))

(declare-fun b!283464 () Bool)

(declare-datatypes ((T!50517 0))(
  ( (T!50518 (val!195 Int)) )
))
(declare-datatypes ((array!16426 0))(
  ( (array!16427 (arr!8092 (Array (_ BitVec 32) T!50517)) (size!7096 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16426)

(declare-fun e!202354 () Bool)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16426)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun arrayRangesEq!1343 (array!16426 array!16426 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283464 (= e!202354 (not (arrayRangesEq!1343 a2!471 a1!471 from!597 to!564)))))

(declare-fun i!913 () (_ BitVec 32))

(declare-datatypes ((Unit!19842 0))(
  ( (Unit!19843) )
))
(declare-fun lt!417920 () Unit!19842)

(declare-fun rec!56 (array!16426 array!16426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19842)

(assert (=> b!283464 (= lt!417920 (rec!56 a1!471 a2!471 from!597 to!564 (bvsub i!913 #b00000000000000000000000000000001)))))

(assert (=> b!283464 (= (select (arr!8092 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8092 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-fun lt!417921 () Unit!19842)

(declare-fun arrayRangesEqImpliesEq!196 (array!16426 array!16426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19842)

(assert (=> b!283464 (= lt!417921 (arrayRangesEqImpliesEq!196 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun mapNonEmpty!1020 () Bool)

(declare-fun tp!1020 () Bool)

(declare-fun tp_is_empty!391 () Bool)

(assert (=> mapNonEmpty!1020 (= mapRes!1020 (and tp!1020 tp_is_empty!391))))

(declare-fun mapValue!1021 () T!50517)

(declare-fun mapKey!1021 () (_ BitVec 32))

(declare-fun mapRest!1020 () (Array (_ BitVec 32) T!50517))

(assert (=> mapNonEmpty!1020 (= (arr!8092 a1!471) (store mapRest!1020 mapKey!1021 mapValue!1021))))

(declare-fun res!234978 () Bool)

(assert (=> start!63238 (=> (not res!234978) (not e!202354))))

(assert (=> start!63238 (= res!234978 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7096 a1!471)) (= (size!7096 a1!471) (size!7096 a2!471))))))

(assert (=> start!63238 e!202354))

(declare-fun e!202355 () Bool)

(declare-fun array_inv!6790 (array!16426) Bool)

(assert (=> start!63238 (and (array_inv!6790 a1!471) e!202355)))

(assert (=> start!63238 true))

(declare-fun e!202353 () Bool)

(assert (=> start!63238 (and (array_inv!6790 a2!471) e!202353)))

(declare-fun b!283465 () Bool)

(declare-fun mapRes!1021 () Bool)

(assert (=> b!283465 (= e!202353 (and tp_is_empty!391 mapRes!1021))))

(declare-fun condMapEmpty!1020 () Bool)

(declare-fun mapDefault!1021 () T!50517)

