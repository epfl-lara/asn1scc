; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64284 () Bool)

(assert start!64284)

(declare-fun b!288286 () Bool)

(declare-fun e!205058 () Bool)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!288286 (= e!205058 (and (not (= i!953 from!722)) (not (= (bvand i!953 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!953 #b10000000000000000000000000000000) (bvand (bvsub i!953 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun res!238290 () Bool)

(assert (=> start!64284 (=> (not res!238290) (not e!205058))))

(declare-datatypes ((T!52531 0))(
  ( (T!52532 (val!352 Int)) )
))
(declare-datatypes ((array!16987 0))(
  ( (array!16988 (arr!8339 (Array (_ BitVec 32) T!52531)) (size!7343 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16987)

(declare-fun a2!596 () array!16987)

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64284 (= res!238290 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7343 a1!596) (size!7343 a2!596)) (bvslt to!689 (size!7343 a1!596))))))

(assert (=> start!64284 e!205058))

(declare-fun e!205057 () Bool)

(declare-fun array_inv!6966 (array!16987) Bool)

(assert (=> start!64284 (and (array_inv!6966 a1!596) e!205057)))

(declare-fun e!205056 () Bool)

(assert (=> start!64284 (and (array_inv!6966 a2!596) e!205056)))

(assert (=> start!64284 true))

(declare-fun b!288287 () Bool)

(declare-fun res!238291 () Bool)

(assert (=> b!288287 (=> (not res!238291) (not e!205058))))

(declare-fun arrayRangesEq!1452 (array!16987 array!16987 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288287 (= res!238291 (arrayRangesEq!1452 a1!596 a2!596 from!722 to!689))))

(declare-fun mapNonEmpty!2271 () Bool)

(declare-fun mapRes!2272 () Bool)

(declare-fun tp!2272 () Bool)

(declare-fun tp_is_empty!705 () Bool)

(assert (=> mapNonEmpty!2271 (= mapRes!2272 (and tp!2272 tp_is_empty!705))))

(declare-fun mapValue!2271 () T!52531)

(declare-fun mapRest!2271 () (Array (_ BitVec 32) T!52531))

(declare-fun mapKey!2272 () (_ BitVec 32))

(assert (=> mapNonEmpty!2271 (= (arr!8339 a1!596) (store mapRest!2271 mapKey!2272 mapValue!2271))))

(declare-fun b!288288 () Bool)

(declare-fun res!238288 () Bool)

(assert (=> b!288288 (=> (not res!238288) (not e!205058))))

(assert (=> b!288288 (= res!238288 (and (= (select (arr!8339 a1!596) to!689) (select (arr!8339 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288289 () Bool)

(assert (=> b!288289 (= e!205057 (and tp_is_empty!705 mapRes!2272))))

(declare-fun condMapEmpty!2271 () Bool)

(declare-fun mapDefault!2272 () T!52531)

(assert (=> b!288289 (= condMapEmpty!2271 (= (arr!8339 a1!596) ((as const (Array (_ BitVec 32) T!52531)) mapDefault!2272)))))

(declare-fun b!288290 () Bool)

(declare-fun res!238289 () Bool)

(assert (=> b!288290 (=> (not res!238289) (not e!205058))))

(assert (=> b!288290 (= res!238289 (arrayRangesEq!1452 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapNonEmpty!2272 () Bool)

(declare-fun mapRes!2271 () Bool)

(declare-fun tp!2271 () Bool)

(assert (=> mapNonEmpty!2272 (= mapRes!2271 (and tp!2271 tp_is_empty!705))))

(declare-fun mapKey!2271 () (_ BitVec 32))

(declare-fun mapValue!2272 () T!52531)

(declare-fun mapRest!2272 () (Array (_ BitVec 32) T!52531))

(assert (=> mapNonEmpty!2272 (= (arr!8339 a2!596) (store mapRest!2272 mapKey!2271 mapValue!2272))))

(declare-fun mapIsEmpty!2271 () Bool)

(assert (=> mapIsEmpty!2271 mapRes!2272))

(declare-fun b!288291 () Bool)

(assert (=> b!288291 (= e!205056 (and tp_is_empty!705 mapRes!2271))))

(declare-fun condMapEmpty!2272 () Bool)

(declare-fun mapDefault!2271 () T!52531)

(assert (=> b!288291 (= condMapEmpty!2272 (= (arr!8339 a2!596) ((as const (Array (_ BitVec 32) T!52531)) mapDefault!2271)))))

(declare-fun mapIsEmpty!2272 () Bool)

(assert (=> mapIsEmpty!2272 mapRes!2271))

(assert (= (and start!64284 res!238290) b!288287))

(assert (= (and b!288287 res!238291) b!288288))

(assert (= (and b!288288 res!238288) b!288290))

(assert (= (and b!288290 res!238289) b!288286))

(assert (= (and b!288289 condMapEmpty!2271) mapIsEmpty!2271))

(assert (= (and b!288289 (not condMapEmpty!2271)) mapNonEmpty!2271))

(assert (= start!64284 b!288289))

(assert (= (and b!288291 condMapEmpty!2272) mapIsEmpty!2272))

(assert (= (and b!288291 (not condMapEmpty!2272)) mapNonEmpty!2272))

(assert (= start!64284 b!288291))

(declare-fun m!420983 () Bool)

(assert (=> mapNonEmpty!2272 m!420983))

(declare-fun m!420985 () Bool)

(assert (=> start!64284 m!420985))

(declare-fun m!420987 () Bool)

(assert (=> start!64284 m!420987))

(declare-fun m!420989 () Bool)

(assert (=> b!288290 m!420989))

(declare-fun m!420991 () Bool)

(assert (=> b!288287 m!420991))

(declare-fun m!420993 () Bool)

(assert (=> mapNonEmpty!2271 m!420993))

(declare-fun m!420995 () Bool)

(assert (=> b!288288 m!420995))

(declare-fun m!420997 () Bool)

(assert (=> b!288288 m!420997))

(check-sat (not mapNonEmpty!2272) (not mapNonEmpty!2271) (not b!288290) (not start!64284) tp_is_empty!705 (not b!288287))
(check-sat)
