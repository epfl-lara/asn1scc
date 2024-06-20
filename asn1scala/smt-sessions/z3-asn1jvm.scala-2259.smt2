; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57206 () Bool)

(assert start!57206)

(declare-fun b!262399 () Bool)

(declare-fun e!182662 () Bool)

(declare-fun e!182664 () Bool)

(assert (=> b!262399 (= e!182662 e!182664)))

(declare-fun res!219591 () Bool)

(assert (=> b!262399 (=> (not res!219591) (not e!182664))))

(declare-datatypes ((T!45639 0))(
  ( (T!45640 (val!136 Int)) )
))
(declare-datatypes ((array!14617 0))(
  ( (array!14618 (arr!7370 (Array (_ BitVec 32) T!45639)) (size!6383 (_ BitVec 32))) )
))
(declare-fun lt!404080 () array!14617)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun a!416 () array!14617)

(declare-fun arrayRangesEq!994 (array!14617 array!14617 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262399 (= res!219591 (arrayRangesEq!994 a!416 lt!404080 i!922 at!218))))

(declare-fun v!333 () T!45639)

(assert (=> b!262399 (= lt!404080 (array!14618 (store (arr!7370 a!416) at!218 v!333) (size!6383 a!416)))))

(declare-fun mapIsEmpty!658 () Bool)

(declare-fun mapRes!658 () Bool)

(assert (=> mapIsEmpty!658 mapRes!658))

(declare-fun b!262400 () Bool)

(declare-fun res!219590 () Bool)

(assert (=> b!262400 (=> (not res!219590) (not e!182664))))

(assert (=> b!262400 (= res!219590 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun b!262401 () Bool)

(assert (=> b!262401 (= e!182664 (not true))))

(assert (=> b!262401 (arrayRangesEq!994 a!416 lt!404080 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18717 0))(
  ( (Unit!18718) )
))
(declare-fun lt!404081 () Unit!18717)

(declare-fun rec!46 (array!14617 (_ BitVec 32) T!45639 (_ BitVec 32)) Unit!18717)

(assert (=> b!262401 (= lt!404081 (rec!46 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun b!262402 () Bool)

(declare-fun res!219589 () Bool)

(assert (=> b!262402 (=> (not res!219589) (not e!182664))))

(assert (=> b!262402 (= res!219589 (arrayRangesEq!994 a!416 lt!404080 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun res!219592 () Bool)

(assert (=> start!57206 (=> (not res!219592) (not e!182662))))

(assert (=> start!57206 (= res!219592 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6383 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57206 e!182662))

(assert (=> start!57206 true))

(declare-fun e!182663 () Bool)

(declare-fun array_inv!6108 (array!14617) Bool)

(assert (=> start!57206 (and (array_inv!6108 a!416) e!182663)))

(declare-fun tp_is_empty!273 () Bool)

(assert (=> start!57206 tp_is_empty!273))

(declare-fun b!262403 () Bool)

(assert (=> b!262403 (= e!182663 (and tp_is_empty!273 mapRes!658))))

(declare-fun condMapEmpty!658 () Bool)

(declare-fun mapDefault!658 () T!45639)

(assert (=> b!262403 (= condMapEmpty!658 (= (arr!7370 a!416) ((as const (Array (_ BitVec 32) T!45639)) mapDefault!658)))))

(declare-fun mapNonEmpty!658 () Bool)

(declare-fun tp!658 () Bool)

(assert (=> mapNonEmpty!658 (= mapRes!658 (and tp!658 tp_is_empty!273))))

(declare-fun mapValue!658 () T!45639)

(declare-fun mapRest!658 () (Array (_ BitVec 32) T!45639))

(declare-fun mapKey!658 () (_ BitVec 32))

(assert (=> mapNonEmpty!658 (= (arr!7370 a!416) (store mapRest!658 mapKey!658 mapValue!658))))

(assert (= (and start!57206 res!219592) b!262399))

(assert (= (and b!262399 res!219591) b!262400))

(assert (= (and b!262400 res!219590) b!262402))

(assert (= (and b!262402 res!219589) b!262401))

(assert (= (and b!262403 condMapEmpty!658) mapIsEmpty!658))

(assert (= (and b!262403 (not condMapEmpty!658)) mapNonEmpty!658))

(assert (= start!57206 b!262403))

(declare-fun m!392437 () Bool)

(assert (=> start!57206 m!392437))

(declare-fun m!392439 () Bool)

(assert (=> b!262402 m!392439))

(declare-fun m!392441 () Bool)

(assert (=> b!262399 m!392441))

(declare-fun m!392443 () Bool)

(assert (=> b!262399 m!392443))

(declare-fun m!392445 () Bool)

(assert (=> mapNonEmpty!658 m!392445))

(declare-fun m!392447 () Bool)

(assert (=> b!262401 m!392447))

(declare-fun m!392449 () Bool)

(assert (=> b!262401 m!392449))

(check-sat (not b!262399) tp_is_empty!273 (not start!57206) (not b!262401) (not mapNonEmpty!658) (not b!262402))
(check-sat)
