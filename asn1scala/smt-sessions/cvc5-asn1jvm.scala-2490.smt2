; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63196 () Bool)

(assert start!63196)

(declare-fun b!283050 () Bool)

(declare-fun res!234687 () Bool)

(declare-fun e!202166 () Bool)

(assert (=> b!283050 (=> (not res!234687) (not e!202166))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283050 (= res!234687 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!283051 () Bool)

(declare-fun res!234691 () Bool)

(assert (=> b!283051 (=> (not res!234691) (not e!202166))))

(declare-datatypes ((T!50335 0))(
  ( (T!50336 (val!174 Int)) )
))
(declare-datatypes ((array!16384 0))(
  ( (array!16385 (arr!8071 (Array (_ BitVec 32) T!50335)) (size!7075 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16384)

(declare-fun a2!471 () array!16384)

(declare-fun arrayRangesEq!1330 (array!16384 array!16384 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283051 (= res!234691 (arrayRangesEq!1330 a1!471 a2!471 from!597 to!564))))

(declare-fun b!283052 () Bool)

(declare-fun res!234688 () Bool)

(assert (=> b!283052 (=> (not res!234688) (not e!202166))))

(assert (=> b!283052 (= res!234688 (arrayRangesEq!1330 a2!471 a1!471 i!913 to!564))))

(declare-fun b!283053 () Bool)

(declare-fun res!234689 () Bool)

(assert (=> b!283053 (=> (not res!234689) (not e!202166))))

(assert (=> b!283053 (= res!234689 (not (= i!913 from!597)))))

(declare-fun mapIsEmpty!894 () Bool)

(declare-fun mapRes!895 () Bool)

(assert (=> mapIsEmpty!894 mapRes!895))

(declare-fun mapNonEmpty!894 () Bool)

(declare-fun tp!894 () Bool)

(declare-fun tp_is_empty!349 () Bool)

(assert (=> mapNonEmpty!894 (= mapRes!895 (and tp!894 tp_is_empty!349))))

(declare-fun mapRest!894 () (Array (_ BitVec 32) T!50335))

(declare-fun mapValue!894 () T!50335)

(declare-fun mapKey!894 () (_ BitVec 32))

(assert (=> mapNonEmpty!894 (= (arr!8071 a2!471) (store mapRest!894 mapKey!894 mapValue!894))))

(declare-fun b!283054 () Bool)

(assert (=> b!283054 (= e!202166 (not (or (bvsgt (size!7075 a2!471) (size!7075 a1!471)) (bvsle to!564 (size!7075 a2!471)))))))

(declare-datatypes ((Unit!19830 0))(
  ( (Unit!19831) )
))
(declare-fun lt!417885 () Unit!19830)

(declare-fun rec!54 (array!16384 array!16384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19830)

(assert (=> b!283054 (= lt!417885 (rec!54 a1!471 a2!471 from!597 to!564 (bvsub i!913 #b00000000000000000000000000000001)))))

(assert (=> b!283054 (= (select (arr!8071 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8071 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-fun lt!417884 () Unit!19830)

(declare-fun arrayRangesEqImpliesEq!190 (array!16384 array!16384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19830)

(assert (=> b!283054 (= lt!417884 (arrayRangesEqImpliesEq!190 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun b!283055 () Bool)

(declare-fun e!202165 () Bool)

(assert (=> b!283055 (= e!202165 (and tp_is_empty!349 mapRes!895))))

(declare-fun condMapEmpty!894 () Bool)

(declare-fun mapDefault!895 () T!50335)

