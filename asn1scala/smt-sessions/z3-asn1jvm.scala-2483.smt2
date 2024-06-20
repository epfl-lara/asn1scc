; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63150 () Bool)

(assert start!63150)

(declare-fun mapIsEmpty!770 () Bool)

(declare-fun mapRes!770 () Bool)

(assert (=> mapIsEmpty!770 mapRes!770))

(declare-fun mapIsEmpty!771 () Bool)

(declare-fun mapRes!771 () Bool)

(assert (=> mapIsEmpty!771 mapRes!771))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun b!282657 () Bool)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun e!201965 () Bool)

(assert (=> b!282657 (= e!201965 (and (bvsle from!597 i!913) (bvsle i!913 to!564) (bvsgt #b00000000000000000000000000000000 i!913)))))

(declare-fun mapNonEmpty!770 () Bool)

(declare-fun tp!771 () Bool)

(declare-fun tp_is_empty!309 () Bool)

(assert (=> mapNonEmpty!770 (= mapRes!770 (and tp!771 tp_is_empty!309))))

(declare-fun mapKey!771 () (_ BitVec 32))

(declare-datatypes ((T!50155 0))(
  ( (T!50156 (val!154 Int)) )
))
(declare-datatypes ((array!16343 0))(
  ( (array!16344 (arr!8051 (Array (_ BitVec 32) T!50155)) (size!7055 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16343)

(declare-fun mapRest!771 () (Array (_ BitVec 32) T!50155))

(declare-fun mapValue!770 () T!50155)

(assert (=> mapNonEmpty!770 (= (arr!8051 a2!471) (store mapRest!771 mapKey!771 mapValue!770))))

(declare-fun b!282658 () Bool)

(declare-fun res!234416 () Bool)

(assert (=> b!282658 (=> (not res!234416) (not e!201965))))

(declare-fun a1!471 () array!16343)

(declare-fun arrayRangesEq!1315 (array!16343 array!16343 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282658 (= res!234416 (arrayRangesEq!1315 a1!471 a2!471 from!597 to!564))))

(declare-fun mapNonEmpty!771 () Bool)

(declare-fun tp!770 () Bool)

(assert (=> mapNonEmpty!771 (= mapRes!771 (and tp!770 tp_is_empty!309))))

(declare-fun mapRest!770 () (Array (_ BitVec 32) T!50155))

(declare-fun mapValue!771 () T!50155)

(declare-fun mapKey!770 () (_ BitVec 32))

(assert (=> mapNonEmpty!771 (= (arr!8051 a1!471) (store mapRest!770 mapKey!770 mapValue!771))))

(declare-fun b!282660 () Bool)

(declare-fun e!201967 () Bool)

(assert (=> b!282660 (= e!201967 (and tp_is_empty!309 mapRes!771))))

(declare-fun condMapEmpty!771 () Bool)

(declare-fun mapDefault!771 () T!50155)

(assert (=> b!282660 (= condMapEmpty!771 (= (arr!8051 a1!471) ((as const (Array (_ BitVec 32) T!50155)) mapDefault!771)))))

(declare-fun b!282659 () Bool)

(declare-fun e!201966 () Bool)

(assert (=> b!282659 (= e!201966 (and tp_is_empty!309 mapRes!770))))

(declare-fun condMapEmpty!770 () Bool)

(declare-fun mapDefault!770 () T!50155)

(assert (=> b!282659 (= condMapEmpty!770 (= (arr!8051 a2!471) ((as const (Array (_ BitVec 32) T!50155)) mapDefault!770)))))

(declare-fun res!234417 () Bool)

(assert (=> start!63150 (=> (not res!234417) (not e!201965))))

(assert (=> start!63150 (= res!234417 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7055 a1!471)) (= (size!7055 a1!471) (size!7055 a2!471))))))

(assert (=> start!63150 e!201965))

(declare-fun array_inv!6769 (array!16343) Bool)

(assert (=> start!63150 (and (array_inv!6769 a1!471) e!201967)))

(assert (=> start!63150 true))

(assert (=> start!63150 (and (array_inv!6769 a2!471) e!201966)))

(assert (= (and start!63150 res!234417) b!282658))

(assert (= (and b!282658 res!234416) b!282657))

(assert (= (and b!282660 condMapEmpty!771) mapIsEmpty!771))

(assert (= (and b!282660 (not condMapEmpty!771)) mapNonEmpty!771))

(assert (= start!63150 b!282660))

(assert (= (and b!282659 condMapEmpty!770) mapIsEmpty!770))

(assert (= (and b!282659 (not condMapEmpty!770)) mapNonEmpty!770))

(assert (= start!63150 b!282659))

(declare-fun m!415801 () Bool)

(assert (=> mapNonEmpty!770 m!415801))

(declare-fun m!415803 () Bool)

(assert (=> b!282658 m!415803))

(declare-fun m!415805 () Bool)

(assert (=> mapNonEmpty!771 m!415805))

(declare-fun m!415807 () Bool)

(assert (=> start!63150 m!415807))

(declare-fun m!415809 () Bool)

(assert (=> start!63150 m!415809))

(check-sat (not start!63150) tp_is_empty!309 (not b!282658) (not mapNonEmpty!770) (not mapNonEmpty!771))
(check-sat)
