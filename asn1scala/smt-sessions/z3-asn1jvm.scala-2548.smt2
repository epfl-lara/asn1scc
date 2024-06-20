; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64060 () Bool)

(assert start!64060)

(declare-fun b!285728 () Bool)

(declare-fun res!236478 () Bool)

(declare-fun e!203892 () Bool)

(assert (=> b!285728 (=> (not res!236478) (not e!203892))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285728 (= res!236478 (not (= i!964 mid!71)))))

(declare-fun res!236472 () Bool)

(assert (=> start!64060 (=> (not res!236472) (not e!203892))))

(declare-datatypes ((T!51647 0))(
  ( (T!51648 (val!250 Int)) )
))
(declare-datatypes ((array!16779 0))(
  ( (array!16780 (arr!8237 (Array (_ BitVec 32) T!51647)) (size!7241 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16779)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16779)

(declare-fun a3!68 () array!16779)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64060 (= res!236472 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7241 a1!647) (size!7241 a2!647)) (bvsle (size!7241 a2!647) (size!7241 a3!68)) (bvsle mid!71 (size!7241 a1!647)) (bvsle to!740 (size!7241 a2!647))))))

(assert (=> start!64060 e!203892))

(declare-fun e!203889 () Bool)

(declare-fun array_inv!6907 (array!16779) Bool)

(assert (=> start!64060 (and (array_inv!6907 a2!647) e!203889)))

(assert (=> start!64060 true))

(declare-fun e!203891 () Bool)

(assert (=> start!64060 (and (array_inv!6907 a1!647) e!203891)))

(declare-fun e!203893 () Bool)

(assert (=> start!64060 (and (array_inv!6907 a3!68) e!203893)))

(declare-fun b!285729 () Bool)

(declare-fun e!203890 () Bool)

(assert (=> b!285729 (= e!203890 true)))

(declare-fun arrayRangesEq!1383 (array!16779 array!16779 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285729 (arrayRangesEq!1383 a1!647 a3!68 from!773 mid!71)))

(declare-datatypes ((Unit!19937 0))(
  ( (Unit!19938) )
))
(declare-fun lt!418625 () Unit!19937)

