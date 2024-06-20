; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63168 () Bool)

(assert start!63168)

(declare-fun mapNonEmpty!824 () Bool)

(declare-fun mapRes!825 () Bool)

(declare-fun tp!824 () Bool)

(declare-fun tp_is_empty!327 () Bool)

(assert (=> mapNonEmpty!824 (= mapRes!825 (and tp!824 tp_is_empty!327))))

(declare-datatypes ((T!50233 0))(
  ( (T!50234 (val!163 Int)) )
))
(declare-fun mapRest!825 () (Array (_ BitVec 32) T!50233))

(declare-fun mapValue!825 () T!50233)

(declare-fun mapKey!824 () (_ BitVec 32))

(declare-datatypes ((array!16361 0))(
  ( (array!16362 (arr!8060 (Array (_ BitVec 32) T!50233)) (size!7064 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16361)

(assert (=> mapNonEmpty!824 (= (arr!8060 a2!471) (store mapRest!825 mapKey!824 mapValue!825))))

(declare-fun mapIsEmpty!824 () Bool)

(assert (=> mapIsEmpty!824 mapRes!825))

(declare-fun b!282798 () Bool)

(declare-fun e!202046 () Bool)

(declare-fun mapRes!824 () Bool)

(assert (=> b!282798 (= e!202046 (and tp_is_empty!327 mapRes!824))))

(declare-fun condMapEmpty!824 () Bool)

(declare-fun a1!471 () array!16361)

(declare-fun mapDefault!824 () T!50233)

(assert (=> b!282798 (= condMapEmpty!824 (= (arr!8060 a1!471) ((as const (Array (_ BitVec 32) T!50233)) mapDefault!824)))))

(declare-fun b!282799 () Bool)

(declare-fun res!234505 () Bool)

(declare-fun e!202048 () Bool)

(assert (=> b!282799 (=> (not res!234505) (not e!202048))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!282799 (= res!234505 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!282800 () Bool)

(declare-fun res!234503 () Bool)

(assert (=> b!282800 (=> (not res!234503) (not e!202048))))

(declare-fun arrayRangesEq!1322 (array!16361 array!16361 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282800 (= res!234503 (arrayRangesEq!1322 a1!471 a2!471 from!597 to!564))))

(declare-fun b!282801 () Bool)

(declare-fun e!202047 () Bool)

(assert (=> b!282801 (= e!202047 (and tp_is_empty!327 mapRes!825))))

(declare-fun condMapEmpty!825 () Bool)

(declare-fun mapDefault!825 () T!50233)

(assert (=> b!282801 (= condMapEmpty!825 (= (arr!8060 a2!471) ((as const (Array (_ BitVec 32) T!50233)) mapDefault!825)))))

(declare-fun b!282802 () Bool)

(declare-fun res!234504 () Bool)

(assert (=> b!282802 (=> (not res!234504) (not e!202048))))

(assert (=> b!282802 (= res!234504 (not (= i!913 from!597)))))

(declare-fun mapIsEmpty!825 () Bool)

(assert (=> mapIsEmpty!825 mapRes!824))

(declare-fun b!282803 () Bool)

(declare-fun res!234507 () Bool)

(assert (=> b!282803 (=> (not res!234507) (not e!202048))))

(assert (=> b!282803 (= res!234507 (arrayRangesEq!1322 a2!471 a1!471 i!913 to!564))))

(declare-fun b!282804 () Bool)

(assert (=> b!282804 (= e!202048 (not (and (bvsle from!597 (bvsub i!913 #b00000000000000000000000000000001)) (bvsle (bvsub i!913 #b00000000000000000000000000000001) to!564))))))

(assert (=> b!282804 (= (select (arr!8060 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8060 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!19822 0))(
  ( (Unit!19823) )
))
(declare-fun lt!417828 () Unit!19822)

(declare-fun arrayRangesEqImpliesEq!186 (array!16361 array!16361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19822)

(assert (=> b!282804 (= lt!417828 (arrayRangesEqImpliesEq!186 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun mapNonEmpty!825 () Bool)

(declare-fun tp!825 () Bool)

(assert (=> mapNonEmpty!825 (= mapRes!824 (and tp!825 tp_is_empty!327))))

(declare-fun mapKey!825 () (_ BitVec 32))

(declare-fun mapValue!824 () T!50233)

(declare-fun mapRest!824 () (Array (_ BitVec 32) T!50233))

(assert (=> mapNonEmpty!825 (= (arr!8060 a1!471) (store mapRest!824 mapKey!825 mapValue!824))))

(declare-fun res!234506 () Bool)

(assert (=> start!63168 (=> (not res!234506) (not e!202048))))

(assert (=> start!63168 (= res!234506 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7064 a1!471)) (= (size!7064 a1!471) (size!7064 a2!471))))))

(assert (=> start!63168 e!202048))

(declare-fun array_inv!6775 (array!16361) Bool)

(assert (=> start!63168 (and (array_inv!6775 a1!471) e!202046)))

(assert (=> start!63168 true))

(assert (=> start!63168 (and (array_inv!6775 a2!471) e!202047)))

(assert (= (and start!63168 res!234506) b!282800))

(assert (= (and b!282800 res!234503) b!282799))

(assert (= (and b!282799 res!234505) b!282803))

(assert (= (and b!282803 res!234507) b!282802))

(assert (= (and b!282802 res!234504) b!282804))

(assert (= (and b!282798 condMapEmpty!824) mapIsEmpty!825))

(assert (= (and b!282798 (not condMapEmpty!824)) mapNonEmpty!825))

(assert (= start!63168 b!282798))

(assert (= (and b!282801 condMapEmpty!825) mapIsEmpty!824))

(assert (= (and b!282801 (not condMapEmpty!825)) mapNonEmpty!824))

(assert (= start!63168 b!282801))

(declare-fun m!415905 () Bool)

(assert (=> start!63168 m!415905))

(declare-fun m!415907 () Bool)

(assert (=> start!63168 m!415907))

(declare-fun m!415909 () Bool)

(assert (=> b!282800 m!415909))

(declare-fun m!415911 () Bool)

(assert (=> mapNonEmpty!824 m!415911))

(declare-fun m!415913 () Bool)

(assert (=> b!282804 m!415913))

(declare-fun m!415915 () Bool)

(assert (=> b!282804 m!415915))

(declare-fun m!415917 () Bool)

(assert (=> b!282804 m!415917))

(declare-fun m!415919 () Bool)

(assert (=> mapNonEmpty!825 m!415919))

(declare-fun m!415921 () Bool)

(assert (=> b!282803 m!415921))

(check-sat (not b!282800) (not b!282804) tp_is_empty!327 (not mapNonEmpty!824) (not mapNonEmpty!825) (not start!63168) (not b!282803))
(check-sat)
