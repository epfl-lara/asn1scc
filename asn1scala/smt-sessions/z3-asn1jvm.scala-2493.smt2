; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63216 () Bool)

(assert start!63216)

(declare-fun b!283246 () Bool)

(declare-fun res!234825 () Bool)

(declare-fun e!202255 () Bool)

(assert (=> b!283246 (=> (not res!234825) (not e!202255))))

(declare-datatypes ((T!50415 0))(
  ( (T!50416 (val!184 Int)) )
))
(declare-datatypes ((array!16404 0))(
  ( (array!16405 (arr!8081 (Array (_ BitVec 32) T!50415)) (size!7085 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16404)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16404)

(declare-fun from!597 () (_ BitVec 32))

(declare-fun arrayRangesEq!1336 (array!16404 array!16404 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283246 (= res!234825 (arrayRangesEq!1336 a1!471 a2!471 from!597 to!564))))

(declare-fun mapNonEmpty!955 () Bool)

(declare-fun mapRes!955 () Bool)

(declare-fun tp!955 () Bool)

(declare-fun tp_is_empty!369 () Bool)

(assert (=> mapNonEmpty!955 (= mapRes!955 (and tp!955 tp_is_empty!369))))

(declare-fun mapRest!955 () (Array (_ BitVec 32) T!50415))

(declare-fun mapKey!955 () (_ BitVec 32))

(declare-fun mapValue!955 () T!50415)

(assert (=> mapNonEmpty!955 (= (arr!8081 a2!471) (store mapRest!955 mapKey!955 mapValue!955))))

(declare-fun b!283247 () Bool)

(declare-fun e!202254 () Bool)

(declare-fun mapRes!954 () Bool)

(assert (=> b!283247 (= e!202254 (and tp_is_empty!369 mapRes!954))))

(declare-fun condMapEmpty!954 () Bool)

(declare-fun mapDefault!954 () T!50415)

(assert (=> b!283247 (= condMapEmpty!954 (= (arr!8081 a1!471) ((as const (Array (_ BitVec 32) T!50415)) mapDefault!954)))))

(declare-fun b!283248 () Bool)

(declare-fun i!913 () (_ BitVec 32))

(assert (=> b!283248 (= e!202255 (and (not (= i!913 from!597)) (not (= (bvand i!913 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!913 #b10000000000000000000000000000000) (bvand (bvsub i!913 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!283249 () Bool)

(declare-fun res!234826 () Bool)

(assert (=> b!283249 (=> (not res!234826) (not e!202255))))

(assert (=> b!283249 (= res!234826 (arrayRangesEq!1336 a2!471 a1!471 i!913 to!564))))

(declare-fun mapIsEmpty!954 () Bool)

(assert (=> mapIsEmpty!954 mapRes!955))

(declare-fun mapIsEmpty!955 () Bool)

(assert (=> mapIsEmpty!955 mapRes!954))

(declare-fun b!283250 () Bool)

(declare-fun res!234823 () Bool)

(assert (=> b!283250 (=> (not res!234823) (not e!202255))))

(assert (=> b!283250 (= res!234823 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun b!283251 () Bool)

(declare-fun e!202256 () Bool)

(assert (=> b!283251 (= e!202256 (and tp_is_empty!369 mapRes!955))))

(declare-fun condMapEmpty!955 () Bool)

(declare-fun mapDefault!955 () T!50415)

(assert (=> b!283251 (= condMapEmpty!955 (= (arr!8081 a2!471) ((as const (Array (_ BitVec 32) T!50415)) mapDefault!955)))))

(declare-fun res!234824 () Bool)

(assert (=> start!63216 (=> (not res!234824) (not e!202255))))

(assert (=> start!63216 (= res!234824 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7085 a1!471)) (= (size!7085 a1!471) (size!7085 a2!471))))))

(assert (=> start!63216 e!202255))

(declare-fun array_inv!6784 (array!16404) Bool)

(assert (=> start!63216 (and (array_inv!6784 a1!471) e!202254)))

(assert (=> start!63216 true))

(assert (=> start!63216 (and (array_inv!6784 a2!471) e!202256)))

(declare-fun mapNonEmpty!954 () Bool)

(declare-fun tp!954 () Bool)

(assert (=> mapNonEmpty!954 (= mapRes!954 (and tp!954 tp_is_empty!369))))

(declare-fun mapRest!954 () (Array (_ BitVec 32) T!50415))

(declare-fun mapKey!954 () (_ BitVec 32))

(declare-fun mapValue!954 () T!50415)

(assert (=> mapNonEmpty!954 (= (arr!8081 a1!471) (store mapRest!954 mapKey!954 mapValue!954))))

(assert (= (and start!63216 res!234824) b!283246))

(assert (= (and b!283246 res!234825) b!283250))

(assert (= (and b!283250 res!234823) b!283249))

(assert (= (and b!283249 res!234826) b!283248))

(assert (= (and b!283247 condMapEmpty!954) mapIsEmpty!955))

(assert (= (and b!283247 (not condMapEmpty!954)) mapNonEmpty!954))

(assert (= start!63216 b!283247))

(assert (= (and b!283251 condMapEmpty!955) mapIsEmpty!954))

(assert (= (and b!283251 (not condMapEmpty!955)) mapNonEmpty!955))

(assert (= start!63216 b!283251))

(declare-fun m!416291 () Bool)

(assert (=> b!283249 m!416291))

(declare-fun m!416293 () Bool)

(assert (=> mapNonEmpty!955 m!416293))

(declare-fun m!416295 () Bool)

(assert (=> start!63216 m!416295))

(declare-fun m!416297 () Bool)

(assert (=> start!63216 m!416297))

(declare-fun m!416299 () Bool)

(assert (=> mapNonEmpty!954 m!416299))

(declare-fun m!416301 () Bool)

(assert (=> b!283246 m!416301))

(check-sat (not mapNonEmpty!954) (not start!63216) (not b!283249) (not mapNonEmpty!955) (not b!283246) tp_is_empty!369)
(check-sat)
