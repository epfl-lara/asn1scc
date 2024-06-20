; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64112 () Bool)

(assert start!64112)

(declare-fun b!286503 () Bool)

(declare-fun res!237030 () Bool)

(declare-fun e!204197 () Bool)

(assert (=> b!286503 (=> (not res!237030) (not e!204197))))

(declare-fun from!773 () (_ BitVec 32))

(declare-datatypes ((T!51855 0))(
  ( (T!51856 (val!274 Int)) )
))
(declare-datatypes ((array!16828 0))(
  ( (array!16829 (arr!8261 (Array (_ BitVec 32) T!51855)) (size!7265 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16828)

(declare-fun a3!68 () array!16828)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1403 (array!16828 array!16828 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286503 (= res!237030 (arrayRangesEq!1403 a2!647 a3!68 from!773 to!740))))

(declare-fun b!286504 () Bool)

(declare-fun res!237034 () Bool)

(assert (=> b!286504 (=> (not res!237034) (not e!204197))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286504 (= res!237034 (not (= i!964 mid!71)))))

(declare-fun mapNonEmpty!1738 () Bool)

(declare-fun mapRes!1740 () Bool)

(declare-fun tp!1738 () Bool)

(declare-fun tp_is_empty!549 () Bool)

(assert (=> mapNonEmpty!1738 (= mapRes!1740 (and tp!1738 tp_is_empty!549))))

(declare-fun mapRest!1738 () (Array (_ BitVec 32) T!51855))

(declare-fun mapKey!1739 () (_ BitVec 32))

(declare-fun mapValue!1740 () T!51855)

(declare-fun a1!647 () array!16828)

(assert (=> mapNonEmpty!1738 (= (arr!8261 a1!647) (store mapRest!1738 mapKey!1739 mapValue!1740))))

(declare-fun b!286505 () Bool)

(declare-fun res!237032 () Bool)

(assert (=> b!286505 (=> (not res!237032) (not e!204197))))

(assert (=> b!286505 (= res!237032 (arrayRangesEq!1403 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapIsEmpty!1738 () Bool)

(declare-fun mapRes!1739 () Bool)

(assert (=> mapIsEmpty!1738 mapRes!1739))

(declare-fun b!286506 () Bool)

(assert (=> b!286506 (= e!204197 (not (and (bvsle from!773 (bvadd #b00000000000000000000000000000001 i!964)) (bvsle (bvadd #b00000000000000000000000000000001 i!964) mid!71))))))

(assert (=> b!286506 (arrayRangesEq!1403 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19945 0))(
  ( (Unit!19946) )
))
(declare-fun lt!418647 () Unit!19945)

(declare-fun arrayRangesEqAppend!14 (array!16828 array!16828 (_ BitVec 32) (_ BitVec 32)) Unit!19945)

(assert (=> b!286506 (= lt!418647 (arrayRangesEqAppend!14 a1!647 a3!68 from!773 i!964))))

(declare-fun mapIsEmpty!1740 () Bool)

(assert (=> mapIsEmpty!1740 mapRes!1740))

(declare-fun mapNonEmpty!1739 () Bool)

(declare-fun tp!1740 () Bool)

(assert (=> mapNonEmpty!1739 (= mapRes!1739 (and tp!1740 tp_is_empty!549))))

(declare-fun mapKey!1740 () (_ BitVec 32))

(declare-fun mapValue!1739 () T!51855)

(declare-fun mapRest!1740 () (Array (_ BitVec 32) T!51855))

(assert (=> mapNonEmpty!1739 (= (arr!8261 a2!647) (store mapRest!1740 mapKey!1740 mapValue!1739))))

(declare-fun mapNonEmpty!1740 () Bool)

(declare-fun mapRes!1738 () Bool)

(declare-fun tp!1739 () Bool)

(assert (=> mapNonEmpty!1740 (= mapRes!1738 (and tp!1739 tp_is_empty!549))))

(declare-fun mapRest!1739 () (Array (_ BitVec 32) T!51855))

(declare-fun mapValue!1738 () T!51855)

(declare-fun mapKey!1738 () (_ BitVec 32))

(assert (=> mapNonEmpty!1740 (= (arr!8261 a3!68) (store mapRest!1739 mapKey!1738 mapValue!1738))))

(declare-fun b!286507 () Bool)

(declare-fun e!204195 () Bool)

(assert (=> b!286507 (= e!204195 (and tp_is_empty!549 mapRes!1739))))

(declare-fun condMapEmpty!1740 () Bool)

(declare-fun mapDefault!1739 () T!51855)

(assert (=> b!286507 (= condMapEmpty!1740 (= (arr!8261 a2!647) ((as const (Array (_ BitVec 32) T!51855)) mapDefault!1739)))))

(declare-fun b!286508 () Bool)

(declare-fun e!204196 () Bool)

(assert (=> b!286508 (= e!204196 (and tp_is_empty!549 mapRes!1740))))

(declare-fun condMapEmpty!1738 () Bool)

(declare-fun mapDefault!1740 () T!51855)

(assert (=> b!286508 (= condMapEmpty!1738 (= (arr!8261 a1!647) ((as const (Array (_ BitVec 32) T!51855)) mapDefault!1740)))))

(declare-fun b!286509 () Bool)

(declare-fun res!237029 () Bool)

(assert (=> b!286509 (=> (not res!237029) (not e!204197))))

(assert (=> b!286509 (= res!237029 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!286510 () Bool)

(declare-fun e!204198 () Bool)

(assert (=> b!286510 (= e!204198 (and tp_is_empty!549 mapRes!1738))))

(declare-fun condMapEmpty!1739 () Bool)

(declare-fun mapDefault!1738 () T!51855)

(assert (=> b!286510 (= condMapEmpty!1739 (= (arr!8261 a3!68) ((as const (Array (_ BitVec 32) T!51855)) mapDefault!1738)))))

(declare-fun b!286511 () Bool)

(declare-fun res!237031 () Bool)

(assert (=> b!286511 (=> (not res!237031) (not e!204197))))

(assert (=> b!286511 (= res!237031 (arrayRangesEq!1403 a2!647 a3!68 i!964 to!740))))

(declare-fun res!237028 () Bool)

(assert (=> start!64112 (=> (not res!237028) (not e!204197))))

(assert (=> start!64112 (= res!237028 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7265 a1!647) (size!7265 a2!647)) (bvsle (size!7265 a2!647) (size!7265 a3!68)) (bvsle mid!71 (size!7265 a1!647)) (bvsle to!740 (size!7265 a2!647))))))

(assert (=> start!64112 e!204197))

(declare-fun array_inv!6919 (array!16828) Bool)

(assert (=> start!64112 (and (array_inv!6919 a2!647) e!204195)))

(assert (=> start!64112 true))

(assert (=> start!64112 (and (array_inv!6919 a1!647) e!204196)))

(assert (=> start!64112 (and (array_inv!6919 a3!68) e!204198)))

(declare-fun mapIsEmpty!1739 () Bool)

(assert (=> mapIsEmpty!1739 mapRes!1738))

(declare-fun b!286512 () Bool)

(declare-fun res!237033 () Bool)

(assert (=> b!286512 (=> (not res!237033) (not e!204197))))

(assert (=> b!286512 (= res!237033 (arrayRangesEq!1403 a1!647 a3!68 from!773 i!964))))

(declare-fun b!286513 () Bool)

(declare-fun res!237035 () Bool)

(assert (=> b!286513 (=> (not res!237035) (not e!204197))))

(assert (=> b!286513 (= res!237035 (arrayRangesEq!1403 a1!647 a2!647 i!964 mid!71))))

(assert (= (and start!64112 res!237028) b!286505))

(assert (= (and b!286505 res!237032) b!286503))

(assert (= (and b!286503 res!237030) b!286509))

(assert (= (and b!286509 res!237029) b!286513))

(assert (= (and b!286513 res!237035) b!286511))

(assert (= (and b!286511 res!237031) b!286512))

(assert (= (and b!286512 res!237033) b!286504))

(assert (= (and b!286504 res!237034) b!286506))

(assert (= (and b!286507 condMapEmpty!1740) mapIsEmpty!1738))

(assert (= (and b!286507 (not condMapEmpty!1740)) mapNonEmpty!1739))

(assert (= start!64112 b!286507))

(assert (= (and b!286508 condMapEmpty!1738) mapIsEmpty!1740))

(assert (= (and b!286508 (not condMapEmpty!1738)) mapNonEmpty!1738))

(assert (= start!64112 b!286508))

(assert (= (and b!286510 condMapEmpty!1739) mapIsEmpty!1739))

(assert (= (and b!286510 (not condMapEmpty!1739)) mapNonEmpty!1740))

(assert (= start!64112 b!286510))

(declare-fun m!419261 () Bool)

(assert (=> b!286513 m!419261))

(declare-fun m!419263 () Bool)

(assert (=> b!286512 m!419263))

(declare-fun m!419265 () Bool)

(assert (=> b!286511 m!419265))

(declare-fun m!419267 () Bool)

(assert (=> b!286506 m!419267))

(declare-fun m!419269 () Bool)

(assert (=> b!286506 m!419269))

(declare-fun m!419271 () Bool)

(assert (=> start!64112 m!419271))

(declare-fun m!419273 () Bool)

(assert (=> start!64112 m!419273))

(declare-fun m!419275 () Bool)

(assert (=> start!64112 m!419275))

(declare-fun m!419277 () Bool)

(assert (=> b!286503 m!419277))

(declare-fun m!419279 () Bool)

(assert (=> mapNonEmpty!1738 m!419279))

(declare-fun m!419281 () Bool)

(assert (=> b!286505 m!419281))

(declare-fun m!419283 () Bool)

(assert (=> mapNonEmpty!1740 m!419283))

(declare-fun m!419285 () Bool)

(assert (=> mapNonEmpty!1739 m!419285))

(check-sat tp_is_empty!549 (not b!286503) (not b!286506) (not mapNonEmpty!1739) (not b!286511) (not start!64112) (not b!286513) (not mapNonEmpty!1738) (not b!286505) (not mapNonEmpty!1740) (not b!286512))
(check-sat)
