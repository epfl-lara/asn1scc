; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64066 () Bool)

(assert start!64066)

(declare-fun b!285834 () Bool)

(declare-fun res!236551 () Bool)

(declare-fun e!203930 () Bool)

(assert (=> b!285834 (=> (not res!236551) (not e!203930))))

(declare-datatypes ((T!51673 0))(
  ( (T!51674 (val!253 Int)) )
))
(declare-datatypes ((array!16785 0))(
  ( (array!16786 (arr!8240 (Array (_ BitVec 32) T!51673)) (size!7244 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16785)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16785)

(declare-fun arrayRangesEq!1386 (array!16785 array!16785 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285834 (= res!236551 (arrayRangesEq!1386 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!285835 () Bool)

(declare-fun res!236555 () Bool)

(assert (=> b!285835 (=> (not res!236555) (not e!203930))))

(declare-fun a3!68 () array!16785)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!285835 (= res!236555 (arrayRangesEq!1386 a2!647 a3!68 from!773 to!740))))

(declare-fun mapIsEmpty!1544 () Bool)

(declare-fun mapRes!1546 () Bool)

(assert (=> mapIsEmpty!1544 mapRes!1546))

(declare-fun mapIsEmpty!1545 () Bool)

(declare-fun mapRes!1544 () Bool)

(assert (=> mapIsEmpty!1545 mapRes!1544))

(declare-fun mapNonEmpty!1544 () Bool)

(declare-fun tp!1546 () Bool)

(declare-fun tp_is_empty!507 () Bool)

(assert (=> mapNonEmpty!1544 (= mapRes!1546 (and tp!1546 tp_is_empty!507))))

(declare-fun mapRest!1545 () (Array (_ BitVec 32) T!51673))

(declare-fun mapKey!1546 () (_ BitVec 32))

(declare-fun mapValue!1544 () T!51673)

(assert (=> mapNonEmpty!1544 (= (arr!8240 a1!647) (store mapRest!1545 mapKey!1546 mapValue!1544))))

(declare-fun b!285836 () Bool)

(declare-fun res!236556 () Bool)

(assert (=> b!285836 (=> (not res!236556) (not e!203930))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!285836 (= res!236556 (arrayRangesEq!1386 a2!647 a3!68 i!964 to!740))))

(declare-fun b!285837 () Bool)

(assert (=> b!285837 (= e!203930 (and (not (= (bvand to!740 #b10000000000000000000000000000000) (bvand i!964 #b10000000000000000000000000000000))) (not (= (bvand to!740 #b10000000000000000000000000000000) (bvand (bvsub to!740 i!964) #b10000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!1545 () Bool)

(declare-fun mapRes!1545 () Bool)

(declare-fun tp!1544 () Bool)

(assert (=> mapNonEmpty!1545 (= mapRes!1545 (and tp!1544 tp_is_empty!507))))

(declare-fun mapKey!1544 () (_ BitVec 32))

(declare-fun mapValue!1545 () T!51673)

(declare-fun mapRest!1546 () (Array (_ BitVec 32) T!51673))

(assert (=> mapNonEmpty!1545 (= (arr!8240 a3!68) (store mapRest!1546 mapKey!1544 mapValue!1545))))

(declare-fun b!285838 () Bool)

(declare-fun res!236553 () Bool)

(assert (=> b!285838 (=> (not res!236553) (not e!203930))))

(assert (=> b!285838 (= res!236553 (arrayRangesEq!1386 a1!647 a3!68 from!773 i!964))))

(declare-fun res!236554 () Bool)

(assert (=> start!64066 (=> (not res!236554) (not e!203930))))

(assert (=> start!64066 (= res!236554 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7244 a1!647) (size!7244 a2!647)) (bvsle (size!7244 a2!647) (size!7244 a3!68)) (bvsle mid!71 (size!7244 a1!647)) (bvsle to!740 (size!7244 a2!647))))))

(assert (=> start!64066 e!203930))

(declare-fun e!203931 () Bool)

(declare-fun array_inv!6908 (array!16785) Bool)

(assert (=> start!64066 (and (array_inv!6908 a2!647) e!203931)))

(assert (=> start!64066 true))

(declare-fun e!203932 () Bool)

(assert (=> start!64066 (and (array_inv!6908 a1!647) e!203932)))

(declare-fun e!203929 () Bool)

(assert (=> start!64066 (and (array_inv!6908 a3!68) e!203929)))

(declare-fun b!285839 () Bool)

(declare-fun res!236550 () Bool)

(assert (=> b!285839 (=> (not res!236550) (not e!203930))))

(assert (=> b!285839 (= res!236550 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285840 () Bool)

(assert (=> b!285840 (= e!203932 (and tp_is_empty!507 mapRes!1546))))

(declare-fun condMapEmpty!1546 () Bool)

(declare-fun mapDefault!1546 () T!51673)

(assert (=> b!285840 (= condMapEmpty!1546 (= (arr!8240 a1!647) ((as const (Array (_ BitVec 32) T!51673)) mapDefault!1546)))))

(declare-fun b!285841 () Bool)

(assert (=> b!285841 (= e!203931 (and tp_is_empty!507 mapRes!1544))))

(declare-fun condMapEmpty!1544 () Bool)

(declare-fun mapDefault!1545 () T!51673)

(assert (=> b!285841 (= condMapEmpty!1544 (= (arr!8240 a2!647) ((as const (Array (_ BitVec 32) T!51673)) mapDefault!1545)))))

(declare-fun mapNonEmpty!1546 () Bool)

(declare-fun tp!1545 () Bool)

(assert (=> mapNonEmpty!1546 (= mapRes!1544 (and tp!1545 tp_is_empty!507))))

(declare-fun mapRest!1544 () (Array (_ BitVec 32) T!51673))

(declare-fun mapKey!1545 () (_ BitVec 32))

(declare-fun mapValue!1546 () T!51673)

(assert (=> mapNonEmpty!1546 (= (arr!8240 a2!647) (store mapRest!1544 mapKey!1545 mapValue!1546))))

(declare-fun mapIsEmpty!1546 () Bool)

(assert (=> mapIsEmpty!1546 mapRes!1545))

(declare-fun b!285842 () Bool)

(assert (=> b!285842 (= e!203929 (and tp_is_empty!507 mapRes!1545))))

(declare-fun condMapEmpty!1545 () Bool)

(declare-fun mapDefault!1544 () T!51673)

(assert (=> b!285842 (= condMapEmpty!1545 (= (arr!8240 a3!68) ((as const (Array (_ BitVec 32) T!51673)) mapDefault!1544)))))

(declare-fun b!285843 () Bool)

(declare-fun res!236552 () Bool)

(assert (=> b!285843 (=> (not res!236552) (not e!203930))))

(assert (=> b!285843 (= res!236552 (arrayRangesEq!1386 a1!647 a2!647 i!964 mid!71))))

(assert (= (and start!64066 res!236554) b!285834))

(assert (= (and b!285834 res!236551) b!285835))

(assert (= (and b!285835 res!236555) b!285839))

(assert (= (and b!285839 res!236550) b!285843))

(assert (= (and b!285843 res!236552) b!285836))

(assert (= (and b!285836 res!236556) b!285838))

(assert (= (and b!285838 res!236553) b!285837))

(assert (= (and b!285841 condMapEmpty!1544) mapIsEmpty!1545))

(assert (= (and b!285841 (not condMapEmpty!1544)) mapNonEmpty!1546))

(assert (= start!64066 b!285841))

(assert (= (and b!285840 condMapEmpty!1546) mapIsEmpty!1544))

(assert (= (and b!285840 (not condMapEmpty!1546)) mapNonEmpty!1544))

(assert (= start!64066 b!285840))

(assert (= (and b!285842 condMapEmpty!1545) mapIsEmpty!1546))

(assert (= (and b!285842 (not condMapEmpty!1545)) mapNonEmpty!1545))

(assert (= start!64066 b!285842))

(declare-fun m!418741 () Bool)

(assert (=> mapNonEmpty!1545 m!418741))

(declare-fun m!418743 () Bool)

(assert (=> mapNonEmpty!1544 m!418743))

(declare-fun m!418745 () Bool)

(assert (=> mapNonEmpty!1546 m!418745))

(declare-fun m!418747 () Bool)

(assert (=> start!64066 m!418747))

(declare-fun m!418749 () Bool)

(assert (=> start!64066 m!418749))

(declare-fun m!418751 () Bool)

(assert (=> start!64066 m!418751))

(declare-fun m!418753 () Bool)

(assert (=> b!285834 m!418753))

(declare-fun m!418755 () Bool)

(assert (=> b!285836 m!418755))

(declare-fun m!418757 () Bool)

(assert (=> b!285843 m!418757))

(declare-fun m!418759 () Bool)

(assert (=> b!285838 m!418759))

(declare-fun m!418761 () Bool)

(assert (=> b!285835 m!418761))

(check-sat tp_is_empty!507 (not b!285843) (not start!64066) (not b!285838) (not mapNonEmpty!1544) (not b!285835) (not mapNonEmpty!1546) (not b!285834) (not mapNonEmpty!1545) (not b!285836))
(check-sat)
