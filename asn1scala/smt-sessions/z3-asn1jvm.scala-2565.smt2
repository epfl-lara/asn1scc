; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64178 () Bool)

(assert start!64178)

(declare-fun mapNonEmpty!1959 () Bool)

(declare-fun mapRes!1960 () Bool)

(declare-fun tp!1960 () Bool)

(declare-fun tp_is_empty!603 () Bool)

(assert (=> mapNonEmpty!1959 (= mapRes!1960 (and tp!1960 tp_is_empty!603))))

(declare-fun mapKey!1960 () (_ BitVec 32))

(declare-datatypes ((T!52089 0))(
  ( (T!52090 (val!301 Int)) )
))
(declare-fun mapValue!1960 () T!52089)

(declare-datatypes ((array!16884 0))(
  ( (array!16885 (arr!8288 (Array (_ BitVec 32) T!52089)) (size!7292 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16884)

(declare-fun mapRest!1960 () (Array (_ BitVec 32) T!52089))

(assert (=> mapNonEmpty!1959 (= (arr!8288 a2!580) (store mapRest!1960 mapKey!1960 mapValue!1960))))

(declare-fun b!287327 () Bool)

(declare-fun res!237640 () Bool)

(declare-fun e!204558 () Bool)

(assert (=> b!287327 (=> (not res!237640) (not e!204558))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun a1!580 () array!16884)

(declare-fun arrayRangesEq!1422 (array!16884 array!16884 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287327 (= res!237640 (arrayRangesEq!1422 a1!580 a2!580 to!673 (bvadd #b00000000000000000000000000000001 to!673)))))

(declare-fun b!287328 () Bool)

(declare-fun res!237639 () Bool)

(assert (=> b!287328 (=> (not res!237639) (not e!204558))))

(declare-fun from!706 () (_ BitVec 32))

(assert (=> b!287328 (= res!237639 (arrayRangesEq!1422 a1!580 a2!580 from!706 to!673))))

(declare-fun b!287329 () Bool)

(assert (=> b!287329 (= e!204558 (not true))))

(assert (=> b!287329 (arrayRangesEq!1422 a1!580 a2!580 from!706 (bvadd #b00000000000000000000000000000001 to!673))))

(declare-datatypes ((Unit!19971 0))(
  ( (Unit!19972) )
))
(declare-fun lt!418734 () Unit!19971)

(declare-fun rec!74 (array!16884 array!16884 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19971)

(assert (=> b!287329 (= lt!418734 (rec!74 a1!580 a2!580 from!706 to!673 to!673))))

(declare-fun res!237638 () Bool)

(assert (=> start!64178 (=> (not res!237638) (not e!204558))))

(assert (=> start!64178 (= res!237638 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7292 a1!580) (size!7292 a2!580)) (bvslt to!673 (size!7292 a1!580))))))

(assert (=> start!64178 e!204558))

(assert (=> start!64178 true))

(declare-fun e!204559 () Bool)

(declare-fun array_inv!6936 (array!16884) Bool)

(assert (=> start!64178 (and (array_inv!6936 a1!580) e!204559)))

(declare-fun e!204560 () Bool)

(assert (=> start!64178 (and (array_inv!6936 a2!580) e!204560)))

(declare-fun mapIsEmpty!1959 () Bool)

(declare-fun mapRes!1959 () Bool)

(assert (=> mapIsEmpty!1959 mapRes!1959))

(declare-fun mapIsEmpty!1960 () Bool)

(assert (=> mapIsEmpty!1960 mapRes!1960))

(declare-fun mapNonEmpty!1960 () Bool)

(declare-fun tp!1959 () Bool)

(assert (=> mapNonEmpty!1960 (= mapRes!1959 (and tp!1959 tp_is_empty!603))))

(declare-fun mapRest!1959 () (Array (_ BitVec 32) T!52089))

(declare-fun mapValue!1959 () T!52089)

(declare-fun mapKey!1959 () (_ BitVec 32))

(assert (=> mapNonEmpty!1960 (= (arr!8288 a1!580) (store mapRest!1959 mapKey!1959 mapValue!1959))))

(declare-fun b!287330 () Bool)

(assert (=> b!287330 (= e!204560 (and tp_is_empty!603 mapRes!1960))))

(declare-fun condMapEmpty!1959 () Bool)

(declare-fun mapDefault!1959 () T!52089)

(assert (=> b!287330 (= condMapEmpty!1959 (= (arr!8288 a2!580) ((as const (Array (_ BitVec 32) T!52089)) mapDefault!1959)))))

(declare-fun b!287331 () Bool)

(declare-fun res!237637 () Bool)

(assert (=> b!287331 (=> (not res!237637) (not e!204558))))

(assert (=> b!287331 (= res!237637 (= (select (arr!8288 a1!580) to!673) (select (arr!8288 a2!580) to!673)))))

(declare-fun b!287332 () Bool)

(assert (=> b!287332 (= e!204559 (and tp_is_empty!603 mapRes!1959))))

(declare-fun condMapEmpty!1960 () Bool)

(declare-fun mapDefault!1960 () T!52089)

(assert (=> b!287332 (= condMapEmpty!1960 (= (arr!8288 a1!580) ((as const (Array (_ BitVec 32) T!52089)) mapDefault!1960)))))

(assert (= (and start!64178 res!237638) b!287328))

(assert (= (and b!287328 res!237639) b!287331))

(assert (= (and b!287331 res!237637) b!287327))

(assert (= (and b!287327 res!237640) b!287329))

(assert (= (and b!287332 condMapEmpty!1960) mapIsEmpty!1959))

(assert (= (and b!287332 (not condMapEmpty!1960)) mapNonEmpty!1960))

(assert (= start!64178 b!287332))

(assert (= (and b!287330 condMapEmpty!1959) mapIsEmpty!1960))

(assert (= (and b!287330 (not condMapEmpty!1959)) mapNonEmpty!1959))

(assert (= start!64178 b!287330))

(declare-fun m!420005 () Bool)

(assert (=> b!287331 m!420005))

(declare-fun m!420007 () Bool)

(assert (=> b!287331 m!420007))

(declare-fun m!420009 () Bool)

(assert (=> b!287327 m!420009))

(declare-fun m!420011 () Bool)

(assert (=> b!287328 m!420011))

(declare-fun m!420013 () Bool)

(assert (=> b!287329 m!420013))

(declare-fun m!420015 () Bool)

(assert (=> b!287329 m!420015))

(declare-fun m!420017 () Bool)

(assert (=> mapNonEmpty!1960 m!420017))

(declare-fun m!420019 () Bool)

(assert (=> start!64178 m!420019))

(declare-fun m!420021 () Bool)

(assert (=> start!64178 m!420021))

(declare-fun m!420023 () Bool)

(assert (=> mapNonEmpty!1959 m!420023))

(check-sat (not b!287329) (not mapNonEmpty!1959) (not b!287327) (not mapNonEmpty!1960) tp_is_empty!603 (not start!64178) (not b!287328))
(check-sat)
