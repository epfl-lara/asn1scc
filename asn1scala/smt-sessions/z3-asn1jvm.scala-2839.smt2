; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68550 () Bool)

(assert start!68550)

(declare-fun b!308196 () Bool)

(declare-fun res!252831 () Bool)

(declare-fun e!221944 () Bool)

(assert (=> b!308196 (=> (not res!252831) (not e!221944))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!308196 (= res!252831 (not (= i!932 fromSlice!46)))))

(declare-fun b!308197 () Bool)

(declare-fun e!221945 () Bool)

(declare-fun tp_is_empty!831 () Bool)

(declare-fun mapRes!2658 () Bool)

(assert (=> b!308197 (= e!221945 (and tp_is_empty!831 mapRes!2658))))

(declare-fun condMapEmpty!2658 () Bool)

(declare-datatypes ((T!57797 0))(
  ( (T!57798 (val!415 Int)) )
))
(declare-datatypes ((array!18695 0))(
  ( (array!18696 (arr!9185 (Array (_ BitVec 32) T!57797)) (size!8102 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18695)

(declare-fun mapDefault!2658 () T!57797)

(assert (=> b!308197 (= condMapEmpty!2658 (= (arr!9185 a1!524) ((as const (Array (_ BitVec 32) T!57797)) mapDefault!2658)))))

(declare-fun b!308198 () Bool)

(declare-fun res!252830 () Bool)

(assert (=> b!308198 (=> (not res!252830) (not e!221944))))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!308198 (= res!252830 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapIsEmpty!2657 () Bool)

(assert (=> mapIsEmpty!2657 mapRes!2658))

(declare-fun b!308199 () Bool)

(declare-fun e!221946 () Bool)

(declare-fun mapRes!2657 () Bool)

(assert (=> b!308199 (= e!221946 (and tp_is_empty!831 mapRes!2657))))

(declare-fun condMapEmpty!2657 () Bool)

(declare-fun a2!524 () array!18695)

(declare-fun mapDefault!2657 () T!57797)

(assert (=> b!308199 (= condMapEmpty!2657 (= (arr!9185 a2!524) ((as const (Array (_ BitVec 32) T!57797)) mapDefault!2657)))))

(declare-fun mapNonEmpty!2658 () Bool)

(declare-fun tp!2658 () Bool)

(assert (=> mapNonEmpty!2658 (= mapRes!2658 (and tp!2658 tp_is_empty!831))))

(declare-fun mapValue!2657 () T!57797)

(declare-fun mapRest!2658 () (Array (_ BitVec 32) T!57797))

(declare-fun mapKey!2658 () (_ BitVec 32))

(assert (=> mapNonEmpty!2658 (= (arr!9185 a1!524) (store mapRest!2658 mapKey!2658 mapValue!2657))))

(declare-fun b!308200 () Bool)

(declare-fun res!252833 () Bool)

(assert (=> b!308200 (=> (not res!252833) (not e!221944))))

(declare-fun arrayRangesEq!1721 (array!18695 array!18695 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308200 (= res!252833 (arrayRangesEq!1721 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308201 () Bool)

(declare-fun res!252835 () Bool)

(assert (=> b!308201 (=> (not res!252835) (not e!221944))))

(declare-fun e!221943 () Bool)

(assert (=> b!308201 (= res!252835 e!221943)))

(declare-fun res!252832 () Bool)

(assert (=> b!308201 (=> res!252832 e!221943)))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!308201 (= res!252832 (bvsgt i!932 toSlice!46))))

(declare-fun mapIsEmpty!2658 () Bool)

(assert (=> mapIsEmpty!2658 mapRes!2657))

(declare-fun b!308202 () Bool)

(assert (=> b!308202 (= e!221943 (arrayRangesEq!1721 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun mapNonEmpty!2657 () Bool)

(declare-fun tp!2657 () Bool)

(assert (=> mapNonEmpty!2657 (= mapRes!2657 (and tp!2657 tp_is_empty!831))))

(declare-fun mapRest!2657 () (Array (_ BitVec 32) T!57797))

(declare-fun mapValue!2658 () T!57797)

(declare-fun mapKey!2657 () (_ BitVec 32))

(assert (=> mapNonEmpty!2657 (= (arr!9185 a2!524) (store mapRest!2657 mapKey!2657 mapValue!2658))))

(declare-fun res!252836 () Bool)

(assert (=> start!68550 (=> (not res!252836) (not e!221944))))

(declare-fun from!650 () (_ BitVec 32))

(assert (=> start!68550 (= res!252836 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8102 a1!524) (size!8102 a2!524)) (bvsle to!617 (size!8102 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68550 e!221944))

(assert (=> start!68550 true))

(declare-fun array_inv!7699 (array!18695) Bool)

(assert (=> start!68550 (and (array_inv!7699 a2!524) e!221946)))

(assert (=> start!68550 (and (array_inv!7699 a1!524) e!221945)))

(declare-fun b!308203 () Bool)

(assert (=> b!308203 (= e!221944 (not true))))

(assert (=> b!308203 (= (select (arr!9185 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9185 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21453 0))(
  ( (Unit!21454) )
))
(declare-fun lt!440274 () Unit!21453)

(declare-fun arrayRangesEqImpliesEq!299 (array!18695 array!18695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21453)

(assert (=> b!308203 (= lt!440274 (arrayRangesEqImpliesEq!299 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!308204 () Bool)

(declare-fun res!252834 () Bool)

(assert (=> b!308204 (=> (not res!252834) (not e!221944))))

(assert (=> b!308204 (= res!252834 (arrayRangesEq!1721 a1!524 a2!524 from!650 to!617))))

(assert (= (and start!68550 res!252836) b!308204))

(assert (= (and b!308204 res!252834) b!308198))

(assert (= (and b!308198 res!252830) b!308200))

(assert (= (and b!308200 res!252833) b!308201))

(assert (= (and b!308201 (not res!252832)) b!308202))

(assert (= (and b!308201 res!252835) b!308196))

(assert (= (and b!308196 res!252831) b!308203))

(assert (= (and b!308199 condMapEmpty!2657) mapIsEmpty!2658))

(assert (= (and b!308199 (not condMapEmpty!2657)) mapNonEmpty!2657))

(assert (= start!68550 b!308199))

(assert (= (and b!308197 condMapEmpty!2658) mapIsEmpty!2657))

(assert (= (and b!308197 (not condMapEmpty!2658)) mapNonEmpty!2658))

(assert (= start!68550 b!308197))

(declare-fun m!446561 () Bool)

(assert (=> start!68550 m!446561))

(declare-fun m!446563 () Bool)

(assert (=> start!68550 m!446563))

(declare-fun m!446565 () Bool)

(assert (=> b!308202 m!446565))

(declare-fun m!446567 () Bool)

(assert (=> b!308204 m!446567))

(declare-fun m!446569 () Bool)

(assert (=> mapNonEmpty!2657 m!446569))

(declare-fun m!446571 () Bool)

(assert (=> b!308200 m!446571))

(declare-fun m!446573 () Bool)

(assert (=> b!308203 m!446573))

(declare-fun m!446575 () Bool)

(assert (=> b!308203 m!446575))

(declare-fun m!446577 () Bool)

(assert (=> b!308203 m!446577))

(declare-fun m!446579 () Bool)

(assert (=> mapNonEmpty!2658 m!446579))

(check-sat (not start!68550) (not b!308200) (not mapNonEmpty!2657) (not b!308204) tp_is_empty!831 (not b!308203) (not b!308202) (not mapNonEmpty!2658))
(check-sat)
