; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64218 () Bool)

(assert start!64218)

(declare-fun res!237810 () Bool)

(declare-fun e!204733 () Bool)

(assert (=> start!64218 (=> (not res!237810) (not e!204733))))

(declare-datatypes ((T!52245 0))(
  ( (T!52246 (val!319 Int)) )
))
(declare-datatypes ((array!16921 0))(
  ( (array!16922 (arr!8306 (Array (_ BitVec 32) T!52245)) (size!7310 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16921)

(declare-fun a2!596 () array!16921)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64218 (= res!237810 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7310 a1!596) (size!7310 a2!596)) (bvslt to!689 (size!7310 a1!596))))))

(assert (=> start!64218 e!204733))

(declare-fun e!204732 () Bool)

(declare-fun array_inv!6948 (array!16921) Bool)

(assert (=> start!64218 (and (array_inv!6948 a1!596) e!204732)))

(declare-fun e!204734 () Bool)

(assert (=> start!64218 (and (array_inv!6948 a2!596) e!204734)))

(assert (=> start!64218 true))

(declare-fun b!287610 () Bool)

(declare-fun tp_is_empty!639 () Bool)

(declare-fun mapRes!2074 () Bool)

(assert (=> b!287610 (= e!204732 (and tp_is_empty!639 mapRes!2074))))

(declare-fun condMapEmpty!2073 () Bool)

(declare-fun mapDefault!2073 () T!52245)

(assert (=> b!287610 (= condMapEmpty!2073 (= (arr!8306 a1!596) ((as const (Array (_ BitVec 32) T!52245)) mapDefault!2073)))))

(declare-fun mapNonEmpty!2073 () Bool)

(declare-fun tp!2074 () Bool)

(assert (=> mapNonEmpty!2073 (= mapRes!2074 (and tp!2074 tp_is_empty!639))))

(declare-fun mapRest!2073 () (Array (_ BitVec 32) T!52245))

(declare-fun mapValue!2073 () T!52245)

(declare-fun mapKey!2074 () (_ BitVec 32))

(assert (=> mapNonEmpty!2073 (= (arr!8306 a1!596) (store mapRest!2073 mapKey!2074 mapValue!2073))))

(declare-fun b!287611 () Bool)

(declare-fun mapRes!2073 () Bool)

(assert (=> b!287611 (= e!204734 (and tp_is_empty!639 mapRes!2073))))

(declare-fun condMapEmpty!2074 () Bool)

(declare-fun mapDefault!2074 () T!52245)

(assert (=> b!287611 (= condMapEmpty!2074 (= (arr!8306 a2!596) ((as const (Array (_ BitVec 32) T!52245)) mapDefault!2074)))))

(declare-fun mapIsEmpty!2073 () Bool)

(assert (=> mapIsEmpty!2073 mapRes!2073))

(declare-fun b!287612 () Bool)

(declare-fun res!237811 () Bool)

(assert (=> b!287612 (=> (not res!237811) (not e!204733))))

(declare-fun arrayRangesEq!1433 (array!16921 array!16921 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287612 (= res!237811 (arrayRangesEq!1433 a1!596 a2!596 from!722 to!689))))

(declare-fun mapIsEmpty!2074 () Bool)

(assert (=> mapIsEmpty!2074 mapRes!2074))

(declare-fun mapNonEmpty!2074 () Bool)

(declare-fun tp!2073 () Bool)

(assert (=> mapNonEmpty!2074 (= mapRes!2073 (and tp!2073 tp_is_empty!639))))

(declare-fun mapValue!2074 () T!52245)

(declare-fun mapKey!2073 () (_ BitVec 32))

(declare-fun mapRest!2074 () (Array (_ BitVec 32) T!52245))

(assert (=> mapNonEmpty!2074 (= (arr!8306 a2!596) (store mapRest!2074 mapKey!2073 mapValue!2074))))

(declare-fun b!287613 () Bool)

(declare-fun i!953 () (_ BitVec 32))

(assert (=> b!287613 (= e!204733 (and (= (select (arr!8306 a1!596) to!689) (select (arr!8306 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689) (or (bvsgt #b00000000000000000000000000000000 i!953) (bvsgt i!953 (bvadd #b00000000000000000000000000000001 to!689)))))))

(assert (= (and start!64218 res!237810) b!287612))

(assert (= (and b!287612 res!237811) b!287613))

(assert (= (and b!287610 condMapEmpty!2073) mapIsEmpty!2074))

(assert (= (and b!287610 (not condMapEmpty!2073)) mapNonEmpty!2073))

(assert (= start!64218 b!287610))

(assert (= (and b!287611 condMapEmpty!2074) mapIsEmpty!2073))

(assert (= (and b!287611 (not condMapEmpty!2074)) mapNonEmpty!2074))

(assert (= start!64218 b!287611))

(declare-fun m!420315 () Bool)

(assert (=> b!287613 m!420315))

(declare-fun m!420317 () Bool)

(assert (=> b!287613 m!420317))

(declare-fun m!420319 () Bool)

(assert (=> mapNonEmpty!2074 m!420319))

(declare-fun m!420321 () Bool)

(assert (=> start!64218 m!420321))

(declare-fun m!420323 () Bool)

(assert (=> start!64218 m!420323))

(declare-fun m!420325 () Bool)

(assert (=> b!287612 m!420325))

(declare-fun m!420327 () Bool)

(assert (=> mapNonEmpty!2073 m!420327))

(check-sat (not mapNonEmpty!2073) (not start!64218) (not mapNonEmpty!2074) tp_is_empty!639 (not b!287612))
(check-sat)
