; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64212 () Bool)

(assert start!64212)

(declare-fun b!287566 () Bool)

(declare-fun e!204707 () Bool)

(declare-fun tp_is_empty!633 () Bool)

(declare-fun mapRes!2056 () Bool)

(assert (=> b!287566 (= e!204707 (and tp_is_empty!633 mapRes!2056))))

(declare-fun condMapEmpty!2056 () Bool)

(declare-datatypes ((T!52219 0))(
  ( (T!52220 (val!316 Int)) )
))
(declare-datatypes ((array!16915 0))(
  ( (array!16916 (arr!8303 (Array (_ BitVec 32) T!52219)) (size!7307 (_ BitVec 32))) )
))
(declare-fun a1!580 () array!16915)

(declare-fun mapDefault!2056 () T!52219)

(assert (=> b!287566 (= condMapEmpty!2056 (= (arr!8303 a1!580) ((as const (Array (_ BitVec 32) T!52219)) mapDefault!2056)))))

(declare-fun mapNonEmpty!2055 () Bool)

(declare-fun mapRes!2055 () Bool)

(declare-fun tp!2056 () Bool)

(assert (=> mapNonEmpty!2055 (= mapRes!2055 (and tp!2056 tp_is_empty!633))))

(declare-fun mapKey!2055 () (_ BitVec 32))

(declare-fun a2!580 () array!16915)

(declare-fun mapRest!2055 () (Array (_ BitVec 32) T!52219))

(declare-fun mapValue!2056 () T!52219)

(assert (=> mapNonEmpty!2055 (= (arr!8303 a2!580) (store mapRest!2055 mapKey!2055 mapValue!2056))))

(declare-fun b!287567 () Bool)

(declare-fun res!237787 () Bool)

(declare-fun e!204706 () Bool)

(assert (=> b!287567 (=> (not res!237787) (not e!204706))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-fun arrayRangesEq!1430 (array!16915 array!16915 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287567 (= res!237787 (arrayRangesEq!1430 a1!580 a2!580 from!706 to!673))))

(declare-fun mapIsEmpty!2055 () Bool)

(assert (=> mapIsEmpty!2055 mapRes!2056))

(declare-fun res!237786 () Bool)

(assert (=> start!64212 (=> (not res!237786) (not e!204706))))

(assert (=> start!64212 (= res!237786 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7307 a1!580) (size!7307 a2!580)) (bvslt to!673 (size!7307 a1!580))))))

(assert (=> start!64212 e!204706))

(assert (=> start!64212 true))

(declare-fun array_inv!6945 (array!16915) Bool)

(assert (=> start!64212 (and (array_inv!6945 a1!580) e!204707)))

(declare-fun e!204705 () Bool)

(assert (=> start!64212 (and (array_inv!6945 a2!580) e!204705)))

(declare-fun b!287568 () Bool)

(assert (=> b!287568 (= e!204705 (and tp_is_empty!633 mapRes!2055))))

(declare-fun condMapEmpty!2055 () Bool)

(declare-fun mapDefault!2055 () T!52219)

(assert (=> b!287568 (= condMapEmpty!2055 (= (arr!8303 a2!580) ((as const (Array (_ BitVec 32) T!52219)) mapDefault!2055)))))

(declare-fun mapNonEmpty!2056 () Bool)

(declare-fun tp!2055 () Bool)

(assert (=> mapNonEmpty!2056 (= mapRes!2056 (and tp!2055 tp_is_empty!633))))

(declare-fun mapKey!2056 () (_ BitVec 32))

(declare-fun mapRest!2056 () (Array (_ BitVec 32) T!52219))

(declare-fun mapValue!2055 () T!52219)

(assert (=> mapNonEmpty!2056 (= (arr!8303 a1!580) (store mapRest!2056 mapKey!2056 mapValue!2055))))

(declare-fun b!287569 () Bool)

(declare-fun res!237785 () Bool)

(assert (=> b!287569 (=> (not res!237785) (not e!204706))))

(assert (=> b!287569 (= res!237785 (arrayRangesEq!1430 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(declare-fun mapIsEmpty!2056 () Bool)

(assert (=> mapIsEmpty!2056 mapRes!2055))

(declare-fun b!287570 () Bool)

(declare-fun res!237784 () Bool)

(assert (=> b!287570 (=> (not res!237784) (not e!204706))))

(assert (=> b!287570 (= res!237784 (= (select (arr!8303 a1!580) to!673) (select (arr!8303 a2!580) to!673)))))

(declare-fun b!287571 () Bool)

(assert (=> b!287571 (= e!204706 (not true))))

(assert (=> b!287571 (arrayRangesEq!1430 a1!580 a2!580 from!706 (bvadd #b00000000000000000000000000000001 to!673))))

(declare-datatypes ((Unit!19977 0))(
  ( (Unit!19978) )
))
(declare-fun lt!418752 () Unit!19977)

(declare-fun rec!77 (array!16915 array!16915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19977)

(assert (=> b!287571 (= lt!418752 (rec!77 a1!580 a2!580 from!706 to!673 to!673))))

(assert (= (and start!64212 res!237786) b!287567))

(assert (= (and b!287567 res!237787) b!287570))

(assert (= (and b!287570 res!237784) b!287569))

(assert (= (and b!287569 res!237785) b!287571))

(assert (= (and b!287566 condMapEmpty!2056) mapIsEmpty!2055))

(assert (= (and b!287566 (not condMapEmpty!2056)) mapNonEmpty!2056))

(assert (= start!64212 b!287566))

(assert (= (and b!287568 condMapEmpty!2055) mapIsEmpty!2056))

(assert (= (and b!287568 (not condMapEmpty!2055)) mapNonEmpty!2055))

(assert (= start!64212 b!287568))

(declare-fun m!420261 () Bool)

(assert (=> start!64212 m!420261))

(declare-fun m!420263 () Bool)

(assert (=> start!64212 m!420263))

(declare-fun m!420265 () Bool)

(assert (=> mapNonEmpty!2055 m!420265))

(declare-fun m!420267 () Bool)

(assert (=> b!287571 m!420267))

(declare-fun m!420269 () Bool)

(assert (=> b!287571 m!420269))

(declare-fun m!420271 () Bool)

(assert (=> b!287567 m!420271))

(declare-fun m!420273 () Bool)

(assert (=> b!287569 m!420273))

(declare-fun m!420275 () Bool)

(assert (=> mapNonEmpty!2056 m!420275))

(declare-fun m!420277 () Bool)

(assert (=> b!287570 m!420277))

(declare-fun m!420279 () Bool)

(assert (=> b!287570 m!420279))

(check-sat (not start!64212) tp_is_empty!633 (not mapNonEmpty!2055) (not b!287567) (not b!287569) (not mapNonEmpty!2056) (not b!287571))
(check-sat)
