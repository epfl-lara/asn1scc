; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68592 () Bool)

(assert start!68592)

(declare-fun mapNonEmpty!2783 () Bool)

(declare-fun mapRes!2784 () Bool)

(declare-fun tp!2783 () Bool)

(declare-fun tp_is_empty!873 () Bool)

(assert (=> mapNonEmpty!2783 (= mapRes!2784 (and tp!2783 tp_is_empty!873))))

(declare-datatypes ((T!57979 0))(
  ( (T!57980 (val!436 Int)) )
))
(declare-fun mapRest!2784 () (Array (_ BitVec 32) T!57979))

(declare-fun mapKey!2784 () (_ BitVec 32))

(declare-fun mapValue!2783 () T!57979)

(declare-datatypes ((array!18737 0))(
  ( (array!18738 (arr!9206 (Array (_ BitVec 32) T!57979)) (size!8123 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18737)

(assert (=> mapNonEmpty!2783 (= (arr!9206 a1!524) (store mapRest!2784 mapKey!2784 mapValue!2783))))

(declare-fun mapIsEmpty!2783 () Bool)

(declare-fun mapRes!2783 () Bool)

(assert (=> mapIsEmpty!2783 mapRes!2783))

(declare-fun mapNonEmpty!2784 () Bool)

(declare-fun tp!2784 () Bool)

(assert (=> mapNonEmpty!2784 (= mapRes!2783 (and tp!2784 tp_is_empty!873))))

(declare-fun mapValue!2784 () T!57979)

(declare-fun mapRest!2783 () (Array (_ BitVec 32) T!57979))

(declare-fun mapKey!2783 () (_ BitVec 32))

(declare-fun a2!524 () array!18737)

(assert (=> mapNonEmpty!2784 (= (arr!9206 a2!524) (store mapRest!2783 mapKey!2783 mapValue!2784))))

(declare-fun res!253370 () Bool)

(declare-fun e!222251 () Bool)

(assert (=> start!68592 (=> (not res!253370) (not e!222251))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> start!68592 (= res!253370 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8123 a1!524) (size!8123 a2!524)) (bvsle to!617 (size!8123 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68592 e!222251))

(assert (=> start!68592 true))

(declare-fun e!222250 () Bool)

(declare-fun array_inv!7709 (array!18737) Bool)

(assert (=> start!68592 (and (array_inv!7709 a2!524) e!222250)))

(declare-fun e!222252 () Bool)

(assert (=> start!68592 (and (array_inv!7709 a1!524) e!222252)))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun e!222249 () Bool)

(declare-fun b!308862 () Bool)

(declare-fun arrayRangesEq!1738 (array!18737 array!18737 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308862 (= e!222249 (arrayRangesEq!1738 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!308863 () Bool)

(assert (=> b!308863 (= e!222251 (not (arrayRangesEq!1738 a1!524 a2!524 fromSlice!46 toSlice!46)))))

(declare-fun b!308864 () Bool)

(assert (=> b!308864 (= e!222252 (and tp_is_empty!873 mapRes!2784))))

(declare-fun condMapEmpty!2784 () Bool)

(declare-fun mapDefault!2783 () T!57979)

(assert (=> b!308864 (= condMapEmpty!2784 (= (arr!9206 a1!524) ((as const (Array (_ BitVec 32) T!57979)) mapDefault!2783)))))

(declare-fun mapIsEmpty!2784 () Bool)

(assert (=> mapIsEmpty!2784 mapRes!2784))

(declare-fun b!308865 () Bool)

(declare-fun res!253371 () Bool)

(assert (=> b!308865 (=> (not res!253371) (not e!222251))))

(assert (=> b!308865 (= res!253371 (arrayRangesEq!1738 a1!524 a2!524 from!650 to!617))))

(declare-fun b!308866 () Bool)

(declare-fun res!253374 () Bool)

(assert (=> b!308866 (=> (not res!253374) (not e!222251))))

(assert (=> b!308866 (= res!253374 e!222249)))

(declare-fun res!253373 () Bool)

(assert (=> b!308866 (=> res!253373 e!222249)))

(assert (=> b!308866 (= res!253373 (bvsgt i!932 toSlice!46))))

(declare-fun b!308867 () Bool)

(declare-fun res!253372 () Bool)

(assert (=> b!308867 (=> (not res!253372) (not e!222251))))

(assert (=> b!308867 (= res!253372 (arrayRangesEq!1738 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308868 () Bool)

(declare-fun res!253375 () Bool)

(assert (=> b!308868 (=> (not res!253375) (not e!222251))))

(assert (=> b!308868 (= res!253375 (= i!932 fromSlice!46))))

(declare-fun b!308869 () Bool)

(declare-fun res!253376 () Bool)

(assert (=> b!308869 (=> (not res!253376) (not e!222251))))

(assert (=> b!308869 (= res!253376 (bvsle i!932 to!617))))

(declare-fun b!308870 () Bool)

(assert (=> b!308870 (= e!222250 (and tp_is_empty!873 mapRes!2783))))

(declare-fun condMapEmpty!2783 () Bool)

(declare-fun mapDefault!2784 () T!57979)

(assert (=> b!308870 (= condMapEmpty!2783 (= (arr!9206 a2!524) ((as const (Array (_ BitVec 32) T!57979)) mapDefault!2784)))))

(assert (= (and start!68592 res!253370) b!308865))

(assert (= (and b!308865 res!253371) b!308869))

(assert (= (and b!308869 res!253376) b!308867))

(assert (= (and b!308867 res!253372) b!308866))

(assert (= (and b!308866 (not res!253373)) b!308862))

(assert (= (and b!308866 res!253374) b!308868))

(assert (= (and b!308868 res!253375) b!308863))

(assert (= (and b!308870 condMapEmpty!2783) mapIsEmpty!2783))

(assert (= (and b!308870 (not condMapEmpty!2783)) mapNonEmpty!2784))

(assert (= start!68592 b!308870))

(assert (= (and b!308864 condMapEmpty!2784) mapIsEmpty!2784))

(assert (= (and b!308864 (not condMapEmpty!2784)) mapNonEmpty!2783))

(assert (= start!68592 b!308864))

(declare-fun m!447031 () Bool)

(assert (=> mapNonEmpty!2784 m!447031))

(declare-fun m!447033 () Bool)

(assert (=> mapNonEmpty!2783 m!447033))

(declare-fun m!447035 () Bool)

(assert (=> b!308865 m!447035))

(declare-fun m!447037 () Bool)

(assert (=> b!308862 m!447037))

(declare-fun m!447039 () Bool)

(assert (=> start!68592 m!447039))

(declare-fun m!447041 () Bool)

(assert (=> start!68592 m!447041))

(declare-fun m!447043 () Bool)

(assert (=> b!308867 m!447043))

(declare-fun m!447045 () Bool)

(assert (=> b!308863 m!447045))

(check-sat (not mapNonEmpty!2784) (not b!308867) (not mapNonEmpty!2783) (not b!308865) (not start!68592) tp_is_empty!873 (not b!308862) (not b!308863))
(check-sat)
