; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68578 () Bool)

(assert start!68578)

(declare-fun mapIsEmpty!2741 () Bool)

(declare-fun mapRes!2741 () Bool)

(assert (=> mapIsEmpty!2741 mapRes!2741))

(declare-fun b!308654 () Bool)

(declare-fun e!222153 () Bool)

(declare-fun e!222156 () Bool)

(assert (=> b!308654 (= e!222153 (not e!222156))))

(declare-fun res!253214 () Bool)

(assert (=> b!308654 (=> res!253214 e!222156)))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!308654 (= res!253214 (or (bvsgt fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsgt (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-datatypes ((T!57925 0))(
  ( (T!57926 (val!429 Int)) )
))
(declare-datatypes ((array!18723 0))(
  ( (array!18724 (arr!9199 (Array (_ BitVec 32) T!57925)) (size!8116 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18723)

(declare-fun a2!524 () array!18723)

(assert (=> b!308654 (= (select (arr!9199 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9199 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21471 0))(
  ( (Unit!21472) )
))
(declare-fun lt!440336 () Unit!21471)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun arrayRangesEqImpliesEq!306 (array!18723 array!18723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21471)

(assert (=> b!308654 (= lt!440336 (arrayRangesEqImpliesEq!306 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun mapNonEmpty!2741 () Bool)

(declare-fun mapRes!2742 () Bool)

(declare-fun tp!2742 () Bool)

(declare-fun tp_is_empty!859 () Bool)

(assert (=> mapNonEmpty!2741 (= mapRes!2742 (and tp!2742 tp_is_empty!859))))

(declare-fun mapValue!2742 () T!57925)

(declare-fun mapKey!2741 () (_ BitVec 32))

(declare-fun mapRest!2741 () (Array (_ BitVec 32) T!57925))

(assert (=> mapNonEmpty!2741 (= (arr!9199 a1!524) (store mapRest!2741 mapKey!2741 mapValue!2742))))

(declare-fun mapIsEmpty!2742 () Bool)

(assert (=> mapIsEmpty!2742 mapRes!2742))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun b!308655 () Bool)

(assert (=> b!308655 (= e!222156 (or (bvsgt #b00000000000000000000000000000000 fromSlice!46) (bvsle toSlice!46 (size!8116 a1!524))))))

(declare-fun arrayRangesEq!1732 (array!18723 array!18723 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308655 (arrayRangesEq!1732 a1!524 a2!524 fromSlice!46 toSlice!46)))

(declare-fun lt!440337 () Unit!21471)

(declare-fun rec!100 (array!18723 array!18723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21471)

(assert (=> b!308655 (= lt!440337 (rec!100 a1!524 a2!524 from!650 fromSlice!46 to!617 toSlice!46 (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun b!308656 () Bool)

(declare-fun e!222154 () Bool)

(assert (=> b!308656 (= e!222154 (and tp_is_empty!859 mapRes!2742))))

(declare-fun condMapEmpty!2742 () Bool)

(declare-fun mapDefault!2742 () T!57925)

