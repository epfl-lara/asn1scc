; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64308 () Bool)

(assert start!64308)

(declare-fun mapIsEmpty!2343 () Bool)

(declare-fun mapRes!2344 () Bool)

(assert (=> mapIsEmpty!2343 mapRes!2344))

(declare-fun b!288516 () Bool)

(declare-fun e!205166 () Bool)

(declare-fun tp_is_empty!729 () Bool)

(declare-fun mapRes!2343 () Bool)

(assert (=> b!288516 (= e!205166 (and tp_is_empty!729 mapRes!2343))))

(declare-fun condMapEmpty!2343 () Bool)

(declare-datatypes ((T!52635 0))(
  ( (T!52636 (val!364 Int)) )
))
(declare-datatypes ((array!17011 0))(
  ( (array!17012 (arr!8351 (Array (_ BitVec 32) T!52635)) (size!7355 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!17011)

(declare-fun mapDefault!2343 () T!52635)

(assert (=> b!288516 (= condMapEmpty!2343 (= (arr!8351 a1!596) ((as const (Array (_ BitVec 32) T!52635)) mapDefault!2343)))))

(declare-fun b!288517 () Bool)

(declare-fun res!238447 () Bool)

(declare-fun e!205164 () Bool)

(assert (=> b!288517 (=> (not res!238447) (not e!205164))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!288517 (= res!238447 (not (= i!953 from!722)))))

(declare-fun b!288518 () Bool)

(declare-fun res!238446 () Bool)

(assert (=> b!288518 (=> (not res!238446) (not e!205164))))

(declare-fun a2!596 () array!17011)

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1461 (array!17011 array!17011 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288518 (= res!238446 (arrayRangesEq!1461 a1!596 a2!596 i!953 (bvadd #b00000000000000000000000000000001 to!689)))))

(declare-fun b!288519 () Bool)

(declare-fun res!238449 () Bool)

(assert (=> b!288519 (=> (not res!238449) (not e!205164))))

(assert (=> b!288519 (= res!238449 (and (= (select (arr!8351 a1!596) to!689) (select (arr!8351 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689)))))

(declare-fun b!288520 () Bool)

(declare-fun res!238450 () Bool)

(assert (=> b!288520 (=> (not res!238450) (not e!205164))))

(assert (=> b!288520 (= res!238450 (arrayRangesEq!1461 a1!596 a2!596 from!722 to!689))))

(declare-fun b!288521 () Bool)

(assert (=> b!288521 (= e!205164 (not (and (bvsle from!722 (bvsub i!953 #b00000000000000000000000000000001)) (bvsle (bvsub i!953 #b00000000000000000000000000000001) to!689))))))

(assert (=> b!288521 (= (select (arr!8351 a1!596) (bvsub i!953 #b00000000000000000000000000000001)) (select (arr!8351 a2!596) (bvsub i!953 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!20003 0))(
  ( (Unit!20004) )
))
(declare-fun lt!418842 () Unit!20003)

(declare-fun arrayRangesEqImpliesEq!207 (array!17011 array!17011 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20003)

(assert (=> b!288521 (= lt!418842 (arrayRangesEqImpliesEq!207 a1!596 a2!596 from!722 (bvsub i!953 #b00000000000000000000000000000001) to!689))))

(declare-fun mapNonEmpty!2343 () Bool)

(declare-fun tp!2343 () Bool)

(assert (=> mapNonEmpty!2343 (= mapRes!2343 (and tp!2343 tp_is_empty!729))))

(declare-fun mapValue!2344 () T!52635)

(declare-fun mapKey!2344 () (_ BitVec 32))

(declare-fun mapRest!2343 () (Array (_ BitVec 32) T!52635))

(assert (=> mapNonEmpty!2343 (= (arr!8351 a1!596) (store mapRest!2343 mapKey!2344 mapValue!2344))))

(declare-fun res!238448 () Bool)

(assert (=> start!64308 (=> (not res!238448) (not e!205164))))

(assert (=> start!64308 (= res!238448 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7355 a1!596) (size!7355 a2!596)) (bvslt to!689 (size!7355 a1!596))))))

(assert (=> start!64308 e!205164))

(declare-fun array_inv!6973 (array!17011) Bool)

(assert (=> start!64308 (and (array_inv!6973 a1!596) e!205166)))

(declare-fun e!205165 () Bool)

(assert (=> start!64308 (and (array_inv!6973 a2!596) e!205165)))

(assert (=> start!64308 true))

(declare-fun mapIsEmpty!2344 () Bool)

(assert (=> mapIsEmpty!2344 mapRes!2343))

(declare-fun b!288522 () Bool)

(assert (=> b!288522 (= e!205165 (and tp_is_empty!729 mapRes!2344))))

(declare-fun condMapEmpty!2344 () Bool)

(declare-fun mapDefault!2344 () T!52635)

(assert (=> b!288522 (= condMapEmpty!2344 (= (arr!8351 a2!596) ((as const (Array (_ BitVec 32) T!52635)) mapDefault!2344)))))

(declare-fun mapNonEmpty!2344 () Bool)

(declare-fun tp!2344 () Bool)

(assert (=> mapNonEmpty!2344 (= mapRes!2344 (and tp!2344 tp_is_empty!729))))

(declare-fun mapKey!2343 () (_ BitVec 32))

(declare-fun mapRest!2344 () (Array (_ BitVec 32) T!52635))

(declare-fun mapValue!2343 () T!52635)

(assert (=> mapNonEmpty!2344 (= (arr!8351 a2!596) (store mapRest!2344 mapKey!2343 mapValue!2343))))

(assert (= (and start!64308 res!238448) b!288520))

(assert (= (and b!288520 res!238450) b!288519))

(assert (= (and b!288519 res!238449) b!288518))

(assert (= (and b!288518 res!238446) b!288517))

(assert (= (and b!288517 res!238447) b!288521))

(assert (= (and b!288516 condMapEmpty!2343) mapIsEmpty!2344))

(assert (= (and b!288516 (not condMapEmpty!2343)) mapNonEmpty!2343))

(assert (= start!64308 b!288516))

(assert (= (and b!288522 condMapEmpty!2344) mapIsEmpty!2343))

(assert (= (and b!288522 (not condMapEmpty!2344)) mapNonEmpty!2344))

(assert (= start!64308 b!288522))

(declare-fun m!421199 () Bool)

(assert (=> start!64308 m!421199))

(declare-fun m!421201 () Bool)

(assert (=> start!64308 m!421201))

(declare-fun m!421203 () Bool)

(assert (=> b!288520 m!421203))

(declare-fun m!421205 () Bool)

(assert (=> mapNonEmpty!2344 m!421205))

(declare-fun m!421207 () Bool)

(assert (=> b!288519 m!421207))

(declare-fun m!421209 () Bool)

(assert (=> b!288519 m!421209))

(declare-fun m!421211 () Bool)

(assert (=> b!288518 m!421211))

(declare-fun m!421213 () Bool)

(assert (=> b!288521 m!421213))

(declare-fun m!421215 () Bool)

(assert (=> b!288521 m!421215))

(declare-fun m!421217 () Bool)

(assert (=> b!288521 m!421217))

(declare-fun m!421219 () Bool)

(assert (=> mapNonEmpty!2343 m!421219))

(check-sat (not mapNonEmpty!2344) (not b!288520) (not b!288518) (not mapNonEmpty!2343) (not start!64308) (not b!288521) tp_is_empty!729)
(check-sat)
