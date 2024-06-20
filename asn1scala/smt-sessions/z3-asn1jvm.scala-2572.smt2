; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64224 () Bool)

(assert start!64224)

(declare-fun mapNonEmpty!2091 () Bool)

(declare-fun mapRes!2091 () Bool)

(declare-fun tp!2092 () Bool)

(declare-fun tp_is_empty!645 () Bool)

(assert (=> mapNonEmpty!2091 (= mapRes!2091 (and tp!2092 tp_is_empty!645))))

(declare-fun mapKey!2092 () (_ BitVec 32))

(declare-datatypes ((T!52271 0))(
  ( (T!52272 (val!322 Int)) )
))
(declare-datatypes ((array!16927 0))(
  ( (array!16928 (arr!8309 (Array (_ BitVec 32) T!52271)) (size!7313 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16927)

(declare-fun mapRest!2092 () (Array (_ BitVec 32) T!52271))

(declare-fun mapValue!2092 () T!52271)

(assert (=> mapNonEmpty!2091 (= (arr!8309 a1!596) (store mapRest!2092 mapKey!2092 mapValue!2092))))

(declare-fun from!722 () (_ BitVec 32))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun e!204761 () Bool)

(declare-fun b!287656 () Bool)

(assert (=> b!287656 (= e!204761 (and (= i!953 from!722) (bvsgt from!722 (bvadd #b00000000000000000000000000000001 to!689))))))

(declare-fun b!287657 () Bool)

(declare-fun e!204760 () Bool)

(declare-fun mapRes!2092 () Bool)

(assert (=> b!287657 (= e!204760 (and tp_is_empty!645 mapRes!2092))))

(declare-fun condMapEmpty!2092 () Bool)

(declare-fun a2!596 () array!16927)

(declare-fun mapDefault!2092 () T!52271)

(assert (=> b!287657 (= condMapEmpty!2092 (= (arr!8309 a2!596) ((as const (Array (_ BitVec 32) T!52271)) mapDefault!2092)))))

(declare-fun b!287658 () Bool)

(declare-fun res!237840 () Bool)

(assert (=> b!287658 (=> (not res!237840) (not e!204761))))

(declare-fun arrayRangesEq!1434 (array!16927 array!16927 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287658 (= res!237840 (arrayRangesEq!1434 a1!596 a2!596 from!722 to!689))))

(declare-fun b!287660 () Bool)

(declare-fun e!204759 () Bool)

(assert (=> b!287660 (= e!204759 (and tp_is_empty!645 mapRes!2091))))

(declare-fun condMapEmpty!2091 () Bool)

(declare-fun mapDefault!2091 () T!52271)

(assert (=> b!287660 (= condMapEmpty!2091 (= (arr!8309 a1!596) ((as const (Array (_ BitVec 32) T!52271)) mapDefault!2091)))))

(declare-fun mapIsEmpty!2091 () Bool)

(assert (=> mapIsEmpty!2091 mapRes!2092))

(declare-fun mapIsEmpty!2092 () Bool)

(assert (=> mapIsEmpty!2092 mapRes!2091))

(declare-fun mapNonEmpty!2092 () Bool)

(declare-fun tp!2091 () Bool)

(assert (=> mapNonEmpty!2092 (= mapRes!2092 (and tp!2091 tp_is_empty!645))))

(declare-fun mapValue!2091 () T!52271)

(declare-fun mapKey!2091 () (_ BitVec 32))

(declare-fun mapRest!2091 () (Array (_ BitVec 32) T!52271))

(assert (=> mapNonEmpty!2092 (= (arr!8309 a2!596) (store mapRest!2091 mapKey!2091 mapValue!2091))))

(declare-fun b!287661 () Bool)

(declare-fun res!237839 () Bool)

(assert (=> b!287661 (=> (not res!237839) (not e!204761))))

(assert (=> b!287661 (= res!237839 (and (= (select (arr!8309 a1!596) to!689) (select (arr!8309 a2!596) to!689)) (bvsle i!953 to!689)))))

(declare-fun res!237838 () Bool)

(assert (=> start!64224 (=> (not res!237838) (not e!204761))))

(assert (=> start!64224 (= res!237838 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7313 a1!596) (size!7313 a2!596)) (bvslt to!689 (size!7313 a1!596))))))

(assert (=> start!64224 e!204761))

(declare-fun array_inv!6949 (array!16927) Bool)

(assert (=> start!64224 (and (array_inv!6949 a1!596) e!204759)))

(assert (=> start!64224 (and (array_inv!6949 a2!596) e!204760)))

(assert (=> start!64224 true))

(declare-fun b!287659 () Bool)

(declare-fun res!237841 () Bool)

(assert (=> b!287659 (=> (not res!237841) (not e!204761))))

(assert (=> b!287659 (= res!237841 (arrayRangesEq!1434 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(assert (= (and start!64224 res!237838) b!287658))

(assert (= (and b!287658 res!237840) b!287661))

(assert (= (and b!287661 res!237839) b!287659))

(assert (= (and b!287659 res!237841) b!287656))

(assert (= (and b!287660 condMapEmpty!2091) mapIsEmpty!2092))

(assert (= (and b!287660 (not condMapEmpty!2091)) mapNonEmpty!2091))

(assert (= start!64224 b!287660))

(assert (= (and b!287657 condMapEmpty!2092) mapIsEmpty!2091))

(assert (= (and b!287657 (not condMapEmpty!2092)) mapNonEmpty!2092))

(assert (= start!64224 b!287657))

(declare-fun m!420359 () Bool)

(assert (=> mapNonEmpty!2092 m!420359))

(declare-fun m!420361 () Bool)

(assert (=> b!287658 m!420361))

(declare-fun m!420363 () Bool)

(assert (=> start!64224 m!420363))

(declare-fun m!420365 () Bool)

(assert (=> start!64224 m!420365))

(declare-fun m!420367 () Bool)

(assert (=> b!287661 m!420367))

(declare-fun m!420369 () Bool)

(assert (=> b!287661 m!420369))

(declare-fun m!420371 () Bool)

(assert (=> b!287659 m!420371))

(declare-fun m!420373 () Bool)

(assert (=> mapNonEmpty!2091 m!420373))

(check-sat tp_is_empty!645 (not mapNonEmpty!2092) (not b!287659) (not start!64224) (not b!287658) (not mapNonEmpty!2091))
(check-sat)
