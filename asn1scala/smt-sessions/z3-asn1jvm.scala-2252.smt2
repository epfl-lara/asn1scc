; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57160 () Bool)

(assert start!57160)

(declare-fun b!262128 () Bool)

(declare-fun e!182485 () Bool)

(declare-fun tp_is_empty!231 () Bool)

(declare-fun mapRes!592 () Bool)

(assert (=> b!262128 (= e!182485 (and tp_is_empty!231 mapRes!592))))

(declare-fun condMapEmpty!592 () Bool)

(declare-datatypes ((T!45457 0))(
  ( (T!45458 (val!115 Int)) )
))
(declare-datatypes ((array!14574 0))(
  ( (array!14575 (arr!7349 (Array (_ BitVec 32) T!45457)) (size!6362 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14574)

(declare-fun mapDefault!592 () T!45457)

(assert (=> b!262128 (= condMapEmpty!592 (= (arr!7349 a!416) ((as const (Array (_ BitVec 32) T!45457)) mapDefault!592)))))

(declare-fun b!262129 () Bool)

(declare-fun e!182484 () Bool)

(declare-fun e!182483 () Bool)

(assert (=> b!262129 (= e!182484 e!182483)))

(declare-fun res!219385 () Bool)

(assert (=> b!262129 (=> (not res!219385) (not e!182483))))

(declare-fun lt!404018 () array!14574)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun arrayRangesEq!979 (array!14574 array!14574 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262129 (= res!219385 (arrayRangesEq!979 a!416 lt!404018 i!922 at!218))))

(declare-fun v!333 () T!45457)

(assert (=> b!262129 (= lt!404018 (array!14575 (store (arr!7349 a!416) at!218 v!333) (size!6362 a!416)))))

(declare-fun b!262130 () Bool)

(assert (=> b!262130 (= e!182483 (not (bvsle at!218 (size!6362 a!416))))))

(assert (=> b!262130 (arrayRangesEq!979 a!416 lt!404018 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18705 0))(
  ( (Unit!18706) )
))
(declare-fun lt!404017 () Unit!18705)

(declare-fun rec!40 (array!14574 (_ BitVec 32) T!45457 (_ BitVec 32)) Unit!18705)

(assert (=> b!262130 (= lt!404017 (rec!40 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!592 () Bool)

(declare-fun tp!592 () Bool)

(assert (=> mapNonEmpty!592 (= mapRes!592 (and tp!592 tp_is_empty!231))))

(declare-fun mapValue!592 () T!45457)

(declare-fun mapKey!592 () (_ BitVec 32))

(declare-fun mapRest!592 () (Array (_ BitVec 32) T!45457))

(assert (=> mapNonEmpty!592 (= (arr!7349 a!416) (store mapRest!592 mapKey!592 mapValue!592))))

(declare-fun mapIsEmpty!592 () Bool)

(assert (=> mapIsEmpty!592 mapRes!592))

(declare-fun res!219386 () Bool)

(assert (=> start!57160 (=> (not res!219386) (not e!182484))))

(assert (=> start!57160 (= res!219386 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6362 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57160 e!182484))

(assert (=> start!57160 true))

(declare-fun array_inv!6093 (array!14574) Bool)

(assert (=> start!57160 (and (array_inv!6093 a!416) e!182485)))

(assert (=> start!57160 tp_is_empty!231))

(declare-fun b!262131 () Bool)

(declare-fun res!219383 () Bool)

(assert (=> b!262131 (=> (not res!219383) (not e!182483))))

(assert (=> b!262131 (= res!219383 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun b!262132 () Bool)

(declare-fun res!219384 () Bool)

(assert (=> b!262132 (=> (not res!219384) (not e!182483))))

(assert (=> b!262132 (= res!219384 (arrayRangesEq!979 a!416 lt!404018 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(assert (= (and start!57160 res!219386) b!262129))

(assert (= (and b!262129 res!219385) b!262131))

(assert (= (and b!262131 res!219383) b!262132))

(assert (= (and b!262132 res!219384) b!262130))

(assert (= (and b!262128 condMapEmpty!592) mapIsEmpty!592))

(assert (= (and b!262128 (not condMapEmpty!592)) mapNonEmpty!592))

(assert (= start!57160 b!262128))

(declare-fun m!392201 () Bool)

(assert (=> mapNonEmpty!592 m!392201))

(declare-fun m!392203 () Bool)

(assert (=> b!262132 m!392203))

(declare-fun m!392205 () Bool)

(assert (=> start!57160 m!392205))

(declare-fun m!392207 () Bool)

(assert (=> b!262130 m!392207))

(declare-fun m!392209 () Bool)

(assert (=> b!262130 m!392209))

(declare-fun m!392211 () Bool)

(assert (=> b!262129 m!392211))

(declare-fun m!392213 () Bool)

(assert (=> b!262129 m!392213))

(check-sat (not mapNonEmpty!592) (not b!262129) (not b!262130) (not b!262132) tp_is_empty!231 (not start!57160))
(check-sat)
