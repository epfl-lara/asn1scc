; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57178 () Bool)

(assert start!57178)

(declare-fun res!219454 () Bool)

(declare-fun e!182550 () Bool)

(assert (=> start!57178 (=> (not res!219454) (not e!182550))))

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-datatypes ((T!45535 0))(
  ( (T!45536 (val!124 Int)) )
))
(declare-datatypes ((array!14592 0))(
  ( (array!14593 (arr!7358 (Array (_ BitVec 32) T!45535)) (size!6371 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14592)

(assert (=> start!57178 (= res!219454 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6371 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57178 e!182550))

(assert (=> start!57178 true))

(declare-fun e!182551 () Bool)

(declare-fun array_inv!6099 (array!14592) Bool)

(assert (=> start!57178 (and (array_inv!6099 a!416) e!182551)))

(declare-fun tp_is_empty!249 () Bool)

(assert (=> start!57178 tp_is_empty!249))

(declare-fun b!262226 () Bool)

(declare-fun mapRes!619 () Bool)

(assert (=> b!262226 (= e!182551 (and tp_is_empty!249 mapRes!619))))

(declare-fun condMapEmpty!619 () Bool)

(declare-fun mapDefault!619 () T!45535)

(assert (=> b!262226 (= condMapEmpty!619 (= (arr!7358 a!416) ((as const (Array (_ BitVec 32) T!45535)) mapDefault!619)))))

(declare-fun mapNonEmpty!619 () Bool)

(declare-fun tp!619 () Bool)

(assert (=> mapNonEmpty!619 (= mapRes!619 (and tp!619 tp_is_empty!249))))

(declare-fun mapValue!619 () T!45535)

(declare-fun mapRest!619 () (Array (_ BitVec 32) T!45535))

(declare-fun mapKey!619 () (_ BitVec 32))

(assert (=> mapNonEmpty!619 (= (arr!7358 a!416) (store mapRest!619 mapKey!619 mapValue!619))))

(declare-fun b!262227 () Bool)

(declare-fun res!219455 () Bool)

(assert (=> b!262227 (=> (not res!219455) (not e!182550))))

(declare-fun v!333 () T!45535)

(declare-fun arrayRangesEq!986 (array!14592 array!14592 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262227 (= res!219455 (arrayRangesEq!986 a!416 (array!14593 (store (arr!7358 a!416) at!218 v!333) (size!6371 a!416)) i!922 at!218))))

(declare-fun b!262228 () Bool)

(assert (=> b!262228 (= e!182550 (and (not (= i!922 #b00000000000000000000000000000000)) (or (bvsgt #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsgt (bvsub i!922 #b00000000000000000000000000000001) at!218))))))

(declare-fun mapIsEmpty!619 () Bool)

(assert (=> mapIsEmpty!619 mapRes!619))

(assert (= (and start!57178 res!219454) b!262227))

(assert (= (and b!262227 res!219455) b!262228))

(assert (= (and b!262226 condMapEmpty!619) mapIsEmpty!619))

(assert (= (and b!262226 (not condMapEmpty!619)) mapNonEmpty!619))

(assert (= start!57178 b!262226))

(declare-fun m!392291 () Bool)

(assert (=> start!57178 m!392291))

(declare-fun m!392293 () Bool)

(assert (=> mapNonEmpty!619 m!392293))

(declare-fun m!392295 () Bool)

(assert (=> b!262227 m!392295))

(declare-fun m!392297 () Bool)

(assert (=> b!262227 m!392297))

(check-sat (not start!57178) (not b!262227) (not mapNonEmpty!619) tp_is_empty!249)
(check-sat)
