; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64090 () Bool)

(assert start!64090)

(declare-fun b!286203 () Bool)

(declare-fun e!204076 () Bool)

(declare-datatypes ((T!51777 0))(
  ( (T!51778 (val!265 Int)) )
))
(declare-datatypes ((array!16809 0))(
  ( (array!16810 (arr!8252 (Array (_ BitVec 32) T!51777)) (size!7256 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16809)

(declare-fun a3!68 () array!16809)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286203 (= e!204076 (and (not (= i!964 mid!71)) (bvsle (size!7256 a1!647) (size!7256 a3!68)) (bvsge i!964 (size!7256 a1!647))))))

(declare-fun b!286204 () Bool)

(declare-fun res!236812 () Bool)

(assert (=> b!286204 (=> (not res!236812) (not e!204076))))

(declare-fun a2!647 () array!16809)

(declare-fun arrayRangesEq!1395 (array!16809 array!16809 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286204 (= res!236812 (arrayRangesEq!1395 a1!647 a2!647 i!964 mid!71))))

(declare-fun mapIsEmpty!1652 () Bool)

(declare-fun mapRes!1652 () Bool)

(assert (=> mapIsEmpty!1652 mapRes!1652))

(declare-fun mapNonEmpty!1652 () Bool)

(declare-fun mapRes!1654 () Bool)

(declare-fun tp!1654 () Bool)

(declare-fun tp_is_empty!531 () Bool)

(assert (=> mapNonEmpty!1652 (= mapRes!1654 (and tp!1654 tp_is_empty!531))))

(declare-fun mapRest!1652 () (Array (_ BitVec 32) T!51777))

(declare-fun mapValue!1654 () T!51777)

(declare-fun mapKey!1652 () (_ BitVec 32))

(assert (=> mapNonEmpty!1652 (= (arr!8252 a3!68) (store mapRest!1652 mapKey!1652 mapValue!1654))))

(declare-fun b!286205 () Bool)

(declare-fun res!236815 () Bool)

(assert (=> b!286205 (=> (not res!236815) (not e!204076))))

(declare-fun from!773 () (_ BitVec 32))

(assert (=> b!286205 (= res!236815 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!286207 () Bool)

(declare-fun e!204075 () Bool)

(assert (=> b!286207 (= e!204075 (and tp_is_empty!531 mapRes!1654))))

(declare-fun condMapEmpty!1653 () Bool)

(declare-fun mapDefault!1654 () T!51777)

(assert (=> b!286207 (= condMapEmpty!1653 (= (arr!8252 a3!68) ((as const (Array (_ BitVec 32) T!51777)) mapDefault!1654)))))

(declare-fun b!286208 () Bool)

(declare-fun e!204074 () Bool)

(declare-fun mapRes!1653 () Bool)

(assert (=> b!286208 (= e!204074 (and tp_is_empty!531 mapRes!1653))))

(declare-fun condMapEmpty!1652 () Bool)

(declare-fun mapDefault!1653 () T!51777)

(assert (=> b!286208 (= condMapEmpty!1652 (= (arr!8252 a1!647) ((as const (Array (_ BitVec 32) T!51777)) mapDefault!1653)))))

(declare-fun b!286209 () Bool)

(declare-fun e!204073 () Bool)

(assert (=> b!286209 (= e!204073 (and tp_is_empty!531 mapRes!1652))))

(declare-fun condMapEmpty!1654 () Bool)

(declare-fun mapDefault!1652 () T!51777)

(assert (=> b!286209 (= condMapEmpty!1654 (= (arr!8252 a2!647) ((as const (Array (_ BitVec 32) T!51777)) mapDefault!1652)))))

(declare-fun mapNonEmpty!1653 () Bool)

(declare-fun tp!1653 () Bool)

(assert (=> mapNonEmpty!1653 (= mapRes!1652 (and tp!1653 tp_is_empty!531))))

(declare-fun mapRest!1653 () (Array (_ BitVec 32) T!51777))

(declare-fun mapValue!1652 () T!51777)

(declare-fun mapKey!1654 () (_ BitVec 32))

(assert (=> mapNonEmpty!1653 (= (arr!8252 a2!647) (store mapRest!1653 mapKey!1654 mapValue!1652))))

(declare-fun mapIsEmpty!1653 () Bool)

(assert (=> mapIsEmpty!1653 mapRes!1654))

(declare-fun mapIsEmpty!1654 () Bool)

(assert (=> mapIsEmpty!1654 mapRes!1653))

(declare-fun mapNonEmpty!1654 () Bool)

(declare-fun tp!1652 () Bool)

(assert (=> mapNonEmpty!1654 (= mapRes!1653 (and tp!1652 tp_is_empty!531))))

(declare-fun mapValue!1653 () T!51777)

(declare-fun mapKey!1653 () (_ BitVec 32))

(declare-fun mapRest!1654 () (Array (_ BitVec 32) T!51777))

(assert (=> mapNonEmpty!1654 (= (arr!8252 a1!647) (store mapRest!1654 mapKey!1653 mapValue!1653))))

(declare-fun b!286210 () Bool)

(declare-fun res!236816 () Bool)

(assert (=> b!286210 (=> (not res!236816) (not e!204076))))

(assert (=> b!286210 (= res!236816 (arrayRangesEq!1395 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!286206 () Bool)

(declare-fun res!236813 () Bool)

(assert (=> b!286206 (=> (not res!236813) (not e!204076))))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!286206 (= res!236813 (arrayRangesEq!1395 a2!647 a3!68 i!964 to!740))))

(declare-fun res!236814 () Bool)

(assert (=> start!64090 (=> (not res!236814) (not e!204076))))

(assert (=> start!64090 (= res!236814 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7256 a1!647) (size!7256 a2!647)) (bvsle (size!7256 a2!647) (size!7256 a3!68)) (bvsle mid!71 (size!7256 a1!647)) (bvsle to!740 (size!7256 a2!647))))))

(assert (=> start!64090 e!204076))

(declare-fun array_inv!6914 (array!16809) Bool)

(assert (=> start!64090 (and (array_inv!6914 a2!647) e!204073)))

(assert (=> start!64090 true))

(assert (=> start!64090 (and (array_inv!6914 a1!647) e!204074)))

(assert (=> start!64090 (and (array_inv!6914 a3!68) e!204075)))

(declare-fun b!286211 () Bool)

(declare-fun res!236817 () Bool)

(assert (=> b!286211 (=> (not res!236817) (not e!204076))))

(assert (=> b!286211 (= res!236817 (arrayRangesEq!1395 a2!647 a3!68 from!773 to!740))))

(declare-fun b!286212 () Bool)

(declare-fun res!236811 () Bool)

(assert (=> b!286212 (=> (not res!236811) (not e!204076))))

(assert (=> b!286212 (= res!236811 (arrayRangesEq!1395 a1!647 a3!68 from!773 i!964))))

(assert (= (and start!64090 res!236814) b!286210))

(assert (= (and b!286210 res!236816) b!286211))

(assert (= (and b!286211 res!236817) b!286205))

(assert (= (and b!286205 res!236815) b!286204))

(assert (= (and b!286204 res!236812) b!286206))

(assert (= (and b!286206 res!236813) b!286212))

(assert (= (and b!286212 res!236811) b!286203))

(assert (= (and b!286209 condMapEmpty!1654) mapIsEmpty!1652))

(assert (= (and b!286209 (not condMapEmpty!1654)) mapNonEmpty!1653))

(assert (= start!64090 b!286209))

(assert (= (and b!286208 condMapEmpty!1652) mapIsEmpty!1654))

(assert (= (and b!286208 (not condMapEmpty!1652)) mapNonEmpty!1654))

(assert (= start!64090 b!286208))

(assert (= (and b!286207 condMapEmpty!1653) mapIsEmpty!1653))

(assert (= (and b!286207 (not condMapEmpty!1653)) mapNonEmpty!1652))

(assert (= start!64090 b!286207))

(declare-fun m!419011 () Bool)

(assert (=> mapNonEmpty!1652 m!419011))

(declare-fun m!419013 () Bool)

(assert (=> b!286211 m!419013))

(declare-fun m!419015 () Bool)

(assert (=> b!286204 m!419015))

(declare-fun m!419017 () Bool)

(assert (=> start!64090 m!419017))

(declare-fun m!419019 () Bool)

(assert (=> start!64090 m!419019))

(declare-fun m!419021 () Bool)

(assert (=> start!64090 m!419021))

(declare-fun m!419023 () Bool)

(assert (=> b!286210 m!419023))

(declare-fun m!419025 () Bool)

(assert (=> mapNonEmpty!1654 m!419025))

(declare-fun m!419027 () Bool)

(assert (=> b!286212 m!419027))

(declare-fun m!419029 () Bool)

(assert (=> mapNonEmpty!1653 m!419029))

(declare-fun m!419031 () Bool)

(assert (=> b!286206 m!419031))

(check-sat (not mapNonEmpty!1654) tp_is_empty!531 (not b!286210) (not b!286212) (not mapNonEmpty!1652) (not b!286206) (not b!286211) (not start!64090) (not b!286204) (not mapNonEmpty!1653))
(check-sat)
