; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64006 () Bool)

(assert start!64006)

(declare-fun mapNonEmpty!1274 () Bool)

(declare-fun mapRes!1276 () Bool)

(declare-fun tp!1275 () Bool)

(declare-fun tp_is_empty!447 () Bool)

(assert (=> mapNonEmpty!1274 (= mapRes!1276 (and tp!1275 tp_is_empty!447))))

(declare-datatypes ((T!51413 0))(
  ( (T!51414 (val!223 Int)) )
))
(declare-datatypes ((array!16725 0))(
  ( (array!16726 (arr!8210 (Array (_ BitVec 32) T!51413)) (size!7214 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16725)

(declare-fun mapKey!1276 () (_ BitVec 32))

(declare-fun mapRest!1276 () (Array (_ BitVec 32) T!51413))

(declare-fun mapValue!1274 () T!51413)

(assert (=> mapNonEmpty!1274 (= (arr!8210 a2!647) (store mapRest!1276 mapKey!1276 mapValue!1274))))

(declare-fun b!284803 () Bool)

(declare-fun res!235792 () Bool)

(declare-fun e!203543 () Bool)

(assert (=> b!284803 (=> (not res!235792) (not e!203543))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun a3!68 () array!16725)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1360 (array!16725 array!16725 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284803 (= res!235792 (arrayRangesEq!1360 a2!647 a3!68 i!964 to!740))))

(declare-fun b!284804 () Bool)

(declare-fun res!235793 () Bool)

(assert (=> b!284804 (=> (not res!235793) (not e!203543))))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16725)

(assert (=> b!284804 (= res!235793 (arrayRangesEq!1360 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapNonEmpty!1275 () Bool)

(declare-fun mapRes!1274 () Bool)

(declare-fun tp!1274 () Bool)

(assert (=> mapNonEmpty!1275 (= mapRes!1274 (and tp!1274 tp_is_empty!447))))

(declare-fun mapValue!1275 () T!51413)

(declare-fun mapRest!1274 () (Array (_ BitVec 32) T!51413))

(declare-fun mapKey!1275 () (_ BitVec 32))

(assert (=> mapNonEmpty!1275 (= (arr!8210 a3!68) (store mapRest!1274 mapKey!1275 mapValue!1275))))

(declare-fun b!284806 () Bool)

(assert (=> b!284806 (= e!203543 (bvsgt (size!7214 a1!647) (size!7214 a3!68)))))

(declare-fun mapIsEmpty!1274 () Bool)

(declare-fun mapRes!1275 () Bool)

(assert (=> mapIsEmpty!1274 mapRes!1275))

(declare-fun b!284807 () Bool)

(declare-fun res!235794 () Bool)

(assert (=> b!284807 (=> (not res!235794) (not e!203543))))

(assert (=> b!284807 (= res!235794 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapNonEmpty!1276 () Bool)

(declare-fun tp!1276 () Bool)

(assert (=> mapNonEmpty!1276 (= mapRes!1275 (and tp!1276 tp_is_empty!447))))

(declare-fun mapKey!1274 () (_ BitVec 32))

(declare-fun mapValue!1276 () T!51413)

(declare-fun mapRest!1275 () (Array (_ BitVec 32) T!51413))

(assert (=> mapNonEmpty!1276 (= (arr!8210 a1!647) (store mapRest!1275 mapKey!1274 mapValue!1276))))

(declare-fun b!284808 () Bool)

(declare-fun e!203542 () Bool)

(assert (=> b!284808 (= e!203542 (and tp_is_empty!447 mapRes!1274))))

(declare-fun condMapEmpty!1275 () Bool)

(declare-fun mapDefault!1276 () T!51413)

(assert (=> b!284808 (= condMapEmpty!1275 (= (arr!8210 a3!68) ((as const (Array (_ BitVec 32) T!51413)) mapDefault!1276)))))

(declare-fun mapIsEmpty!1275 () Bool)

(assert (=> mapIsEmpty!1275 mapRes!1276))

(declare-fun res!235789 () Bool)

(assert (=> start!64006 (=> (not res!235789) (not e!203543))))

(assert (=> start!64006 (= res!235789 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7214 a1!647) (size!7214 a2!647)) (bvsle (size!7214 a2!647) (size!7214 a3!68)) (bvsle mid!71 (size!7214 a1!647)) (bvsle to!740 (size!7214 a2!647))))))

(assert (=> start!64006 e!203543))

(declare-fun e!203545 () Bool)

(declare-fun array_inv!6893 (array!16725) Bool)

(assert (=> start!64006 (and (array_inv!6893 a2!647) e!203545)))

(assert (=> start!64006 true))

(declare-fun e!203544 () Bool)

(assert (=> start!64006 (and (array_inv!6893 a1!647) e!203544)))

(assert (=> start!64006 (and (array_inv!6893 a3!68) e!203542)))

(declare-fun b!284805 () Bool)

(assert (=> b!284805 (= e!203544 (and tp_is_empty!447 mapRes!1275))))

(declare-fun condMapEmpty!1274 () Bool)

(declare-fun mapDefault!1275 () T!51413)

(assert (=> b!284805 (= condMapEmpty!1274 (= (arr!8210 a1!647) ((as const (Array (_ BitVec 32) T!51413)) mapDefault!1275)))))

(declare-fun b!284809 () Bool)

(assert (=> b!284809 (= e!203545 (and tp_is_empty!447 mapRes!1276))))

(declare-fun condMapEmpty!1276 () Bool)

(declare-fun mapDefault!1274 () T!51413)

(assert (=> b!284809 (= condMapEmpty!1276 (= (arr!8210 a2!647) ((as const (Array (_ BitVec 32) T!51413)) mapDefault!1274)))))

(declare-fun b!284810 () Bool)

(declare-fun res!235790 () Bool)

(assert (=> b!284810 (=> (not res!235790) (not e!203543))))

(assert (=> b!284810 (= res!235790 (arrayRangesEq!1360 a2!647 a3!68 from!773 to!740))))

(declare-fun b!284811 () Bool)

(declare-fun res!235791 () Bool)

(assert (=> b!284811 (=> (not res!235791) (not e!203543))))

(assert (=> b!284811 (= res!235791 (arrayRangesEq!1360 a1!647 a2!647 i!964 mid!71))))

(declare-fun mapIsEmpty!1276 () Bool)

(assert (=> mapIsEmpty!1276 mapRes!1274))

(assert (= (and start!64006 res!235789) b!284804))

(assert (= (and b!284804 res!235793) b!284810))

(assert (= (and b!284810 res!235790) b!284807))

(assert (= (and b!284807 res!235794) b!284811))

(assert (= (and b!284811 res!235791) b!284803))

(assert (= (and b!284803 res!235792) b!284806))

(assert (= (and b!284809 condMapEmpty!1276) mapIsEmpty!1275))

(assert (= (and b!284809 (not condMapEmpty!1276)) mapNonEmpty!1274))

(assert (= start!64006 b!284809))

(assert (= (and b!284805 condMapEmpty!1274) mapIsEmpty!1274))

(assert (= (and b!284805 (not condMapEmpty!1274)) mapNonEmpty!1276))

(assert (= start!64006 b!284805))

(assert (= (and b!284808 condMapEmpty!1275) mapIsEmpty!1276))

(assert (= (and b!284808 (not condMapEmpty!1275)) mapNonEmpty!1275))

(assert (= start!64006 b!284808))

(declare-fun m!417935 () Bool)

(assert (=> start!64006 m!417935))

(declare-fun m!417937 () Bool)

(assert (=> start!64006 m!417937))

(declare-fun m!417939 () Bool)

(assert (=> start!64006 m!417939))

(declare-fun m!417941 () Bool)

(assert (=> b!284810 m!417941))

(declare-fun m!417943 () Bool)

(assert (=> b!284803 m!417943))

(declare-fun m!417945 () Bool)

(assert (=> b!284804 m!417945))

(declare-fun m!417947 () Bool)

(assert (=> b!284811 m!417947))

(declare-fun m!417949 () Bool)

(assert (=> mapNonEmpty!1275 m!417949))

(declare-fun m!417951 () Bool)

(assert (=> mapNonEmpty!1274 m!417951))

(declare-fun m!417953 () Bool)

(assert (=> mapNonEmpty!1276 m!417953))

(check-sat (not mapNonEmpty!1275) tp_is_empty!447 (not start!64006) (not mapNonEmpty!1276) (not b!284811) (not b!284810) (not b!284803) (not mapNonEmpty!1274) (not b!284804))
(check-sat)
