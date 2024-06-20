; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64084 () Bool)

(assert start!64084)

(declare-fun mapNonEmpty!1625 () Bool)

(declare-fun mapRes!1627 () Bool)

(declare-fun tp!1625 () Bool)

(declare-fun tp_is_empty!525 () Bool)

(assert (=> mapNonEmpty!1625 (= mapRes!1627 (and tp!1625 tp_is_empty!525))))

(declare-fun mapKey!1627 () (_ BitVec 32))

(declare-datatypes ((T!51751 0))(
  ( (T!51752 (val!262 Int)) )
))
(declare-datatypes ((array!16803 0))(
  ( (array!16804 (arr!8249 (Array (_ BitVec 32) T!51751)) (size!7253 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16803)

(declare-fun mapRest!1626 () (Array (_ BitVec 32) T!51751))

(declare-fun mapValue!1627 () T!51751)

(assert (=> mapNonEmpty!1625 (= (arr!8249 a3!68) (store mapRest!1626 mapKey!1627 mapValue!1627))))

(declare-fun b!286113 () Bool)

(declare-fun e!204038 () Bool)

(declare-fun mapRes!1626 () Bool)

(assert (=> b!286113 (= e!204038 (and tp_is_empty!525 mapRes!1626))))

(declare-fun condMapEmpty!1625 () Bool)

(declare-fun a2!647 () array!16803)

(declare-fun mapDefault!1625 () T!51751)

(assert (=> b!286113 (= condMapEmpty!1625 (= (arr!8249 a2!647) ((as const (Array (_ BitVec 32) T!51751)) mapDefault!1625)))))

(declare-fun b!286114 () Bool)

(declare-fun e!204040 () Bool)

(assert (=> b!286114 (= e!204040 (and tp_is_empty!525 mapRes!1627))))

(declare-fun condMapEmpty!1626 () Bool)

(declare-fun mapDefault!1627 () T!51751)

(assert (=> b!286114 (= condMapEmpty!1626 (= (arr!8249 a3!68) ((as const (Array (_ BitVec 32) T!51751)) mapDefault!1627)))))

(declare-fun e!204039 () Bool)

(declare-fun b!286115 () Bool)

(declare-fun a1!647 () array!16803)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286115 (= e!204039 (and (not (= i!964 mid!71)) (bvsgt (size!7253 a1!647) (size!7253 a3!68))))))

(declare-fun mapIsEmpty!1625 () Bool)

(assert (=> mapIsEmpty!1625 mapRes!1627))

(declare-fun b!286116 () Bool)

(declare-fun e!204037 () Bool)

(declare-fun mapRes!1625 () Bool)

(assert (=> b!286116 (= e!204037 (and tp_is_empty!525 mapRes!1625))))

(declare-fun condMapEmpty!1627 () Bool)

(declare-fun mapDefault!1626 () T!51751)

(assert (=> b!286116 (= condMapEmpty!1627 (= (arr!8249 a1!647) ((as const (Array (_ BitVec 32) T!51751)) mapDefault!1626)))))

(declare-fun mapIsEmpty!1626 () Bool)

(assert (=> mapIsEmpty!1626 mapRes!1626))

(declare-fun b!286117 () Bool)

(declare-fun res!236751 () Bool)

(assert (=> b!286117 (=> (not res!236751) (not e!204039))))

(declare-fun from!773 () (_ BitVec 32))

(assert (=> b!286117 (= res!236751 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!286118 () Bool)

(declare-fun res!236753 () Bool)

(assert (=> b!286118 (=> (not res!236753) (not e!204039))))

(declare-fun arrayRangesEq!1393 (array!16803 array!16803 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286118 (= res!236753 (arrayRangesEq!1393 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!286119 () Bool)

(declare-fun res!236752 () Bool)

(assert (=> b!286119 (=> (not res!236752) (not e!204039))))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!286119 (= res!236752 (arrayRangesEq!1393 a2!647 a3!68 i!964 to!740))))

(declare-fun b!286120 () Bool)

(declare-fun res!236754 () Bool)

(assert (=> b!286120 (=> (not res!236754) (not e!204039))))

(assert (=> b!286120 (= res!236754 (arrayRangesEq!1393 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapNonEmpty!1626 () Bool)

(declare-fun tp!1626 () Bool)

(assert (=> mapNonEmpty!1626 (= mapRes!1625 (and tp!1626 tp_is_empty!525))))

(declare-fun mapKey!1626 () (_ BitVec 32))

(declare-fun mapRest!1625 () (Array (_ BitVec 32) T!51751))

(declare-fun mapValue!1625 () T!51751)

(assert (=> mapNonEmpty!1626 (= (arr!8249 a1!647) (store mapRest!1625 mapKey!1626 mapValue!1625))))

(declare-fun mapIsEmpty!1627 () Bool)

(assert (=> mapIsEmpty!1627 mapRes!1625))

(declare-fun b!286121 () Bool)

(declare-fun res!236750 () Bool)

(assert (=> b!286121 (=> (not res!236750) (not e!204039))))

(assert (=> b!286121 (= res!236750 (arrayRangesEq!1393 a1!647 a3!68 from!773 i!964))))

(declare-fun b!286122 () Bool)

(declare-fun res!236748 () Bool)

(assert (=> b!286122 (=> (not res!236748) (not e!204039))))

(assert (=> b!286122 (= res!236748 (arrayRangesEq!1393 a2!647 a3!68 from!773 to!740))))

(declare-fun mapNonEmpty!1627 () Bool)

(declare-fun tp!1627 () Bool)

(assert (=> mapNonEmpty!1627 (= mapRes!1626 (and tp!1627 tp_is_empty!525))))

(declare-fun mapRest!1627 () (Array (_ BitVec 32) T!51751))

(declare-fun mapKey!1625 () (_ BitVec 32))

(declare-fun mapValue!1626 () T!51751)

(assert (=> mapNonEmpty!1627 (= (arr!8249 a2!647) (store mapRest!1627 mapKey!1625 mapValue!1626))))

(declare-fun res!236749 () Bool)

(assert (=> start!64084 (=> (not res!236749) (not e!204039))))

(assert (=> start!64084 (= res!236749 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7253 a1!647) (size!7253 a2!647)) (bvsle (size!7253 a2!647) (size!7253 a3!68)) (bvsle mid!71 (size!7253 a1!647)) (bvsle to!740 (size!7253 a2!647))))))

(assert (=> start!64084 e!204039))

(declare-fun array_inv!6913 (array!16803) Bool)

(assert (=> start!64084 (and (array_inv!6913 a2!647) e!204038)))

(assert (=> start!64084 true))

(assert (=> start!64084 (and (array_inv!6913 a1!647) e!204037)))

(assert (=> start!64084 (and (array_inv!6913 a3!68) e!204040)))

(assert (= (and start!64084 res!236749) b!286120))

(assert (= (and b!286120 res!236754) b!286122))

(assert (= (and b!286122 res!236748) b!286117))

(assert (= (and b!286117 res!236751) b!286118))

(assert (= (and b!286118 res!236753) b!286119))

(assert (= (and b!286119 res!236752) b!286121))

(assert (= (and b!286121 res!236750) b!286115))

(assert (= (and b!286113 condMapEmpty!1625) mapIsEmpty!1626))

(assert (= (and b!286113 (not condMapEmpty!1625)) mapNonEmpty!1627))

(assert (= start!64084 b!286113))

(assert (= (and b!286116 condMapEmpty!1627) mapIsEmpty!1627))

(assert (= (and b!286116 (not condMapEmpty!1627)) mapNonEmpty!1626))

(assert (= start!64084 b!286116))

(assert (= (and b!286114 condMapEmpty!1626) mapIsEmpty!1625))

(assert (= (and b!286114 (not condMapEmpty!1626)) mapNonEmpty!1625))

(assert (= start!64084 b!286114))

(declare-fun m!418945 () Bool)

(assert (=> mapNonEmpty!1627 m!418945))

(declare-fun m!418947 () Bool)

(assert (=> mapNonEmpty!1626 m!418947))

(declare-fun m!418949 () Bool)

(assert (=> b!286121 m!418949))

(declare-fun m!418951 () Bool)

(assert (=> mapNonEmpty!1625 m!418951))

(declare-fun m!418953 () Bool)

(assert (=> start!64084 m!418953))

(declare-fun m!418955 () Bool)

(assert (=> start!64084 m!418955))

(declare-fun m!418957 () Bool)

(assert (=> start!64084 m!418957))

(declare-fun m!418959 () Bool)

(assert (=> b!286118 m!418959))

(declare-fun m!418961 () Bool)

(assert (=> b!286122 m!418961))

(declare-fun m!418963 () Bool)

(assert (=> b!286120 m!418963))

(declare-fun m!418965 () Bool)

(assert (=> b!286119 m!418965))

(check-sat (not mapNonEmpty!1625) (not b!286118) (not mapNonEmpty!1626) (not b!286120) tp_is_empty!525 (not b!286121) (not start!64084) (not b!286119) (not b!286122) (not mapNonEmpty!1627))
(check-sat)
