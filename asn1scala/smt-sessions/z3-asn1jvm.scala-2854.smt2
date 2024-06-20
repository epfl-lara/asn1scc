; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68652 () Bool)

(assert start!68652)

(declare-fun b!309614 () Bool)

(declare-fun res!253980 () Bool)

(declare-fun e!222610 () Bool)

(assert (=> b!309614 (=> res!253980 e!222610)))

(declare-fun e!222613 () Bool)

(assert (=> b!309614 (= res!253980 e!222613)))

(declare-fun res!253974 () Bool)

(assert (=> b!309614 (=> (not res!253974) (not e!222613))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!309614 (= res!253974 (bvsle (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun res!253979 () Bool)

(declare-fun e!222611 () Bool)

(assert (=> start!68652 (=> (not res!253979) (not e!222611))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-datatypes ((T!58187 0))(
  ( (T!58188 (val!460 Int)) )
))
(declare-datatypes ((array!18787 0))(
  ( (array!18788 (arr!9230 (Array (_ BitVec 32) T!58187)) (size!8147 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18787)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18787)

(assert (=> start!68652 (= res!253979 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8147 a1!524) (size!8147 a2!524)) (bvsle to!617 (size!8147 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68652 e!222611))

(assert (=> start!68652 true))

(declare-fun e!222612 () Bool)

(declare-fun array_inv!7725 (array!18787) Bool)

(assert (=> start!68652 (and (array_inv!7725 a2!524) e!222612)))

(declare-fun e!222609 () Bool)

(assert (=> start!68652 (and (array_inv!7725 a1!524) e!222609)))

(declare-fun b!309615 () Bool)

(declare-fun res!253983 () Bool)

(assert (=> b!309615 (=> (not res!253983) (not e!222611))))

(declare-fun arrayRangesEq!1759 (array!18787 array!18787 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309615 (= res!253983 (arrayRangesEq!1759 a1!524 a2!524 i!932 to!617))))

(declare-fun b!309616 () Bool)

(declare-fun tp_is_empty!921 () Bool)

(declare-fun mapRes!2935 () Bool)

(assert (=> b!309616 (= e!222612 (and tp_is_empty!921 mapRes!2935))))

(declare-fun condMapEmpty!2936 () Bool)

(declare-fun mapDefault!2936 () T!58187)

(assert (=> b!309616 (= condMapEmpty!2936 (= (arr!9230 a2!524) ((as const (Array (_ BitVec 32) T!58187)) mapDefault!2936)))))

(declare-fun b!309617 () Bool)

(declare-fun res!253977 () Bool)

(assert (=> b!309617 (=> (not res!253977) (not e!222611))))

(assert (=> b!309617 (= res!253977 (arrayRangesEq!1759 a1!524 a2!524 from!650 to!617))))

(declare-fun b!309618 () Bool)

(declare-fun mapRes!2936 () Bool)

(assert (=> b!309618 (= e!222609 (and tp_is_empty!921 mapRes!2936))))

(declare-fun condMapEmpty!2935 () Bool)

(declare-fun mapDefault!2935 () T!58187)

(assert (=> b!309618 (= condMapEmpty!2935 (= (arr!9230 a1!524) ((as const (Array (_ BitVec 32) T!58187)) mapDefault!2935)))))

(declare-fun b!309619 () Bool)

(declare-fun res!253981 () Bool)

(assert (=> b!309619 (=> (not res!253981) (not e!222611))))

(assert (=> b!309619 (= res!253981 (not (= i!932 fromSlice!46)))))

(declare-fun mapIsEmpty!2935 () Bool)

(assert (=> mapIsEmpty!2935 mapRes!2935))

(declare-fun b!309620 () Bool)

(assert (=> b!309620 (= e!222611 (not e!222610))))

(declare-fun res!253976 () Bool)

(assert (=> b!309620 (=> res!253976 e!222610)))

(assert (=> b!309620 (= res!253976 (or (bvsgt fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsgt (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(assert (=> b!309620 (= (select (arr!9230 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9230 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21489 0))(
  ( (Unit!21490) )
))
(declare-fun lt!440411 () Unit!21489)

(declare-fun arrayRangesEqImpliesEq!315 (array!18787 array!18787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21489)

(assert (=> b!309620 (= lt!440411 (arrayRangesEqImpliesEq!315 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!309621 () Bool)

(declare-fun e!222614 () Bool)

(assert (=> b!309621 (= e!222614 (arrayRangesEq!1759 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!309622 () Bool)

(declare-fun res!253978 () Bool)

(assert (=> b!309622 (=> res!253978 e!222610)))

(assert (=> b!309622 (= res!253978 (not (arrayRangesEq!1759 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun b!309623 () Bool)

(assert (=> b!309623 (= e!222613 (not (arrayRangesEq!1759 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(declare-fun mapNonEmpty!2935 () Bool)

(declare-fun tp!2936 () Bool)

(assert (=> mapNonEmpty!2935 (= mapRes!2936 (and tp!2936 tp_is_empty!921))))

(declare-fun mapRest!2936 () (Array (_ BitVec 32) T!58187))

(declare-fun mapKey!2935 () (_ BitVec 32))

(declare-fun mapValue!2935 () T!58187)

(assert (=> mapNonEmpty!2935 (= (arr!9230 a1!524) (store mapRest!2936 mapKey!2935 mapValue!2935))))

(declare-fun b!309624 () Bool)

(declare-fun res!253982 () Bool)

(assert (=> b!309624 (=> (not res!253982) (not e!222611))))

(assert (=> b!309624 (= res!253982 e!222614)))

(declare-fun res!253975 () Bool)

(assert (=> b!309624 (=> res!253975 e!222614)))

(assert (=> b!309624 (= res!253975 (bvsgt i!932 toSlice!46))))

(declare-fun mapIsEmpty!2936 () Bool)

(assert (=> mapIsEmpty!2936 mapRes!2936))

(declare-fun b!309625 () Bool)

(assert (=> b!309625 (= e!222610 true)))

(assert (=> b!309625 (arrayRangesEq!1759 a1!524 a2!524 fromSlice!46 toSlice!46)))

(declare-fun lt!440412 () Unit!21489)

(declare-fun rec!102 (array!18787 array!18787 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21489)

(assert (=> b!309625 (= lt!440412 (rec!102 a1!524 a2!524 from!650 fromSlice!46 to!617 toSlice!46 (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun b!309626 () Bool)

(declare-fun res!253984 () Bool)

(assert (=> b!309626 (=> (not res!253984) (not e!222611))))

(assert (=> b!309626 (= res!253984 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapNonEmpty!2936 () Bool)

(declare-fun tp!2935 () Bool)

(assert (=> mapNonEmpty!2936 (= mapRes!2935 (and tp!2935 tp_is_empty!921))))

(declare-fun mapValue!2936 () T!58187)

(declare-fun mapKey!2936 () (_ BitVec 32))

(declare-fun mapRest!2935 () (Array (_ BitVec 32) T!58187))

(assert (=> mapNonEmpty!2936 (= (arr!9230 a2!524) (store mapRest!2935 mapKey!2936 mapValue!2936))))

(assert (= (and start!68652 res!253979) b!309617))

(assert (= (and b!309617 res!253977) b!309626))

(assert (= (and b!309626 res!253984) b!309615))

(assert (= (and b!309615 res!253983) b!309624))

(assert (= (and b!309624 (not res!253975)) b!309621))

(assert (= (and b!309624 res!253982) b!309619))

(assert (= (and b!309619 res!253981) b!309620))

(assert (= (and b!309620 (not res!253976)) b!309622))

(assert (= (and b!309622 (not res!253978)) b!309614))

(assert (= (and b!309614 res!253974) b!309623))

(assert (= (and b!309614 (not res!253980)) b!309625))

(assert (= (and b!309616 condMapEmpty!2936) mapIsEmpty!2935))

(assert (= (and b!309616 (not condMapEmpty!2936)) mapNonEmpty!2936))

(assert (= start!68652 b!309616))

(assert (= (and b!309618 condMapEmpty!2935) mapIsEmpty!2936))

(assert (= (and b!309618 (not condMapEmpty!2935)) mapNonEmpty!2935))

(assert (= start!68652 b!309618))

(declare-fun m!447551 () Bool)

(assert (=> b!309621 m!447551))

(declare-fun m!447553 () Bool)

(assert (=> b!309615 m!447553))

(declare-fun m!447555 () Bool)

(assert (=> b!309617 m!447555))

(declare-fun m!447557 () Bool)

(assert (=> mapNonEmpty!2935 m!447557))

(declare-fun m!447559 () Bool)

(assert (=> mapNonEmpty!2936 m!447559))

(declare-fun m!447561 () Bool)

(assert (=> start!68652 m!447561))

(declare-fun m!447563 () Bool)

(assert (=> start!68652 m!447563))

(declare-fun m!447565 () Bool)

(assert (=> b!309625 m!447565))

(declare-fun m!447567 () Bool)

(assert (=> b!309625 m!447567))

(declare-fun m!447569 () Bool)

(assert (=> b!309620 m!447569))

(declare-fun m!447571 () Bool)

(assert (=> b!309620 m!447571))

(declare-fun m!447573 () Bool)

(assert (=> b!309620 m!447573))

(declare-fun m!447575 () Bool)

(assert (=> b!309622 m!447575))

(declare-fun m!447577 () Bool)

(assert (=> b!309623 m!447577))

(check-sat (not b!309615) (not mapNonEmpty!2936) (not b!309623) tp_is_empty!921 (not b!309620) (not b!309622) (not b!309625) (not start!68652) (not mapNonEmpty!2935) (not b!309621) (not b!309617))
(check-sat)
