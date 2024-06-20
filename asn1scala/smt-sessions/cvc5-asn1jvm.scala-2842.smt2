; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68566 () Bool)

(assert start!68566)

(declare-fun b!308420 () Bool)

(declare-fun e!222048 () Bool)

(declare-fun e!222045 () Bool)

(assert (=> b!308420 (= e!222048 (not e!222045))))

(declare-fun res!253016 () Bool)

(assert (=> b!308420 (=> res!253016 e!222045)))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!308420 (= res!253016 (or (bvsgt fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsgt (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-datatypes ((T!57873 0))(
  ( (T!57874 (val!423 Int)) )
))
(declare-datatypes ((array!18711 0))(
  ( (array!18712 (arr!9193 (Array (_ BitVec 32) T!57873)) (size!8110 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18711)

(declare-fun a2!524 () array!18711)

(assert (=> b!308420 (= (select (arr!9193 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9193 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun from!650 () (_ BitVec 32))

(declare-datatypes ((Unit!21461 0))(
  ( (Unit!21462) )
))
(declare-fun lt!440300 () Unit!21461)

(declare-fun arrayRangesEqImpliesEq!303 (array!18711 array!18711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21461)

(assert (=> b!308420 (= lt!440300 (arrayRangesEqImpliesEq!303 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun e!222047 () Bool)

(declare-fun b!308421 () Bool)

(declare-fun arrayRangesEq!1727 (array!18711 array!18711 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308421 (= e!222047 (not (arrayRangesEq!1727 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(declare-fun mapIsEmpty!2705 () Bool)

(declare-fun mapRes!2705 () Bool)

(assert (=> mapIsEmpty!2705 mapRes!2705))

(declare-fun b!308423 () Bool)

(declare-fun res!253010 () Bool)

(assert (=> b!308423 (=> (not res!253010) (not e!222048))))

(assert (=> b!308423 (= res!253010 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun b!308424 () Bool)

(declare-fun res!253009 () Bool)

(assert (=> b!308424 (=> res!253009 e!222045)))

(assert (=> b!308424 (= res!253009 e!222047)))

(declare-fun res!253011 () Bool)

(assert (=> b!308424 (=> (not res!253011) (not e!222047))))

(assert (=> b!308424 (= res!253011 (bvsle (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun mapNonEmpty!2705 () Bool)

(declare-fun tp!2705 () Bool)

(declare-fun tp_is_empty!847 () Bool)

(assert (=> mapNonEmpty!2705 (= mapRes!2705 (and tp!2705 tp_is_empty!847))))

(declare-fun mapKey!2706 () (_ BitVec 32))

(declare-fun mapValue!2706 () T!57873)

(declare-fun mapRest!2705 () (Array (_ BitVec 32) T!57873))

(assert (=> mapNonEmpty!2705 (= (arr!9193 a2!524) (store mapRest!2705 mapKey!2706 mapValue!2706))))

(declare-fun b!308425 () Bool)

(declare-fun res!253006 () Bool)

(assert (=> b!308425 (=> res!253006 e!222045)))

(assert (=> b!308425 (= res!253006 (not (arrayRangesEq!1727 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun b!308426 () Bool)

(assert (=> b!308426 (= e!222045 (bvsle #b00000000000000000000000000000000 fromSlice!46))))

(assert (=> b!308426 (arrayRangesEq!1727 a1!524 a2!524 fromSlice!46 toSlice!46)))

(declare-fun lt!440301 () Unit!21461)

(declare-fun rec!95 (array!18711 array!18711 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21461)

(assert (=> b!308426 (= lt!440301 (rec!95 a1!524 a2!524 from!650 fromSlice!46 to!617 toSlice!46 (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun b!308427 () Bool)

(declare-fun res!253015 () Bool)

(assert (=> b!308427 (=> (not res!253015) (not e!222048))))

(declare-fun e!222044 () Bool)

(assert (=> b!308427 (= res!253015 e!222044)))

(declare-fun res!253012 () Bool)

(assert (=> b!308427 (=> res!253012 e!222044)))

(assert (=> b!308427 (= res!253012 (bvsgt i!932 toSlice!46))))

(declare-fun mapIsEmpty!2706 () Bool)

(declare-fun mapRes!2706 () Bool)

(assert (=> mapIsEmpty!2706 mapRes!2706))

(declare-fun b!308428 () Bool)

(declare-fun e!222046 () Bool)

(assert (=> b!308428 (= e!222046 (and tp_is_empty!847 mapRes!2705))))

(declare-fun condMapEmpty!2705 () Bool)

(declare-fun mapDefault!2705 () T!57873)

