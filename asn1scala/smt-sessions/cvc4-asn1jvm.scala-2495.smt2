; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63230 () Bool)

(assert start!63230)

(declare-fun mapNonEmpty!996 () Bool)

(declare-fun mapRes!997 () Bool)

(declare-fun tp!997 () Bool)

(declare-fun tp_is_empty!383 () Bool)

(assert (=> mapNonEmpty!996 (= mapRes!997 (and tp!997 tp_is_empty!383))))

(declare-datatypes ((T!50469 0))(
  ( (T!50470 (val!191 Int)) )
))
(declare-fun mapRest!997 () (Array (_ BitVec 32) T!50469))

(declare-datatypes ((array!16418 0))(
  ( (array!16419 (arr!8088 (Array (_ BitVec 32) T!50469)) (size!7092 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16418)

(declare-fun mapValue!996 () T!50469)

(declare-fun mapKey!996 () (_ BitVec 32))

(assert (=> mapNonEmpty!996 (= (arr!8088 a1!471) (store mapRest!997 mapKey!996 mapValue!996))))

(declare-fun mapNonEmpty!997 () Bool)

(declare-fun mapRes!996 () Bool)

(declare-fun tp!996 () Bool)

(assert (=> mapNonEmpty!997 (= mapRes!996 (and tp!996 tp_is_empty!383))))

(declare-fun mapRest!996 () (Array (_ BitVec 32) T!50469))

(declare-fun mapKey!997 () (_ BitVec 32))

(declare-fun a2!471 () array!16418)

(declare-fun mapValue!997 () T!50469)

(assert (=> mapNonEmpty!997 (= (arr!8088 a2!471) (store mapRest!996 mapKey!997 mapValue!997))))

(declare-fun mapIsEmpty!996 () Bool)

(assert (=> mapIsEmpty!996 mapRes!997))

(declare-fun mapIsEmpty!997 () Bool)

(assert (=> mapIsEmpty!997 mapRes!996))

(declare-fun b!283380 () Bool)

(declare-fun res!234915 () Bool)

(declare-fun e!202318 () Bool)

(assert (=> b!283380 (=> (not res!234915) (not e!202318))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283380 (= res!234915 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!283381 () Bool)

(declare-fun res!234917 () Bool)

(assert (=> b!283381 (=> (not res!234917) (not e!202318))))

(declare-fun arrayRangesEq!1341 (array!16418 array!16418 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283381 (= res!234917 (arrayRangesEq!1341 a2!471 a1!471 i!913 to!564))))

(declare-fun b!283382 () Bool)

(assert (=> b!283382 (= e!202318 (not (or (= (bvand i!913 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand i!913 #b10000000000000000000000000000000) (bvand (bvsub i!913 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(assert (=> b!283382 (= (select (arr!8088 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8088 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19838 0))(
  ( (Unit!19839) )
))
(declare-fun lt!417906 () Unit!19838)

(declare-fun arrayRangesEqImpliesEq!194 (array!16418 array!16418 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19838)

(assert (=> b!283382 (= lt!417906 (arrayRangesEqImpliesEq!194 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun res!234919 () Bool)

(assert (=> start!63230 (=> (not res!234919) (not e!202318))))

(assert (=> start!63230 (= res!234919 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7092 a1!471)) (= (size!7092 a1!471) (size!7092 a2!471))))))

(assert (=> start!63230 e!202318))

(declare-fun e!202317 () Bool)

(declare-fun array_inv!6788 (array!16418) Bool)

(assert (=> start!63230 (and (array_inv!6788 a1!471) e!202317)))

(assert (=> start!63230 true))

(declare-fun e!202319 () Bool)

(assert (=> start!63230 (and (array_inv!6788 a2!471) e!202319)))

(declare-fun b!283383 () Bool)

(declare-fun res!234918 () Bool)

(assert (=> b!283383 (=> (not res!234918) (not e!202318))))

(assert (=> b!283383 (= res!234918 (not (= i!913 from!597)))))

(declare-fun b!283384 () Bool)

(declare-fun res!234916 () Bool)

(assert (=> b!283384 (=> (not res!234916) (not e!202318))))

(assert (=> b!283384 (= res!234916 (arrayRangesEq!1341 a1!471 a2!471 from!597 to!564))))

(declare-fun b!283385 () Bool)

(assert (=> b!283385 (= e!202319 (and tp_is_empty!383 mapRes!996))))

(declare-fun condMapEmpty!997 () Bool)

(declare-fun mapDefault!997 () T!50469)

