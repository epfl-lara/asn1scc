; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63204 () Bool)

(assert start!63204)

(declare-fun b!283129 () Bool)

(declare-fun res!234744 () Bool)

(declare-fun e!202201 () Bool)

(assert (=> b!283129 (=> (not res!234744) (not e!202201))))

(declare-datatypes ((T!50363 0))(
  ( (T!50364 (val!178 Int)) )
))
(declare-datatypes ((array!16392 0))(
  ( (array!16393 (arr!8075 (Array (_ BitVec 32) T!50363)) (size!7079 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16392)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun a2!471 () array!16392)

(declare-fun arrayRangesEq!1333 (array!16392 array!16392 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283129 (= res!234744 (arrayRangesEq!1333 a2!471 a1!471 i!913 to!564))))

(declare-fun b!283130 () Bool)

(assert (=> b!283130 (= e!202201 (bvslt i!913 #b00000000000000000000000000000000))))

(declare-fun b!283131 () Bool)

(declare-fun res!234743 () Bool)

(assert (=> b!283131 (=> (not res!234743) (not e!202201))))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283131 (= res!234743 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!283132 () Bool)

(declare-fun res!234745 () Bool)

(assert (=> b!283132 (=> (not res!234745) (not e!202201))))

(assert (=> b!283132 (= res!234745 (arrayRangesEq!1333 a1!471 a2!471 from!597 to!564))))

(declare-fun mapNonEmpty!918 () Bool)

(declare-fun mapRes!918 () Bool)

(declare-fun tp!919 () Bool)

(declare-fun tp_is_empty!357 () Bool)

(assert (=> mapNonEmpty!918 (= mapRes!918 (and tp!919 tp_is_empty!357))))

(declare-fun mapValue!919 () T!50363)

(declare-fun mapRest!918 () (Array (_ BitVec 32) T!50363))

(declare-fun mapKey!918 () (_ BitVec 32))

(assert (=> mapNonEmpty!918 (= (arr!8075 a2!471) (store mapRest!918 mapKey!918 mapValue!919))))

(declare-fun res!234742 () Bool)

(assert (=> start!63204 (=> (not res!234742) (not e!202201))))

(assert (=> start!63204 (= res!234742 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7079 a1!471)) (= (size!7079 a1!471) (size!7079 a2!471))))))

(assert (=> start!63204 e!202201))

(declare-fun e!202200 () Bool)

(declare-fun array_inv!6782 (array!16392) Bool)

(assert (=> start!63204 (and (array_inv!6782 a1!471) e!202200)))

(assert (=> start!63204 true))

(declare-fun e!202202 () Bool)

(assert (=> start!63204 (and (array_inv!6782 a2!471) e!202202)))

(declare-fun mapIsEmpty!918 () Bool)

(declare-fun mapRes!919 () Bool)

(assert (=> mapIsEmpty!918 mapRes!919))

(declare-fun b!283133 () Bool)

(assert (=> b!283133 (= e!202200 (and tp_is_empty!357 mapRes!919))))

(declare-fun condMapEmpty!919 () Bool)

(declare-fun mapDefault!918 () T!50363)

(assert (=> b!283133 (= condMapEmpty!919 (= (arr!8075 a1!471) ((as const (Array (_ BitVec 32) T!50363)) mapDefault!918)))))

(declare-fun mapNonEmpty!919 () Bool)

(declare-fun tp!918 () Bool)

(assert (=> mapNonEmpty!919 (= mapRes!919 (and tp!918 tp_is_empty!357))))

(declare-fun mapKey!919 () (_ BitVec 32))

(declare-fun mapRest!919 () (Array (_ BitVec 32) T!50363))

(declare-fun mapValue!918 () T!50363)

(assert (=> mapNonEmpty!919 (= (arr!8075 a1!471) (store mapRest!919 mapKey!919 mapValue!918))))

(declare-fun b!283134 () Bool)

(assert (=> b!283134 (= e!202202 (and tp_is_empty!357 mapRes!918))))

(declare-fun condMapEmpty!918 () Bool)

(declare-fun mapDefault!919 () T!50363)

(assert (=> b!283134 (= condMapEmpty!918 (= (arr!8075 a2!471) ((as const (Array (_ BitVec 32) T!50363)) mapDefault!919)))))

(declare-fun mapIsEmpty!919 () Bool)

(assert (=> mapIsEmpty!919 mapRes!918))

(assert (= (and start!63204 res!234742) b!283132))

(assert (= (and b!283132 res!234745) b!283131))

(assert (= (and b!283131 res!234743) b!283129))

(assert (= (and b!283129 res!234744) b!283130))

(assert (= (and b!283133 condMapEmpty!919) mapIsEmpty!918))

(assert (= (and b!283133 (not condMapEmpty!919)) mapNonEmpty!919))

(assert (= start!63204 b!283133))

(assert (= (and b!283134 condMapEmpty!918) mapIsEmpty!919))

(assert (= (and b!283134 (not condMapEmpty!918)) mapNonEmpty!918))

(assert (= start!63204 b!283134))

(declare-fun m!416213 () Bool)

(assert (=> b!283132 m!416213))

(declare-fun m!416215 () Bool)

(assert (=> start!63204 m!416215))

(declare-fun m!416217 () Bool)

(assert (=> start!63204 m!416217))

(declare-fun m!416219 () Bool)

(assert (=> mapNonEmpty!918 m!416219))

(declare-fun m!416221 () Bool)

(assert (=> mapNonEmpty!919 m!416221))

(declare-fun m!416223 () Bool)

(assert (=> b!283129 m!416223))

(check-sat tp_is_empty!357 (not mapNonEmpty!919) (not b!283129) (not b!283132) (not mapNonEmpty!918) (not start!63204))
(check-sat)
