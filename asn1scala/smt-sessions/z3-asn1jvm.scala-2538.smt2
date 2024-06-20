; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64000 () Bool)

(assert start!64000)

(declare-fun mapNonEmpty!1247 () Bool)

(declare-fun mapRes!1248 () Bool)

(declare-fun tp!1248 () Bool)

(declare-fun tp_is_empty!441 () Bool)

(assert (=> mapNonEmpty!1247 (= mapRes!1248 (and tp!1248 tp_is_empty!441))))

(declare-fun mapKey!1247 () (_ BitVec 32))

(declare-datatypes ((T!51387 0))(
  ( (T!51388 (val!220 Int)) )
))
(declare-fun mapValue!1247 () T!51387)

(declare-fun mapRest!1248 () (Array (_ BitVec 32) T!51387))

(declare-datatypes ((array!16719 0))(
  ( (array!16720 (arr!8207 (Array (_ BitVec 32) T!51387)) (size!7211 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16719)

(assert (=> mapNonEmpty!1247 (= (arr!8207 a3!68) (store mapRest!1248 mapKey!1247 mapValue!1247))))

(declare-fun mapNonEmpty!1248 () Bool)

(declare-fun mapRes!1249 () Bool)

(declare-fun tp!1247 () Bool)

(assert (=> mapNonEmpty!1248 (= mapRes!1249 (and tp!1247 tp_is_empty!441))))

(declare-fun mapRest!1249 () (Array (_ BitVec 32) T!51387))

(declare-fun a1!647 () array!16719)

(declare-fun mapKey!1249 () (_ BitVec 32))

(declare-fun mapValue!1248 () T!51387)

(assert (=> mapNonEmpty!1248 (= (arr!8207 a1!647) (store mapRest!1249 mapKey!1249 mapValue!1248))))

(declare-fun b!284726 () Bool)

(declare-fun e!203509 () Bool)

(assert (=> b!284726 (= e!203509 (and tp_is_empty!441 mapRes!1249))))

(declare-fun condMapEmpty!1249 () Bool)

(declare-fun mapDefault!1249 () T!51387)

(assert (=> b!284726 (= condMapEmpty!1249 (= (arr!8207 a1!647) ((as const (Array (_ BitVec 32) T!51387)) mapDefault!1249)))))

(declare-fun b!284727 () Bool)

(declare-fun res!235739 () Bool)

(declare-fun e!203507 () Bool)

(assert (=> b!284727 (=> (not res!235739) (not e!203507))))

(declare-fun a2!647 () array!16719)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun arrayRangesEq!1359 (array!16719 array!16719 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284727 (= res!235739 (arrayRangesEq!1359 a1!647 a2!647 i!964 mid!71))))

(declare-fun mapNonEmpty!1249 () Bool)

(declare-fun mapRes!1247 () Bool)

(declare-fun tp!1249 () Bool)

(assert (=> mapNonEmpty!1249 (= mapRes!1247 (and tp!1249 tp_is_empty!441))))

(declare-fun mapKey!1248 () (_ BitVec 32))

(declare-fun mapRest!1247 () (Array (_ BitVec 32) T!51387))

(declare-fun mapValue!1249 () T!51387)

(assert (=> mapNonEmpty!1249 (= (arr!8207 a2!647) (store mapRest!1247 mapKey!1248 mapValue!1249))))

(declare-fun b!284728 () Bool)

(declare-fun e!203506 () Bool)

(assert (=> b!284728 (= e!203506 (and tp_is_empty!441 mapRes!1248))))

(declare-fun condMapEmpty!1247 () Bool)

(declare-fun mapDefault!1247 () T!51387)

(assert (=> b!284728 (= condMapEmpty!1247 (= (arr!8207 a3!68) ((as const (Array (_ BitVec 32) T!51387)) mapDefault!1247)))))

(declare-fun res!235740 () Bool)

(assert (=> start!64000 (=> (not res!235740) (not e!203507))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64000 (= res!235740 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7211 a1!647) (size!7211 a2!647)) (bvsle (size!7211 a2!647) (size!7211 a3!68)) (bvsle mid!71 (size!7211 a1!647)) (bvsle to!740 (size!7211 a2!647))))))

