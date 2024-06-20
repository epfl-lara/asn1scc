; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64072 () Bool)

(assert start!64072)

(declare-fun b!285924 () Bool)

(declare-fun res!236614 () Bool)

(declare-fun e!203966 () Bool)

(assert (=> b!285924 (=> (not res!236614) (not e!203966))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!285924 (= res!236614 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapIsEmpty!1571 () Bool)

(declare-fun mapRes!1572 () Bool)

(assert (=> mapIsEmpty!1571 mapRes!1572))

(declare-fun b!285925 () Bool)

(declare-fun res!236616 () Bool)

(assert (=> b!285925 (=> (not res!236616) (not e!203966))))

(declare-datatypes ((T!51699 0))(
  ( (T!51700 (val!256 Int)) )
))
(declare-datatypes ((array!16791 0))(
  ( (array!16792 (arr!8243 (Array (_ BitVec 32) T!51699)) (size!7247 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16791)

(declare-fun a1!647 () array!16791)

(declare-fun arrayRangesEq!1389 (array!16791 array!16791 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285925 (= res!236616 (arrayRangesEq!1389 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapNonEmpty!1571 () Bool)

(declare-fun mapRes!1573 () Bool)

(declare-fun tp!1571 () Bool)

(declare-fun tp_is_empty!513 () Bool)

(assert (=> mapNonEmpty!1571 (= mapRes!1573 (and tp!1571 tp_is_empty!513))))

(declare-fun mapKey!1572 () (_ BitVec 32))

(declare-fun mapValue!1573 () T!51699)

(declare-fun mapRest!1572 () (Array (_ BitVec 32) T!51699))

(assert (=> mapNonEmpty!1571 (= (arr!8243 a1!647) (store mapRest!1572 mapKey!1572 mapValue!1573))))

(declare-fun mapIsEmpty!1572 () Bool)

(declare-fun mapRes!1571 () Bool)

(assert (=> mapIsEmpty!1572 mapRes!1571))

(declare-fun b!285926 () Bool)

(declare-fun e!203965 () Bool)

(assert (=> b!285926 (= e!203965 (and tp_is_empty!513 mapRes!1572))))

(declare-fun condMapEmpty!1573 () Bool)

(declare-fun a3!68 () array!16791)

(declare-fun mapDefault!1571 () T!51699)

(assert (=> b!285926 (= condMapEmpty!1573 (= (arr!8243 a3!68) ((as const (Array (_ BitVec 32) T!51699)) mapDefault!1571)))))

(declare-fun b!285927 () Bool)

(declare-fun res!236615 () Bool)

(assert (=> b!285927 (=> (not res!236615) (not e!203966))))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!285927 (= res!236615 (arrayRangesEq!1389 a2!647 a3!68 from!773 to!740))))

(declare-fun mapNonEmpty!1572 () Bool)

(declare-fun tp!1572 () Bool)

(assert (=> mapNonEmpty!1572 (= mapRes!1572 (and tp!1572 tp_is_empty!513))))

(declare-fun mapKey!1571 () (_ BitVec 32))

(declare-fun mapValue!1571 () T!51699)

(declare-fun mapRest!1571 () (Array (_ BitVec 32) T!51699))

(assert (=> mapNonEmpty!1572 (= (arr!8243 a3!68) (store mapRest!1571 mapKey!1571 mapValue!1571))))

(declare-fun b!285928 () Bool)

(declare-fun res!236617 () Bool)

(assert (=> b!285928 (=> (not res!236617) (not e!203966))))

(assert (=> b!285928 (= res!236617 (arrayRangesEq!1389 a1!647 a2!647 i!964 mid!71))))

(declare-fun res!236619 () Bool)

(assert (=> start!64072 (=> (not res!236619) (not e!203966))))

(assert (=> start!64072 (= res!236619 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7247 a1!647) (size!7247 a2!647)) (bvsle (size!7247 a2!647) (size!7247 a3!68)) (bvsle mid!71 (size!7247 a1!647)) (bvsle to!740 (size!7247 a2!647))))))

(assert (=> start!64072 e!203966))

(declare-fun e!203967 () Bool)

(declare-fun array_inv!6910 (array!16791) Bool)

(assert (=> start!64072 (and (array_inv!6910 a2!647) e!203967)))

(assert (=> start!64072 true))

(declare-fun e!203968 () Bool)

(assert (=> start!64072 (and (array_inv!6910 a1!647) e!203968)))

(assert (=> start!64072 (and (array_inv!6910 a3!68) e!203965)))

(declare-fun mapNonEmpty!1573 () Bool)

(declare-fun tp!1573 () Bool)

(assert (=> mapNonEmpty!1573 (= mapRes!1571 (and tp!1573 tp_is_empty!513))))

(declare-fun mapRest!1573 () (Array (_ BitVec 32) T!51699))

(declare-fun mapKey!1573 () (_ BitVec 32))

(declare-fun mapValue!1572 () T!51699)

(assert (=> mapNonEmpty!1573 (= (arr!8243 a2!647) (store mapRest!1573 mapKey!1573 mapValue!1572))))

(declare-fun b!285929 () Bool)

(declare-fun res!236613 () Bool)

(assert (=> b!285929 (=> (not res!236613) (not e!203966))))

(assert (=> b!285929 (= res!236613 (arrayRangesEq!1389 a1!647 a3!68 from!773 i!964))))

(declare-fun mapIsEmpty!1573 () Bool)

(assert (=> mapIsEmpty!1573 mapRes!1573))

(declare-fun b!285930 () Bool)

(assert (=> b!285930 (= e!203966 (bvslt (bvsub to!740 i!964) #b00000000000000000000000000000000))))

(declare-fun b!285931 () Bool)

(assert (=> b!285931 (= e!203967 (and tp_is_empty!513 mapRes!1571))))

(declare-fun condMapEmpty!1572 () Bool)

(declare-fun mapDefault!1572 () T!51699)

(assert (=> b!285931 (= condMapEmpty!1572 (= (arr!8243 a2!647) ((as const (Array (_ BitVec 32) T!51699)) mapDefault!1572)))))

(declare-fun b!285932 () Bool)

(assert (=> b!285932 (= e!203968 (and tp_is_empty!513 mapRes!1573))))

(declare-fun condMapEmpty!1571 () Bool)

(declare-fun mapDefault!1573 () T!51699)

(assert (=> b!285932 (= condMapEmpty!1571 (= (arr!8243 a1!647) ((as const (Array (_ BitVec 32) T!51699)) mapDefault!1573)))))

(declare-fun b!285933 () Bool)

(declare-fun res!236618 () Bool)

(assert (=> b!285933 (=> (not res!236618) (not e!203966))))

(assert (=> b!285933 (= res!236618 (arrayRangesEq!1389 a2!647 a3!68 i!964 to!740))))

(assert (= (and start!64072 res!236619) b!285925))

(assert (= (and b!285925 res!236616) b!285927))

(assert (= (and b!285927 res!236615) b!285924))

(assert (= (and b!285924 res!236614) b!285928))

(assert (= (and b!285928 res!236617) b!285933))

(assert (= (and b!285933 res!236618) b!285929))

(assert (= (and b!285929 res!236613) b!285930))

(assert (= (and b!285931 condMapEmpty!1572) mapIsEmpty!1572))

(assert (= (and b!285931 (not condMapEmpty!1572)) mapNonEmpty!1573))

(assert (= start!64072 b!285931))

(assert (= (and b!285932 condMapEmpty!1571) mapIsEmpty!1573))

(assert (= (and b!285932 (not condMapEmpty!1571)) mapNonEmpty!1571))

(assert (= start!64072 b!285932))

(assert (= (and b!285926 condMapEmpty!1573) mapIsEmpty!1571))

(assert (= (and b!285926 (not condMapEmpty!1573)) mapNonEmpty!1572))

(assert (= start!64072 b!285926))

(declare-fun m!418807 () Bool)

(assert (=> b!285928 m!418807))

(declare-fun m!418809 () Bool)

(assert (=> b!285925 m!418809))

(declare-fun m!418811 () Bool)

(assert (=> b!285933 m!418811))

(declare-fun m!418813 () Bool)

(assert (=> mapNonEmpty!1573 m!418813))

(declare-fun m!418815 () Bool)

(assert (=> mapNonEmpty!1571 m!418815))

(declare-fun m!418817 () Bool)

(assert (=> start!64072 m!418817))

(declare-fun m!418819 () Bool)

(assert (=> start!64072 m!418819))

(declare-fun m!418821 () Bool)

(assert (=> start!64072 m!418821))

(declare-fun m!418823 () Bool)

(assert (=> mapNonEmpty!1572 m!418823))

(declare-fun m!418825 () Bool)

(assert (=> b!285927 m!418825))

(declare-fun m!418827 () Bool)

(assert (=> b!285929 m!418827))

(check-sat (not mapNonEmpty!1572) (not b!285928) (not b!285927) tp_is_empty!513 (not b!285933) (not mapNonEmpty!1571) (not b!285929) (not mapNonEmpty!1573) (not start!64072) (not b!285925))
(check-sat)
