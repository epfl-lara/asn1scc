; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64078 () Bool)

(assert start!64078)

(declare-fun mapIsEmpty!1598 () Bool)

(declare-fun mapRes!1599 () Bool)

(assert (=> mapIsEmpty!1598 mapRes!1599))

(declare-fun mapNonEmpty!1598 () Bool)

(declare-fun tp!1599 () Bool)

(declare-fun tp_is_empty!519 () Bool)

(assert (=> mapNonEmpty!1598 (= mapRes!1599 (and tp!1599 tp_is_empty!519))))

(declare-fun mapKey!1599 () (_ BitVec 32))

(declare-datatypes ((T!51725 0))(
  ( (T!51726 (val!259 Int)) )
))
(declare-fun mapValue!1600 () T!51725)

(declare-datatypes ((array!16797 0))(
  ( (array!16798 (arr!8246 (Array (_ BitVec 32) T!51725)) (size!7250 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16797)

(declare-fun mapRest!1600 () (Array (_ BitVec 32) T!51725))

(assert (=> mapNonEmpty!1598 (= (arr!8246 a1!647) (store mapRest!1600 mapKey!1599 mapValue!1600))))

(declare-fun res!236687 () Bool)

(declare-fun e!204002 () Bool)

(assert (=> start!64078 (=> (not res!236687) (not e!204002))))

(declare-fun a2!647 () array!16797)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16797)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64078 (= res!236687 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7250 a1!647) (size!7250 a2!647)) (bvsle (size!7250 a2!647) (size!7250 a3!68)) (bvsle mid!71 (size!7250 a1!647)) (bvsle to!740 (size!7250 a2!647))))))

(assert (=> start!64078 e!204002))

(declare-fun e!204003 () Bool)

(declare-fun array_inv!6911 (array!16797) Bool)

(assert (=> start!64078 (and (array_inv!6911 a2!647) e!204003)))

(assert (=> start!64078 true))

(declare-fun e!204001 () Bool)

(assert (=> start!64078 (and (array_inv!6911 a1!647) e!204001)))

(declare-fun e!204004 () Bool)

(assert (=> start!64078 (and (array_inv!6911 a3!68) e!204004)))

(declare-fun b!286019 () Bool)

(declare-fun arrayRangesEq!1391 (array!16797 array!16797 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286019 (= e!204002 (not (arrayRangesEq!1391 a1!647 a3!68 from!773 mid!71)))))

(declare-fun mapIsEmpty!1599 () Bool)

(declare-fun mapRes!1598 () Bool)

(assert (=> mapIsEmpty!1599 mapRes!1598))

(declare-fun b!286020 () Bool)

(declare-fun mapRes!1600 () Bool)

(assert (=> b!286020 (= e!204004 (and tp_is_empty!519 mapRes!1600))))

(declare-fun condMapEmpty!1598 () Bool)

(declare-fun mapDefault!1599 () T!51725)

(assert (=> b!286020 (= condMapEmpty!1598 (= (arr!8246 a3!68) ((as const (Array (_ BitVec 32) T!51725)) mapDefault!1599)))))

(declare-fun b!286021 () Bool)

(declare-fun res!236681 () Bool)

(assert (=> b!286021 (=> (not res!236681) (not e!204002))))

(declare-fun i!964 () (_ BitVec 32))

(assert (=> b!286021 (= res!236681 (= i!964 mid!71))))

(declare-fun b!286022 () Bool)

(declare-fun res!236684 () Bool)

(assert (=> b!286022 (=> (not res!236684) (not e!204002))))

