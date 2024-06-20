; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63162 () Bool)

(assert start!63162)

(declare-fun res!234464 () Bool)

(declare-fun e!202019 () Bool)

(assert (=> start!63162 (=> (not res!234464) (not e!202019))))

(declare-datatypes ((T!50207 0))(
  ( (T!50208 (val!160 Int)) )
))
(declare-datatypes ((array!16355 0))(
  ( (array!16356 (arr!8057 (Array (_ BitVec 32) T!50207)) (size!7061 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16355)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16355)

(declare-fun from!597 () (_ BitVec 32))

(assert (=> start!63162 (= res!234464 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7061 a1!471)) (= (size!7061 a1!471) (size!7061 a2!471))))))

(assert (=> start!63162 e!202019))

(declare-fun e!202020 () Bool)

(declare-fun array_inv!6773 (array!16355) Bool)

(assert (=> start!63162 (and (array_inv!6773 a1!471) e!202020)))

(assert (=> start!63162 true))

(declare-fun e!202021 () Bool)

(assert (=> start!63162 (and (array_inv!6773 a2!471) e!202021)))

(declare-fun mapNonEmpty!806 () Bool)

(declare-fun mapRes!806 () Bool)

(declare-fun tp!807 () Bool)

(declare-fun tp_is_empty!321 () Bool)

(assert (=> mapNonEmpty!806 (= mapRes!806 (and tp!807 tp_is_empty!321))))

(declare-fun mapValue!806 () T!50207)

(declare-fun mapKey!807 () (_ BitVec 32))

(declare-fun mapRest!807 () (Array (_ BitVec 32) T!50207))

(assert (=> mapNonEmpty!806 (= (arr!8057 a1!471) (store mapRest!807 mapKey!807 mapValue!806))))

(declare-fun b!282739 () Bool)

(assert (=> b!282739 (= e!202020 (and tp_is_empty!321 mapRes!806))))

(declare-fun condMapEmpty!806 () Bool)

(declare-fun mapDefault!806 () T!50207)

(assert (=> b!282739 (= condMapEmpty!806 (= (arr!8057 a1!471) ((as const (Array (_ BitVec 32) T!50207)) mapDefault!806)))))

(declare-fun mapIsEmpty!806 () Bool)

(declare-fun mapRes!807 () Bool)

(assert (=> mapIsEmpty!806 mapRes!807))

(declare-fun b!282740 () Bool)

(declare-fun res!234462 () Bool)

(assert (=> b!282740 (=> (not res!234462) (not e!202019))))

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!282740 (= res!234462 (bvsle i!913 to!564))))

(declare-fun b!282741 () Bool)

(assert (=> b!282741 (= e!202019 (and (= i!913 from!597) (bvsgt to!564 (size!7061 a2!471))))))

(declare-fun mapNonEmpty!807 () Bool)

(declare-fun tp!806 () Bool)

(assert (=> mapNonEmpty!807 (= mapRes!807 (and tp!806 tp_is_empty!321))))

(declare-fun mapKey!806 () (_ BitVec 32))

(declare-fun mapRest!806 () (Array (_ BitVec 32) T!50207))

(declare-fun mapValue!807 () T!50207)

(assert (=> mapNonEmpty!807 (= (arr!8057 a2!471) (store mapRest!806 mapKey!806 mapValue!807))))

(declare-fun b!282742 () Bool)

(assert (=> b!282742 (= e!202021 (and tp_is_empty!321 mapRes!807))))

(declare-fun condMapEmpty!807 () Bool)

(declare-fun mapDefault!807 () T!50207)

(assert (=> b!282742 (= condMapEmpty!807 (= (arr!8057 a2!471) ((as const (Array (_ BitVec 32) T!50207)) mapDefault!807)))))

(declare-fun mapIsEmpty!807 () Bool)

(assert (=> mapIsEmpty!807 mapRes!806))

(declare-fun b!282743 () Bool)

(declare-fun res!234465 () Bool)

(assert (=> b!282743 (=> (not res!234465) (not e!202019))))

(declare-fun arrayRangesEq!1320 (array!16355 array!16355 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282743 (= res!234465 (arrayRangesEq!1320 a2!471 a1!471 i!913 to!564))))

(declare-fun b!282744 () Bool)

(declare-fun res!234463 () Bool)

(assert (=> b!282744 (=> (not res!234463) (not e!202019))))

(assert (=> b!282744 (= res!234463 (arrayRangesEq!1320 a1!471 a2!471 from!597 to!564))))

(assert (= (and start!63162 res!234464) b!282744))

(assert (= (and b!282744 res!234463) b!282740))

(assert (= (and b!282740 res!234462) b!282743))

(assert (= (and b!282743 res!234465) b!282741))

(assert (= (and b!282739 condMapEmpty!806) mapIsEmpty!807))

(assert (= (and b!282739 (not condMapEmpty!806)) mapNonEmpty!806))

(assert (= start!63162 b!282739))

(assert (= (and b!282742 condMapEmpty!807) mapIsEmpty!806))

(assert (= (and b!282742 (not condMapEmpty!807)) mapNonEmpty!807))

(assert (= start!63162 b!282742))

(declare-fun m!415863 () Bool)

(assert (=> start!63162 m!415863))

(declare-fun m!415865 () Bool)

(assert (=> start!63162 m!415865))

(declare-fun m!415867 () Bool)

(assert (=> mapNonEmpty!807 m!415867))

(declare-fun m!415869 () Bool)

(assert (=> b!282744 m!415869))

(declare-fun m!415871 () Bool)

(assert (=> mapNonEmpty!806 m!415871))

(declare-fun m!415873 () Bool)

(assert (=> b!282743 m!415873))

(check-sat (not mapNonEmpty!806) (not start!63162) (not mapNonEmpty!807) (not b!282743) (not b!282744) tp_is_empty!321)
(check-sat)
