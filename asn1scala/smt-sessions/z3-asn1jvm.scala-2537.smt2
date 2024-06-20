; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63994 () Bool)

(assert start!63994)

(declare-fun b!284662 () Bool)

(declare-fun e!203471 () Bool)

(declare-fun tp_is_empty!435 () Bool)

(declare-fun mapRes!1220 () Bool)

(assert (=> b!284662 (= e!203471 (and tp_is_empty!435 mapRes!1220))))

(declare-fun condMapEmpty!1222 () Bool)

(declare-datatypes ((T!51361 0))(
  ( (T!51362 (val!217 Int)) )
))
(declare-datatypes ((array!16713 0))(
  ( (array!16714 (arr!8204 (Array (_ BitVec 32) T!51361)) (size!7208 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16713)

(declare-fun mapDefault!1221 () T!51361)

(assert (=> b!284662 (= condMapEmpty!1222 (= (arr!8204 a1!647) ((as const (Array (_ BitVec 32) T!51361)) mapDefault!1221)))))

(declare-fun b!284663 () Bool)

(declare-fun e!203473 () Bool)

(declare-fun mapRes!1221 () Bool)

(assert (=> b!284663 (= e!203473 (and tp_is_empty!435 mapRes!1221))))

(declare-fun condMapEmpty!1221 () Bool)

(declare-fun a2!647 () array!16713)

(declare-fun mapDefault!1220 () T!51361)

(assert (=> b!284663 (= condMapEmpty!1221 (= (arr!8204 a2!647) ((as const (Array (_ BitVec 32) T!51361)) mapDefault!1220)))))

(declare-fun b!284664 () Bool)

(declare-fun res!235703 () Bool)

(declare-fun e!203470 () Bool)

(assert (=> b!284664 (=> (not res!235703) (not e!203470))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16713)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1357 (array!16713 array!16713 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284664 (= res!235703 (arrayRangesEq!1357 a2!647 a3!68 from!773 to!740))))

(declare-fun res!235704 () Bool)

(assert (=> start!63994 (=> (not res!235704) (not e!203470))))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> start!63994 (= res!235704 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7208 a1!647) (size!7208 a2!647)) (bvsle (size!7208 a2!647) (size!7208 a3!68)) (bvsle mid!71 (size!7208 a1!647)) (bvsle to!740 (size!7208 a2!647))))))

(assert (=> start!63994 e!203470))

(declare-fun array_inv!6891 (array!16713) Bool)

(assert (=> start!63994 (and (array_inv!6891 a2!647) e!203473)))

(assert (=> start!63994 true))

(assert (=> start!63994 (and (array_inv!6891 a1!647) e!203471)))

(declare-fun e!203472 () Bool)

(assert (=> start!63994 (and (array_inv!6891 a3!68) e!203472)))

(declare-fun mapIsEmpty!1220 () Bool)

(assert (=> mapIsEmpty!1220 mapRes!1220))

(declare-fun mapIsEmpty!1221 () Bool)

(declare-fun mapRes!1222 () Bool)

(assert (=> mapIsEmpty!1221 mapRes!1222))

(declare-fun b!284665 () Bool)

(declare-fun res!235702 () Bool)

(assert (=> b!284665 (=> (not res!235702) (not e!203470))))

(assert (=> b!284665 (= res!235702 (arrayRangesEq!1357 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!284666 () Bool)

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!284666 (= e!203470 (and (bvsle from!773 i!964) (bvsle i!964 mid!71) (bvsgt #b00000000000000000000000000000000 i!964)))))

(declare-fun mapNonEmpty!1220 () Bool)

(declare-fun tp!1221 () Bool)

(assert (=> mapNonEmpty!1220 (= mapRes!1222 (and tp!1221 tp_is_empty!435))))

(declare-fun mapRest!1220 () (Array (_ BitVec 32) T!51361))

(declare-fun mapValue!1222 () T!51361)

(declare-fun mapKey!1222 () (_ BitVec 32))

(assert (=> mapNonEmpty!1220 (= (arr!8204 a3!68) (store mapRest!1220 mapKey!1222 mapValue!1222))))

(declare-fun mapIsEmpty!1222 () Bool)

(assert (=> mapIsEmpty!1222 mapRes!1221))

(declare-fun mapNonEmpty!1221 () Bool)

(declare-fun tp!1222 () Bool)

(assert (=> mapNonEmpty!1221 (= mapRes!1220 (and tp!1222 tp_is_empty!435))))

(declare-fun mapKey!1220 () (_ BitVec 32))

(declare-fun mapValue!1221 () T!51361)

(declare-fun mapRest!1222 () (Array (_ BitVec 32) T!51361))

(assert (=> mapNonEmpty!1221 (= (arr!8204 a1!647) (store mapRest!1222 mapKey!1220 mapValue!1221))))

(declare-fun mapNonEmpty!1222 () Bool)

(declare-fun tp!1220 () Bool)

(assert (=> mapNonEmpty!1222 (= mapRes!1221 (and tp!1220 tp_is_empty!435))))

(declare-fun mapRest!1221 () (Array (_ BitVec 32) T!51361))

(declare-fun mapValue!1220 () T!51361)

(declare-fun mapKey!1221 () (_ BitVec 32))

(assert (=> mapNonEmpty!1222 (= (arr!8204 a2!647) (store mapRest!1221 mapKey!1221 mapValue!1220))))

(declare-fun b!284667 () Bool)

(assert (=> b!284667 (= e!203472 (and tp_is_empty!435 mapRes!1222))))

(declare-fun condMapEmpty!1220 () Bool)

(declare-fun mapDefault!1222 () T!51361)

(assert (=> b!284667 (= condMapEmpty!1220 (= (arr!8204 a3!68) ((as const (Array (_ BitVec 32) T!51361)) mapDefault!1222)))))

(assert (= (and start!63994 res!235704) b!284665))

(assert (= (and b!284665 res!235702) b!284664))

(assert (= (and b!284664 res!235703) b!284666))

(assert (= (and b!284663 condMapEmpty!1221) mapIsEmpty!1222))

(assert (= (and b!284663 (not condMapEmpty!1221)) mapNonEmpty!1222))

(assert (= start!63994 b!284663))

(assert (= (and b!284662 condMapEmpty!1222) mapIsEmpty!1220))

(assert (= (and b!284662 (not condMapEmpty!1222)) mapNonEmpty!1221))

(assert (= start!63994 b!284662))

(assert (= (and b!284667 condMapEmpty!1220) mapIsEmpty!1221))

(assert (= (and b!284667 (not condMapEmpty!1220)) mapNonEmpty!1220))

(assert (= start!63994 b!284667))

(declare-fun m!417829 () Bool)

(assert (=> mapNonEmpty!1222 m!417829))

(declare-fun m!417831 () Bool)

(assert (=> mapNonEmpty!1221 m!417831))

(declare-fun m!417833 () Bool)

(assert (=> start!63994 m!417833))

(declare-fun m!417835 () Bool)

(assert (=> start!63994 m!417835))

(declare-fun m!417837 () Bool)

(assert (=> start!63994 m!417837))

(declare-fun m!417839 () Bool)

(assert (=> b!284664 m!417839))

(declare-fun m!417841 () Bool)

(assert (=> b!284665 m!417841))

(declare-fun m!417843 () Bool)

(assert (=> mapNonEmpty!1220 m!417843))

(check-sat tp_is_empty!435 (not b!284664) (not start!63994) (not mapNonEmpty!1220) (not b!284665) (not mapNonEmpty!1222) (not mapNonEmpty!1221))
(check-sat)
