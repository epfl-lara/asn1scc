; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68556 () Bool)

(assert start!68556)

(declare-fun b!308277 () Bool)

(declare-fun res!252897 () Bool)

(declare-fun e!221980 () Bool)

(assert (=> b!308277 (=> (not res!252897) (not e!221980))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!308277 (= res!252897 (not (= i!932 fromSlice!46)))))

(declare-fun b!308278 () Bool)

(declare-fun res!252898 () Bool)

(assert (=> b!308278 (=> (not res!252898) (not e!221980))))

(declare-datatypes ((T!57823 0))(
  ( (T!57824 (val!418 Int)) )
))
(declare-datatypes ((array!18701 0))(
  ( (array!18702 (arr!9188 (Array (_ BitVec 32) T!57823)) (size!8105 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18701)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun a1!524 () array!18701)

(declare-fun arrayRangesEq!1724 (array!18701 array!18701 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308278 (= res!252898 (arrayRangesEq!1724 a1!524 a2!524 from!650 to!617))))

(declare-fun b!308279 () Bool)

(declare-fun res!252893 () Bool)

(assert (=> b!308279 (=> (not res!252893) (not e!221980))))

(assert (=> b!308279 (= res!252893 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun b!308280 () Bool)

(declare-fun e!221982 () Bool)

(declare-fun tp_is_empty!837 () Bool)

(declare-fun mapRes!2675 () Bool)

(assert (=> b!308280 (= e!221982 (and tp_is_empty!837 mapRes!2675))))

(declare-fun condMapEmpty!2675 () Bool)

(declare-fun mapDefault!2675 () T!57823)

(assert (=> b!308280 (= condMapEmpty!2675 (= (arr!9188 a2!524) ((as const (Array (_ BitVec 32) T!57823)) mapDefault!2675)))))

(declare-fun mapIsEmpty!2675 () Bool)

(declare-fun mapRes!2676 () Bool)

(assert (=> mapIsEmpty!2675 mapRes!2676))

(declare-fun b!308281 () Bool)

(declare-fun e!221981 () Bool)

(assert (=> b!308281 (= e!221981 (and tp_is_empty!837 mapRes!2676))))

(declare-fun condMapEmpty!2676 () Bool)

(declare-fun mapDefault!2676 () T!57823)

(assert (=> b!308281 (= condMapEmpty!2676 (= (arr!9188 a1!524) ((as const (Array (_ BitVec 32) T!57823)) mapDefault!2676)))))

(declare-fun b!308282 () Bool)

(assert (=> b!308282 (= e!221980 (not true))))

(assert (=> b!308282 (= (select (arr!9188 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9188 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21455 0))(
  ( (Unit!21456) )
))
(declare-fun lt!440283 () Unit!21455)

(declare-fun arrayRangesEqImpliesEq!300 (array!18701 array!18701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21455)

(assert (=> b!308282 (= lt!440283 (arrayRangesEqImpliesEq!300 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun mapNonEmpty!2675 () Bool)

(declare-fun tp!2676 () Bool)

(assert (=> mapNonEmpty!2675 (= mapRes!2676 (and tp!2676 tp_is_empty!837))))

(declare-fun mapKey!2676 () (_ BitVec 32))

(declare-fun mapValue!2676 () T!57823)

(declare-fun mapRest!2675 () (Array (_ BitVec 32) T!57823))

(assert (=> mapNonEmpty!2675 (= (arr!9188 a1!524) (store mapRest!2675 mapKey!2676 mapValue!2676))))

(declare-fun mapIsEmpty!2676 () Bool)

(assert (=> mapIsEmpty!2676 mapRes!2675))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun b!308284 () Bool)

(declare-fun e!221979 () Bool)

(assert (=> b!308284 (= e!221979 (arrayRangesEq!1724 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun res!252894 () Bool)

(assert (=> start!68556 (=> (not res!252894) (not e!221980))))

(assert (=> start!68556 (= res!252894 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8105 a1!524) (size!8105 a2!524)) (bvsle to!617 (size!8105 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68556 e!221980))

(assert (=> start!68556 true))

(declare-fun array_inv!7700 (array!18701) Bool)

(assert (=> start!68556 (and (array_inv!7700 a2!524) e!221982)))

(assert (=> start!68556 (and (array_inv!7700 a1!524) e!221981)))

(declare-fun b!308283 () Bool)

(declare-fun res!252899 () Bool)

(assert (=> b!308283 (=> (not res!252899) (not e!221980))))

(assert (=> b!308283 (= res!252899 e!221979)))

(declare-fun res!252895 () Bool)

(assert (=> b!308283 (=> res!252895 e!221979)))

(assert (=> b!308283 (= res!252895 (bvsgt i!932 toSlice!46))))

(declare-fun b!308285 () Bool)

(declare-fun res!252896 () Bool)

(assert (=> b!308285 (=> (not res!252896) (not e!221980))))

(assert (=> b!308285 (= res!252896 (arrayRangesEq!1724 a1!524 a2!524 i!932 to!617))))

(declare-fun mapNonEmpty!2676 () Bool)

(declare-fun tp!2675 () Bool)

(assert (=> mapNonEmpty!2676 (= mapRes!2675 (and tp!2675 tp_is_empty!837))))

(declare-fun mapKey!2675 () (_ BitVec 32))

(declare-fun mapValue!2675 () T!57823)

(declare-fun mapRest!2676 () (Array (_ BitVec 32) T!57823))

(assert (=> mapNonEmpty!2676 (= (arr!9188 a2!524) (store mapRest!2676 mapKey!2675 mapValue!2675))))

(assert (= (and start!68556 res!252894) b!308278))

(assert (= (and b!308278 res!252898) b!308279))

(assert (= (and b!308279 res!252893) b!308285))

(assert (= (and b!308285 res!252896) b!308283))

(assert (= (and b!308283 (not res!252895)) b!308284))

(assert (= (and b!308283 res!252899) b!308277))

(assert (= (and b!308277 res!252897) b!308282))

(assert (= (and b!308280 condMapEmpty!2675) mapIsEmpty!2676))

(assert (= (and b!308280 (not condMapEmpty!2675)) mapNonEmpty!2676))

(assert (= start!68556 b!308280))

(assert (= (and b!308281 condMapEmpty!2676) mapIsEmpty!2675))

(assert (= (and b!308281 (not condMapEmpty!2676)) mapNonEmpty!2675))

(assert (= start!68556 b!308281))

(declare-fun m!446621 () Bool)

(assert (=> b!308278 m!446621))

(declare-fun m!446623 () Bool)

(assert (=> b!308284 m!446623))

(declare-fun m!446625 () Bool)

(assert (=> mapNonEmpty!2676 m!446625))

(declare-fun m!446627 () Bool)

(assert (=> start!68556 m!446627))

(declare-fun m!446629 () Bool)

(assert (=> start!68556 m!446629))

(declare-fun m!446631 () Bool)

(assert (=> b!308282 m!446631))

(declare-fun m!446633 () Bool)

(assert (=> b!308282 m!446633))

(declare-fun m!446635 () Bool)

(assert (=> b!308282 m!446635))

(declare-fun m!446637 () Bool)

(assert (=> b!308285 m!446637))

(declare-fun m!446639 () Bool)

(assert (=> mapNonEmpty!2675 m!446639))

(check-sat (not start!68556) (not mapNonEmpty!2676) (not b!308284) tp_is_empty!837 (not mapNonEmpty!2675) (not b!308278) (not b!308282) (not b!308285))
(check-sat)