(assert (=> b!286022 (= res!236684 (arrayRangesEq!1391 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!286023 () Bool)

(declare-fun res!236686 () Bool)

(assert (=> b!286023 (=> (not res!236686) (not e!204002))))

(assert (=> b!286023 (= res!236686 (arrayRangesEq!1391 a1!647 a3!68 from!773 i!964))))

(declare-fun mapIsEmpty!1600 () Bool)

(assert (=> mapIsEmpty!1600 mapRes!1600))

(declare-fun mapNonEmpty!1599 () Bool)

(declare-fun tp!1598 () Bool)

(assert (=> mapNonEmpty!1599 (= mapRes!1600 (and tp!1598 tp_is_empty!519))))

(declare-fun mapRest!1599 () (Array (_ BitVec 32) T!51725))

(declare-fun mapKey!1600 () (_ BitVec 32))

(declare-fun mapValue!1598 () T!51725)

(assert (=> mapNonEmpty!1599 (= (arr!8246 a3!68) (store mapRest!1599 mapKey!1600 mapValue!1598))))

(declare-fun b!286024 () Bool)

(assert (=> b!286024 (= e!204003 (and tp_is_empty!519 mapRes!1598))))

(declare-fun condMapEmpty!1600 () Bool)

(declare-fun mapDefault!1600 () T!51725)

(assert (=> b!286024 (= condMapEmpty!1600 (= (arr!8246 a2!647) ((as const (Array (_ BitVec 32) T!51725)) mapDefault!1600)))))

(declare-fun b!286025 () Bool)

(declare-fun res!236688 () Bool)

(assert (=> b!286025 (=> (not res!236688) (not e!204002))))

(assert (=> b!286025 (= res!236688 (arrayRangesEq!1391 a2!647 a3!68 from!773 to!740))))

(declare-fun b!286026 () Bool)

(declare-fun res!236682 () Bool)

(assert (=> b!286026 (=> (not res!236682) (not e!204002))))

(assert (=> b!286026 (= res!236682 (arrayRangesEq!1391 a2!647 a3!68 i!964 to!740))))

(declare-fun mapNonEmpty!1600 () Bool)

(declare-fun tp!1600 () Bool)

(assert (=> mapNonEmpty!1600 (= mapRes!1598 (and tp!1600 tp_is_empty!519))))

(declare-fun mapKey!1598 () (_ BitVec 32))

(declare-fun mapValue!1599 () T!51725)

(declare-fun mapRest!1598 () (Array (_ BitVec 32) T!51725))

(assert (=> mapNonEmpty!1600 (= (arr!8246 a2!647) (store mapRest!1598 mapKey!1598 mapValue!1599))))

(declare-fun b!286027 () Bool)

(assert (=> b!286027 (= e!204001 (and tp_is_empty!519 mapRes!1599))))

(declare-fun condMapEmpty!1599 () Bool)

(declare-fun mapDefault!1598 () T!51725)

(assert (=> b!286027 (= condMapEmpty!1599 (= (arr!8246 a1!647) ((as const (Array (_ BitVec 32) T!51725)) mapDefault!1598)))))

(declare-fun b!286028 () Bool)

(declare-fun res!236683 () Bool)

(assert (=> b!286028 (=> (not res!236683) (not e!204002))))

(assert (=> b!286028 (= res!236683 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!286029 () Bool)

(declare-fun res!236685 () Bool)

(assert (=> b!286029 (=> (not res!236685) (not e!204002))))

(assert (=> b!286029 (= res!236685 (arrayRangesEq!1391 a1!647 a2!647 i!964 mid!71))))

(assert (= (and start!64078 res!236687) b!286022))

(assert (= (and b!286022 res!236684) b!286025))

(assert (= (and b!286025 res!236688) b!286028))

(assert (= (and b!286028 res!236683) b!286029))

(assert (= (and b!286029 res!236685) b!286026))

(assert (= (and b!286026 res!236682) b!286023))

(assert (= (and b!286023 res!236686) b!286021))

(assert (= (and b!286021 res!236681) b!286019))

(assert (= (and b!286024 condMapEmpty!1600) mapIsEmpty!1599))

(assert (= (and b!286024 (not condMapEmpty!1600)) mapNonEmpty!1600))

(assert (= start!64078 b!286024))

(assert (= (and b!286027 condMapEmpty!1599) mapIsEmpty!1598))

(assert (= (and b!286027 (not condMapEmpty!1599)) mapNonEmpty!1598))

(assert (= start!64078 b!286027))

(assert (= (and b!286020 condMapEmpty!1598) mapIsEmpty!1600))

(assert (= (and b!286020 (not condMapEmpty!1598)) mapNonEmpty!1599))

(assert (= start!64078 b!286020))

(declare-fun m!418875 () Bool)

(assert (=> mapNonEmpty!1600 m!418875))

(declare-fun m!418877 () Bool)

(assert (=> b!286019 m!418877))

(declare-fun m!418879 () Bool)

(assert (=> b!286029 m!418879))

(declare-fun m!418881 () Bool)

(assert (=> start!64078 m!418881))

(declare-fun m!418883 () Bool)

(assert (=> start!64078 m!418883))

(declare-fun m!418885 () Bool)

(assert (=> start!64078 m!418885))

(declare-fun m!418887 () Bool)

(assert (=> mapNonEmpty!1598 m!418887))

(declare-fun m!418889 () Bool)

(assert (=> b!286026 m!418889))

(declare-fun m!418891 () Bool)

(assert (=> b!286022 m!418891))

(declare-fun m!418893 () Bool)

(assert (=> b!286023 m!418893))

(declare-fun m!418895 () Bool)

(assert (=> mapNonEmpty!1599 m!418895))

(declare-fun m!418897 () Bool)

(assert (=> b!286025 m!418897))

(check-sat (not b!286026) (not b!286022) (not start!64078) (not b!286023) (not mapNonEmpty!1599) (not mapNonEmpty!1598) (not b!286029) (not mapNonEmpty!1600) tp_is_empty!519 (not b!286025) (not b!286019))
(check-sat)
