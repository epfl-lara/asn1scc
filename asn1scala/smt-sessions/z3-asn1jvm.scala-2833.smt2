; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68514 () Bool)

(assert start!68514)

(declare-fun b!307831 () Bool)

(declare-fun e!221754 () Bool)

(declare-fun toSlice!41 () (_ BitVec 32))

(declare-datatypes ((T!57641 0))(
  ( (T!57642 (val!397 Int)) )
))
(declare-datatypes ((array!18659 0))(
  ( (array!18660 (arr!9167 (Array (_ BitVec 32) T!57641)) (size!8084 (_ BitVec 32))) )
))
(declare-fun a1!506 () array!18659)

(declare-fun to!599 () (_ BitVec 32))

(declare-fun a2!506 () array!18659)

(declare-fun arrayRangesEq!1707 (array!18659 array!18659 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!307831 (= e!221754 (arrayRangesEq!1707 a1!506 a2!506 to!599 toSlice!41))))

(declare-fun b!307832 () Bool)

(declare-fun res!252578 () Bool)

(declare-fun e!221757 () Bool)

(assert (=> b!307832 (=> (not res!252578) (not e!221757))))

(declare-fun from!632 () (_ BitVec 32))

(assert (=> b!307832 (= res!252578 (arrayRangesEq!1707 a1!506 a2!506 from!632 to!599))))

(declare-fun mapIsEmpty!2549 () Bool)

(declare-fun mapRes!2549 () Bool)

(assert (=> mapIsEmpty!2549 mapRes!2549))

(declare-fun b!307833 () Bool)

(assert (=> b!307833 (= e!221757 (not true))))

(declare-fun fromSlice!41 () (_ BitVec 32))

(assert (=> b!307833 (arrayRangesEq!1707 a1!506 a2!506 fromSlice!41 toSlice!41)))

(declare-datatypes ((Unit!21447 0))(
  ( (Unit!21448) )
))
(declare-fun lt!440265 () Unit!21447)

