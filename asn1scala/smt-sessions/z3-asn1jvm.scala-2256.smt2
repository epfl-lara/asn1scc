; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57184 () Bool)

(assert start!57184)

(declare-fun e!182573 () Bool)

(declare-datatypes ((T!45561 0))(
  ( (T!45562 (val!127 Int)) )
))
(declare-datatypes ((array!14598 0))(
  ( (array!14599 (arr!7361 (Array (_ BitVec 32) T!45561)) (size!6374 (_ BitVec 32))) )
))
(declare-fun lt!404039 () array!14598)

(declare-fun b!262258 () Bool)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun a!416 () array!14598)

(declare-fun arrayRangesEq!988 (array!14598 array!14598 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262258 (= e!182573 (not (arrayRangesEq!988 a!416 lt!404039 (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun b!262259 () Bool)

(declare-fun res!219479 () Bool)

(assert (=> b!262259 (=> (not res!219479) (not e!182573))))

(assert (=> b!262259 (= res!219479 (and (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun mapIsEmpty!628 () Bool)

(declare-fun mapRes!628 () Bool)

(assert (=> mapIsEmpty!628 mapRes!628))

(declare-fun res!219477 () Bool)

(declare-fun e!182575 () Bool)

(assert (=> start!57184 (=> (not res!219477) (not e!182575))))

(assert (=> start!57184 (= res!219477 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6374 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57184 e!182575))

(assert (=> start!57184 true))

(declare-fun e!182574 () Bool)

(declare-fun array_inv!6102 (array!14598) Bool)

(assert (=> start!57184 (and (array_inv!6102 a!416) e!182574)))

(declare-fun tp_is_empty!255 () Bool)

(assert (=> start!57184 tp_is_empty!255))

(declare-fun b!262260 () Bool)

(assert (=> b!262260 (= e!182574 (and tp_is_empty!255 mapRes!628))))

(declare-fun condMapEmpty!628 () Bool)

(declare-fun mapDefault!628 () T!45561)

(assert (=> b!262260 (= condMapEmpty!628 (= (arr!7361 a!416) ((as const (Array (_ BitVec 32) T!45561)) mapDefault!628)))))

(declare-fun b!262261 () Bool)

(assert (=> b!262261 (= e!182575 e!182573)))

(declare-fun res!219478 () Bool)

(assert (=> b!262261 (=> (not res!219478) (not e!182573))))

(assert (=> b!262261 (= res!219478 (arrayRangesEq!988 a!416 lt!404039 i!922 at!218))))

(declare-fun v!333 () T!45561)

(assert (=> b!262261 (= lt!404039 (array!14599 (store (arr!7361 a!416) at!218 v!333) (size!6374 a!416)))))

(declare-fun mapNonEmpty!628 () Bool)

(declare-fun tp!628 () Bool)

(assert (=> mapNonEmpty!628 (= mapRes!628 (and tp!628 tp_is_empty!255))))

(declare-fun mapKey!628 () (_ BitVec 32))

(declare-fun mapRest!628 () (Array (_ BitVec 32) T!45561))

(declare-fun mapValue!628 () T!45561)

(assert (=> mapNonEmpty!628 (= (arr!7361 a!416) (store mapRest!628 mapKey!628 mapValue!628))))

(assert (= (and start!57184 res!219477) b!262261))

(assert (= (and b!262261 res!219478) b!262259))

(assert (= (and b!262259 res!219479) b!262258))

(assert (= (and b!262260 condMapEmpty!628) mapIsEmpty!628))

(assert (= (and b!262260 (not condMapEmpty!628)) mapNonEmpty!628))

(assert (= start!57184 b!262260))

(declare-fun m!392317 () Bool)

(assert (=> b!262258 m!392317))

(declare-fun m!392319 () Bool)

(assert (=> start!57184 m!392319))

(declare-fun m!392321 () Bool)

(assert (=> b!262261 m!392321))

(declare-fun m!392323 () Bool)

(assert (=> b!262261 m!392323))

(declare-fun m!392325 () Bool)

(assert (=> mapNonEmpty!628 m!392325))

(check-sat (not start!57184) tp_is_empty!255 (not b!262258) (not mapNonEmpty!628) (not b!262261))
(check-sat)
(get-model)

(declare-fun d!88434 () Bool)

(assert (=> d!88434 (= (array_inv!6102 a!416) (bvsge (size!6374 a!416) #b00000000000000000000000000000000))))

(assert (=> start!57184 d!88434))

(declare-fun d!88436 () Bool)

(declare-fun res!219493 () Bool)

(declare-fun e!182589 () Bool)

(assert (=> d!88436 (=> res!219493 e!182589)))

(assert (=> d!88436 (= res!219493 (= i!922 at!218))))

(assert (=> d!88436 (= (arrayRangesEq!988 a!416 lt!404039 i!922 at!218) e!182589)))

(declare-fun b!262278 () Bool)

(declare-fun e!182590 () Bool)

(assert (=> b!262278 (= e!182589 e!182590)))

(declare-fun res!219494 () Bool)

(assert (=> b!262278 (=> (not res!219494) (not e!182590))))

(assert (=> b!262278 (= res!219494 (= (select (arr!7361 a!416) i!922) (select (arr!7361 lt!404039) i!922)))))

(declare-fun b!262279 () Bool)

(assert (=> b!262279 (= e!182590 (arrayRangesEq!988 a!416 lt!404039 (bvadd i!922 #b00000000000000000000000000000001) at!218))))

(assert (= (and d!88436 (not res!219493)) b!262278))

(assert (= (and b!262278 res!219494) b!262279))

(declare-fun m!392337 () Bool)

(assert (=> b!262278 m!392337))

(declare-fun m!392339 () Bool)

(assert (=> b!262278 m!392339))

(declare-fun m!392341 () Bool)

(assert (=> b!262279 m!392341))

(assert (=> b!262261 d!88436))

(declare-fun d!88438 () Bool)

(declare-fun res!219495 () Bool)

(declare-fun e!182591 () Bool)

(assert (=> d!88438 (=> res!219495 e!182591)))

(assert (=> d!88438 (= res!219495 (= (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(assert (=> d!88438 (= (arrayRangesEq!988 a!416 lt!404039 (bvsub i!922 #b00000000000000000000000000000001) at!218) e!182591)))

(declare-fun b!262280 () Bool)

(declare-fun e!182592 () Bool)

(assert (=> b!262280 (= e!182591 e!182592)))

(declare-fun res!219496 () Bool)

(assert (=> b!262280 (=> (not res!219496) (not e!182592))))

(assert (=> b!262280 (= res!219496 (= (select (arr!7361 a!416) (bvsub i!922 #b00000000000000000000000000000001)) (select (arr!7361 lt!404039) (bvsub i!922 #b00000000000000000000000000000001))))))

(declare-fun b!262281 () Bool)

(assert (=> b!262281 (= e!182592 (arrayRangesEq!988 a!416 lt!404039 (bvadd (bvsub i!922 #b00000000000000000000000000000001) #b00000000000000000000000000000001) at!218))))

(assert (= (and d!88438 (not res!219495)) b!262280))

(assert (= (and b!262280 res!219496) b!262281))

(declare-fun m!392343 () Bool)

(assert (=> b!262280 m!392343))

(declare-fun m!392345 () Bool)

(assert (=> b!262280 m!392345))

(declare-fun m!392347 () Bool)

(assert (=> b!262281 m!392347))

(assert (=> b!262258 d!88438))

(declare-fun condMapEmpty!634 () Bool)

(declare-fun mapDefault!634 () T!45561)

(assert (=> mapNonEmpty!628 (= condMapEmpty!634 (= mapRest!628 ((as const (Array (_ BitVec 32) T!45561)) mapDefault!634)))))

(declare-fun mapRes!634 () Bool)

(assert (=> mapNonEmpty!628 (= tp!628 (and tp_is_empty!255 mapRes!634))))

(declare-fun mapIsEmpty!634 () Bool)

(assert (=> mapIsEmpty!634 mapRes!634))

(declare-fun mapNonEmpty!634 () Bool)

(declare-fun tp!634 () Bool)

(assert (=> mapNonEmpty!634 (= mapRes!634 (and tp!634 tp_is_empty!255))))

(declare-fun mapKey!634 () (_ BitVec 32))

(declare-fun mapValue!634 () T!45561)

(declare-fun mapRest!634 () (Array (_ BitVec 32) T!45561))

(assert (=> mapNonEmpty!634 (= mapRest!628 (store mapRest!634 mapKey!634 mapValue!634))))

(assert (= (and mapNonEmpty!628 condMapEmpty!634) mapIsEmpty!634))

(assert (= (and mapNonEmpty!628 (not condMapEmpty!634)) mapNonEmpty!634))

(declare-fun m!392349 () Bool)

(assert (=> mapNonEmpty!634 m!392349))

(check-sat (not b!262281) (not b!262279) (not mapNonEmpty!634) tp_is_empty!255)
(check-sat)
