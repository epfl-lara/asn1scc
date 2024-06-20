; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64024 () Bool)

(assert start!64024)

(declare-fun mapNonEmpty!1355 () Bool)

(declare-fun mapRes!1357 () Bool)

(declare-fun tp!1356 () Bool)

(declare-fun tp_is_empty!465 () Bool)

(assert (=> mapNonEmpty!1355 (= mapRes!1357 (and tp!1356 tp_is_empty!465))))

(declare-datatypes ((T!51491 0))(
  ( (T!51492 (val!232 Int)) )
))
(declare-fun mapRest!1355 () (Array (_ BitVec 32) T!51491))

(declare-fun mapKey!1356 () (_ BitVec 32))

(declare-fun mapValue!1356 () T!51491)

(declare-datatypes ((array!16743 0))(
  ( (array!16744 (arr!8219 (Array (_ BitVec 32) T!51491)) (size!7223 (_ BitVec 32))) )
))
(declare-fun a3!68 () array!16743)

(assert (=> mapNonEmpty!1355 (= (arr!8219 a3!68) (store mapRest!1355 mapKey!1356 mapValue!1356))))

(declare-fun b!285065 () Bool)

(declare-fun res!235973 () Bool)

(declare-fun e!203653 () Bool)

(assert (=> b!285065 (=> (not res!235973) (not e!203653))))

(declare-fun a2!647 () array!16743)

(declare-fun a1!647 () array!16743)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun arrayRangesEq!1367 (array!16743 array!16743 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!285065 (= res!235973 (arrayRangesEq!1367 a1!647 a2!647 i!964 mid!71))))

(declare-fun mapNonEmpty!1356 () Bool)

(declare-fun mapRes!1355 () Bool)

(declare-fun tp!1357 () Bool)

(assert (=> mapNonEmpty!1356 (= mapRes!1355 (and tp!1357 tp_is_empty!465))))

(declare-fun mapValue!1357 () T!51491)

(declare-fun mapKey!1355 () (_ BitVec 32))

(declare-fun mapRest!1357 () (Array (_ BitVec 32) T!51491))

(assert (=> mapNonEmpty!1356 (= (arr!8219 a2!647) (store mapRest!1357 mapKey!1355 mapValue!1357))))

(declare-fun mapIsEmpty!1355 () Bool)

(assert (=> mapIsEmpty!1355 mapRes!1357))

(declare-fun b!285066 () Bool)

(declare-fun res!235970 () Bool)

(assert (=> b!285066 (=> (not res!235970) (not e!203653))))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!285066 (= res!235970 (arrayRangesEq!1367 a2!647 a3!68 from!773 to!740))))

(declare-fun mapIsEmpty!1356 () Bool)

(assert (=> mapIsEmpty!1356 mapRes!1355))

(declare-fun b!285067 () Bool)

(declare-fun e!203650 () Bool)

(assert (=> b!285067 (= e!203650 (and tp_is_empty!465 mapRes!1357))))

(declare-fun condMapEmpty!1357 () Bool)

(declare-fun mapDefault!1355 () T!51491)

(assert (=> b!285067 (= condMapEmpty!1357 (= (arr!8219 a3!68) ((as const (Array (_ BitVec 32) T!51491)) mapDefault!1355)))))

(declare-fun b!285068 () Bool)

(declare-fun res!235977 () Bool)

(assert (=> b!285068 (=> (not res!235977) (not e!203653))))

(assert (=> b!285068 (= res!235977 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!285069 () Bool)

(declare-fun e!203652 () Bool)

(declare-fun mapRes!1356 () Bool)

(assert (=> b!285069 (= e!203652 (and tp_is_empty!465 mapRes!1356))))

(declare-fun condMapEmpty!1356 () Bool)

(declare-fun mapDefault!1356 () T!51491)

(assert (=> b!285069 (= condMapEmpty!1356 (= (arr!8219 a1!647) ((as const (Array (_ BitVec 32) T!51491)) mapDefault!1356)))))

(declare-fun b!285070 () Bool)

(declare-fun res!235974 () Bool)

(assert (=> b!285070 (=> (not res!235974) (not e!203653))))

(assert (=> b!285070 (= res!235974 (arrayRangesEq!1367 a2!647 a3!68 i!964 to!740))))

(declare-fun res!235975 () Bool)

(assert (=> start!64024 (=> (not res!235975) (not e!203653))))

(assert (=> start!64024 (= res!235975 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7223 a1!647) (size!7223 a2!647)) (bvsle (size!7223 a2!647) (size!7223 a3!68)) (bvsle mid!71 (size!7223 a1!647)) (bvsle to!740 (size!7223 a2!647))))))

(assert (=> start!64024 e!203653))

(declare-fun e!203651 () Bool)

(declare-fun array_inv!6898 (array!16743) Bool)

(assert (=> start!64024 (and (array_inv!6898 a2!647) e!203651)))

(assert (=> start!64024 true))

(assert (=> start!64024 (and (array_inv!6898 a1!647) e!203652)))