(declare-fun rec!93 (array!18659 array!18659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21447)

(assert (=> b!307833 (= lt!440265 (rec!93 a1!506 a2!506 from!632 fromSlice!41 to!599 toSlice!41 to!599))))

(declare-fun b!307834 () Bool)

(declare-fun res!252577 () Bool)

(assert (=> b!307834 (=> (not res!252577) (not e!221757))))

(assert (=> b!307834 (= res!252577 e!221754)))

(declare-fun res!252576 () Bool)

(assert (=> b!307834 (=> res!252576 e!221754)))

(assert (=> b!307834 (= res!252576 (bvsgt to!599 toSlice!41))))

(declare-fun mapNonEmpty!2549 () Bool)

(declare-fun tp!2549 () Bool)

(declare-fun tp_is_empty!795 () Bool)

(assert (=> mapNonEmpty!2549 (= mapRes!2549 (and tp!2549 tp_is_empty!795))))

(declare-fun mapValue!2549 () T!57641)

(declare-fun mapKey!2550 () (_ BitVec 32))

(declare-fun mapRest!2549 () (Array (_ BitVec 32) T!57641))

(assert (=> mapNonEmpty!2549 (= (arr!9167 a2!506) (store mapRest!2549 mapKey!2550 mapValue!2549))))

(declare-fun res!252573 () Bool)

(assert (=> start!68514 (=> (not res!252573) (not e!221757))))

(assert (=> start!68514 (= res!252573 (and (bvsle #b00000000000000000000000000000000 from!632) (bvsle from!632 to!599) (bvsle (size!8084 a1!506) (size!8084 a2!506)) (bvsle to!599 (size!8084 a1!506)) (bvsle from!632 fromSlice!41) (bvsle fromSlice!41 toSlice!41) (bvsle toSlice!41 to!599)))))

(assert (=> start!68514 e!221757))

(assert (=> start!68514 true))

(declare-fun e!221756 () Bool)

(declare-fun array_inv!7689 (array!18659) Bool)

(assert (=> start!68514 (and (array_inv!7689 a1!506) e!221756)))

(declare-fun e!221755 () Bool)

(assert (=> start!68514 (and (array_inv!7689 a2!506) e!221755)))

(declare-fun b!307835 () Bool)

(declare-fun res!252575 () Bool)

(assert (=> b!307835 (=> (not res!252575) (not e!221757))))

(assert (=> b!307835 (= res!252575 (bvsle fromSlice!41 to!599))))

(declare-fun b!307836 () Bool)

(declare-fun res!252574 () Bool)

(assert (=> b!307836 (=> (not res!252574) (not e!221757))))

(assert (=> b!307836 (= res!252574 (arrayRangesEq!1707 a1!506 a2!506 to!599 to!599))))

(declare-fun mapIsEmpty!2550 () Bool)

(declare-fun mapRes!2550 () Bool)

(assert (=> mapIsEmpty!2550 mapRes!2550))

(declare-fun b!307837 () Bool)

(assert (=> b!307837 (= e!221756 (and tp_is_empty!795 mapRes!2550))))

(declare-fun condMapEmpty!2549 () Bool)

(declare-fun mapDefault!2550 () T!57641)

(assert (=> b!307837 (= condMapEmpty!2549 (= (arr!9167 a1!506) ((as const (Array (_ BitVec 32) T!57641)) mapDefault!2550)))))

(declare-fun mapNonEmpty!2550 () Bool)

(declare-fun tp!2550 () Bool)

(assert (=> mapNonEmpty!2550 (= mapRes!2550 (and tp!2550 tp_is_empty!795))))

(declare-fun mapKey!2549 () (_ BitVec 32))

(declare-fun mapRest!2550 () (Array (_ BitVec 32) T!57641))

(declare-fun mapValue!2550 () T!57641)

(assert (=> mapNonEmpty!2550 (= (arr!9167 a1!506) (store mapRest!2550 mapKey!2549 mapValue!2550))))

(declare-fun b!307838 () Bool)

(assert (=> b!307838 (= e!221755 (and tp_is_empty!795 mapRes!2549))))

(declare-fun condMapEmpty!2550 () Bool)

(declare-fun mapDefault!2549 () T!57641)

(assert (=> b!307838 (= condMapEmpty!2550 (= (arr!9167 a2!506) ((as const (Array (_ BitVec 32) T!57641)) mapDefault!2549)))))

(assert (= (and start!68514 res!252573) b!307832))

(assert (= (and b!307832 res!252578) b!307835))

(assert (= (and b!307835 res!252575) b!307836))

(assert (= (and b!307836 res!252574) b!307834))

(assert (= (and b!307834 (not res!252576)) b!307831))

(assert (= (and b!307834 res!252577) b!307833))

(assert (= (and b!307837 condMapEmpty!2549) mapIsEmpty!2550))

(assert (= (and b!307837 (not condMapEmpty!2549)) mapNonEmpty!2550))

(assert (= start!68514 b!307837))

(assert (= (and b!307838 condMapEmpty!2550) mapIsEmpty!2549))

(assert (= (and b!307838 (not condMapEmpty!2550)) mapNonEmpty!2549))

(assert (= start!68514 b!307838))

(declare-fun m!446319 () Bool)

(assert (=> start!68514 m!446319))

(declare-fun m!446321 () Bool)

(assert (=> start!68514 m!446321))

(declare-fun m!446323 () Bool)

(assert (=> b!307831 m!446323))

(declare-fun m!446325 () Bool)

(assert (=> b!307833 m!446325))

(declare-fun m!446327 () Bool)

(assert (=> b!307833 m!446327))

(declare-fun m!446329 () Bool)

(assert (=> b!307836 m!446329))

(declare-fun m!446331 () Bool)

(assert (=> mapNonEmpty!2549 m!446331))

(declare-fun m!446333 () Bool)

(assert (=> b!307832 m!446333))

(declare-fun m!446335 () Bool)

(assert (=> mapNonEmpty!2550 m!446335))

(check-sat (not b!307832) tp_is_empty!795 (not mapNonEmpty!2550) (not b!307833) (not mapNonEmpty!2549) (not start!68514) (not b!307836) (not b!307831))
(check-sat)
