; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68562 () Bool)

(assert start!68562)

(declare-fun mapNonEmpty!2693 () Bool)

(declare-fun mapRes!2694 () Bool)

(declare-fun tp!2693 () Bool)

(declare-fun tp_is_empty!843 () Bool)

(assert (=> mapNonEmpty!2693 (= mapRes!2694 (and tp!2693 tp_is_empty!843))))

(declare-datatypes ((T!57849 0))(
  ( (T!57850 (val!421 Int)) )
))
(declare-fun mapValue!2694 () T!57849)

(declare-fun mapKey!2694 () (_ BitVec 32))

(declare-datatypes ((array!18707 0))(
  ( (array!18708 (arr!9191 (Array (_ BitVec 32) T!57849)) (size!8108 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18707)

(declare-fun mapRest!2694 () (Array (_ BitVec 32) T!57849))

(assert (=> mapNonEmpty!2693 (= (arr!9191 a1!524) (store mapRest!2694 mapKey!2694 mapValue!2694))))

(declare-fun b!308358 () Bool)

(declare-fun res!252961 () Bool)

(declare-fun e!222017 () Bool)

(assert (=> b!308358 (=> (not res!252961) (not e!222017))))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!308358 (= res!252961 (not (= i!932 fromSlice!46)))))

(declare-fun mapIsEmpty!2693 () Bool)

(assert (=> mapIsEmpty!2693 mapRes!2694))

(declare-fun mapIsEmpty!2694 () Bool)

(declare-fun mapRes!2693 () Bool)

(assert (=> mapIsEmpty!2694 mapRes!2693))

(declare-fun b!308359 () Bool)

(declare-fun res!252957 () Bool)

(assert (=> b!308359 (=> (not res!252957) (not e!222017))))

(declare-fun a2!524 () array!18707)

(declare-fun to!617 () (_ BitVec 32))

(declare-fun arrayRangesEq!1726 (array!18707 array!18707 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308359 (= res!252957 (arrayRangesEq!1726 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308360 () Bool)

(assert (=> b!308360 (= e!222017 (not true))))

(assert (=> b!308360 (= (select (arr!9191 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9191 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21459 0))(
  ( (Unit!21460) )
))
(declare-fun lt!440292 () Unit!21459)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun arrayRangesEqImpliesEq!302 (array!18707 array!18707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21459)

(assert (=> b!308360 (= lt!440292 (arrayRangesEqImpliesEq!302 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!308361 () Bool)

(declare-fun res!252958 () Bool)

(assert (=> b!308361 (=> (not res!252958) (not e!222017))))

(declare-fun e!222015 () Bool)

(assert (=> b!308361 (= res!252958 e!222015)))

(declare-fun res!252960 () Bool)

(assert (=> b!308361 (=> res!252960 e!222015)))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!308361 (= res!252960 (bvsgt i!932 toSlice!46))))

(declare-fun b!308362 () Bool)

(assert (=> b!308362 (= e!222015 (arrayRangesEq!1726 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun mapNonEmpty!2694 () Bool)

(declare-fun tp!2694 () Bool)

(assert (=> mapNonEmpty!2694 (= mapRes!2693 (and tp!2694 tp_is_empty!843))))

(declare-fun mapKey!2693 () (_ BitVec 32))

(declare-fun mapRest!2693 () (Array (_ BitVec 32) T!57849))

(declare-fun mapValue!2693 () T!57849)

(assert (=> mapNonEmpty!2694 (= (arr!9191 a2!524) (store mapRest!2693 mapKey!2693 mapValue!2693))))

(declare-fun b!308363 () Bool)

(declare-fun e!222016 () Bool)

(assert (=> b!308363 (= e!222016 (and tp_is_empty!843 mapRes!2694))))

(declare-fun condMapEmpty!2694 () Bool)

(declare-fun mapDefault!2693 () T!57849)

(assert (=> b!308363 (= condMapEmpty!2694 (= (arr!9191 a1!524) ((as const (Array (_ BitVec 32) T!57849)) mapDefault!2693)))))

(declare-fun b!308364 () Bool)

(declare-fun res!252959 () Bool)

(assert (=> b!308364 (=> (not res!252959) (not e!222017))))

(assert (=> b!308364 (= res!252959 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun res!252956 () Bool)

(assert (=> start!68562 (=> (not res!252956) (not e!222017))))

(assert (=> start!68562 (= res!252956 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8108 a1!524) (size!8108 a2!524)) (bvsle to!617 (size!8108 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68562 e!222017))

(assert (=> start!68562 true))

(declare-fun e!222018 () Bool)

(declare-fun array_inv!7702 (array!18707) Bool)

(assert (=> start!68562 (and (array_inv!7702 a2!524) e!222018)))

(assert (=> start!68562 (and (array_inv!7702 a1!524) e!222016)))

(declare-fun b!308365 () Bool)

(assert (=> b!308365 (= e!222018 (and tp_is_empty!843 mapRes!2693))))

(declare-fun condMapEmpty!2693 () Bool)

(declare-fun mapDefault!2694 () T!57849)

(assert (=> b!308365 (= condMapEmpty!2693 (= (arr!9191 a2!524) ((as const (Array (_ BitVec 32) T!57849)) mapDefault!2694)))))

(declare-fun b!308366 () Bool)

(declare-fun res!252962 () Bool)

(assert (=> b!308366 (=> (not res!252962) (not e!222017))))

(assert (=> b!308366 (= res!252962 (arrayRangesEq!1726 a1!524 a2!524 from!650 to!617))))

(assert (= (and start!68562 res!252956) b!308366))

(assert (= (and b!308366 res!252962) b!308364))

(assert (= (and b!308364 res!252959) b!308359))

(assert (= (and b!308359 res!252957) b!308361))

(assert (= (and b!308361 (not res!252960)) b!308362))

(assert (= (and b!308361 res!252958) b!308358))

(assert (= (and b!308358 res!252961) b!308360))

(assert (= (and b!308365 condMapEmpty!2693) mapIsEmpty!2694))

(assert (= (and b!308365 (not condMapEmpty!2693)) mapNonEmpty!2694))

(assert (= start!68562 b!308365))

(assert (= (and b!308363 condMapEmpty!2694) mapIsEmpty!2693))

(assert (= (and b!308363 (not condMapEmpty!2694)) mapNonEmpty!2693))

(assert (= start!68562 b!308363))

(declare-fun m!446681 () Bool)

(assert (=> b!308366 m!446681))

(declare-fun m!446683 () Bool)

(assert (=> b!308362 m!446683))

(declare-fun m!446685 () Bool)

(assert (=> start!68562 m!446685))

(declare-fun m!446687 () Bool)

(assert (=> start!68562 m!446687))

(declare-fun m!446689 () Bool)

(assert (=> b!308360 m!446689))

(declare-fun m!446691 () Bool)

(assert (=> b!308360 m!446691))

(declare-fun m!446693 () Bool)

(assert (=> b!308360 m!446693))

(declare-fun m!446695 () Bool)

(assert (=> mapNonEmpty!2694 m!446695))

(declare-fun m!446697 () Bool)

(assert (=> mapNonEmpty!2693 m!446697))

(declare-fun m!446699 () Bool)

(assert (=> b!308359 m!446699))

(check-sat (not start!68562) (not b!308362) (not mapNonEmpty!2694) (not b!308360) tp_is_empty!843 (not mapNonEmpty!2693) (not b!308366) (not b!308359))
(check-sat)
