; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57166 () Bool)

(assert start!57166)

(declare-fun b!262168 () Bool)

(declare-fun e!182512 () Bool)

(declare-fun tp_is_empty!237 () Bool)

(declare-fun mapRes!601 () Bool)

(assert (=> b!262168 (= e!182512 (and tp_is_empty!237 mapRes!601))))

(declare-fun condMapEmpty!601 () Bool)

(declare-datatypes ((T!45483 0))(
  ( (T!45484 (val!118 Int)) )
))
(declare-datatypes ((array!14580 0))(
  ( (array!14581 (arr!7352 (Array (_ BitVec 32) T!45483)) (size!6365 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14580)

(declare-fun mapDefault!601 () T!45483)

(assert (=> b!262168 (= condMapEmpty!601 (= (arr!7352 a!416) ((as const (Array (_ BitVec 32) T!45483)) mapDefault!601)))))

(declare-fun b!262169 () Bool)

(declare-fun e!182511 () Bool)

(declare-fun e!182510 () Bool)

(assert (=> b!262169 (= e!182511 e!182510)))

(declare-fun res!219415 () Bool)

(assert (=> b!262169 (=> (not res!219415) (not e!182510))))

(declare-fun lt!404030 () array!14580)

(declare-fun i!922 () (_ BitVec 32))

(declare-fun at!218 () (_ BitVec 32))

(declare-fun arrayRangesEq!982 (array!14580 array!14580 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262169 (= res!219415 (arrayRangesEq!982 a!416 lt!404030 i!922 at!218))))

(declare-fun v!333 () T!45483)

(assert (=> b!262169 (= lt!404030 (array!14581 (store (arr!7352 a!416) at!218 v!333) (size!6365 a!416)))))

(declare-fun b!262170 () Bool)

(declare-fun res!219414 () Bool)

(assert (=> b!262170 (=> (not res!219414) (not e!182510))))

(assert (=> b!262170 (= res!219414 (= i!922 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!601 () Bool)

(declare-fun tp!601 () Bool)

(assert (=> mapNonEmpty!601 (= mapRes!601 (and tp!601 tp_is_empty!237))))

(declare-fun mapValue!601 () T!45483)

(declare-fun mapRest!601 () (Array (_ BitVec 32) T!45483))

(declare-fun mapKey!601 () (_ BitVec 32))

(assert (=> mapNonEmpty!601 (= (arr!7352 a!416) (store mapRest!601 mapKey!601 mapValue!601))))

(declare-fun res!219416 () Bool)

(assert (=> start!57166 (=> (not res!219416) (not e!182511))))

(assert (=> start!57166 (= res!219416 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6365 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57166 e!182511))

(assert (=> start!57166 true))

(declare-fun array_inv!6094 (array!14580) Bool)

(assert (=> start!57166 (and (array_inv!6094 a!416) e!182512)))

(assert (=> start!57166 tp_is_empty!237))

(declare-fun mapIsEmpty!601 () Bool)

(assert (=> mapIsEmpty!601 mapRes!601))

(declare-fun b!262171 () Bool)

(assert (=> b!262171 (= e!182510 (not (arrayRangesEq!982 a!416 lt!404030 #b00000000000000000000000000000000 at!218)))))

(assert (= (and start!57166 res!219416) b!262169))

(assert (= (and b!262169 res!219415) b!262170))

(assert (= (and b!262170 res!219414) b!262171))

(assert (= (and b!262168 condMapEmpty!601) mapIsEmpty!601))

(assert (= (and b!262168 (not condMapEmpty!601)) mapNonEmpty!601))

(assert (= start!57166 b!262168))

(declare-fun m!392239 () Bool)

(assert (=> b!262169 m!392239))

(declare-fun m!392241 () Bool)

(assert (=> b!262169 m!392241))

(declare-fun m!392243 () Bool)

(assert (=> mapNonEmpty!601 m!392243))

(declare-fun m!392245 () Bool)

(assert (=> start!57166 m!392245))

(declare-fun m!392247 () Bool)

(assert (=> b!262171 m!392247))

(check-sat (not mapNonEmpty!601) (not b!262169) (not start!57166) tp_is_empty!237 (not b!262171))
(check-sat)