(assert (=> start!64024 (and (array_inv!6898 a3!68) e!203650)))

(declare-fun b!285071 () Bool)

(declare-fun res!235971 () Bool)

(assert (=> b!285071 (=> (not res!235971) (not e!203653))))

(assert (=> b!285071 (= res!235971 (arrayRangesEq!1367 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285072 () Bool)

(assert (=> b!285072 (= e!203653 (not true))))

(assert (=> b!285072 (arrayRangesEq!1367 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19917 0))(
  ( (Unit!19918) )
))
(declare-fun lt!418548 () Unit!19917)

(declare-fun arrayRangesEqAppend!1 (array!16743 array!16743 (_ BitVec 32) (_ BitVec 32)) Unit!19917)

(assert (=> b!285072 (= lt!418548 (arrayRangesEqAppend!1 a1!647 a3!68 from!773 i!964))))

(declare-fun b!285073 () Bool)

(declare-fun res!235976 () Bool)

(assert (=> b!285073 (=> (not res!235976) (not e!203653))))

(assert (=> b!285073 (= res!235976 (arrayRangesEq!1367 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapIsEmpty!1357 () Bool)

(assert (=> mapIsEmpty!1357 mapRes!1356))

(declare-fun b!285074 () Bool)

(assert (=> b!285074 (= e!203651 (and tp_is_empty!465 mapRes!1355))))

(declare-fun condMapEmpty!1355 () Bool)

(declare-fun mapDefault!1357 () T!51491)

(assert (=> b!285074 (= condMapEmpty!1355 (= (arr!8219 a2!647) ((as const (Array (_ BitVec 32) T!51491)) mapDefault!1357)))))

(declare-fun mapNonEmpty!1357 () Bool)

(declare-fun tp!1355 () Bool)

(assert (=> mapNonEmpty!1357 (= mapRes!1356 (and tp!1355 tp_is_empty!465))))

(declare-fun mapKey!1357 () (_ BitVec 32))

(declare-fun mapValue!1355 () T!51491)

(declare-fun mapRest!1356 () (Array (_ BitVec 32) T!51491))

(assert (=> mapNonEmpty!1357 (= (arr!8219 a1!647) (store mapRest!1356 mapKey!1357 mapValue!1355))))

(declare-fun b!285075 () Bool)

(declare-fun res!235972 () Bool)

(assert (=> b!285075 (=> (not res!235972) (not e!203653))))

(assert (=> b!285075 (= res!235972 (not (= i!964 mid!71)))))

(assert (= (and start!64024 res!235975) b!285073))

(assert (= (and b!285073 res!235976) b!285066))

(assert (= (and b!285066 res!235970) b!285068))

(assert (= (and b!285068 res!235977) b!285065))

(assert (= (and b!285065 res!235973) b!285070))

(assert (= (and b!285070 res!235974) b!285071))

(assert (= (and b!285071 res!235971) b!285075))

(assert (= (and b!285075 res!235972) b!285072))

(assert (= (and b!285074 condMapEmpty!1355) mapIsEmpty!1356))

(assert (= (and b!285074 (not condMapEmpty!1355)) mapNonEmpty!1356))

(assert (= start!64024 b!285074))

(assert (= (and b!285069 condMapEmpty!1356) mapIsEmpty!1357))

(assert (= (and b!285069 (not condMapEmpty!1356)) mapNonEmpty!1357))

(assert (= start!64024 b!285069))

(assert (= (and b!285067 condMapEmpty!1357) mapIsEmpty!1355))

(assert (= (and b!285067 (not condMapEmpty!1357)) mapNonEmpty!1355))

(assert (= start!64024 b!285067))

(declare-fun m!418127 () Bool)

(assert (=> b!285066 m!418127))

(declare-fun m!418129 () Bool)

(assert (=> b!285071 m!418129))

(declare-fun m!418131 () Bool)

(assert (=> b!285065 m!418131))

(declare-fun m!418133 () Bool)

(assert (=> mapNonEmpty!1357 m!418133))

(declare-fun m!418135 () Bool)

(assert (=> b!285072 m!418135))

(declare-fun m!418137 () Bool)

(assert (=> b!285072 m!418137))

(declare-fun m!418139 () Bool)

(assert (=> mapNonEmpty!1356 m!418139))

(declare-fun m!418141 () Bool)

(assert (=> b!285070 m!418141))

(declare-fun m!418143 () Bool)

(assert (=> start!64024 m!418143))

(declare-fun m!418145 () Bool)

(assert (=> start!64024 m!418145))

(declare-fun m!418147 () Bool)

(assert (=> start!64024 m!418147))

(declare-fun m!418149 () Bool)

(assert (=> b!285073 m!418149))

(declare-fun m!418151 () Bool)

(assert (=> mapNonEmpty!1355 m!418151))

(check-sat (not b!285072) (not start!64024) (not b!285071) (not b!285070) tp_is_empty!465 (not b!285065) (not mapNonEmpty!1356) (not mapNonEmpty!1357) (not b!285073) (not mapNonEmpty!1355) (not b!285066))
(check-sat)
