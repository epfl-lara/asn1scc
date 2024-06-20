; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64018 () Bool)

(assert start!64018)

(declare-fun mapIsEmpty!1328 () Bool)

(declare-fun mapRes!1330 () Bool)

(assert (=> mapIsEmpty!1328 mapRes!1330))

(declare-fun res!235903 () Bool)

(declare-fun e!203617 () Bool)

(assert (=> start!64018 (=> (not res!235903) (not e!203617))))

(declare-datatypes ((T!51465 0))(
  ( (T!51466 (val!229 Int)) )
))
(declare-datatypes ((array!16737 0))(
  ( (array!16738 (arr!8216 (Array (_ BitVec 32) T!51465)) (size!7220 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16737)

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun a1!647 () array!16737)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a3!68 () array!16737)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64018 (= res!235903 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7220 a1!647) (size!7220 a2!647)) (bvsle (size!7220 a2!647) (size!7220 a3!68)) (bvsle mid!71 (size!7220 a1!647)) (bvsle to!740 (size!7220 a2!647))))))

(assert (=> start!64018 e!203617))

(declare-fun e!203614 () Bool)

(declare-fun array_inv!6896 (array!16737) Bool)

(assert (=> start!64018 (and (array_inv!6896 a2!647) e!203614)))

(assert (=> start!64018 true))

(declare-fun e!203616 () Bool)

(assert (=> start!64018 (and (array_inv!6896 a1!647) e!203616)))

(declare-fun e!203615 () Bool)

(assert (=> start!64018 (and (array_inv!6896 a3!68) e!203615)))

(declare-fun b!284970 () Bool)

(declare-fun tp_is_empty!459 () Bool)

(declare-fun mapRes!1328 () Bool)

(assert (=> b!284970 (= e!203616 (and tp_is_empty!459 mapRes!1328))))

(declare-fun condMapEmpty!1329 () Bool)

(declare-fun mapDefault!1328 () T!51465)

(assert (=> b!284970 (= condMapEmpty!1329 (= (arr!8216 a1!647) ((as const (Array (_ BitVec 32) T!51465)) mapDefault!1328)))))

(declare-fun mapNonEmpty!1328 () Bool)

(declare-fun tp!1330 () Bool)

(assert (=> mapNonEmpty!1328 (= mapRes!1330 (and tp!1330 tp_is_empty!459))))

(declare-fun mapKey!1330 () (_ BitVec 32))

(declare-fun mapRest!1328 () (Array (_ BitVec 32) T!51465))

(declare-fun mapValue!1330 () T!51465)

(assert (=> mapNonEmpty!1328 (= (arr!8216 a2!647) (store mapRest!1328 mapKey!1330 mapValue!1330))))

(declare-fun b!284971 () Bool)

(declare-fun res!235906 () Bool)

