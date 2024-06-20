; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63226 () Bool)

(assert start!63226)

(declare-fun mapNonEmpty!984 () Bool)

(declare-fun mapRes!985 () Bool)

(declare-fun tp!985 () Bool)

(declare-fun tp_is_empty!379 () Bool)

(assert (=> mapNonEmpty!984 (= mapRes!985 (and tp!985 tp_is_empty!379))))

(declare-datatypes ((T!50465 0))(
  ( (T!50466 (val!189 Int)) )
))
(declare-fun mapRest!984 () (Array (_ BitVec 32) T!50465))

(declare-fun mapValue!984 () T!50465)

(declare-fun mapKey!984 () (_ BitVec 32))

(declare-datatypes ((array!16414 0))(
  ( (array!16415 (arr!8086 (Array (_ BitVec 32) T!50465)) (size!7090 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16414)

(assert (=> mapNonEmpty!984 (= (arr!8086 a2!471) (store mapRest!984 mapKey!984 mapValue!984))))

(declare-fun b!283338 () Bool)

(declare-fun e!202301 () Bool)

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!283338 (= e!202301 (not (or (= (bvand i!913 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand i!913 #b10000000000000000000000000000000) (bvand (bvsub i!913 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun a1!471 () array!16414)

(assert (=> b!283338 (= (select (arr!8086 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8086 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-fun to!564 () (_ BitVec 32))

(declare-datatypes ((Unit!19834 0))(
  ( (Unit!19835) )
))
(declare-fun lt!417900 () Unit!19834)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun arrayRangesEqImpliesEq!192 (array!16414 array!16414 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19834)

(assert (=> b!283338 (= lt!417900 (arrayRangesEqImpliesEq!192 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun b!283339 () Bool)

(declare-fun res!234889 () Bool)

(assert (=> b!283339 (=> (not res!234889) (not e!202301))))

(assert (=> b!283339 (= res!234889 (not (= i!913 from!597)))))

(declare-fun b!283340 () Bool)

(declare-fun res!234888 () Bool)

(assert (=> b!283340 (=> (not res!234888) (not e!202301))))

(declare-fun arrayRangesEq!1339 (array!16414 array!16414 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283340 (= res!234888 (arrayRangesEq!1339 a2!471 a1!471 i!913 to!564))))

(declare-fun mapIsEmpty!985 () Bool)

(assert (=> mapIsEmpty!985 mapRes!985))

(declare-fun b!283341 () Bool)

(declare-fun res!234886 () Bool)

(assert (=> b!283341 (=> (not res!234886) (not e!202301))))

(assert (=> b!283341 (= res!234886 (arrayRangesEq!1339 a1!471 a2!471 from!597 to!564))))

(declare-fun b!283342 () Bool)

(declare-fun e!202299 () Bool)

(assert (=> b!283342 (= e!202299 (and tp_is_empty!379 mapRes!985))))

(declare-fun condMapEmpty!985 () Bool)

(declare-fun mapDefault!985 () T!50465)

