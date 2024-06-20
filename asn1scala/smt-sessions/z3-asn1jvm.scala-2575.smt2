; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64242 () Bool)

(assert start!64242)

(declare-fun b!287851 () Bool)

(declare-fun e!204845 () Bool)

(declare-fun tp_is_empty!663 () Bool)

(declare-fun mapRes!2146 () Bool)

(assert (=> b!287851 (= e!204845 (and tp_is_empty!663 mapRes!2146))))

(declare-fun condMapEmpty!2146 () Bool)

(declare-datatypes ((T!52349 0))(
  ( (T!52350 (val!331 Int)) )
))
(declare-datatypes ((array!16945 0))(
  ( (array!16946 (arr!8318 (Array (_ BitVec 32) T!52349)) (size!7322 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16945)

(declare-fun mapDefault!2146 () T!52349)

(assert (=> b!287851 (= condMapEmpty!2146 (= (arr!8318 a2!596) ((as const (Array (_ BitVec 32) T!52349)) mapDefault!2146)))))

(declare-fun mapNonEmpty!2145 () Bool)

(declare-fun mapRes!2145 () Bool)

(declare-fun tp!2145 () Bool)

(assert (=> mapNonEmpty!2145 (= mapRes!2145 (and tp!2145 tp_is_empty!663))))

(declare-fun a1!596 () array!16945)

(declare-fun mapRest!2146 () (Array (_ BitVec 32) T!52349))

(declare-fun mapKey!2145 () (_ BitVec 32))

(declare-fun mapValue!2145 () T!52349)

(assert (=> mapNonEmpty!2145 (= (arr!8318 a1!596) (store mapRest!2146 mapKey!2145 mapValue!2145))))

(declare-fun mapNonEmpty!2146 () Bool)

(declare-fun tp!2146 () Bool)

(assert (=> mapNonEmpty!2146 (= mapRes!2146 (and tp!2146 tp_is_empty!663))))

(declare-fun mapRest!2145 () (Array (_ BitVec 32) T!52349))

(declare-fun mapValue!2146 () T!52349)

(declare-fun mapKey!2146 () (_ BitVec 32))

(assert (=> mapNonEmpty!2146 (= (arr!8318 a2!596) (store mapRest!2145 mapKey!2146 mapValue!2146))))

(declare-fun b!287852 () Bool)

(declare-fun e!204847 () Bool)

(declare-fun e!204846 () Bool)

(assert (=> b!287852 (= e!204847 (not e!204846))))

(declare-fun res!237982 () Bool)

(assert (=> b!287852 (=> res!237982 e!204846)))

(declare-fun from!722 () (_ BitVec 32))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> b!287852 (= res!237982 (or (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsgt (bvsub i!953 #b00000000000000000000000000000001) to!689)))))

(assert (=> b!287852 (= (select (arr!8318 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8318 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19989 0))(
  ( (Unit!19990) )
))
(declare-fun lt!418785 () Unit!19989)

(declare-fun arrayRangesEqImpliesEq!201 (array!16945 array!16945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19989)

(assert (=> b!287852 (= lt!418785 (arrayRangesEqImpliesEq!201 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun mapIsEmpty!2145 () Bool)

(assert (=> mapIsEmpty!2145 mapRes!2146))

(declare-fun b!287853 () Bool)

(declare-fun e!204848 () Bool)

(assert (=> b!287853 (= e!204848 (and tp_is_empty!663 mapRes!2145))))

(declare-fun condMapEmpty!2145 () Bool)

(declare-fun mapDefault!2145 () T!52349)

(assert (=> b!287853 (= condMapEmpty!2145 (= (arr!8318 a1!596) ((as const (Array (_ BitVec 32) T!52349)) mapDefault!2145)))))

(declare-fun b!287854 () Bool)

(declare-fun res!237981 () Bool)

(assert (=> b!287854 (=> (not res!237981) (not e!204847))))

(assert (=> b!287854 (= res!237981 (not (= i!953 from!722)))))

(declare-fun mapIsEmpty!2146 () Bool)

(assert (=> mapIsEmpty!2146 mapRes!2145))

(declare-fun res!237980 () Bool)

(assert (=> start!64242 (=> (not res!237980) (not e!204847))))

(assert (=> start!64242 (= res!237980 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7322 a1!596) (size!7322 a2!596)) (bvslt to!689 (size!7322 a1!596))))))

(assert (=> start!64242 e!204847))

(declare-fun array_inv!6954 (array!16945) Bool)

(assert (=> start!64242 (and (array_inv!6954 a1!596) e!204848)))

(assert (=> start!64242 (and (array_inv!6954 a2!596) e!204845)))

(assert (=> start!64242 true))

(declare-fun b!287855 () Bool)

(assert (=> b!287855 (= e!204846 (bvsle from!722 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun arrayRangesEq!1440 (array!16945 array!16945 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287855 (arrayRangesEq!1440 a1!596 a2!596 from!722 (bvadd #b00000000000000000000000000000001 to!689))))

(declare-fun lt!418784 () Unit!19989)

(declare-fun rec!80 (array!16945 array!16945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19989)

(assert (=> b!287855 (= lt!418784 (rec!80 a1!596 a2!596 from!722 to!689 (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-fun b!287856 () Bool)

(declare-fun res!237979 () Bool)

(assert (=> b!287856 (=> (not res!237979) (not e!204847))))

(assert (=> b!287856 (= res!237979 (arrayRangesEq!1440 a1!596 a2!596 from!722 to!689))))

(declare-fun b!287857 () Bool)

(declare-fun res!237984 () Bool)

(assert (=> b!287857 (=> (not res!237984) (not e!204847))))

(assert (=> b!287857 (= res!237984 (and (= (select (arr!8318 a1!596) to!689) (select (arr!8318 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!287858 () Bool)

(declare-fun res!237983 () Bool)

(assert (=> b!287858 (=> (not res!237983) (not e!204847))))

(assert (=> b!287858 (= res!237983 (arrayRangesEq!1440 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!287859 () Bool)

(declare-fun res!237985 () Bool)

(assert (=> b!287859 (=> res!237985 e!204846)))

(assert (=> b!287859 (= res!237985 (not (arrayRangesEq!1440 a1!596 a2!596 (bvsub i!953 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!689))))))

(assert (= (and start!64242 res!237980) b!287856))

(assert (= (and b!287856 res!237979) b!287857))

(assert (= (and b!287857 res!237984) b!287858))

(assert (= (and b!287858 res!237983) b!287854))

(assert (= (and b!287854 res!237981) b!287852))

(assert (= (and b!287852 (not res!237982)) b!287859))

(assert (= (and b!287859 (not res!237985)) b!287855))

(assert (= (and b!287853 condMapEmpty!2145) mapIsEmpty!2146))

(assert (= (and b!287853 (not condMapEmpty!2145)) mapNonEmpty!2145))

(assert (= start!64242 b!287853))

(assert (= (and b!287851 condMapEmpty!2146) mapIsEmpty!2145))

(assert (= (and b!287851 (not condMapEmpty!2146)) mapNonEmpty!2146))

(assert (= start!64242 b!287851))

(declare-fun m!420551 () Bool)

(assert (=> b!287859 m!420551))

(declare-fun m!420553 () Bool)

(assert (=> b!287856 m!420553))

(declare-fun m!420555 () Bool)

(assert (=> mapNonEmpty!2145 m!420555))

(declare-fun m!420557 () Bool)

(assert (=> start!64242 m!420557))

(declare-fun m!420559 () Bool)

(assert (=> start!64242 m!420559))

(declare-fun m!420561 () Bool)

(assert (=> b!287855 m!420561))

(declare-fun m!420563 () Bool)

(assert (=> b!287855 m!420563))

(declare-fun m!420565 () Bool)

(assert (=> b!287858 m!420565))

(declare-fun m!420567 () Bool)

(assert (=> b!287852 m!420567))

(declare-fun m!420569 () Bool)

(assert (=> b!287852 m!420569))

(declare-fun m!420571 () Bool)

(assert (=> b!287852 m!420571))

(declare-fun m!420573 () Bool)

(assert (=> b!287857 m!420573))

(declare-fun m!420575 () Bool)

(assert (=> b!287857 m!420575))

(declare-fun m!420577 () Bool)

(assert (=> mapNonEmpty!2146 m!420577))

(check-sat (not start!64242) (not mapNonEmpty!2146) tp_is_empty!663 (not b!287856) (not b!287859) (not b!287855) (not mapNonEmpty!2145) (not b!287852) (not b!287858))
(check-sat)
