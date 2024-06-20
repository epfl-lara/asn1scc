; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63166 () Bool)

(assert start!63166)

(declare-fun mapIsEmpty!818 () Bool)

(declare-fun mapRes!819 () Bool)

(assert (=> mapIsEmpty!818 mapRes!819))

(declare-fun mapNonEmpty!818 () Bool)

(declare-fun tp!819 () Bool)

(declare-fun tp_is_empty!325 () Bool)

(assert (=> mapNonEmpty!818 (= mapRes!819 (and tp!819 tp_is_empty!325))))

(declare-datatypes ((T!50231 0))(
  ( (T!50232 (val!162 Int)) )
))
(declare-fun mapRest!819 () (Array (_ BitVec 32) T!50231))

(declare-fun mapValue!818 () T!50231)

(declare-datatypes ((array!16359 0))(
  ( (array!16360 (arr!8059 (Array (_ BitVec 32) T!50231)) (size!7063 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16359)

(declare-fun mapKey!819 () (_ BitVec 32))

(assert (=> mapNonEmpty!818 (= (arr!8059 a2!471) (store mapRest!819 mapKey!819 mapValue!818))))

(declare-fun e!202038 () Bool)

(declare-fun b!282777 () Bool)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!282777 (= e!202038 (not (and (bvsle from!597 (bvsub i!913 #b00000000000000000000000000000001)) (bvsle (bvsub i!913 #b00000000000000000000000000000001) to!564))))))

(declare-fun a1!471 () array!16359)

(assert (=> b!282777 (= (select (arr!8059 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8059 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19820 0))(
  ( (Unit!19821) )
))
(declare-fun lt!417825 () Unit!19820)

(declare-fun arrayRangesEqImpliesEq!185 (array!16359 array!16359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19820)

(assert (=> b!282777 (= lt!417825 (arrayRangesEqImpliesEq!185 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun mapIsEmpty!819 () Bool)

(declare-fun mapRes!818 () Bool)

(assert (=> mapIsEmpty!819 mapRes!818))

(declare-fun res!234488 () Bool)

(assert (=> start!63166 (=> (not res!234488) (not e!202038))))

(assert (=> start!63166 (= res!234488 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7063 a1!471)) (= (size!7063 a1!471) (size!7063 a2!471))))))

(assert (=> start!63166 e!202038))

(declare-fun e!202039 () Bool)

(declare-fun array_inv!6774 (array!16359) Bool)

(assert (=> start!63166 (and (array_inv!6774 a1!471) e!202039)))

(assert (=> start!63166 true))

(declare-fun e!202037 () Bool)

(assert (=> start!63166 (and (array_inv!6774 a2!471) e!202037)))

(declare-fun b!282778 () Bool)

(declare-fun res!234491 () Bool)

(assert (=> b!282778 (=> (not res!234491) (not e!202038))))

(declare-fun arrayRangesEq!1321 (array!16359 array!16359 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282778 (= res!234491 (arrayRangesEq!1321 a2!471 a1!471 i!913 to!564))))

(declare-fun b!282779 () Bool)

(assert (=> b!282779 (= e!202039 (and tp_is_empty!325 mapRes!818))))

(declare-fun condMapEmpty!818 () Bool)

(declare-fun mapDefault!818 () T!50231)

