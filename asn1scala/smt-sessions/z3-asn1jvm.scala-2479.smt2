; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63120 () Bool)

(assert start!63120)

(declare-fun mapNonEmpty!694 () Bool)

(declare-fun mapRes!695 () Bool)

(declare-fun tp!694 () Bool)

(declare-fun tp_is_empty!285 () Bool)

(assert (=> mapNonEmpty!694 (= mapRes!695 (and tp!694 tp_is_empty!285))))

(declare-fun mapKey!694 () (_ BitVec 32))

(declare-datatypes ((T!50051 0))(
  ( (T!50052 (val!142 Int)) )
))
(declare-fun mapRest!695 () (Array (_ BitVec 32) T!50051))

(declare-datatypes ((array!16318 0))(
  ( (array!16319 (arr!8039 (Array (_ BitVec 32) T!50051)) (size!7043 (_ BitVec 32))) )
))
(declare-fun a1!463 () array!16318)

(declare-fun mapValue!695 () T!50051)

(assert (=> mapNonEmpty!694 (= (arr!8039 a1!463) (store mapRest!695 mapKey!694 mapValue!695))))

(declare-fun b!282498 () Bool)

(declare-fun e!201846 () Bool)

(assert (=> b!282498 (= e!201846 false)))

(declare-fun to!556 () (_ BitVec 32))

(declare-datatypes ((Unit!19809 0))(
  ( (Unit!19810) )
))
(declare-fun lt!417780 () Unit!19809)

(declare-fun from!589 () (_ BitVec 32))

(declare-fun a2!463 () array!16318)

(declare-fun rec!47 (array!16318 array!16318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19809)

(assert (=> b!282498 (= lt!417780 (rec!47 a1!463 a2!463 from!589 to!556 to!556))))

(declare-fun b!282499 () Bool)

(declare-fun e!201847 () Bool)

(assert (=> b!282499 (= e!201847 (and tp_is_empty!285 mapRes!695))))

(declare-fun condMapEmpty!695 () Bool)

(declare-fun mapDefault!694 () T!50051)

(assert (=> b!282499 (= condMapEmpty!695 (= (arr!8039 a1!463) ((as const (Array (_ BitVec 32) T!50051)) mapDefault!694)))))

(declare-fun mapIsEmpty!694 () Bool)

(assert (=> mapIsEmpty!694 mapRes!695))

(declare-fun mapNonEmpty!695 () Bool)

(declare-fun mapRes!694 () Bool)

(declare-fun tp!695 () Bool)

(assert (=> mapNonEmpty!695 (= mapRes!694 (and tp!695 tp_is_empty!285))))

(declare-fun mapKey!695 () (_ BitVec 32))

(declare-fun mapRest!694 () (Array (_ BitVec 32) T!50051))

(declare-fun mapValue!694 () T!50051)

(assert (=> mapNonEmpty!695 (= (arr!8039 a2!463) (store mapRest!694 mapKey!695 mapValue!694))))

(declare-fun b!282497 () Bool)

(declare-fun res!234336 () Bool)

(assert (=> b!282497 (=> (not res!234336) (not e!201846))))

(declare-fun arrayRangesEq!1309 (array!16318 array!16318 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!282497 (= res!234336 (arrayRangesEq!1309 a1!463 a2!463 from!589 to!556))))

(declare-fun res!234337 () Bool)

(assert (=> start!63120 (=> (not res!234337) (not e!201846))))

(assert (=> start!63120 (= res!234337 (and (bvsle #b00000000000000000000000000000000 from!589) (bvsle from!589 to!556) (bvsle to!556 (size!7043 a1!463)) (= (size!7043 a1!463) (size!7043 a2!463))))))

(assert (=> start!63120 e!201846))

(assert (=> start!63120 true))

(declare-fun array_inv!6764 (array!16318) Bool)

(assert (=> start!63120 (and (array_inv!6764 a1!463) e!201847)))

(declare-fun e!201848 () Bool)

(assert (=> start!63120 (and (array_inv!6764 a2!463) e!201848)))

(declare-fun b!282500 () Bool)

(assert (=> b!282500 (= e!201848 (and tp_is_empty!285 mapRes!694))))

(declare-fun condMapEmpty!694 () Bool)

(declare-fun mapDefault!695 () T!50051)

(assert (=> b!282500 (= condMapEmpty!694 (= (arr!8039 a2!463) ((as const (Array (_ BitVec 32) T!50051)) mapDefault!695)))))

(declare-fun mapIsEmpty!695 () Bool)

(assert (=> mapIsEmpty!695 mapRes!694))

(assert (= (and start!63120 res!234337) b!282497))

(assert (= (and b!282497 res!234336) b!282498))

(assert (= (and b!282499 condMapEmpty!695) mapIsEmpty!694))

(assert (= (and b!282499 (not condMapEmpty!695)) mapNonEmpty!694))

(assert (= start!63120 b!282499))

(assert (= (and b!282500 condMapEmpty!694) mapIsEmpty!695))

(assert (= (and b!282500 (not condMapEmpty!694)) mapNonEmpty!695))

(assert (= start!63120 b!282500))

(declare-fun m!415633 () Bool)

(assert (=> mapNonEmpty!694 m!415633))

(declare-fun m!415635 () Bool)

(assert (=> start!63120 m!415635))

(declare-fun m!415637 () Bool)

(assert (=> start!63120 m!415637))

(declare-fun m!415639 () Bool)

(assert (=> b!282497 m!415639))

(declare-fun m!415641 () Bool)

(assert (=> mapNonEmpty!695 m!415641))

(declare-fun m!415643 () Bool)

(assert (=> b!282498 m!415643))

(check-sat (not b!282497) (not mapNonEmpty!695) (not b!282498) (not start!63120) (not mapNonEmpty!694) tp_is_empty!285)
(check-sat)
