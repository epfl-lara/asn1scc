; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64012 () Bool)

(assert start!64012)

(declare-fun mapNonEmpty!1301 () Bool)

(declare-fun mapRes!1302 () Bool)

(declare-fun tp!1303 () Bool)

(declare-fun tp_is_empty!453 () Bool)

(assert (=> mapNonEmpty!1301 (= mapRes!1302 (and tp!1303 tp_is_empty!453))))

(declare-fun mapKey!1303 () (_ BitVec 32))

(declare-datatypes ((T!51439 0))(
  ( (T!51440 (val!226 Int)) )
))
(declare-fun mapValue!1303 () T!51439)

(declare-fun mapRest!1303 () (Array (_ BitVec 32) T!51439))

(declare-datatypes ((array!16731 0))(
  ( (array!16732 (arr!8213 (Array (_ BitVec 32) T!51439)) (size!7217 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16731)

(assert (=> mapNonEmpty!1301 (= (arr!8213 a3!68) (store mapRest!1303 mapKey!1303 mapValue!1303))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun e!203579 () Bool)

(declare-fun b!284884 () Bool)

(declare-fun a1!647 () array!16731)

(assert (=> b!284884 (= e!203579 (and (bvsle (size!7217 a1!647) (size!7217 a3!68)) (bvsgt i!964 (size!7217 a1!647))))))

(declare-fun mapNonEmpty!1302 () Bool)

(declare-fun mapRes!1301 () Bool)

(declare-fun tp!1301 () Bool)

(assert (=> mapNonEmpty!1302 (= mapRes!1301 (and tp!1301 tp_is_empty!453))))

(declare-fun a2!647 () array!16731)

(declare-fun mapValue!1301 () T!51439)

(declare-fun mapKey!1301 () (_ BitVec 32))

(declare-fun mapRest!1301 () (Array (_ BitVec 32) T!51439))

(assert (=> mapNonEmpty!1302 (= (arr!8213 a2!647) (store mapRest!1301 mapKey!1301 mapValue!1301))))

(declare-fun res!235846 () Bool)

(assert (=> start!64012 (=> (not res!235846) (not e!203579))))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64012 (= res!235846 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7217 a1!647) (size!7217 a2!647)) (bvsle (size!7217 a2!647) (size!7217 a3!68)) (bvsle mid!71 (size!7217 a1!647)) (bvsle to!740 (size!7217 a2!647))))))

(assert (=> start!64012 e!203579))

(declare-fun e!203578 () Bool)

(declare-fun array_inv!6895 (array!16731) Bool)

(assert (=> start!64012 (and (array_inv!6895 a2!647) e!203578)))

(assert (=> start!64012 true))

(declare-fun e!203580 () Bool)

(assert (=> start!64012 (and (array_inv!6895 a1!647) e!203580)))

(declare-fun e!203581 () Bool)

(assert (=> start!64012 (and (array_inv!6895 a3!68) e!203581)))

(declare-fun mapIsEmpty!1301 () Bool)

(declare-fun mapRes!1303 () Bool)

(assert (=> mapIsEmpty!1301 mapRes!1303))

(declare-fun mapIsEmpty!1302 () Bool)

(assert (=> mapIsEmpty!1302 mapRes!1302))

(declare-fun mapNonEmpty!1303 () Bool)

(declare-fun tp!1302 () Bool)

(assert (=> mapNonEmpty!1303 (= mapRes!1303 (and tp!1302 tp_is_empty!453))))

(declare-fun mapRest!1302 () (Array (_ BitVec 32) T!51439))

(declare-fun mapValue!1302 () T!51439)

(declare-fun mapKey!1302 () (_ BitVec 32))

(assert (=> mapNonEmpty!1303 (= (arr!8213 a1!647) (store mapRest!1302 mapKey!1302 mapValue!1302))))

(declare-fun b!284885 () Bool)

(assert (=> b!284885 (= e!203581 (and tp_is_empty!453 mapRes!1302))))

(declare-fun condMapEmpty!1302 () Bool)

(declare-fun mapDefault!1302 () T!51439)

(assert (=> b!284885 (= condMapEmpty!1302 (= (arr!8213 a3!68) ((as const (Array (_ BitVec 32) T!51439)) mapDefault!1302)))))

(declare-fun b!284886 () Bool)

(declare-fun res!235843 () Bool)

