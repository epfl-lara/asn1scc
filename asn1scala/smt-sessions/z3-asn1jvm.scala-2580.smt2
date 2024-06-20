; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64272 () Bool)

(assert start!64272)

(declare-fun mapNonEmpty!2235 () Bool)

(declare-fun mapRes!2236 () Bool)

(declare-fun tp!2235 () Bool)

(declare-fun tp_is_empty!693 () Bool)

(assert (=> mapNonEmpty!2235 (= mapRes!2236 (and tp!2235 tp_is_empty!693))))

(declare-datatypes ((T!52479 0))(
  ( (T!52480 (val!346 Int)) )
))
(declare-datatypes ((array!16975 0))(
  ( (array!16976 (arr!8333 (Array (_ BitVec 32) T!52479)) (size!7337 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16975)

(declare-fun mapRest!2235 () (Array (_ BitVec 32) T!52479))

(declare-fun mapKey!2236 () (_ BitVec 32))

(declare-fun mapValue!2235 () T!52479)

(assert (=> mapNonEmpty!2235 (= (arr!8333 a1!596) (store mapRest!2235 mapKey!2236 mapValue!2235))))

(declare-fun res!238210 () Bool)

(declare-fun e!205004 () Bool)

(assert (=> start!64272 (=> (not res!238210) (not e!205004))))

(declare-fun a2!596 () array!16975)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64272 (= res!238210 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7337 a1!596) (size!7337 a2!596)) (bvslt to!689 (size!7337 a1!596))))))

(assert (=> start!64272 e!205004))

(declare-fun e!205003 () Bool)

(declare-fun array_inv!6962 (array!16975) Bool)

(assert (=> start!64272 (and (array_inv!6962 a1!596) e!205003)))

(declare-fun e!205002 () Bool)

(assert (=> start!64272 (and (array_inv!6962 a2!596) e!205002)))

(assert (=> start!64272 true))

(declare-fun b!288169 () Bool)

(declare-fun mapRes!2235 () Bool)

(assert (=> b!288169 (= e!205002 (and tp_is_empty!693 mapRes!2235))))

(declare-fun condMapEmpty!2236 () Bool)

(declare-fun mapDefault!2235 () T!52479)

(assert (=> b!288169 (= condMapEmpty!2236 (= (arr!8333 a2!596) ((as const (Array (_ BitVec 32) T!52479)) mapDefault!2235)))))

(declare-fun mapNonEmpty!2236 () Bool)

(declare-fun tp!2236 () Bool)

(assert (=> mapNonEmpty!2236 (= mapRes!2235 (and tp!2236 tp_is_empty!693))))

(declare-fun mapKey!2235 () (_ BitVec 32))

(declare-fun mapValue!2236 () T!52479)

(declare-fun mapRest!2236 () (Array (_ BitVec 32) T!52479))

(assert (=> mapNonEmpty!2236 (= (arr!8333 a2!596) (store mapRest!2236 mapKey!2235 mapValue!2236))))

(declare-fun mapIsEmpty!2235 () Bool)

(assert (=> mapIsEmpty!2235 mapRes!2236))

(declare-fun mapIsEmpty!2236 () Bool)

(assert (=> mapIsEmpty!2236 mapRes!2235))

(declare-fun b!288170 () Bool)

(assert (=> b!288170 (= e!205003 (and tp_is_empty!693 mapRes!2236))))

(declare-fun condMapEmpty!2235 () Bool)

(declare-fun mapDefault!2236 () T!52479)

(assert (=> b!288170 (= condMapEmpty!2235 (= (arr!8333 a1!596) ((as const (Array (_ BitVec 32) T!52479)) mapDefault!2236)))))

(declare-fun b!288171 () Bool)

(declare-fun res!238208 () Bool)

(assert (=> b!288171 (=> (not res!238208) (not e!205004))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun arrayRangesEq!1448 (array!16975 array!16975 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288171 (= res!238208 (arrayRangesEq!1448 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288172 () Bool)

(declare-fun res!238207 () Bool)

(assert (=> b!288172 (=> (not res!238207) (not e!205004))))

(assert (=> b!288172 (= res!238207 (and (= (select (arr!8333 a1!596) to!689) (select (arr!8333 a2!596) to!689)) (bvsle i!953 to!689)))))

(declare-fun b!288173 () Bool)

(assert (=> b!288173 (= e!205004 (and (= i!953 from!722) (= (bvand to!689 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand to!689 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 to!689) #b10000000000000000000000000000000)))))))

(declare-fun b!288174 () Bool)

(declare-fun res!238209 () Bool)

(assert (=> b!288174 (=> (not res!238209) (not e!205004))))

(assert (=> b!288174 (= res!238209 (arrayRangesEq!1448 a1!596 a2!596 from!722 to!689))))

(assert (= (and start!64272 res!238210) b!288174))

(assert (= (and b!288174 res!238209) b!288172))

(assert (= (and b!288172 res!238207) b!288171))

(assert (= (and b!288171 res!238208) b!288173))

(assert (= (and b!288170 condMapEmpty!2235) mapIsEmpty!2235))

(assert (= (and b!288170 (not condMapEmpty!2235)) mapNonEmpty!2235))

(assert (= start!64272 b!288170))

(assert (= (and b!288169 condMapEmpty!2236) mapIsEmpty!2236))

(assert (= (and b!288169 (not condMapEmpty!2236)) mapNonEmpty!2236))

(assert (= start!64272 b!288169))

(declare-fun m!420881 () Bool)

(assert (=> mapNonEmpty!2235 m!420881))

(declare-fun m!420883 () Bool)

(assert (=> b!288171 m!420883))

(declare-fun m!420885 () Bool)

(assert (=> b!288172 m!420885))

(declare-fun m!420887 () Bool)

(assert (=> b!288172 m!420887))

(declare-fun m!420889 () Bool)

(assert (=> b!288174 m!420889))

(declare-fun m!420891 () Bool)

(assert (=> start!64272 m!420891))

(declare-fun m!420893 () Bool)

(assert (=> start!64272 m!420893))

(declare-fun m!420895 () Bool)

(assert (=> mapNonEmpty!2236 m!420895))

(check-sat (not mapNonEmpty!2236) (not b!288171) (not mapNonEmpty!2235) (not b!288174) (not start!64272) tp_is_empty!693)
(check-sat)
