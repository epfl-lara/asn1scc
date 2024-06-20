; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57124 () Bool)

(assert start!57124)

(declare-fun res!219248 () Bool)

(declare-fun e!182348 () Bool)

(assert (=> start!57124 (=> (not res!219248) (not e!182348))))

(declare-fun at!213 () (_ BitVec 32))

(declare-datatypes ((T!45301 0))(
  ( (T!45302 (val!97 Int)) )
))
(declare-datatypes ((array!14538 0))(
  ( (array!14539 (arr!7331 (Array (_ BitVec 32) T!45301)) (size!6344 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14538)

(assert (=> start!57124 (= res!219248 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6344 a!411))))))

(assert (=> start!57124 e!182348))

(assert (=> start!57124 true))

(declare-fun e!182349 () Bool)

(declare-fun array_inv!6079 (array!14538) Bool)

(assert (=> start!57124 (and (array_inv!6079 a!411) e!182349)))

(declare-fun tp_is_empty!195 () Bool)

(assert (=> start!57124 tp_is_empty!195))

(declare-fun b!261938 () Bool)

(declare-fun e!182350 () Bool)

(assert (=> b!261938 (= e!182348 e!182350)))

(declare-fun res!219247 () Bool)

(assert (=> b!261938 (=> (not res!219247) (not e!182350))))

(declare-fun lt!403945 () array!14538)

(declare-fun arrayRangesEq!966 (array!14538 array!14538 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261938 (= res!219247 (arrayRangesEq!966 a!411 lt!403945 at!213 at!213))))

(declare-fun v!328 () T!45301)

(assert (=> b!261938 (= lt!403945 (array!14539 (store (arr!7331 a!411) at!213 v!328) (size!6344 a!411)))))

(declare-fun b!261939 () Bool)

(assert (=> b!261939 (= e!182350 (not true))))

(assert (=> b!261939 (arrayRangesEq!966 a!411 lt!403945 #b00000000000000000000000000000000 at!213)))

(declare-datatypes ((Unit!18685 0))(
  ( (Unit!18686) )
))
(declare-fun lt!403946 () Unit!18685)

(declare-fun rec!30 (array!14538 (_ BitVec 32) T!45301 (_ BitVec 32)) Unit!18685)

(assert (=> b!261939 (= lt!403946 (rec!30 a!411 at!213 v!328 at!213))))

(declare-fun mapIsEmpty!538 () Bool)

(declare-fun mapRes!538 () Bool)

(assert (=> mapIsEmpty!538 mapRes!538))

(declare-fun mapNonEmpty!538 () Bool)

(declare-fun tp!538 () Bool)

(assert (=> mapNonEmpty!538 (= mapRes!538 (and tp!538 tp_is_empty!195))))

(declare-fun mapValue!538 () T!45301)

(declare-fun mapKey!538 () (_ BitVec 32))

(declare-fun mapRest!538 () (Array (_ BitVec 32) T!45301))

(assert (=> mapNonEmpty!538 (= (arr!7331 a!411) (store mapRest!538 mapKey!538 mapValue!538))))

(declare-fun b!261940 () Bool)

(assert (=> b!261940 (= e!182349 (and tp_is_empty!195 mapRes!538))))

(declare-fun condMapEmpty!538 () Bool)

(declare-fun mapDefault!538 () T!45301)

(assert (=> b!261940 (= condMapEmpty!538 (= (arr!7331 a!411) ((as const (Array (_ BitVec 32) T!45301)) mapDefault!538)))))

(assert (= (and start!57124 res!219248) b!261938))

(assert (= (and b!261938 res!219247) b!261939))

(assert (= (and b!261940 condMapEmpty!538) mapIsEmpty!538))

(assert (= (and b!261940 (not condMapEmpty!538)) mapNonEmpty!538))

(assert (= start!57124 b!261940))

(declare-fun m!392007 () Bool)

(assert (=> start!57124 m!392007))

(declare-fun m!392009 () Bool)

(assert (=> b!261938 m!392009))

(declare-fun m!392011 () Bool)

(assert (=> b!261938 m!392011))

(declare-fun m!392013 () Bool)

(assert (=> b!261939 m!392013))

(declare-fun m!392015 () Bool)

(assert (=> b!261939 m!392015))

(declare-fun m!392017 () Bool)

(assert (=> mapNonEmpty!538 m!392017))

(check-sat (not mapNonEmpty!538) (not start!57124) (not b!261939) (not b!261938) tp_is_empty!195)
(check-sat)
