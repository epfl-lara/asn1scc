; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63156 () Bool)

(assert start!63156)

(declare-fun mapIsEmpty!788 () Bool)

(declare-fun mapRes!789 () Bool)

(assert (=> mapIsEmpty!788 mapRes!789))

(declare-fun b!282693 () Bool)

(declare-fun res!234434 () Bool)

(declare-fun e!201994 () Bool)

(assert (=> b!282693 (=> (not res!234434) (not e!201994))))

(declare-datatypes ((T!50181 0))(
  ( (T!50182 (val!157 Int)) )
))
(declare-datatypes ((array!16349 0))(
  ( (array!16350 (arr!8054 (Array (_ BitVec 32) T!50181)) (size!7058 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16349)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16349)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun arrayRangesEq!1317 (array!16349 array!16349 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282693 (= res!234434 (arrayRangesEq!1317 a1!471 a2!471 from!597 to!564))))

(declare-fun mapIsEmpty!789 () Bool)

(declare-fun mapRes!788 () Bool)

(assert (=> mapIsEmpty!789 mapRes!788))

(declare-fun b!282694 () Bool)

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!282694 (= e!201994 (and (bvsle from!597 i!913) (bvsle i!913 to!564) (bvsle #b00000000000000000000000000000000 i!913) (bvsgt to!564 (size!7058 a2!471))))))

(declare-fun b!282695 () Bool)

(declare-fun e!201992 () Bool)

(declare-fun tp_is_empty!315 () Bool)

(assert (=> b!282695 (= e!201992 (and tp_is_empty!315 mapRes!788))))

(declare-fun condMapEmpty!789 () Bool)

(declare-fun mapDefault!789 () T!50181)

(assert (=> b!282695 (= condMapEmpty!789 (= (arr!8054 a2!471) ((as const (Array (_ BitVec 32) T!50181)) mapDefault!789)))))

(declare-fun mapNonEmpty!788 () Bool)

(declare-fun tp!789 () Bool)

(assert (=> mapNonEmpty!788 (= mapRes!788 (and tp!789 tp_is_empty!315))))

(declare-fun mapRest!789 () (Array (_ BitVec 32) T!50181))

(declare-fun mapKey!789 () (_ BitVec 32))

(declare-fun mapValue!788 () T!50181)

(assert (=> mapNonEmpty!788 (= (arr!8054 a2!471) (store mapRest!789 mapKey!789 mapValue!788))))

(declare-fun res!234435 () Bool)

(assert (=> start!63156 (=> (not res!234435) (not e!201994))))

(assert (=> start!63156 (= res!234435 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7058 a1!471)) (= (size!7058 a1!471) (size!7058 a2!471))))))

(assert (=> start!63156 e!201994))

(declare-fun e!201993 () Bool)

(declare-fun array_inv!6770 (array!16349) Bool)

(assert (=> start!63156 (and (array_inv!6770 a1!471) e!201993)))

(assert (=> start!63156 true))

(assert (=> start!63156 (and (array_inv!6770 a2!471) e!201992)))

(declare-fun b!282696 () Bool)

(assert (=> b!282696 (= e!201993 (and tp_is_empty!315 mapRes!789))))

(declare-fun condMapEmpty!788 () Bool)

(declare-fun mapDefault!788 () T!50181)

(assert (=> b!282696 (= condMapEmpty!788 (= (arr!8054 a1!471) ((as const (Array (_ BitVec 32) T!50181)) mapDefault!788)))))

(declare-fun mapNonEmpty!789 () Bool)

(declare-fun tp!788 () Bool)

(assert (=> mapNonEmpty!789 (= mapRes!789 (and tp!788 tp_is_empty!315))))

(declare-fun mapRest!788 () (Array (_ BitVec 32) T!50181))

(declare-fun mapValue!789 () T!50181)

(declare-fun mapKey!788 () (_ BitVec 32))

(assert (=> mapNonEmpty!789 (= (arr!8054 a1!471) (store mapRest!788 mapKey!788 mapValue!789))))

(assert (= (and start!63156 res!234435) b!282693))

(assert (= (and b!282693 res!234434) b!282694))

(assert (= (and b!282696 condMapEmpty!788) mapIsEmpty!788))

(assert (= (and b!282696 (not condMapEmpty!788)) mapNonEmpty!789))

(assert (= start!63156 b!282696))

(assert (= (and b!282695 condMapEmpty!789) mapIsEmpty!789))

(assert (= (and b!282695 (not condMapEmpty!789)) mapNonEmpty!788))

(assert (= start!63156 b!282695))

(declare-fun m!415831 () Bool)

(assert (=> b!282693 m!415831))

(declare-fun m!415833 () Bool)

(assert (=> mapNonEmpty!788 m!415833))

(declare-fun m!415835 () Bool)

(assert (=> start!63156 m!415835))

(declare-fun m!415837 () Bool)

(assert (=> start!63156 m!415837))

(declare-fun m!415839 () Bool)

(assert (=> mapNonEmpty!789 m!415839))

(check-sat (not mapNonEmpty!789) (not start!63156) (not b!282693) (not mapNonEmpty!788) tp_is_empty!315)
(check-sat)
