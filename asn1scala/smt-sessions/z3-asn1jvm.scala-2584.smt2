; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64296 () Bool)

(assert start!64296)

(declare-fun mapNonEmpty!2307 () Bool)

(declare-fun mapRes!2307 () Bool)

(declare-fun tp!2308 () Bool)

(declare-fun tp_is_empty!717 () Bool)

(assert (=> mapNonEmpty!2307 (= mapRes!2307 (and tp!2308 tp_is_empty!717))))

(declare-datatypes ((T!52583 0))(
  ( (T!52584 (val!358 Int)) )
))
(declare-datatypes ((array!16999 0))(
  ( (array!17000 (arr!8345 (Array (_ BitVec 32) T!52583)) (size!7349 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16999)

(declare-fun mapValue!2307 () T!52583)

(declare-fun mapKey!2308 () (_ BitVec 32))

(declare-fun mapRest!2308 () (Array (_ BitVec 32) T!52583))

(assert (=> mapNonEmpty!2307 (= (arr!8345 a1!596) (store mapRest!2308 mapKey!2308 mapValue!2307))))

(declare-fun e!205112 () Bool)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun b!288395 () Bool)

(assert (=> b!288395 (= e!205112 (and (not (= i!953 from!722)) (bvsle to!689 (size!7349 a1!596)) (bvsgt from!722 (bvsub i!953 #b00000000000000000000000000000001))))))

(declare-fun b!288396 () Bool)

(declare-fun e!205111 () Bool)

(declare-fun mapRes!2308 () Bool)

(assert (=> b!288396 (= e!205111 (and tp_is_empty!717 mapRes!2308))))

(declare-fun condMapEmpty!2307 () Bool)

(declare-fun a2!596 () array!16999)

(declare-fun mapDefault!2308 () T!52583)

(assert (=> b!288396 (= condMapEmpty!2307 (= (arr!8345 a2!596) ((as const (Array (_ BitVec 32) T!52583)) mapDefault!2308)))))

(declare-fun mapIsEmpty!2307 () Bool)

(assert (=> mapIsEmpty!2307 mapRes!2307))

(declare-fun b!288397 () Bool)

(declare-fun res!238363 () Bool)

(assert (=> b!288397 (=> (not res!238363) (not e!205112))))

(declare-fun arrayRangesEq!1457 (array!16999 array!16999 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288397 (= res!238363 (arrayRangesEq!1457 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288398 () Bool)

(declare-fun e!205110 () Bool)

(assert (=> b!288398 (= e!205110 (and tp_is_empty!717 mapRes!2307))))

(declare-fun condMapEmpty!2308 () Bool)

(declare-fun mapDefault!2307 () T!52583)

(assert (=> b!288398 (= condMapEmpty!2308 (= (arr!8345 a1!596) ((as const (Array (_ BitVec 32) T!52583)) mapDefault!2307)))))

(declare-fun mapIsEmpty!2308 () Bool)

(assert (=> mapIsEmpty!2308 mapRes!2308))

(declare-fun res!238362 () Bool)

(assert (=> start!64296 (=> (not res!238362) (not e!205112))))

(assert (=> start!64296 (= res!238362 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7349 a1!596) (size!7349 a2!596)) (bvslt to!689 (size!7349 a1!596))))))

(assert (=> start!64296 e!205112))

(declare-fun array_inv!6970 (array!16999) Bool)

(assert (=> start!64296 (and (array_inv!6970 a1!596) e!205110)))

(assert (=> start!64296 (and (array_inv!6970 a2!596) e!205111)))

(assert (=> start!64296 true))

(declare-fun b!288394 () Bool)

(declare-fun res!238360 () Bool)

(assert (=> b!288394 (=> (not res!238360) (not e!205112))))

(assert (=> b!288394 (= res!238360 (arrayRangesEq!1457 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun mapNonEmpty!2308 () Bool)

(declare-fun tp!2307 () Bool)

(assert (=> mapNonEmpty!2308 (= mapRes!2308 (and tp!2307 tp_is_empty!717))))

(declare-fun mapRest!2307 () (Array (_ BitVec 32) T!52583))

(declare-fun mapValue!2308 () T!52583)

(declare-fun mapKey!2307 () (_ BitVec 32))

(assert (=> mapNonEmpty!2308 (= (arr!8345 a2!596) (store mapRest!2307 mapKey!2307 mapValue!2308))))

(declare-fun b!288399 () Bool)

(declare-fun res!238361 () Bool)

(assert (=> b!288399 (=> (not res!238361) (not e!205112))))

(assert (=> b!288399 (= res!238361 (and (= (select (arr!8345 a1!596) to!689) (select (arr!8345 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(assert (= (and start!64296 res!238362) b!288397))

(assert (= (and b!288397 res!238363) b!288399))

(assert (= (and b!288399 res!238361) b!288394))

(assert (= (and b!288394 res!238360) b!288395))

(assert (= (and b!288398 condMapEmpty!2308) mapIsEmpty!2307))

(assert (= (and b!288398 (not condMapEmpty!2308)) mapNonEmpty!2307))

(assert (= start!64296 b!288398))

(assert (= (and b!288396 condMapEmpty!2307) mapIsEmpty!2308))

(assert (= (and b!288396 (not condMapEmpty!2307)) mapNonEmpty!2308))

(assert (= start!64296 b!288396))

(declare-fun m!421079 () Bool)

(assert (=> start!64296 m!421079))

(declare-fun m!421081 () Bool)

(assert (=> start!64296 m!421081))

(declare-fun m!421083 () Bool)

(assert (=> b!288397 m!421083))

(declare-fun m!421085 () Bool)

(assert (=> mapNonEmpty!2307 m!421085))

(declare-fun m!421087 () Bool)

(assert (=> mapNonEmpty!2308 m!421087))

(declare-fun m!421089 () Bool)

(assert (=> b!288399 m!421089))

(declare-fun m!421091 () Bool)

(assert (=> b!288399 m!421091))

(declare-fun m!421093 () Bool)

(assert (=> b!288394 m!421093))

(check-sat (not mapNonEmpty!2307) (not start!64296) tp_is_empty!717 (not b!288397) (not mapNonEmpty!2308) (not b!288394))
(check-sat)
