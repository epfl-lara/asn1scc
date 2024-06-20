; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68568 () Bool)

(assert start!68568)

(declare-fun b!308459 () Bool)

(declare-fun e!222066 () Bool)

(declare-fun tp_is_empty!849 () Bool)

(declare-fun mapRes!2712 () Bool)

(assert (=> b!308459 (= e!222066 (and tp_is_empty!849 mapRes!2712))))

(declare-fun condMapEmpty!2711 () Bool)

(declare-datatypes ((T!57875 0))(
  ( (T!57876 (val!424 Int)) )
))
(declare-datatypes ((array!18713 0))(
  ( (array!18714 (arr!9194 (Array (_ BitVec 32) T!57875)) (size!8111 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18713)

(declare-fun mapDefault!2711 () T!57875)

(assert (=> b!308459 (= condMapEmpty!2711 (= (arr!9194 a2!524) ((as const (Array (_ BitVec 32) T!57875)) mapDefault!2711)))))

(declare-fun b!308460 () Bool)

(declare-fun e!222065 () Bool)

(declare-fun e!222064 () Bool)

(assert (=> b!308460 (= e!222065 (not e!222064))))

(declare-fun res!253039 () Bool)

(assert (=> b!308460 (=> res!253039 e!222064)))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!308460 (= res!253039 (or (bvsgt fromSlice!46 (bvsub i!932 #b00000000000000000000000000000001)) (bvsgt (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun a1!524 () array!18713)

(assert (=> b!308460 (= (select (arr!9194 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9194 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21463 0))(
  ( (Unit!21464) )
))
(declare-fun lt!440307 () Unit!21463)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun arrayRangesEqImpliesEq!304 (array!18713 array!18713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21463)

(assert (=> b!308460 (= lt!440307 (arrayRangesEqImpliesEq!304 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!308461 () Bool)

(declare-fun res!253048 () Bool)

(assert (=> b!308461 (=> (not res!253048) (not e!222065))))

(assert (=> b!308461 (= res!253048 (not (= i!932 fromSlice!46)))))

(declare-fun b!308462 () Bool)

(assert (=> b!308462 (= e!222064 (bvsle #b00000000000000000000000000000000 fromSlice!46))))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun arrayRangesEq!1728 (array!18713 array!18713 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308462 (arrayRangesEq!1728 a1!524 a2!524 fromSlice!46 toSlice!46)))

(declare-fun lt!440306 () Unit!21463)

(declare-fun rec!96 (array!18713 array!18713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21463)

(assert (=> b!308462 (= lt!440306 (rec!96 a1!524 a2!524 from!650 fromSlice!46 to!617 toSlice!46 (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun b!308463 () Bool)

(declare-fun res!253043 () Bool)

(assert (=> b!308463 (=> (not res!253043) (not e!222065))))

(declare-fun e!222063 () Bool)

(assert (=> b!308463 (= res!253043 e!222063)))

(declare-fun res!253049 () Bool)

(assert (=> b!308463 (=> res!253049 e!222063)))

(assert (=> b!308463 (= res!253049 (bvsgt i!932 toSlice!46))))

(declare-fun mapIsEmpty!2711 () Bool)

(declare-fun mapRes!2711 () Bool)

(assert (=> mapIsEmpty!2711 mapRes!2711))

(declare-fun b!308464 () Bool)

(assert (=> b!308464 (= e!222063 (arrayRangesEq!1728 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun mapNonEmpty!2711 () Bool)

(declare-fun tp!2711 () Bool)

(assert (=> mapNonEmpty!2711 (= mapRes!2712 (and tp!2711 tp_is_empty!849))))

(declare-fun mapKey!2711 () (_ BitVec 32))

(declare-fun mapValue!2712 () T!57875)

(declare-fun mapRest!2711 () (Array (_ BitVec 32) T!57875))

(assert (=> mapNonEmpty!2711 (= (arr!9194 a2!524) (store mapRest!2711 mapKey!2711 mapValue!2712))))

(declare-fun b!308465 () Bool)

(declare-fun res!253042 () Bool)

(assert (=> b!308465 (=> res!253042 e!222064)))

(assert (=> b!308465 (= res!253042 (not (arrayRangesEq!1728 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) to!617)))))

(declare-fun res!253047 () Bool)

(assert (=> start!68568 (=> (not res!253047) (not e!222065))))

(assert (=> start!68568 (= res!253047 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8111 a1!524) (size!8111 a2!524)) (bvsle to!617 (size!8111 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68568 e!222065))

(assert (=> start!68568 true))

(declare-fun array_inv!7703 (array!18713) Bool)

(assert (=> start!68568 (and (array_inv!7703 a2!524) e!222066)))

(declare-fun e!222061 () Bool)

(assert (=> start!68568 (and (array_inv!7703 a1!524) e!222061)))

(declare-fun e!222062 () Bool)

(declare-fun b!308466 () Bool)

(assert (=> b!308466 (= e!222062 (not (arrayRangesEq!1728 a1!524 a2!524 (bvsub i!932 #b00000000000000000000000000000001) toSlice!46)))))

(declare-fun b!308467 () Bool)

(declare-fun res!253046 () Bool)

(assert (=> b!308467 (=> (not res!253046) (not e!222065))))

(assert (=> b!308467 (= res!253046 (arrayRangesEq!1728 a1!524 a2!524 from!650 to!617))))

(declare-fun mapNonEmpty!2712 () Bool)

(declare-fun tp!2712 () Bool)

(assert (=> mapNonEmpty!2712 (= mapRes!2711 (and tp!2712 tp_is_empty!849))))

(declare-fun mapValue!2711 () T!57875)

(declare-fun mapKey!2712 () (_ BitVec 32))

(declare-fun mapRest!2712 () (Array (_ BitVec 32) T!57875))

(assert (=> mapNonEmpty!2712 (= (arr!9194 a1!524) (store mapRest!2712 mapKey!2712 mapValue!2711))))

(declare-fun b!308468 () Bool)

(declare-fun res!253041 () Bool)

(assert (=> b!308468 (=> res!253041 e!222064)))

(assert (=> b!308468 (= res!253041 e!222062)))

(declare-fun res!253044 () Bool)

(assert (=> b!308468 (=> (not res!253044) (not e!222062))))

(assert (=> b!308468 (= res!253044 (bvsle (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun b!308469 () Bool)

(declare-fun res!253040 () Bool)

(assert (=> b!308469 (=> (not res!253040) (not e!222065))))

(assert (=> b!308469 (= res!253040 (arrayRangesEq!1728 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308470 () Bool)

(assert (=> b!308470 (= e!222061 (and tp_is_empty!849 mapRes!2711))))

(declare-fun condMapEmpty!2712 () Bool)

(declare-fun mapDefault!2712 () T!57875)

(assert (=> b!308470 (= condMapEmpty!2712 (= (arr!9194 a1!524) ((as const (Array (_ BitVec 32) T!57875)) mapDefault!2712)))))

(declare-fun b!308471 () Bool)

(declare-fun res!253045 () Bool)

(assert (=> b!308471 (=> (not res!253045) (not e!222065))))

(assert (=> b!308471 (= res!253045 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapIsEmpty!2712 () Bool)

(assert (=> mapIsEmpty!2712 mapRes!2712))

(assert (= (and start!68568 res!253047) b!308467))

(assert (= (and b!308467 res!253046) b!308471))

(assert (= (and b!308471 res!253045) b!308469))

(assert (= (and b!308469 res!253040) b!308463))

(assert (= (and b!308463 (not res!253049)) b!308464))

(assert (= (and b!308463 res!253043) b!308461))

(assert (= (and b!308461 res!253048) b!308460))

(assert (= (and b!308460 (not res!253039)) b!308465))

(assert (= (and b!308465 (not res!253042)) b!308468))

(assert (= (and b!308468 res!253044) b!308466))

(assert (= (and b!308468 (not res!253041)) b!308462))

(assert (= (and b!308459 condMapEmpty!2711) mapIsEmpty!2712))

(assert (= (and b!308459 (not condMapEmpty!2711)) mapNonEmpty!2711))

(assert (= start!68568 b!308459))

(assert (= (and b!308470 condMapEmpty!2712) mapIsEmpty!2711))

(assert (= (and b!308470 (not condMapEmpty!2712)) mapNonEmpty!2712))

(assert (= start!68568 b!308470))

(declare-fun m!446749 () Bool)

(assert (=> b!308469 m!446749))

(declare-fun m!446751 () Bool)

(assert (=> b!308464 m!446751))

(declare-fun m!446753 () Bool)

(assert (=> b!308462 m!446753))

(declare-fun m!446755 () Bool)

(assert (=> b!308462 m!446755))

(declare-fun m!446757 () Bool)

(assert (=> mapNonEmpty!2712 m!446757))

(declare-fun m!446759 () Bool)

(assert (=> mapNonEmpty!2711 m!446759))

(declare-fun m!446761 () Bool)

(assert (=> b!308466 m!446761))

(declare-fun m!446763 () Bool)

(assert (=> b!308465 m!446763))

(declare-fun m!446765 () Bool)

(assert (=> start!68568 m!446765))

(declare-fun m!446767 () Bool)

(assert (=> start!68568 m!446767))

(declare-fun m!446769 () Bool)

(assert (=> b!308467 m!446769))

(declare-fun m!446771 () Bool)

(assert (=> b!308460 m!446771))

(declare-fun m!446773 () Bool)

(assert (=> b!308460 m!446773))

(declare-fun m!446775 () Bool)

(assert (=> b!308460 m!446775))

(check-sat (not b!308460) (not b!308462) (not b!308465) (not b!308464) (not b!308467) (not start!68568) (not mapNonEmpty!2711) (not mapNonEmpty!2712) tp_is_empty!849 (not b!308469) (not b!308466))
(check-sat)