(declare-fun rec!66 (array!16779 array!16779 array!16779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19937)

(assert (=> b!285729 (= lt!418625 (rec!66 a1!647 a2!647 a3!68 from!773 mid!71 to!740 (bvadd #b00000000000000000000000000000001 i!964)))))

(declare-fun b!285730 () Bool)

(declare-fun res!236473 () Bool)

(assert (=> b!285730 (=> (not res!236473) (not e!203892))))

(assert (=> b!285730 (= res!236473 (arrayRangesEq!1383 a2!647 a3!68 from!773 to!740))))

(declare-fun b!285731 () Bool)

(declare-fun res!236481 () Bool)

(assert (=> b!285731 (=> (not res!236481) (not e!203892))))

(assert (=> b!285731 (= res!236481 (arrayRangesEq!1383 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapNonEmpty!1517 () Bool)

(declare-fun mapRes!1517 () Bool)

(declare-fun tp!1518 () Bool)

(declare-fun tp_is_empty!501 () Bool)

(assert (=> mapNonEmpty!1517 (= mapRes!1517 (and tp!1518 tp_is_empty!501))))

(declare-fun mapValue!1517 () T!51647)

(declare-fun mapRest!1517 () (Array (_ BitVec 32) T!51647))

(declare-fun mapKey!1519 () (_ BitVec 32))

(assert (=> mapNonEmpty!1517 (= (arr!8237 a3!68) (store mapRest!1517 mapKey!1519 mapValue!1517))))

(declare-fun b!285732 () Bool)

(declare-fun res!236480 () Bool)

(assert (=> b!285732 (=> (not res!236480) (not e!203892))))

(assert (=> b!285732 (= res!236480 (arrayRangesEq!1383 a1!647 a3!68 from!773 i!964))))

(declare-fun mapNonEmpty!1518 () Bool)

(declare-fun mapRes!1518 () Bool)

(declare-fun tp!1517 () Bool)

(assert (=> mapNonEmpty!1518 (= mapRes!1518 (and tp!1517 tp_is_empty!501))))

(declare-fun mapRest!1519 () (Array (_ BitVec 32) T!51647))

(declare-fun mapKey!1517 () (_ BitVec 32))

(declare-fun mapValue!1519 () T!51647)

(assert (=> mapNonEmpty!1518 (= (arr!8237 a2!647) (store mapRest!1519 mapKey!1517 mapValue!1519))))

(declare-fun b!285733 () Bool)

(declare-fun res!236471 () Bool)

(assert (=> b!285733 (=> (not res!236471) (not e!203892))))

(assert (=> b!285733 (= res!236471 (arrayRangesEq!1383 a2!647 a3!68 i!964 to!740))))

(declare-fun mapIsEmpty!1517 () Bool)

(assert (=> mapIsEmpty!1517 mapRes!1518))

(declare-fun b!285734 () Bool)

(assert (=> b!285734 (= e!203892 (not e!203890))))

(declare-fun res!236475 () Bool)

(assert (=> b!285734 (=> res!236475 e!203890)))

(assert (=> b!285734 (= res!236475 (or (bvsgt from!773 (bvadd #b00000000000000000000000000000001 i!964)) (bvsgt (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(assert (=> b!285734 (arrayRangesEq!1383 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-fun lt!418626 () Unit!19937)

(declare-fun arrayRangesEqAppend!11 (array!16779 array!16779 (_ BitVec 32) (_ BitVec 32)) Unit!19937)

(assert (=> b!285734 (= lt!418626 (arrayRangesEqAppend!11 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285735 () Bool)

(assert (=> b!285735 (= e!203889 (and tp_is_empty!501 mapRes!1518))))

(declare-fun condMapEmpty!1518 () Bool)

(declare-fun mapDefault!1519 () T!51647)

(assert (=> b!285735 (= condMapEmpty!1518 (= (arr!8237 a2!647) ((as const (Array (_ BitVec 32) T!51647)) mapDefault!1519)))))

(declare-fun b!285736 () Bool)

(declare-fun res!236479 () Bool)

(assert (=> b!285736 (=> (not res!236479) (not e!203892))))

(assert (=> b!285736 (= res!236479 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285737 () Bool)

(assert (=> b!285737 (= e!203893 (and tp_is_empty!501 mapRes!1517))))

(declare-fun condMapEmpty!1519 () Bool)

(declare-fun mapDefault!1518 () T!51647)

(assert (=> b!285737 (= condMapEmpty!1519 (= (arr!8237 a3!68) ((as const (Array (_ BitVec 32) T!51647)) mapDefault!1518)))))

(declare-fun b!285738 () Bool)

(declare-fun res!236474 () Bool)

(assert (=> b!285738 (=> (not res!236474) (not e!203892))))

(assert (=> b!285738 (= res!236474 (arrayRangesEq!1383 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!285739 () Bool)

(declare-fun res!236476 () Bool)

(assert (=> b!285739 (=> res!236476 e!203890)))

(assert (=> b!285739 (= res!236476 (not (arrayRangesEq!1383 a2!647 a3!68 (bvadd #b00000000000000000000000000000001 i!964) to!740)))))

(declare-fun b!285740 () Bool)

(declare-fun mapRes!1519 () Bool)

(assert (=> b!285740 (= e!203891 (and tp_is_empty!501 mapRes!1519))))

(declare-fun condMapEmpty!1517 () Bool)

(declare-fun mapDefault!1517 () T!51647)

(assert (=> b!285740 (= condMapEmpty!1517 (= (arr!8237 a1!647) ((as const (Array (_ BitVec 32) T!51647)) mapDefault!1517)))))

(declare-fun mapNonEmpty!1519 () Bool)

(declare-fun tp!1519 () Bool)

(assert (=> mapNonEmpty!1519 (= mapRes!1519 (and tp!1519 tp_is_empty!501))))

(declare-fun mapValue!1518 () T!51647)

(declare-fun mapRest!1518 () (Array (_ BitVec 32) T!51647))

(declare-fun mapKey!1518 () (_ BitVec 32))

(assert (=> mapNonEmpty!1519 (= (arr!8237 a1!647) (store mapRest!1518 mapKey!1518 mapValue!1518))))

(declare-fun b!285741 () Bool)

(declare-fun res!236477 () Bool)

(assert (=> b!285741 (=> res!236477 e!203890)))

(assert (=> b!285741 (= res!236477 (not (arrayRangesEq!1383 a1!647 a2!647 (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-fun mapIsEmpty!1518 () Bool)

(assert (=> mapIsEmpty!1518 mapRes!1519))

(declare-fun mapIsEmpty!1519 () Bool)

(assert (=> mapIsEmpty!1519 mapRes!1517))

(assert (= (and start!64060 res!236472) b!285731))

(assert (= (and b!285731 res!236481) b!285730))

(assert (= (and b!285730 res!236473) b!285736))

(assert (= (and b!285736 res!236479) b!285738))

(assert (= (and b!285738 res!236474) b!285733))

(assert (= (and b!285733 res!236471) b!285732))

(assert (= (and b!285732 res!236480) b!285728))

(assert (= (and b!285728 res!236478) b!285734))

(assert (= (and b!285734 (not res!236475)) b!285741))

(assert (= (and b!285741 (not res!236477)) b!285739))

(assert (= (and b!285739 (not res!236476)) b!285729))

(assert (= (and b!285735 condMapEmpty!1518) mapIsEmpty!1517))

(assert (= (and b!285735 (not condMapEmpty!1518)) mapNonEmpty!1518))

(assert (= start!64060 b!285735))

(assert (= (and b!285740 condMapEmpty!1517) mapIsEmpty!1518))

(assert (= (and b!285740 (not condMapEmpty!1517)) mapNonEmpty!1519))

(assert (= start!64060 b!285740))

(assert (= (and b!285737 condMapEmpty!1519) mapIsEmpty!1519))

(assert (= (and b!285737 (not condMapEmpty!1519)) mapNonEmpty!1517))

(assert (= start!64060 b!285737))

(declare-fun m!418651 () Bool)

(assert (=> mapNonEmpty!1517 m!418651))

(declare-fun m!418653 () Bool)

(assert (=> b!285738 m!418653))

(declare-fun m!418655 () Bool)

(assert (=> b!285729 m!418655))

(declare-fun m!418657 () Bool)

(assert (=> b!285729 m!418657))

(declare-fun m!418659 () Bool)

(assert (=> start!64060 m!418659))

(declare-fun m!418661 () Bool)

(assert (=> start!64060 m!418661))

(declare-fun m!418663 () Bool)

(assert (=> start!64060 m!418663))

(declare-fun m!418665 () Bool)

(assert (=> mapNonEmpty!1518 m!418665))

(declare-fun m!418667 () Bool)

(assert (=> b!285731 m!418667))

(declare-fun m!418669 () Bool)

(assert (=> b!285734 m!418669))

(declare-fun m!418671 () Bool)

(assert (=> b!285734 m!418671))

(declare-fun m!418673 () Bool)

(assert (=> b!285730 m!418673))

(declare-fun m!418675 () Bool)

(assert (=> b!285732 m!418675))

(declare-fun m!418677 () Bool)

(assert (=> b!285741 m!418677))

(declare-fun m!418679 () Bool)

(assert (=> b!285739 m!418679))

(declare-fun m!418681 () Bool)

(assert (=> mapNonEmpty!1519 m!418681))

(declare-fun m!418683 () Bool)

(assert (=> b!285733 m!418683))

(check-sat (not start!64060) (not mapNonEmpty!1517) (not mapNonEmpty!1519) tp_is_empty!501 (not b!285730) (not b!285734) (not b!285738) (not b!285739) (not mapNonEmpty!1518) (not b!285729) (not b!285732) (not b!285733) (not b!285741) (not b!285731))
(check-sat)
