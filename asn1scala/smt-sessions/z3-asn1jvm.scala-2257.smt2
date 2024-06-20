; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57194 () Bool)

(assert start!57194)

(declare-fun b!262309 () Bool)

(declare-fun res!219520 () Bool)

(declare-fun e!182610 () Bool)

(assert (=> b!262309 (=> (not res!219520) (not e!182610))))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun at!218 () (_ BitVec 32))

(assert (=> b!262309 (= res!219520 (and (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun b!262310 () Bool)

(declare-fun e!182609 () Bool)

(declare-fun tp_is_empty!261 () Bool)

(declare-fun mapRes!640 () Bool)

(assert (=> b!262310 (= e!182609 (and tp_is_empty!261 mapRes!640))))

(declare-fun condMapEmpty!640 () Bool)

(declare-datatypes ((T!45587 0))(
  ( (T!45588 (val!130 Int)) )
))
(declare-datatypes ((array!14605 0))(
  ( (array!14606 (arr!7364 (Array (_ BitVec 32) T!45587)) (size!6377 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14605)

(declare-fun mapDefault!640 () T!45587)

(assert (=> b!262310 (= condMapEmpty!640 (= (arr!7364 a!416) ((as const (Array (_ BitVec 32) T!45587)) mapDefault!640)))))

(declare-fun b!262311 () Bool)

(declare-fun e!182608 () Bool)

(assert (=> b!262311 (= e!182608 e!182610)))

(declare-fun res!219517 () Bool)

(assert (=> b!262311 (=> (not res!219517) (not e!182610))))

(declare-fun lt!404048 () array!14605)

(declare-fun arrayRangesEq!989 (array!14605 array!14605 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262311 (= res!219517 (arrayRangesEq!989 a!416 lt!404048 i!922 at!218))))

(declare-fun v!333 () T!45587)

(assert (=> b!262311 (= lt!404048 (array!14606 (store (arr!7364 a!416) at!218 v!333) (size!6377 a!416)))))

(declare-fun mapIsEmpty!640 () Bool)

(assert (=> mapIsEmpty!640 mapRes!640))

(declare-fun mapNonEmpty!640 () Bool)

(declare-fun tp!640 () Bool)

(assert (=> mapNonEmpty!640 (= mapRes!640 (and tp!640 tp_is_empty!261))))

(declare-fun mapKey!640 () (_ BitVec 32))

(declare-fun mapValue!640 () T!45587)

(declare-fun mapRest!640 () (Array (_ BitVec 32) T!45587))

(assert (=> mapNonEmpty!640 (= (arr!7364 a!416) (store mapRest!640 mapKey!640 mapValue!640))))

(declare-fun res!219519 () Bool)

(assert (=> start!57194 (=> (not res!219519) (not e!182608))))

(assert (=> start!57194 (= res!219519 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6377 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57194 e!182608))

(assert (=> start!57194 true))

(declare-fun array_inv!6104 (array!14605) Bool)

(assert (=> start!57194 (and (array_inv!6104 a!416) e!182609)))

(assert (=> start!57194 tp_is_empty!261))

(declare-fun b!262312 () Bool)

(declare-fun res!219518 () Bool)

(assert (=> b!262312 (=> (not res!219518) (not e!182610))))

(assert (=> b!262312 (= res!219518 (arrayRangesEq!989 a!416 lt!404048 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun b!262313 () Bool)

(assert (=> b!262313 (= e!182610 (bvsge (bvsub i!922 #b00000000000000000000000000000001) i!922))))

(assert (= (and start!57194 res!219519) b!262311))

(assert (= (and b!262311 res!219517) b!262309))

(assert (= (and b!262309 res!219520) b!262312))

(assert (= (and b!262312 res!219518) b!262313))

(assert (= (and b!262310 condMapEmpty!640) mapIsEmpty!640))

(assert (= (and b!262310 (not condMapEmpty!640)) mapNonEmpty!640))

(assert (= start!57194 b!262310))

(declare-fun m!392361 () Bool)

(assert (=> b!262311 m!392361))

(declare-fun m!392363 () Bool)

(assert (=> b!262311 m!392363))

(declare-fun m!392365 () Bool)

(assert (=> mapNonEmpty!640 m!392365))

(declare-fun m!392367 () Bool)

(assert (=> start!57194 m!392367))

(declare-fun m!392369 () Bool)

(assert (=> b!262312 m!392369))

(check-sat (not b!262312) (not start!57194) tp_is_empty!261 (not b!262311) (not mapNonEmpty!640))
(check-sat)
