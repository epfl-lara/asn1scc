; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64236 () Bool)

(assert start!64236)

(declare-fun mapNonEmpty!2127 () Bool)

(declare-fun mapRes!2127 () Bool)

(declare-fun tp!2127 () Bool)

(declare-fun tp_is_empty!657 () Bool)

(assert (=> mapNonEmpty!2127 (= mapRes!2127 (and tp!2127 tp_is_empty!657))))

(declare-datatypes ((T!52323 0))(
  ( (T!52324 (val!328 Int)) )
))
(declare-datatypes ((array!16939 0))(
  ( (array!16940 (arr!8315 (Array (_ BitVec 32) T!52323)) (size!7319 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16939)

(declare-fun mapKey!2127 () (_ BitVec 32))

(declare-fun mapValue!2127 () T!52323)

(declare-fun mapRest!2128 () (Array (_ BitVec 32) T!52323))

(assert (=> mapNonEmpty!2127 (= (arr!8315 a1!596) (store mapRest!2128 mapKey!2127 mapValue!2127))))

(declare-fun b!287778 () Bool)

(declare-fun e!204815 () Bool)

(assert (=> b!287778 (= e!204815 (not true))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun a2!596 () array!16939)

(assert (=> b!287778 (= (select (arr!8315 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8315 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun from!722 () (_ BitVec 32))

(declare-datatypes ((Unit!19983 0))(
  ( (Unit!19984) )
))
(declare-fun lt!418770 () Unit!19983)

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEqImpliesEq!199 (array!16939 array!16939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19983)

(assert (=> b!287778 (= lt!418770 (arrayRangesEqImpliesEq!199 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun mapIsEmpty!2127 () Bool)

(declare-fun mapRes!2128 () Bool)

(assert (=> mapIsEmpty!2127 mapRes!2128))

(declare-fun b!287779 () Bool)

(declare-fun e!204814 () Bool)

(assert (=> b!287779 (= e!204814 (and tp_is_empty!657 mapRes!2127))))

(declare-fun condMapEmpty!2128 () Bool)

(declare-fun mapDefault!2127 () T!52323)

(assert (=> b!287779 (= condMapEmpty!2128 (= (arr!8315 a1!596) ((as const (Array (_ BitVec 32) T!52323)) mapDefault!2127)))))

(declare-fun b!287780 () Bool)

(declare-fun res!237926 () Bool)

(assert (=> b!287780 (=> (not res!237926) (not e!204815))))

(declare-fun arrayRangesEq!1437 (array!16939 array!16939 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287780 (= res!237926 (arrayRangesEq!1437 a1!596 a2!596 from!722 to!689))))

(declare-fun b!287781 () Bool)

(declare-fun res!237927 () Bool)

(assert (=> b!287781 (=> (not res!237927) (not e!204815))))

(assert (=> b!287781 (= res!237927 (not (= i!953 from!722)))))

(declare-fun res!237924 () Bool)

(assert (=> start!64236 (=> (not res!237924) (not e!204815))))

(assert (=> start!64236 (= res!237924 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7319 a1!596) (size!7319 a2!596)) (bvslt to!689 (size!7319 a1!596))))))

(assert (=> start!64236 e!204815))

(declare-fun array_inv!6951 (array!16939) Bool)

(assert (=> start!64236 (and (array_inv!6951 a1!596) e!204814)))

(declare-fun e!204813 () Bool)

(assert (=> start!64236 (and (array_inv!6951 a2!596) e!204813)))

(assert (=> start!64236 true))

(declare-fun mapNonEmpty!2128 () Bool)

(declare-fun tp!2128 () Bool)

(assert (=> mapNonEmpty!2128 (= mapRes!2128 (and tp!2128 tp_is_empty!657))))

(declare-fun mapValue!2128 () T!52323)

(declare-fun mapKey!2128 () (_ BitVec 32))

(declare-fun mapRest!2127 () (Array (_ BitVec 32) T!52323))

(assert (=> mapNonEmpty!2128 (= (arr!8315 a2!596) (store mapRest!2127 mapKey!2128 mapValue!2128))))

(declare-fun b!287782 () Bool)

(declare-fun res!237925 () Bool)

(assert (=> b!287782 (=> (not res!237925) (not e!204815))))

(assert (=> b!287782 (= res!237925 (arrayRangesEq!1437 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!287783 () Bool)

(assert (=> b!287783 (= e!204813 (and tp_is_empty!657 mapRes!2128))))

(declare-fun condMapEmpty!2127 () Bool)

(declare-fun mapDefault!2128 () T!52323)

(assert (=> b!287783 (= condMapEmpty!2127 (= (arr!8315 a2!596) ((as const (Array (_ BitVec 32) T!52323)) mapDefault!2128)))))

(declare-fun mapIsEmpty!2128 () Bool)

(assert (=> mapIsEmpty!2128 mapRes!2127))

(declare-fun b!287784 () Bool)

(declare-fun res!237928 () Bool)

(assert (=> b!287784 (=> (not res!237928) (not e!204815))))

(assert (=> b!287784 (= res!237928 (and (= (select (arr!8315 a1!596) to!689) (select (arr!8315 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(assert (= (and start!64236 res!237924) b!287780))

(assert (= (and b!287780 res!237926) b!287784))

(assert (= (and b!287784 res!237928) b!287782))

(assert (= (and b!287782 res!237925) b!287781))

(assert (= (and b!287781 res!237927) b!287778))

(assert (= (and b!287779 condMapEmpty!2128) mapIsEmpty!2128))

(assert (= (and b!287779 (not condMapEmpty!2128)) mapNonEmpty!2127))

(assert (= start!64236 b!287779))

(assert (= (and b!287783 condMapEmpty!2127) mapIsEmpty!2127))

(assert (= (and b!287783 (not condMapEmpty!2127)) mapNonEmpty!2128))

(assert (= start!64236 b!287783))

(declare-fun m!420479 () Bool)

(assert (=> b!287780 m!420479))

(declare-fun m!420481 () Bool)

(assert (=> b!287784 m!420481))

(declare-fun m!420483 () Bool)

(assert (=> b!287784 m!420483))

(declare-fun m!420485 () Bool)

(assert (=> start!64236 m!420485))

(declare-fun m!420487 () Bool)

(assert (=> start!64236 m!420487))

(declare-fun m!420489 () Bool)

(assert (=> mapNonEmpty!2127 m!420489))

(declare-fun m!420491 () Bool)

(assert (=> b!287778 m!420491))

(declare-fun m!420493 () Bool)

(assert (=> b!287778 m!420493))

(declare-fun m!420495 () Bool)

(assert (=> b!287778 m!420495))

(declare-fun m!420497 () Bool)

(assert (=> b!287782 m!420497))

(declare-fun m!420499 () Bool)

(assert (=> mapNonEmpty!2128 m!420499))

(check-sat (not b!287780) (not b!287782) (not mapNonEmpty!2127) (not start!64236) (not b!287778) (not mapNonEmpty!2128) tp_is_empty!657)
(check-sat)