(assert (=> b!284971 (=> (not res!235906) (not e!203617))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun arrayRangesEq!1364 (array!16737 array!16737 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284971 (= res!235906 (arrayRangesEq!1364 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!284972 () Bool)

(declare-fun res!235907 () Bool)

(assert (=> b!284972 (=> (not res!235907) (not e!203617))))

(assert (=> b!284972 (= res!235907 (arrayRangesEq!1364 a2!647 a3!68 i!964 to!740))))

(declare-fun b!284973 () Bool)

(declare-fun res!235902 () Bool)

(assert (=> b!284973 (=> (not res!235902) (not e!203617))))

(assert (=> b!284973 (= res!235902 (arrayRangesEq!1364 a1!647 a2!647 from!773 mid!71))))

(declare-fun b!284974 () Bool)

(assert (=> b!284974 (= e!203614 (and tp_is_empty!459 mapRes!1330))))

(declare-fun condMapEmpty!1328 () Bool)

(declare-fun mapDefault!1329 () T!51465)

(assert (=> b!284974 (= condMapEmpty!1328 (= (arr!8216 a2!647) ((as const (Array (_ BitVec 32) T!51465)) mapDefault!1329)))))

(declare-fun b!284975 () Bool)

(declare-fun mapRes!1329 () Bool)

(assert (=> b!284975 (= e!203615 (and tp_is_empty!459 mapRes!1329))))

(declare-fun condMapEmpty!1330 () Bool)

(declare-fun mapDefault!1330 () T!51465)

(assert (=> b!284975 (= condMapEmpty!1330 (= (arr!8216 a3!68) ((as const (Array (_ BitVec 32) T!51465)) mapDefault!1330)))))

(declare-fun b!284976 () Bool)

(assert (=> b!284976 (= e!203617 (and (= i!964 mid!71) (bvsgt (size!7220 a1!647) (size!7220 a3!68))))))

(declare-fun b!284977 () Bool)

(declare-fun res!235908 () Bool)

(assert (=> b!284977 (=> (not res!235908) (not e!203617))))

(assert (=> b!284977 (= res!235908 (arrayRangesEq!1364 a1!647 a3!68 from!773 i!964))))

(declare-fun mapIsEmpty!1329 () Bool)

(assert (=> mapIsEmpty!1329 mapRes!1329))

(declare-fun mapNonEmpty!1329 () Bool)

(declare-fun tp!1329 () Bool)

(assert (=> mapNonEmpty!1329 (= mapRes!1328 (and tp!1329 tp_is_empty!459))))

(declare-fun mapRest!1330 () (Array (_ BitVec 32) T!51465))

(declare-fun mapKey!1329 () (_ BitVec 32))

(declare-fun mapValue!1329 () T!51465)

(assert (=> mapNonEmpty!1329 (= (arr!8216 a1!647) (store mapRest!1330 mapKey!1329 mapValue!1329))))

(declare-fun mapNonEmpty!1330 () Bool)

(declare-fun tp!1328 () Bool)

(assert (=> mapNonEmpty!1330 (= mapRes!1329 (and tp!1328 tp_is_empty!459))))

(declare-fun mapKey!1328 () (_ BitVec 32))

(declare-fun mapRest!1329 () (Array (_ BitVec 32) T!51465))

(declare-fun mapValue!1328 () T!51465)

(assert (=> mapNonEmpty!1330 (= (arr!8216 a3!68) (store mapRest!1329 mapKey!1328 mapValue!1328))))

(declare-fun b!284978 () Bool)

(declare-fun res!235905 () Bool)

(assert (=> b!284978 (=> (not res!235905) (not e!203617))))

(assert (=> b!284978 (= res!235905 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!284979 () Bool)

(declare-fun res!235904 () Bool)

(assert (=> b!284979 (=> (not res!235904) (not e!203617))))

(assert (=> b!284979 (= res!235904 (arrayRangesEq!1364 a2!647 a3!68 from!773 to!740))))

(declare-fun mapIsEmpty!1330 () Bool)

(assert (=> mapIsEmpty!1330 mapRes!1328))

(assert (= (and start!64018 res!235903) b!284973))

(assert (= (and b!284973 res!235902) b!284979))

(assert (= (and b!284979 res!235904) b!284978))

(assert (= (and b!284978 res!235905) b!284971))

(assert (= (and b!284971 res!235906) b!284972))

(assert (= (and b!284972 res!235907) b!284977))

(assert (= (and b!284977 res!235908) b!284976))

(assert (= (and b!284974 condMapEmpty!1328) mapIsEmpty!1328))

(assert (= (and b!284974 (not condMapEmpty!1328)) mapNonEmpty!1328))

(assert (= start!64018 b!284974))

(assert (= (and b!284970 condMapEmpty!1329) mapIsEmpty!1330))

(assert (= (and b!284970 (not condMapEmpty!1329)) mapNonEmpty!1329))

(assert (= start!64018 b!284970))

(assert (= (and b!284975 condMapEmpty!1330) mapIsEmpty!1329))

(assert (= (and b!284975 (not condMapEmpty!1330)) mapNonEmpty!1330))

(assert (= start!64018 b!284975))

(declare-fun m!418057 () Bool)

(assert (=> mapNonEmpty!1328 m!418057))

(declare-fun m!418059 () Bool)

(assert (=> start!64018 m!418059))

(declare-fun m!418061 () Bool)

(assert (=> start!64018 m!418061))

(declare-fun m!418063 () Bool)

(assert (=> start!64018 m!418063))

(declare-fun m!418065 () Bool)

(assert (=> b!284979 m!418065))

(declare-fun m!418067 () Bool)

(assert (=> b!284973 m!418067))

(declare-fun m!418069 () Bool)

(assert (=> mapNonEmpty!1330 m!418069))

(declare-fun m!418071 () Bool)

(assert (=> mapNonEmpty!1329 m!418071))

(declare-fun m!418073 () Bool)

(assert (=> b!284977 m!418073))

(declare-fun m!418075 () Bool)

(assert (=> b!284971 m!418075))

(declare-fun m!418077 () Bool)

(assert (=> b!284972 m!418077))

(check-sat (not start!64018) (not b!284979) (not b!284977) (not mapNonEmpty!1329) (not mapNonEmpty!1330) (not b!284972) (not b!284973) tp_is_empty!459 (not mapNonEmpty!1328) (not b!284971))
(check-sat)
