; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64054 () Bool)

(assert start!64054)

(declare-fun mapIsEmpty!1490 () Bool)

(declare-fun mapRes!1491 () Bool)

(assert (=> mapIsEmpty!1490 mapRes!1491))

(declare-fun b!285602 () Bool)

(declare-fun e!203844 () Bool)

(declare-fun e!203845 () Bool)

(assert (=> b!285602 (= e!203844 (not e!203845))))

(declare-fun res!236375 () Bool)

(assert (=> b!285602 (=> res!236375 e!203845)))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285602 (= res!236375 (or (bvsgt from!773 (bvadd #b00000000000000000000000000000001 i!964)) (bvsgt (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-datatypes ((T!51621 0))(
  ( (T!51622 (val!247 Int)) )
))
(declare-datatypes ((array!16773 0))(
  ( (array!16774 (arr!8234 (Array (_ BitVec 32) T!51621)) (size!7238 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16773)

(declare-fun a1!647 () array!16773)

(declare-fun arrayRangesEq!1380 (array!16773 array!16773 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285602 (arrayRangesEq!1380 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19935 0))(
  ( (Unit!19936) )
))
(declare-fun lt!418607 () Unit!19935)

(declare-fun arrayRangesEqAppend!10 (array!16773 array!16773 (_ BitVec 32) (_ BitVec 32)) Unit!19935)

(assert (=> b!285602 (= lt!418607 (arrayRangesEqAppend!10 a1!647 a3!68 from!773 i!964))))

(declare-fun mapNonEmpty!1490 () Bool)

(declare-fun tp!1492 () Bool)

(declare-fun tp_is_empty!495 () Bool)

(assert (=> mapNonEmpty!1490 (= mapRes!1491 (and tp!1492 tp_is_empty!495))))

(declare-fun a2!647 () array!16773)

(declare-fun mapRest!1490 () (Array (_ BitVec 32) T!51621))

(declare-fun mapKey!1492 () (_ BitVec 32))

(declare-fun mapValue!1492 () T!51621)

(assert (=> mapNonEmpty!1490 (= (arr!8234 a2!647) (store mapRest!1490 mapKey!1492 mapValue!1492))))

(declare-fun b!285603 () Bool)

(declare-fun e!203847 () Bool)

(declare-fun mapRes!1490 () Bool)

(assert (=> b!285603 (= e!203847 (and tp_is_empty!495 mapRes!1490))))

(declare-fun condMapEmpty!1490 () Bool)

(declare-fun mapDefault!1490 () T!51621)

(assert (=> b!285603 (= condMapEmpty!1490 (= (arr!8234 a1!647) ((as const (Array (_ BitVec 32) T!51621)) mapDefault!1490)))))

(declare-fun b!285604 () Bool)

(assert (=> b!285604 (= e!203845 (bvsle (size!7238 a1!647) (size!7238 a3!68)))))

(assert (=> b!285604 (arrayRangesEq!1380 a1!647 a3!68 from!773 mid!71)))

(declare-fun lt!418608 () Unit!19935)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun rec!65 (array!16773 array!16773 array!16773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19935)

(assert (=> b!285604 (= lt!418608 (rec!65 a1!647 a2!647 a3!68 from!773 mid!71 to!740 (bvadd #b00000000000000000000000000000001 i!964)))))

(declare-fun mapNonEmpty!1491 () Bool)

(declare-fun tp!1490 () Bool)

(assert (=> mapNonEmpty!1491 (= mapRes!1490 (and tp!1490 tp_is_empty!495))))

(declare-fun mapKey!1490 () (_ BitVec 32))

(declare-fun mapRest!1492 () (Array (_ BitVec 32) T!51621))

(declare-fun mapValue!1490 () T!51621)

(assert (=> mapNonEmpty!1491 (= (arr!8234 a1!647) (store mapRest!1492 mapKey!1490 mapValue!1490))))

(declare-fun mapIsEmpty!1491 () Bool)

(declare-fun mapRes!1492 () Bool)

(assert (=> mapIsEmpty!1491 mapRes!1492))

(declare-fun b!285605 () Bool)

(declare-fun res!236377 () Bool)

(assert (=> b!285605 (=> (not res!236377) (not e!203844))))

(assert (=> b!285605 (= res!236377 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285606 () Bool)

(declare-fun res!236376 () Bool)

(assert (=> b!285606 (=> (not res!236376) (not e!203844))))

(assert (=> b!285606 (= res!236376 (arrayRangesEq!1380 a2!647 a3!68 i!964 to!740))))

(declare-fun b!285607 () Bool)

(declare-fun res!236374 () Bool)

(assert (=> b!285607 (=> (not res!236374) (not e!203844))))

(assert (=> b!285607 (= res!236374 (arrayRangesEq!1380 a1!647 a3!68 from!773 i!964))))

(declare-fun res!236373 () Bool)

(assert (=> start!64054 (=> (not res!236373) (not e!203844))))

(assert (=> start!64054 (= res!236373 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7238 a1!647) (size!7238 a2!647)) (bvsle (size!7238 a2!647) (size!7238 a3!68)) (bvsle mid!71 (size!7238 a1!647)) (bvsle to!740 (size!7238 a2!647))))))

(assert (=> start!64054 e!203844))

(declare-fun e!203846 () Bool)

(declare-fun array_inv!6906 (array!16773) Bool)

(assert (=> start!64054 (and (array_inv!6906 a2!647) e!203846)))

(assert (=> start!64054 true))

(assert (=> start!64054 (and (array_inv!6906 a1!647) e!203847)))

(declare-fun e!203848 () Bool)

(assert (=> start!64054 (and (array_inv!6906 a3!68) e!203848)))

(declare-fun b!285608 () Bool)

(assert (=> b!285608 (= e!203848 (and tp_is_empty!495 mapRes!1492))))

(declare-fun condMapEmpty!1491 () Bool)

(declare-fun mapDefault!1491 () T!51621)

(assert (=> b!285608 (= condMapEmpty!1491 (= (arr!8234 a3!68) ((as const (Array (_ BitVec 32) T!51621)) mapDefault!1491)))))

(declare-fun mapNonEmpty!1492 () Bool)

(declare-fun tp!1491 () Bool)

(assert (=> mapNonEmpty!1492 (= mapRes!1492 (and tp!1491 tp_is_empty!495))))

(declare-fun mapRest!1491 () (Array (_ BitVec 32) T!51621))

(declare-fun mapKey!1491 () (_ BitVec 32))

(declare-fun mapValue!1491 () T!51621)

(assert (=> mapNonEmpty!1492 (= (arr!8234 a3!68) (store mapRest!1491 mapKey!1491 mapValue!1491))))

(declare-fun b!285609 () Bool)

(declare-fun res!236379 () Bool)

(assert (=> b!285609 (=> (not res!236379) (not e!203844))))

(assert (=> b!285609 (= res!236379 (arrayRangesEq!1380 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!285610 () Bool)

(declare-fun res!236378 () Bool)

(assert (=> b!285610 (=> res!236378 e!203845)))

(assert (=> b!285610 (= res!236378 (not (arrayRangesEq!1380 a1!647 a2!647 (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun b!285611 () Bool)

(declare-fun res!236382 () Bool)

(assert (=> b!285611 (=> (not res!236382) (not e!203844))))

(assert (=> b!285611 (= res!236382 (arrayRangesEq!1380 a2!647 a3!68 from!773 to!740))))

(declare-fun b!285612 () Bool)

(declare-fun res!236381 () Bool)

(assert (=> b!285612 (=> (not res!236381) (not e!203844))))

(assert (=> b!285612 (= res!236381 (arrayRangesEq!1380 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!285613 () Bool)

(assert (=> b!285613 (= e!203846 (and tp_is_empty!495 mapRes!1491))))

(declare-fun condMapEmpty!1492 () Bool)

(declare-fun mapDefault!1492 () T!51621)

(assert (=> b!285613 (= condMapEmpty!1492 (= (arr!8234 a2!647) ((as const (Array (_ BitVec 32) T!51621)) mapDefault!1492)))))

(declare-fun b!285614 () Bool)

(declare-fun res!236372 () Bool)

(assert (=> b!285614 (=> res!236372 e!203845)))

(assert (=> b!285614 (= res!236372 (not (arrayRangesEq!1380 a2!647 a3!68 (bvadd #b00000000000000000000000000000001 i!964) to!740)))))

(declare-fun mapIsEmpty!1492 () Bool)

(assert (=> mapIsEmpty!1492 mapRes!1490))

(declare-fun b!285615 () Bool)

(declare-fun res!236380 () Bool)

(assert (=> b!285615 (=> (not res!236380) (not e!203844))))

(assert (=> b!285615 (= res!236380 (not (= i!964 mid!71)))))

(assert (= (and start!64054 res!236373) b!285612))

(assert (= (and b!285612 res!236381) b!285611))

(assert (= (and b!285611 res!236382) b!285605))

(assert (= (and b!285605 res!236377) b!285609))

(assert (= (and b!285609 res!236379) b!285606))

(assert (= (and b!285606 res!236376) b!285607))

(assert (= (and b!285607 res!236374) b!285615))

(assert (= (and b!285615 res!236380) b!285602))

(assert (= (and b!285602 (not res!236375)) b!285610))

(assert (= (and b!285610 (not res!236378)) b!285614))

(assert (= (and b!285614 (not res!236372)) b!285604))

(assert (= (and b!285613 condMapEmpty!1492) mapIsEmpty!1490))

(assert (= (and b!285613 (not condMapEmpty!1492)) mapNonEmpty!1490))

(assert (= start!64054 b!285613))

(assert (= (and b!285603 condMapEmpty!1490) mapIsEmpty!1492))

(assert (= (and b!285603 (not condMapEmpty!1490)) mapNonEmpty!1491))

(assert (= start!64054 b!285603))

(assert (= (and b!285608 condMapEmpty!1491) mapIsEmpty!1491))

(assert (= (and b!285608 (not condMapEmpty!1491)) mapNonEmpty!1492))

(assert (= start!64054 b!285608))

(declare-fun m!418549 () Bool)

(assert (=> b!285607 m!418549))

(declare-fun m!418551 () Bool)

(assert (=> b!285609 m!418551))

(declare-fun m!418553 () Bool)

(assert (=> start!64054 m!418553))

(declare-fun m!418555 () Bool)

(assert (=> start!64054 m!418555))

(declare-fun m!418557 () Bool)

(assert (=> start!64054 m!418557))

(declare-fun m!418559 () Bool)

(assert (=> b!285614 m!418559))

(declare-fun m!418561 () Bool)

(assert (=> mapNonEmpty!1490 m!418561))

(declare-fun m!418563 () Bool)

(assert (=> b!285604 m!418563))

(declare-fun m!418565 () Bool)

(assert (=> b!285604 m!418565))

(declare-fun m!418567 () Bool)

(assert (=> mapNonEmpty!1491 m!418567))

(declare-fun m!418569 () Bool)

(assert (=> b!285606 m!418569))

(declare-fun m!418571 () Bool)

(assert (=> b!285602 m!418571))

(declare-fun m!418573 () Bool)

(assert (=> b!285602 m!418573))

(declare-fun m!418575 () Bool)

(assert (=> b!285610 m!418575))

(declare-fun m!418577 () Bool)

(assert (=> mapNonEmpty!1492 m!418577))

(declare-fun m!418579 () Bool)

(assert (=> b!285611 m!418579))

(declare-fun m!418581 () Bool)

(assert (=> b!285612 m!418581))

(check-sat (not b!285604) (not mapNonEmpty!1491) (not b!285611) (not b!285610) tp_is_empty!495 (not b!285602) (not b!285607) (not b!285614) (not b!285606) (not mapNonEmpty!1490) (not start!64054) (not mapNonEmpty!1492) (not b!285609) (not b!285612))
(check-sat)
