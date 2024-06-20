; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64154 () Bool)

(assert start!64154)

(declare-fun mapIsEmpty!1883 () Bool)

(declare-fun mapRes!1885 () Bool)

(assert (=> mapIsEmpty!1883 mapRes!1885))

(declare-fun b!287115 () Bool)

(declare-fun res!237504 () Bool)

(declare-fun e!204455 () Bool)

(assert (=> b!287115 (=> (not res!237504) (not e!204455))))

(declare-datatypes ((T!51985 0))(
  ( (T!51986 (val!289 Int)) )
))
(declare-datatypes ((array!16860 0))(
  ( (array!16861 (arr!8276 (Array (_ BitVec 32) T!51985)) (size!7280 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16860)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16860)

(declare-fun arrayRangesEq!1415 (array!16860 array!16860 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287115 (= res!237504 (arrayRangesEq!1415 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!287116 () Bool)

(declare-fun res!237510 () Bool)

(assert (=> b!287116 (=> (not res!237510) (not e!204455))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!287116 (= res!237510 (not (= i!964 mid!71)))))

(declare-fun b!287117 () Bool)

(declare-fun res!237509 () Bool)

(declare-fun e!204452 () Bool)

(assert (=> b!287117 (=> res!237509 e!204452)))

(declare-fun a3!68 () array!16860)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!287117 (= res!237509 (not (arrayRangesEq!1415 a2!647 a3!68 (bvadd #b00000000000000000000000000000001 i!964) to!740)))))

(declare-fun b!287118 () Bool)

(declare-fun e!204453 () Bool)

(declare-fun tp_is_empty!579 () Bool)

(declare-fun mapRes!1884 () Bool)

(assert (=> b!287118 (= e!204453 (and tp_is_empty!579 mapRes!1884))))

(declare-fun condMapEmpty!1885 () Bool)

(declare-fun mapDefault!1884 () T!51985)

(assert (=> b!287118 (= condMapEmpty!1885 (= (arr!8276 a2!647) ((as const (Array (_ BitVec 32) T!51985)) mapDefault!1884)))))

(declare-fun b!287119 () Bool)

(declare-fun res!237506 () Bool)

(assert (=> b!287119 (=> (not res!237506) (not e!204455))))

(assert (=> b!287119 (= res!237506 (arrayRangesEq!1415 a2!647 a3!68 i!964 to!740))))

(declare-fun b!287120 () Bool)

(declare-fun res!237507 () Bool)

(assert (=> b!287120 (=> (not res!237507) (not e!204455))))

(assert (=> b!287120 (= res!237507 (arrayRangesEq!1415 a1!647 a2!647 i!964 mid!71))))

(declare-fun mapNonEmpty!1883 () Bool)

(declare-fun mapRes!1883 () Bool)

(declare-fun tp!1883 () Bool)

(assert (=> mapNonEmpty!1883 (= mapRes!1883 (and tp!1883 tp_is_empty!579))))

(declare-fun mapRest!1885 () (Array (_ BitVec 32) T!51985))

(declare-fun mapKey!1883 () (_ BitVec 32))

(declare-fun mapValue!1885 () T!51985)

(assert (=> mapNonEmpty!1883 (= (arr!8276 a3!68) (store mapRest!1885 mapKey!1883 mapValue!1885))))

(declare-fun b!287121 () Bool)

(assert (=> b!287121 (= e!204455 (not e!204452))))

(declare-fun res!237508 () Bool)

(assert (=> b!287121 (=> res!237508 e!204452)))

(assert (=> b!287121 (= res!237508 (or (bvsgt from!773 (bvadd #b00000000000000000000000000000001 i!964)) (bvsgt (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(assert (=> b!287121 (arrayRangesEq!1415 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19961 0))(
  ( (Unit!19962) )
))
(declare-fun lt!418704 () Unit!19961)

(declare-fun arrayRangesEqAppend!21 (array!16860 array!16860 (_ BitVec 32) (_ BitVec 32)) Unit!19961)

(assert (=> b!287121 (= lt!418704 (arrayRangesEqAppend!21 a1!647 a3!68 from!773 i!964))))

(declare-fun mapNonEmpty!1884 () Bool)

(declare-fun tp!1885 () Bool)

(assert (=> mapNonEmpty!1884 (= mapRes!1885 (and tp!1885 tp_is_empty!579))))

(declare-fun mapKey!1884 () (_ BitVec 32))

(declare-fun mapValue!1884 () T!51985)

(declare-fun mapRest!1884 () (Array (_ BitVec 32) T!51985))

(assert (=> mapNonEmpty!1884 (= (arr!8276 a1!647) (store mapRest!1884 mapKey!1884 mapValue!1884))))

(declare-fun b!287122 () Bool)

(declare-fun res!237501 () Bool)

(assert (=> b!287122 (=> (not res!237501) (not e!204455))))

(assert (=> b!287122 (= res!237501 (arrayRangesEq!1415 a1!647 a3!68 from!773 i!964))))

(declare-fun b!287123 () Bool)

(declare-fun res!237503 () Bool)

(assert (=> b!287123 (=> (not res!237503) (not e!204455))))

(assert (=> b!287123 (= res!237503 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun res!237511 () Bool)

(assert (=> start!64154 (=> (not res!237511) (not e!204455))))

(assert (=> start!64154 (= res!237511 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7280 a1!647) (size!7280 a2!647)) (bvsle (size!7280 a2!647) (size!7280 a3!68)) (bvsle mid!71 (size!7280 a1!647)) (bvsle to!740 (size!7280 a2!647))))))

(assert (=> start!64154 e!204455))

(declare-fun array_inv!6930 (array!16860) Bool)

(assert (=> start!64154 (and (array_inv!6930 a2!647) e!204453)))

(assert (=> start!64154 true))

(declare-fun e!204454 () Bool)

(assert (=> start!64154 (and (array_inv!6930 a1!647) e!204454)))

(declare-fun e!204451 () Bool)

(assert (=> start!64154 (and (array_inv!6930 a3!68) e!204451)))

(declare-fun b!287124 () Bool)

(assert (=> b!287124 (= e!204452 true)))

(assert (=> b!287124 (arrayRangesEq!1415 a1!647 a3!68 from!773 mid!71)))

(declare-fun lt!418703 () Unit!19961)

(declare-fun rec!69 (array!16860 array!16860 array!16860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19961)

(assert (=> b!287124 (= lt!418703 (rec!69 a1!647 a2!647 a3!68 from!773 mid!71 to!740 (bvadd #b00000000000000000000000000000001 i!964)))))

(declare-fun mapIsEmpty!1884 () Bool)

(assert (=> mapIsEmpty!1884 mapRes!1884))

(declare-fun mapNonEmpty!1885 () Bool)

(declare-fun tp!1884 () Bool)

(assert (=> mapNonEmpty!1885 (= mapRes!1884 (and tp!1884 tp_is_empty!579))))

(declare-fun mapRest!1883 () (Array (_ BitVec 32) T!51985))

(declare-fun mapValue!1883 () T!51985)

(declare-fun mapKey!1885 () (_ BitVec 32))

(assert (=> mapNonEmpty!1885 (= (arr!8276 a2!647) (store mapRest!1883 mapKey!1885 mapValue!1883))))

(declare-fun b!287125 () Bool)

(assert (=> b!287125 (= e!204454 (and tp_is_empty!579 mapRes!1885))))

(declare-fun condMapEmpty!1884 () Bool)

(declare-fun mapDefault!1885 () T!51985)

(assert (=> b!287125 (= condMapEmpty!1884 (= (arr!8276 a1!647) ((as const (Array (_ BitVec 32) T!51985)) mapDefault!1885)))))

(declare-fun mapIsEmpty!1885 () Bool)

(assert (=> mapIsEmpty!1885 mapRes!1883))

(declare-fun b!287126 () Bool)

(assert (=> b!287126 (= e!204451 (and tp_is_empty!579 mapRes!1883))))

(declare-fun condMapEmpty!1883 () Bool)

(declare-fun mapDefault!1883 () T!51985)

(assert (=> b!287126 (= condMapEmpty!1883 (= (arr!8276 a3!68) ((as const (Array (_ BitVec 32) T!51985)) mapDefault!1883)))))

(declare-fun b!287127 () Bool)

(declare-fun res!237505 () Bool)

(assert (=> b!287127 (=> (not res!237505) (not e!204455))))

(assert (=> b!287127 (= res!237505 (arrayRangesEq!1415 a2!647 a3!68 from!773 to!740))))

(declare-fun b!287128 () Bool)

(declare-fun res!237502 () Bool)

(assert (=> b!287128 (=> res!237502 e!204452)))

(assert (=> b!287128 (= res!237502 (not (arrayRangesEq!1415 a1!647 a2!647 (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(assert (= (and start!64154 res!237511) b!287115))

(assert (= (and b!287115 res!237504) b!287127))

(assert (= (and b!287127 res!237505) b!287123))

(assert (= (and b!287123 res!237503) b!287120))

(assert (= (and b!287120 res!237507) b!287119))

(assert (= (and b!287119 res!237506) b!287122))

(assert (= (and b!287122 res!237501) b!287116))

(assert (= (and b!287116 res!237510) b!287121))

(assert (= (and b!287121 (not res!237508)) b!287128))

(assert (= (and b!287128 (not res!237502)) b!287117))

(assert (= (and b!287117 (not res!237509)) b!287124))

(assert (= (and b!287118 condMapEmpty!1885) mapIsEmpty!1884))

(assert (= (and b!287118 (not condMapEmpty!1885)) mapNonEmpty!1885))

(assert (= start!64154 b!287118))

(assert (= (and b!287125 condMapEmpty!1884) mapIsEmpty!1883))

(assert (= (and b!287125 (not condMapEmpty!1884)) mapNonEmpty!1884))

(assert (= start!64154 b!287125))

(assert (= (and b!287126 condMapEmpty!1883) mapIsEmpty!1885))

(assert (= (and b!287126 (not condMapEmpty!1883)) mapNonEmpty!1883))

(assert (= start!64154 b!287126))

(declare-fun m!419773 () Bool)

(assert (=> b!287122 m!419773))

(declare-fun m!419775 () Bool)

(assert (=> b!287119 m!419775))

(declare-fun m!419777 () Bool)

(assert (=> mapNonEmpty!1885 m!419777))

(declare-fun m!419779 () Bool)

(assert (=> b!287127 m!419779))

(declare-fun m!419781 () Bool)

(assert (=> b!287124 m!419781))

(declare-fun m!419783 () Bool)

(assert (=> b!287124 m!419783))

(declare-fun m!419785 () Bool)

(assert (=> mapNonEmpty!1883 m!419785))

(declare-fun m!419787 () Bool)

(assert (=> b!287120 m!419787))

(declare-fun m!419789 () Bool)

(assert (=> b!287115 m!419789))

(declare-fun m!419791 () Bool)

(assert (=> start!64154 m!419791))

(declare-fun m!419793 () Bool)

(assert (=> start!64154 m!419793))

(declare-fun m!419795 () Bool)

(assert (=> start!64154 m!419795))

(declare-fun m!419797 () Bool)

(assert (=> b!287121 m!419797))

(declare-fun m!419799 () Bool)

(assert (=> b!287121 m!419799))

(declare-fun m!419801 () Bool)

(assert (=> mapNonEmpty!1884 m!419801))

(declare-fun m!419803 () Bool)

(assert (=> b!287117 m!419803))

(declare-fun m!419805 () Bool)

(assert (=> b!287128 m!419805))

(check-sat (not mapNonEmpty!1883) (not b!287119) (not b!287117) (not b!287124) (not b!287120) tp_is_empty!579 (not b!287122) (not start!64154) (not b!287127) (not b!287128) (not b!287121) (not mapNonEmpty!1885) (not b!287115) (not mapNonEmpty!1884))
(check-sat)