(assert (=> b!284886 (=> (not res!235843) (not e!203579))))

(declare-fun arrayRangesEq!1362 (array!16731 array!16731 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284886 (= res!235843 (arrayRangesEq!1362 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!284887 () Bool)

(declare-fun res!235848 () Bool)

(assert (=> b!284887 (=> (not res!235848) (not e!203579))))

(assert (=> b!284887 (= res!235848 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!284888 () Bool)

(declare-fun res!235844 () Bool)

(assert (=> b!284888 (=> (not res!235844) (not e!203579))))

(assert (=> b!284888 (= res!235844 (arrayRangesEq!1362 a2!647 a3!68 i!964 to!740))))

(declare-fun b!284889 () Bool)

(declare-fun res!235845 () Bool)

(assert (=> b!284889 (=> (not res!235845) (not e!203579))))

(assert (=> b!284889 (= res!235845 (arrayRangesEq!1362 a2!647 a3!68 from!773 to!740))))

(declare-fun b!284890 () Bool)

(declare-fun res!235847 () Bool)

(assert (=> b!284890 (=> (not res!235847) (not e!203579))))

(assert (=> b!284890 (= res!235847 (arrayRangesEq!1362 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!284891 () Bool)

(assert (=> b!284891 (= e!203580 (and tp_is_empty!453 mapRes!1303))))

(declare-fun condMapEmpty!1301 () Bool)

(declare-fun mapDefault!1303 () T!51439)

(assert (=> b!284891 (= condMapEmpty!1301 (= (arr!8213 a1!647) ((as const (Array (_ BitVec 32) T!51439)) mapDefault!1303)))))

(declare-fun b!284892 () Bool)

(assert (=> b!284892 (= e!203578 (and tp_is_empty!453 mapRes!1301))))

(declare-fun condMapEmpty!1303 () Bool)

(declare-fun mapDefault!1301 () T!51439)

(assert (=> b!284892 (= condMapEmpty!1303 (= (arr!8213 a2!647) ((as const (Array (_ BitVec 32) T!51439)) mapDefault!1301)))))

(declare-fun mapIsEmpty!1303 () Bool)

(assert (=> mapIsEmpty!1303 mapRes!1301))

(assert (= (and start!64012 res!235846) b!284890))

(assert (= (and b!284890 res!235847) b!284889))

(assert (= (and b!284889 res!235845) b!284887))

(assert (= (and b!284887 res!235848) b!284886))

(assert (= (and b!284886 res!235843) b!284888))

(assert (= (and b!284888 res!235844) b!284884))

(assert (= (and b!284892 condMapEmpty!1303) mapIsEmpty!1303))

(assert (= (and b!284892 (not condMapEmpty!1303)) mapNonEmpty!1302))

(assert (= start!64012 b!284892))

(assert (= (and b!284891 condMapEmpty!1301) mapIsEmpty!1301))

(assert (= (and b!284891 (not condMapEmpty!1301)) mapNonEmpty!1303))

(assert (= start!64012 b!284891))

(assert (= (and b!284885 condMapEmpty!1302) mapIsEmpty!1302))

(assert (= (and b!284885 (not condMapEmpty!1302)) mapNonEmpty!1301))

(assert (= start!64012 b!284885))

(declare-fun m!417995 () Bool)

(assert (=> b!284889 m!417995))

(declare-fun m!417997 () Bool)

(assert (=> start!64012 m!417997))

(declare-fun m!417999 () Bool)

(assert (=> start!64012 m!417999))

(declare-fun m!418001 () Bool)

(assert (=> start!64012 m!418001))

(declare-fun m!418003 () Bool)

(assert (=> b!284886 m!418003))

(declare-fun m!418005 () Bool)

(assert (=> mapNonEmpty!1301 m!418005))

(declare-fun m!418007 () Bool)

(assert (=> b!284888 m!418007))

(declare-fun m!418009 () Bool)

(assert (=> b!284890 m!418009))

(declare-fun m!418011 () Bool)

(assert (=> mapNonEmpty!1302 m!418011))

(declare-fun m!418013 () Bool)

(assert (=> mapNonEmpty!1303 m!418013))

(check-sat (not b!284889) (not mapNonEmpty!1303) (not b!284888) (not b!284886) tp_is_empty!453 (not mapNonEmpty!1301) (not start!64012) (not mapNonEmpty!1302) (not b!284890))
(check-sat)
