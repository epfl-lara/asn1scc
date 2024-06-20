; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64184 () Bool)

(assert start!64184)

(declare-fun b!287371 () Bool)

(declare-fun e!204586 () Bool)

(declare-fun to!673 () (_ BitVec 32))

(assert (=> b!287371 (= e!204586 (bvslt to!673 #b00000000000000000000000000000000))))

(declare-fun res!237663 () Bool)

(assert (=> start!64184 (=> (not res!237663) (not e!204586))))

(declare-fun from!706 () (_ BitVec 32))

(declare-datatypes ((T!52115 0))(
  ( (T!52116 (val!304 Int)) )
))
(declare-datatypes ((array!16890 0))(
  ( (array!16891 (arr!8291 (Array (_ BitVec 32) T!52115)) (size!7295 (_ BitVec 32))) )
))
(declare-fun a2!580 () array!16890)

(declare-fun a1!580 () array!16890)

(assert (=> start!64184 (= res!237663 (and (bvsle #b00000000000000000000000000000000 from!706) (bvsle from!706 to!673) (bvsle (size!7295 a1!580) (size!7295 a2!580)) (bvslt to!673 (size!7295 a1!580))))))

(assert (=> start!64184 e!204586))

(assert (=> start!64184 true))

(declare-fun e!204585 () Bool)

(declare-fun array_inv!6938 (array!16890) Bool)

(assert (=> start!64184 (and (array_inv!6938 a1!580) e!204585)))

(declare-fun e!204587 () Bool)

(assert (=> start!64184 (and (array_inv!6938 a2!580) e!204587)))

(declare-fun b!287372 () Bool)

(declare-fun tp_is_empty!609 () Bool)

(declare-fun mapRes!1978 () Bool)

(assert (=> b!287372 (= e!204587 (and tp_is_empty!609 mapRes!1978))))

(declare-fun condMapEmpty!1977 () Bool)

(declare-fun mapDefault!1977 () T!52115)

(assert (=> b!287372 (= condMapEmpty!1977 (= (arr!8291 a2!580) ((as const (Array (_ BitVec 32) T!52115)) mapDefault!1977)))))

(declare-fun b!287373 () Bool)

(declare-fun mapRes!1977 () Bool)

(assert (=> b!287373 (= e!204585 (and tp_is_empty!609 mapRes!1977))))

(declare-fun condMapEmpty!1978 () Bool)

(declare-fun mapDefault!1978 () T!52115)

(assert (=> b!287373 (= condMapEmpty!1978 (= (arr!8291 a1!580) ((as const (Array (_ BitVec 32) T!52115)) mapDefault!1978)))))

(declare-fun mapIsEmpty!1977 () Bool)

(assert (=> mapIsEmpty!1977 mapRes!1977))

(declare-fun mapNonEmpty!1977 () Bool)

(declare-fun tp!1977 () Bool)

(assert (=> mapNonEmpty!1977 (= mapRes!1977 (and tp!1977 tp_is_empty!609))))

(declare-fun mapRest!1977 () (Array (_ BitVec 32) T!52115))

(declare-fun mapValue!1977 () T!52115)

(declare-fun mapKey!1977 () (_ BitVec 32))

(assert (=> mapNonEmpty!1977 (= (arr!8291 a1!580) (store mapRest!1977 mapKey!1977 mapValue!1977))))

(declare-fun mapNonEmpty!1978 () Bool)

(declare-fun tp!1978 () Bool)

(assert (=> mapNonEmpty!1978 (= mapRes!1978 (and tp!1978 tp_is_empty!609))))

(declare-fun mapRest!1978 () (Array (_ BitVec 32) T!52115))

(declare-fun mapValue!1978 () T!52115)

(declare-fun mapKey!1978 () (_ BitVec 32))

(assert (=> mapNonEmpty!1978 (= (arr!8291 a2!580) (store mapRest!1978 mapKey!1978 mapValue!1978))))

(declare-fun mapIsEmpty!1978 () Bool)

(assert (=> mapIsEmpty!1978 mapRes!1978))

(declare-fun b!287374 () Bool)

(declare-fun res!237664 () Bool)

(assert (=> b!287374 (=> (not res!237664) (not e!204586))))

(declare-fun arrayRangesEq!1423 (array!16890 array!16890 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!287374 (= res!237664 (arrayRangesEq!1423 a1!580 a2!580 from!706 to!673))))

(assert (= (and start!64184 res!237663) b!287374))

(assert (= (and b!287374 res!237664) b!287371))

(assert (= (and b!287373 condMapEmpty!1978) mapIsEmpty!1977))

(assert (= (and b!287373 (not condMapEmpty!1978)) mapNonEmpty!1977))

(assert (= start!64184 b!287373))

(assert (= (and b!287372 condMapEmpty!1977) mapIsEmpty!1978))

(assert (= (and b!287372 (not condMapEmpty!1977)) mapNonEmpty!1978))

(assert (= start!64184 b!287372))

(declare-fun m!420055 () Bool)

(assert (=> start!64184 m!420055))

(declare-fun m!420057 () Bool)

(assert (=> start!64184 m!420057))

(declare-fun m!420059 () Bool)

(assert (=> mapNonEmpty!1977 m!420059))

(declare-fun m!420061 () Bool)

(assert (=> mapNonEmpty!1978 m!420061))

(declare-fun m!420063 () Bool)

(assert (=> b!287374 m!420063))

(check-sat (not b!287374) (not start!64184) tp_is_empty!609 (not mapNonEmpty!1977) (not mapNonEmpty!1978))
(check-sat)
