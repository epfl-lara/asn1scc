; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64106 () Bool)

(assert start!64106)

(declare-fun b!286404 () Bool)

(declare-fun res!236963 () Bool)

(declare-fun e!204160 () Bool)

(assert (=> b!286404 (=> (not res!236963) (not e!204160))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-datatypes ((T!51829 0))(
  ( (T!51830 (val!271 Int)) )
))
(declare-datatypes ((array!16822 0))(
  ( (array!16823 (arr!8258 (Array (_ BitVec 32) T!51829)) (size!7262 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16822)

(declare-fun a3!68 () array!16822)

(declare-fun arrayRangesEq!1401 (array!16822 array!16822 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286404 (= res!236963 (arrayRangesEq!1401 a1!647 a3!68 from!773 i!964))))

(declare-fun mapNonEmpty!1711 () Bool)

(declare-fun mapRes!1711 () Bool)

(declare-fun tp!1713 () Bool)

(declare-fun tp_is_empty!543 () Bool)

(assert (=> mapNonEmpty!1711 (= mapRes!1711 (and tp!1713 tp_is_empty!543))))

(declare-fun mapKey!1713 () (_ BitVec 32))

(declare-fun a2!647 () array!16822)

(declare-fun mapRest!1711 () (Array (_ BitVec 32) T!51829))

(declare-fun mapValue!1713 () T!51829)

(assert (=> mapNonEmpty!1711 (= (arr!8258 a2!647) (store mapRest!1711 mapKey!1713 mapValue!1713))))

(declare-fun mapIsEmpty!1711 () Bool)

(declare-fun mapRes!1713 () Bool)

(assert (=> mapIsEmpty!1711 mapRes!1713))

(declare-fun b!286405 () Bool)

(declare-fun e!204159 () Bool)

(assert (=> b!286405 (= e!204159 (and tp_is_empty!543 mapRes!1713))))

(declare-fun condMapEmpty!1713 () Bool)

(declare-fun mapDefault!1712 () T!51829)

(assert (=> b!286405 (= condMapEmpty!1713 (= (arr!8258 a3!68) ((as const (Array (_ BitVec 32) T!51829)) mapDefault!1712)))))

(declare-fun mapNonEmpty!1712 () Bool)

(declare-fun mapRes!1712 () Bool)

(declare-fun tp!1712 () Bool)

(assert (=> mapNonEmpty!1712 (= mapRes!1712 (and tp!1712 tp_is_empty!543))))

(declare-fun mapRest!1713 () (Array (_ BitVec 32) T!51829))

(declare-fun mapValue!1711 () T!51829)

(declare-fun mapKey!1712 () (_ BitVec 32))

(assert (=> mapNonEmpty!1712 (= (arr!8258 a1!647) (store mapRest!1713 mapKey!1712 mapValue!1711))))

(declare-fun b!286406 () Bool)

(declare-fun res!236956 () Bool)

(assert (=> b!286406 (=> (not res!236956) (not e!204160))))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286406 (= res!236956 (arrayRangesEq!1401 a1!647 a2!647 from!773 mid!71))))

(declare-fun mapIsEmpty!1712 () Bool)

(assert (=> mapIsEmpty!1712 mapRes!1711))

(declare-fun b!286407 () Bool)

(assert (=> b!286407 (= e!204160 (not (or (not (= (bvand i!964 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!964 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!964) #b10000000000000000000000000000000)))))))

(assert (=> b!286407 (arrayRangesEq!1401 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19943 0))(
  ( (Unit!19944) )
))
(declare-fun lt!418638 () Unit!19943)

(declare-fun arrayRangesEqAppend!13 (array!16822 array!16822 (_ BitVec 32) (_ BitVec 32)) Unit!19943)

(assert (=> b!286407 (= lt!418638 (arrayRangesEqAppend!13 a1!647 a3!68 from!773 i!964))))

(declare-fun mapNonEmpty!1713 () Bool)

(declare-fun tp!1711 () Bool)

(assert (=> mapNonEmpty!1713 (= mapRes!1713 (and tp!1711 tp_is_empty!543))))

(declare-fun mapRest!1712 () (Array (_ BitVec 32) T!51829))

(declare-fun mapKey!1711 () (_ BitVec 32))

(declare-fun mapValue!1712 () T!51829)

(assert (=> mapNonEmpty!1713 (= (arr!8258 a3!68) (store mapRest!1712 mapKey!1711 mapValue!1712))))

(declare-fun b!286408 () Bool)

(declare-fun res!236957 () Bool)

(assert (=> b!286408 (=> (not res!236957) (not e!204160))))

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!286408 (= res!236957 (arrayRangesEq!1401 a2!647 a3!68 from!773 to!740))))

(declare-fun res!236960 () Bool)

(assert (=> start!64106 (=> (not res!236960) (not e!204160))))

(assert (=> start!64106 (= res!236960 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7262 a1!647) (size!7262 a2!647)) (bvsle (size!7262 a2!647) (size!7262 a3!68)) (bvsle mid!71 (size!7262 a1!647)) (bvsle to!740 (size!7262 a2!647))))))

(assert (=> start!64106 e!204160))

(declare-fun e!204162 () Bool)

(declare-fun array_inv!6917 (array!16822) Bool)

(assert (=> start!64106 (and (array_inv!6917 a2!647) e!204162)))

(assert (=> start!64106 true))

(declare-fun e!204161 () Bool)

(assert (=> start!64106 (and (array_inv!6917 a1!647) e!204161)))

(assert (=> start!64106 (and (array_inv!6917 a3!68) e!204159)))

(declare-fun b!286409 () Bool)

(declare-fun res!236959 () Bool)

(assert (=> b!286409 (=> (not res!236959) (not e!204160))))

(assert (=> b!286409 (= res!236959 (not (= i!964 mid!71)))))

(declare-fun b!286410 () Bool)

(declare-fun res!236962 () Bool)

(assert (=> b!286410 (=> (not res!236962) (not e!204160))))

(assert (=> b!286410 (= res!236962 (arrayRangesEq!1401 a2!647 a3!68 i!964 to!740))))

(declare-fun b!286411 () Bool)

(declare-fun res!236958 () Bool)

(assert (=> b!286411 (=> (not res!236958) (not e!204160))))

(assert (=> b!286411 (= res!236958 (arrayRangesEq!1401 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!286412 () Bool)

(declare-fun res!236961 () Bool)

(assert (=> b!286412 (=> (not res!236961) (not e!204160))))

(assert (=> b!286412 (= res!236961 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!286413 () Bool)

(assert (=> b!286413 (= e!204162 (and tp_is_empty!543 mapRes!1711))))

(declare-fun condMapEmpty!1711 () Bool)

(declare-fun mapDefault!1711 () T!51829)

(assert (=> b!286413 (= condMapEmpty!1711 (= (arr!8258 a2!647) ((as const (Array (_ BitVec 32) T!51829)) mapDefault!1711)))))

(declare-fun mapIsEmpty!1713 () Bool)

(assert (=> mapIsEmpty!1713 mapRes!1712))

(declare-fun b!286414 () Bool)

(assert (=> b!286414 (= e!204161 (and tp_is_empty!543 mapRes!1712))))

(declare-fun condMapEmpty!1712 () Bool)

(declare-fun mapDefault!1713 () T!51829)

(assert (=> b!286414 (= condMapEmpty!1712 (= (arr!8258 a1!647) ((as const (Array (_ BitVec 32) T!51829)) mapDefault!1713)))))

(assert (= (and start!64106 res!236960) b!286406))

(assert (= (and b!286406 res!236956) b!286408))

(assert (= (and b!286408 res!236957) b!286412))

(assert (= (and b!286412 res!236961) b!286411))

(assert (= (and b!286411 res!236958) b!286410))

(assert (= (and b!286410 res!236962) b!286404))

(assert (= (and b!286404 res!236963) b!286409))

(assert (= (and b!286409 res!236959) b!286407))

(assert (= (and b!286413 condMapEmpty!1711) mapIsEmpty!1712))

(assert (= (and b!286413 (not condMapEmpty!1711)) mapNonEmpty!1711))

(assert (= start!64106 b!286413))

(assert (= (and b!286414 condMapEmpty!1712) mapIsEmpty!1713))

(assert (= (and b!286414 (not condMapEmpty!1712)) mapNonEmpty!1712))

(assert (= start!64106 b!286414))

(assert (= (and b!286405 condMapEmpty!1713) mapIsEmpty!1711))

(assert (= (and b!286405 (not condMapEmpty!1713)) mapNonEmpty!1713))

(assert (= start!64106 b!286405))

(declare-fun m!419183 () Bool)

(assert (=> start!64106 m!419183))

(declare-fun m!419185 () Bool)

(assert (=> start!64106 m!419185))

(declare-fun m!419187 () Bool)

(assert (=> start!64106 m!419187))

(declare-fun m!419189 () Bool)

(assert (=> b!286410 m!419189))

(declare-fun m!419191 () Bool)

(assert (=> b!286408 m!419191))

(declare-fun m!419193 () Bool)

(assert (=> b!286411 m!419193))

(declare-fun m!419195 () Bool)

(assert (=> b!286404 m!419195))

(declare-fun m!419197 () Bool)

(assert (=> b!286406 m!419197))

(declare-fun m!419199 () Bool)

(assert (=> mapNonEmpty!1711 m!419199))

(declare-fun m!419201 () Bool)

(assert (=> b!286407 m!419201))

(declare-fun m!419203 () Bool)

(assert (=> b!286407 m!419203))

(declare-fun m!419205 () Bool)

(assert (=> mapNonEmpty!1712 m!419205))

(declare-fun m!419207 () Bool)

(assert (=> mapNonEmpty!1713 m!419207))

(check-sat (not b!286404) (not mapNonEmpty!1712) (not mapNonEmpty!1713) tp_is_empty!543 (not start!64106) (not mapNonEmpty!1711) (not b!286407) (not b!286408) (not b!286411) (not b!286406) (not b!286410))
(check-sat)
