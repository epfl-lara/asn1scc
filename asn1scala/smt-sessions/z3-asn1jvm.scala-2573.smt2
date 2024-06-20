; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64230 () Bool)

(assert start!64230)

(declare-fun mapNonEmpty!2109 () Bool)

(declare-fun mapRes!2110 () Bool)

(declare-fun tp!2110 () Bool)

(declare-fun tp_is_empty!651 () Bool)

(assert (=> mapNonEmpty!2109 (= mapRes!2110 (and tp!2110 tp_is_empty!651))))

(declare-datatypes ((T!52297 0))(
  ( (T!52298 (val!325 Int)) )
))
(declare-datatypes ((array!16933 0))(
  ( (array!16934 (arr!8312 (Array (_ BitVec 32) T!52297)) (size!7316 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16933)

(declare-fun mapRest!2109 () (Array (_ BitVec 32) T!52297))

(declare-fun mapKey!2109 () (_ BitVec 32))

(declare-fun mapValue!2110 () T!52297)

(assert (=> mapNonEmpty!2109 (= (arr!8312 a2!596) (store mapRest!2109 mapKey!2109 mapValue!2110))))

(declare-fun b!287715 () Bool)

(declare-fun res!237881 () Bool)

(declare-fun e!204788 () Bool)

(assert (=> b!287715 (=> (not res!237881) (not e!204788))))

(declare-fun a1!596 () array!16933)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1435 (array!16933 array!16933 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287715 (= res!237881 (arrayRangesEq!1435 a1!596 a2!596 from!722 to!689))))

(declare-fun mapNonEmpty!2110 () Bool)

(declare-fun mapRes!2109 () Bool)

(declare-fun tp!2109 () Bool)

(assert (=> mapNonEmpty!2110 (= mapRes!2109 (and tp!2109 tp_is_empty!651))))

(declare-fun mapValue!2109 () T!52297)

(declare-fun mapKey!2110 () (_ BitVec 32))

(declare-fun mapRest!2110 () (Array (_ BitVec 32) T!52297))

(assert (=> mapNonEmpty!2110 (= (arr!8312 a1!596) (store mapRest!2110 mapKey!2110 mapValue!2109))))

(declare-fun b!287716 () Bool)

(declare-fun res!237879 () Bool)

(assert (=> b!287716 (=> (not res!237879) (not e!204788))))

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!287716 (= res!237879 (not (= i!953 from!722)))))

(declare-fun mapIsEmpty!2109 () Bool)

(assert (=> mapIsEmpty!2109 mapRes!2109))

(declare-fun res!237883 () Bool)

(assert (=> start!64230 (=> (not res!237883) (not e!204788))))

(assert (=> start!64230 (= res!237883 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7316 a1!596) (size!7316 a2!596)) (bvslt to!689 (size!7316 a1!596))))))

(assert (=> start!64230 e!204788))

(declare-fun e!204787 () Bool)

(declare-fun array_inv!6950 (array!16933) Bool)

(assert (=> start!64230 (and (array_inv!6950 a1!596) e!204787)))

(declare-fun e!204786 () Bool)

(assert (=> start!64230 (and (array_inv!6950 a2!596) e!204786)))

(assert (=> start!64230 true))

(declare-fun b!287717 () Bool)

(assert (=> b!287717 (= e!204786 (and tp_is_empty!651 mapRes!2110))))

(declare-fun condMapEmpty!2110 () Bool)

(declare-fun mapDefault!2109 () T!52297)

(assert (=> b!287717 (= condMapEmpty!2110 (= (arr!8312 a2!596) ((as const (Array (_ BitVec 32) T!52297)) mapDefault!2109)))))

(declare-fun b!287718 () Bool)

(declare-fun res!237882 () Bool)

(assert (=> b!287718 (=> (not res!237882) (not e!204788))))

(assert (=> b!287718 (= res!237882 (arrayRangesEq!1435 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapIsEmpty!2110 () Bool)

(assert (=> mapIsEmpty!2110 mapRes!2110))

(declare-fun b!287719 () Bool)

(assert (=> b!287719 (= e!204787 (and tp_is_empty!651 mapRes!2109))))

(declare-fun condMapEmpty!2109 () Bool)

(declare-fun mapDefault!2110 () T!52297)

(assert (=> b!287719 (= condMapEmpty!2109 (= (arr!8312 a1!596) ((as const (Array (_ BitVec 32) T!52297)) mapDefault!2110)))))

(declare-fun b!287720 () Bool)

(declare-fun res!237880 () Bool)

(assert (=> b!287720 (=> (not res!237880) (not e!204788))))

(assert (=> b!287720 (= res!237880 (and (= (select (arr!8312 a1!596) to!689) (select (arr!8312 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!287721 () Bool)

(assert (=> b!287721 (= e!204788 (not true))))

(assert (=> b!287721 (= (select (arr!8312 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8312 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19981 0))(
  ( (Unit!19982) )
))
(declare-fun lt!418761 () Unit!19981)

(declare-fun arrayRangesEqImpliesEq!198 (array!16933 array!16933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19981)

(assert (=> b!287721 (= lt!418761 (arrayRangesEqImpliesEq!198 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(assert (= (and start!64230 res!237883) b!287715))

(assert (= (and b!287715 res!237881) b!287720))

(assert (= (and b!287720 res!237880) b!287718))

(assert (= (and b!287718 res!237882) b!287716))

(assert (= (and b!287716 res!237879) b!287721))

(assert (= (and b!287719 condMapEmpty!2109) mapIsEmpty!2109))

(assert (= (and b!287719 (not condMapEmpty!2109)) mapNonEmpty!2110))

(assert (= start!64230 b!287719))

(assert (= (and b!287717 condMapEmpty!2110) mapIsEmpty!2110))

(assert (= (and b!287717 (not condMapEmpty!2110)) mapNonEmpty!2109))

(assert (= start!64230 b!287717))

(declare-fun m!420413 () Bool)

(assert (=> b!287721 m!420413))

(declare-fun m!420415 () Bool)

(assert (=> b!287721 m!420415))

(declare-fun m!420417 () Bool)

(assert (=> b!287721 m!420417))

(declare-fun m!420419 () Bool)

(assert (=> b!287718 m!420419))

(declare-fun m!420421 () Bool)

(assert (=> start!64230 m!420421))

(declare-fun m!420423 () Bool)

(assert (=> start!64230 m!420423))

(declare-fun m!420425 () Bool)

(assert (=> mapNonEmpty!2109 m!420425))

(declare-fun m!420427 () Bool)

(assert (=> mapNonEmpty!2110 m!420427))

(declare-fun m!420429 () Bool)

(assert (=> b!287715 m!420429))

(declare-fun m!420431 () Bool)

(assert (=> b!287720 m!420431))

(declare-fun m!420433 () Bool)

(assert (=> b!287720 m!420433))

(check-sat (not b!287715) (not mapNonEmpty!2110) (not b!287718) (not b!287721) (not start!64230) tp_is_empty!651 (not mapNonEmpty!2109))
(check-sat)