(assert (=> start!64000 e!203507))

(declare-fun e!203508 () Bool)

(declare-fun array_inv!6892 (array!16719) Bool)

(assert (=> start!64000 (and (array_inv!6892 a2!647) e!203508)))

(assert (=> start!64000 true))

(assert (=> start!64000 (and (array_inv!6892 a1!647) e!203509)))

(assert (=> start!64000 (and (array_inv!6892 a3!68) e!203506)))

(declare-fun b!284729 () Bool)

(assert (=> b!284729 (= e!203508 (and tp_is_empty!441 mapRes!1247))))

(declare-fun condMapEmpty!1248 () Bool)

(declare-fun mapDefault!1248 () T!51387)

(assert (=> b!284729 (= condMapEmpty!1248 (= (arr!8207 a2!647) ((as const (Array (_ BitVec 32) T!51387)) mapDefault!1248)))))

(declare-fun mapIsEmpty!1247 () Bool)

(assert (=> mapIsEmpty!1247 mapRes!1247))

(declare-fun mapIsEmpty!1248 () Bool)

(assert (=> mapIsEmpty!1248 mapRes!1249))

(declare-fun b!284730 () Bool)

(declare-fun res!235743 () Bool)

(assert (=> b!284730 (=> (not res!235743) (not e!203507))))

(assert (=> b!284730 (= res!235743 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapIsEmpty!1249 () Bool)

(assert (=> mapIsEmpty!1249 mapRes!1248))

(declare-fun b!284731 () Bool)

(declare-fun res!235742 () Bool)

(assert (=> b!284731 (=> (not res!235742) (not e!203507))))

(assert (=> b!284731 (= res!235742 (arrayRangesEq!1359 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!284732 () Bool)

(assert (=> b!284732 (= e!203507 (or (bvsgt #b00000000000000000000000000000000 i!964) (bvsgt i!964 to!740)))))

(declare-fun b!284733 () Bool)

(declare-fun res!235741 () Bool)

(assert (=> b!284733 (=> (not res!235741) (not e!203507))))

(assert (=> b!284733 (= res!235741 (arrayRangesEq!1359 a2!647 a3!68 from!773 to!740))))

(assert (= (and start!64000 res!235740) b!284731))

(assert (= (and b!284731 res!235742) b!284733))

(assert (= (and b!284733 res!235741) b!284730))

(assert (= (and b!284730 res!235743) b!284727))

(assert (= (and b!284727 res!235739) b!284732))

(assert (= (and b!284729 condMapEmpty!1248) mapIsEmpty!1247))

(assert (= (and b!284729 (not condMapEmpty!1248)) mapNonEmpty!1249))

(assert (= start!64000 b!284729))

(assert (= (and b!284726 condMapEmpty!1249) mapIsEmpty!1248))

(assert (= (and b!284726 (not condMapEmpty!1249)) mapNonEmpty!1248))

(assert (= start!64000 b!284726))

(assert (= (and b!284728 condMapEmpty!1247) mapIsEmpty!1249))

(assert (= (and b!284728 (not condMapEmpty!1247)) mapNonEmpty!1247))

(assert (= start!64000 b!284728))

(declare-fun m!417879 () Bool)

(assert (=> b!284731 m!417879))

(declare-fun m!417881 () Bool)

(assert (=> start!64000 m!417881))

(declare-fun m!417883 () Bool)

(assert (=> start!64000 m!417883))

(declare-fun m!417885 () Bool)

(assert (=> start!64000 m!417885))

(declare-fun m!417887 () Bool)

(assert (=> mapNonEmpty!1247 m!417887))

(declare-fun m!417889 () Bool)

(assert (=> mapNonEmpty!1249 m!417889))

(declare-fun m!417891 () Bool)

(assert (=> mapNonEmpty!1248 m!417891))

(declare-fun m!417893 () Bool)

(assert (=> b!284733 m!417893))

(declare-fun m!417895 () Bool)

(assert (=> b!284727 m!417895))

(check-sat (not b!284727) (not b!284733) tp_is_empty!441 (not b!284731) (not start!64000) (not mapNonEmpty!1248) (not mapNonEmpty!1249) (not mapNonEmpty!1247))
(check-sat)
