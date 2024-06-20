; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68558 () Bool)

(assert start!68558)

(declare-fun mapIsEmpty!2681 () Bool)

(declare-fun mapRes!2681 () Bool)

(assert (=> mapIsEmpty!2681 mapRes!2681))

(declare-fun b!308304 () Bool)

(declare-fun e!221993 () Bool)

(assert (=> b!308304 (= e!221993 (not true))))

(declare-datatypes ((T!57825 0))(
  ( (T!57826 (val!419 Int)) )
))
(declare-datatypes ((array!18703 0))(
  ( (array!18704 (arr!9189 (Array (_ BitVec 32) T!57825)) (size!8106 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18703)

(declare-fun i!932 () (_ BitVec 32))

(declare-fun a2!524 () array!18703)

(assert (=> b!308304 (= (select (arr!9189 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9189 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-datatypes ((Unit!21457 0))(
  ( (Unit!21458) )
))
(declare-fun lt!440286 () Unit!21457)

(declare-fun arrayRangesEqImpliesEq!301 (array!18703 array!18703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21457)

(assert (=> b!308304 (= lt!440286 (arrayRangesEqImpliesEq!301 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!308305 () Bool)

(declare-fun res!252917 () Bool)

(assert (=> b!308305 (=> (not res!252917) (not e!221993))))

(declare-fun e!221991 () Bool)

(assert (=> b!308305 (= res!252917 e!221991)))

(declare-fun res!252916 () Bool)

(assert (=> b!308305 (=> res!252916 e!221991)))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!308305 (= res!252916 (bvsgt i!932 toSlice!46))))

(declare-fun res!252920 () Bool)

(assert (=> start!68558 (=> (not res!252920) (not e!221993))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> start!68558 (= res!252920 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8106 a1!524) (size!8106 a2!524)) (bvsle to!617 (size!8106 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68558 e!221993))

(assert (=> start!68558 true))

(declare-fun e!221994 () Bool)

(declare-fun array_inv!7701 (array!18703) Bool)

(assert (=> start!68558 (and (array_inv!7701 a2!524) e!221994)))

(declare-fun e!221992 () Bool)

(assert (=> start!68558 (and (array_inv!7701 a1!524) e!221992)))

(declare-fun b!308306 () Bool)

(declare-fun res!252918 () Bool)

(assert (=> b!308306 (=> (not res!252918) (not e!221993))))

(assert (=> b!308306 (= res!252918 (not (= i!932 fromSlice!46)))))

(declare-fun b!308307 () Bool)

(declare-fun res!252919 () Bool)

(assert (=> b!308307 (=> (not res!252919) (not e!221993))))

(assert (=> b!308307 (= res!252919 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun b!308308 () Bool)

(declare-fun res!252915 () Bool)

(assert (=> b!308308 (=> (not res!252915) (not e!221993))))

(declare-fun arrayRangesEq!1725 (array!18703 array!18703 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308308 (= res!252915 (arrayRangesEq!1725 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308309 () Bool)

(declare-fun tp_is_empty!839 () Bool)

(assert (=> b!308309 (= e!221994 (and tp_is_empty!839 mapRes!2681))))

(declare-fun condMapEmpty!2682 () Bool)

(declare-fun mapDefault!2681 () T!57825)

