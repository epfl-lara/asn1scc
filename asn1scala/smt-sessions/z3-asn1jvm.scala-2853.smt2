; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68646 () Bool)

(assert start!68646)

(declare-fun mapNonEmpty!2917 () Bool)

(declare-fun mapRes!2918 () Bool)

(declare-fun tp!2918 () Bool)

(declare-fun tp_is_empty!915 () Bool)

(assert (=> mapNonEmpty!2917 (= mapRes!2918 (and tp!2918 tp_is_empty!915))))

(declare-datatypes ((T!58161 0))(
  ( (T!58162 (val!457 Int)) )
))
(declare-fun mapRest!2918 () (Array (_ BitVec 32) T!58161))

(declare-fun mapValue!2917 () T!58161)

(declare-fun mapKey!2917 () (_ BitVec 32))

(declare-datatypes ((array!18781 0))(
  ( (array!18782 (arr!9227 (Array (_ BitVec 32) T!58161)) (size!8144 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18781)

(assert (=> mapNonEmpty!2917 (= (arr!9227 a1!524) (store mapRest!2918 mapKey!2917 mapValue!2917))))

(declare-fun b!309497 () Bool)

(declare-fun e!222557 () Bool)

(assert (=> b!309497 (= e!222557 (and tp_is_empty!915 mapRes!2918))))

(declare-fun condMapEmpty!2917 () Bool)

(declare-fun mapDefault!2918 () T!58161)

(assert (=> b!309497 (= condMapEmpty!2917 (= (arr!9227 a1!524) ((as const (Array (_ BitVec 32) T!58161)) mapDefault!2918)))))

(declare-fun b!309498 () Bool)

(declare-fun e!222559 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!309498 (= e!222559 (bvslt (bvsub i!932 #b00000000000000000000000000000001) i!932))))

(declare-fun b!309499 () Bool)

(declare-fun res!253885 () Bool)

(declare-fun e!222556 () Bool)

(assert (=> b!309499 (=> (not res!253885) (not e!222556))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!309499 (= res!253885 (not (= i!932 fromSlice!46)))))

(declare-fun b!309500 () Bool)

(assert (=> b!309500 (= e!222556 (not e!222559))))

(declare-fun res!253876 () Bool)

(assert (=> b!309500 (=> res!253876 e!222559)))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!309500 (= res!253876 (or (bvsgt fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsgt (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun a2!524 () array!18781)

(assert (=> b!309500 (= (select (arr!9227 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9227 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21487 0))(
  ( (Unit!21488) )
))
(declare-fun lt!440397 () Unit!21487)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun arrayRangesEqImpliesEq!314 (array!18781 array!18781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21487)

(assert (=> b!309500 (= lt!440397 (arrayRangesEqImpliesEq!314 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun res!253880 () Bool)

(assert (=> start!68646 (=> (not res!253880) (not e!222556))))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> start!68646 (= res!253880 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8144 a1!524) (size!8144 a2!524)) (bvsle to!617 (size!8144 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68646 e!222556))

(assert (=> start!68646 true))

(declare-fun e!222555 () Bool)

(declare-fun array_inv!7722 (array!18781) Bool)

(assert (=> start!68646 (and (array_inv!7722 a2!524) e!222555)))

(assert (=> start!68646 (and (array_inv!7722 a1!524) e!222557)))

(declare-fun b!309501 () Bool)

(declare-fun res!253882 () Bool)

(assert (=> b!309501 (=> (not res!253882) (not e!222556))))

(declare-fun arrayRangesEq!1756 (array!18781 array!18781 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309501 (= res!253882 (arrayRangesEq!1756 a1!524 a2!524 from!650 to!617))))

(declare-fun b!309502 () Bool)

(declare-fun res!253879 () Bool)

(assert (=> b!309502 (=> (not res!253879) (not e!222556))))

(assert (=> b!309502 (= res!253879 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapIsEmpty!2917 () Bool)

(assert (=> mapIsEmpty!2917 mapRes!2918))

(declare-fun e!222558 () Bool)

(declare-fun b!309503 () Bool)

(assert (=> b!309503 (= e!222558 (not (arrayRangesEq!1756 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(declare-fun b!309504 () Bool)

(declare-fun e!222560 () Bool)

(assert (=> b!309504 (= e!222560 (arrayRangesEq!1756 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!309505 () Bool)

(declare-fun res!253878 () Bool)

(assert (=> b!309505 (=> (not res!253878) (not e!222556))))

(assert (=> b!309505 (= res!253878 (arrayRangesEq!1756 a1!524 a2!524 i!932 to!617))))

(declare-fun b!309506 () Bool)

(declare-fun res!253875 () Bool)

(assert (=> b!309506 (=> res!253875 e!222559)))

(assert (=> b!309506 (= res!253875 e!222558)))

(declare-fun res!253877 () Bool)

(assert (=> b!309506 (=> (not res!253877) (not e!222558))))

(assert (=> b!309506 (= res!253877 (bvsle (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun b!309507 () Bool)

(declare-fun res!253883 () Bool)

(assert (=> b!309507 (=> (not res!253883) (not e!222556))))

(assert (=> b!309507 (= res!253883 e!222560)))

(declare-fun res!253884 () Bool)

(assert (=> b!309507 (=> res!253884 e!222560)))

(assert (=> b!309507 (= res!253884 (bvsgt i!932 toSlice!46))))

(declare-fun mapNonEmpty!2918 () Bool)

(declare-fun mapRes!2917 () Bool)

(declare-fun tp!2917 () Bool)

(assert (=> mapNonEmpty!2918 (= mapRes!2917 (and tp!2917 tp_is_empty!915))))

(declare-fun mapRest!2917 () (Array (_ BitVec 32) T!58161))

(declare-fun mapValue!2918 () T!58161)

(declare-fun mapKey!2918 () (_ BitVec 32))

(assert (=> mapNonEmpty!2918 (= (arr!9227 a2!524) (store mapRest!2917 mapKey!2918 mapValue!2918))))

(declare-fun b!309508 () Bool)

(assert (=> b!309508 (= e!222555 (and tp_is_empty!915 mapRes!2917))))

(declare-fun condMapEmpty!2918 () Bool)

(declare-fun mapDefault!2917 () T!58161)

(assert (=> b!309508 (= condMapEmpty!2918 (= (arr!9227 a2!524) ((as const (Array (_ BitVec 32) T!58161)) mapDefault!2917)))))

(declare-fun b!309509 () Bool)

(declare-fun res!253881 () Bool)

(assert (=> b!309509 (=> res!253881 e!222559)))

(assert (=> b!309509 (= res!253881 (not (arrayRangesEq!1756 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun mapIsEmpty!2918 () Bool)

(assert (=> mapIsEmpty!2918 mapRes!2917))

(assert (= (and start!68646 res!253880) b!309501))

(assert (= (and b!309501 res!253882) b!309502))

(assert (= (and b!309502 res!253879) b!309505))

(assert (= (and b!309505 res!253878) b!309507))

(assert (= (and b!309507 (not res!253884)) b!309504))

(assert (= (and b!309507 res!253883) b!309499))

(assert (= (and b!309499 res!253885) b!309500))

(assert (= (and b!309500 (not res!253876)) b!309509))

(assert (= (and b!309509 (not res!253881)) b!309506))

(assert (= (and b!309506 res!253877) b!309503))

(assert (= (and b!309506 (not res!253875)) b!309498))

(assert (= (and b!309508 condMapEmpty!2918) mapIsEmpty!2918))

(assert (= (and b!309508 (not condMapEmpty!2918)) mapNonEmpty!2918))

(assert (= start!68646 b!309508))

(assert (= (and b!309497 condMapEmpty!2917) mapIsEmpty!2917))

(assert (= (and b!309497 (not condMapEmpty!2917)) mapNonEmpty!2917))

(assert (= start!68646 b!309497))

(declare-fun m!447475 () Bool)

(assert (=> b!309504 m!447475))

(declare-fun m!447477 () Bool)

(assert (=> b!309505 m!447477))

(declare-fun m!447479 () Bool)

(assert (=> mapNonEmpty!2918 m!447479))

(declare-fun m!447481 () Bool)

(assert (=> mapNonEmpty!2917 m!447481))

(declare-fun m!447483 () Bool)

(assert (=> b!309503 m!447483))

(declare-fun m!447485 () Bool)

(assert (=> start!68646 m!447485))

(declare-fun m!447487 () Bool)

(assert (=> start!68646 m!447487))

(declare-fun m!447489 () Bool)

(assert (=> b!309501 m!447489))

(declare-fun m!447491 () Bool)

(assert (=> b!309500 m!447491))

(declare-fun m!447493 () Bool)

(assert (=> b!309500 m!447493))

(declare-fun m!447495 () Bool)

(assert (=> b!309500 m!447495))

(declare-fun m!447497 () Bool)

(assert (=> b!309509 m!447497))

(check-sat (not b!309501) (not b!309509) (not b!309503) (not b!309500) (not mapNonEmpty!2918) (not b!309505) tp_is_empty!915 (not b!309504) (not start!68646) (not mapNonEmpty!2917))
(check-sat)
