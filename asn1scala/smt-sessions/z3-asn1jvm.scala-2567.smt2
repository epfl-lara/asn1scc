; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64190 () Bool)

(assert start!64190)

(declare-fun b!287407 () Bool)

(declare-fun e!204614 () Bool)

(declare-fun tp_is_empty!615 () Bool)

(declare-fun mapRes!1995 () Bool)

(assert (=> b!287407 (= e!204614 (and tp_is_empty!615 mapRes!1995))))

(declare-fun condMapEmpty!1996 () Bool)

(declare-datatypes ((T!52141 0))(
  ( (T!52142 (val!307 Int)) )
))
(declare-datatypes ((array!16896 0))(
  ( (array!16897 (arr!8294 (Array (_ BitVec 32) T!52141)) (size!7298 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16896)

(declare-fun mapDefault!1995 () T!52141)

(assert (=> b!287407 (= condMapEmpty!1996 (= (arr!8294 a2!580) ((as const (Array (_ BitVec 32) T!52141)) mapDefault!1995)))))

(declare-fun res!237682 () Bool)

(declare-fun e!204612 () Bool)

(assert (=> start!64190 (=> (not res!237682) (not e!204612))))

(declare-fun to!673 () (_ BitVec 32))

(declare-fun from!706 () (_ BitVec 32))

(declare-fun a1!580 () array!16896)

(assert (=> start!64190 (= res!237682 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7298 a1!580) (size!7298 a2!580)) (bvslt to!673 (size!7298 a1!580))))))

(assert (=> start!64190 e!204612))

(assert (=> start!64190 true))

(declare-fun e!204613 () Bool)

(declare-fun array_inv!6940 (array!16896) Bool)

(assert (=> start!64190 (and (array_inv!6940 a1!580) e!204613)))

(assert (=> start!64190 (and (array_inv!6940 a2!580) e!204614)))

(declare-fun b!287408 () Bool)

(declare-fun mapRes!1996 () Bool)

(assert (=> b!287408 (= e!204613 (and tp_is_empty!615 mapRes!1996))))

(declare-fun condMapEmpty!1995 () Bool)

(declare-fun mapDefault!1996 () T!52141)

(assert (=> b!287408 (= condMapEmpty!1995 (= (arr!8294 a1!580) ((as const (Array (_ BitVec 32) T!52141)) mapDefault!1996)))))

(declare-fun b!287409 () Bool)

(declare-fun res!237681 () Bool)

(assert (=> b!287409 (=> (not res!237681) (not e!204612))))

(declare-fun arrayRangesEq!1424 (array!16896 array!16896 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287409 (= res!237681 (arrayRangesEq!1424 a1!580 a2!580 from!706 to!673))))

(declare-fun mapIsEmpty!1995 () Bool)

(assert (=> mapIsEmpty!1995 mapRes!1996))

(declare-fun mapIsEmpty!1996 () Bool)

(assert (=> mapIsEmpty!1996 mapRes!1995))

(declare-fun mapNonEmpty!1995 () Bool)

(declare-fun tp!1996 () Bool)

(assert (=> mapNonEmpty!1995 (= mapRes!1995 (and tp!1996 tp_is_empty!615))))

(declare-fun mapKey!1995 () (_ BitVec 32))

(declare-fun mapRest!1996 () (Array (_ BitVec 32) T!52141))

(declare-fun mapValue!1996 () T!52141)

(assert (=> mapNonEmpty!1995 (= (arr!8294 a2!580) (store mapRest!1996 mapKey!1995 mapValue!1996))))

(declare-fun mapNonEmpty!1996 () Bool)

(declare-fun tp!1995 () Bool)

(assert (=> mapNonEmpty!1996 (= mapRes!1996 (and tp!1995 tp_is_empty!615))))

(declare-fun mapKey!1996 () (_ BitVec 32))

(declare-fun mapValue!1995 () T!52141)

(declare-fun mapRest!1995 () (Array (_ BitVec 32) T!52141))

(assert (=> mapNonEmpty!1996 (= (arr!8294 a1!580) (store mapRest!1995 mapKey!1996 mapValue!1995))))

(declare-fun b!287410 () Bool)

(assert (=> b!287410 (= e!204612 (or (bvslt to!673 #b00000000000000000000000000000000) (bvsge to!673 (size!7298 a2!580))))))

(assert (= (and start!64190 res!237682) b!287409))

(assert (= (and b!287409 res!237681) b!287410))

(assert (= (and b!287408 condMapEmpty!1995) mapIsEmpty!1995))

(assert (= (and b!287408 (not condMapEmpty!1995)) mapNonEmpty!1996))

(assert (= start!64190 b!287408))

(assert (= (and b!287407 condMapEmpty!1996) mapIsEmpty!1996))

(assert (= (and b!287407 (not condMapEmpty!1996)) mapNonEmpty!1995))

(assert (= start!64190 b!287407))

(declare-fun m!420085 () Bool)

(assert (=> start!64190 m!420085))

(declare-fun m!420087 () Bool)

(assert (=> start!64190 m!420087))

(declare-fun m!420089 () Bool)

(assert (=> b!287409 m!420089))

(declare-fun m!420091 () Bool)

(assert (=> mapNonEmpty!1995 m!420091))

(declare-fun m!420093 () Bool)

(assert (=> mapNonEmpty!1996 m!420093))

(check-sat (not mapNonEmpty!1995) (not start!64190) (not b!287409) tp_is_empty!615 (not mapNonEmpty!1996))
(check-sat)
