; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57142 () Bool)

(assert start!57142)

(declare-fun e!182406 () Bool)

(declare-fun b!262001 () Bool)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-datatypes ((T!45379 0))(
  ( (T!45380 (val!106 Int)) )
))
(declare-datatypes ((array!14556 0))(
  ( (array!14557 (arr!7340 (Array (_ BitVec 32) T!45379)) (size!6353 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14556)

(assert (=> b!262001 (= e!182406 (and (= i!922 #b00000000000000000000000000000000) (bvsgt at!218 (size!6353 a!416))))))

(declare-fun res!219283 () Bool)

(assert (=> start!57142 (=> (not res!219283) (not e!182406))))

(assert (=> start!57142 (= res!219283 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6353 a!416)) (bvsle i!922 at!218)))))

(assert (=> start!57142 e!182406))

(assert (=> start!57142 true))

(declare-fun e!182407 () Bool)

(declare-fun array_inv!6086 (array!14556) Bool)

(assert (=> start!57142 (and (array_inv!6086 a!416) e!182407)))

(declare-fun tp_is_empty!213 () Bool)

(assert (=> start!57142 tp_is_empty!213))

(declare-fun mapIsEmpty!565 () Bool)

(declare-fun mapRes!565 () Bool)

(assert (=> mapIsEmpty!565 mapRes!565))

(declare-fun b!262002 () Bool)

(assert (=> b!262002 (= e!182407 (and tp_is_empty!213 mapRes!565))))

(declare-fun condMapEmpty!565 () Bool)

(declare-fun mapDefault!565 () T!45379)

(assert (=> b!262002 (= condMapEmpty!565 (= (arr!7340 a!416) ((as const (Array (_ BitVec 32) T!45379)) mapDefault!565)))))

(declare-fun b!262003 () Bool)

(declare-fun res!219284 () Bool)

(assert (=> b!262003 (=> (not res!219284) (not e!182406))))

(declare-fun v!333 () T!45379)

(declare-fun arrayRangesEq!971 (array!14556 array!14556 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262003 (= res!219284 (arrayRangesEq!971 a!416 (array!14557 (store (arr!7340 a!416) at!218 v!333) (size!6353 a!416)) i!922 at!218))))

(declare-fun mapNonEmpty!565 () Bool)

(declare-fun tp!565 () Bool)

(assert (=> mapNonEmpty!565 (= mapRes!565 (and tp!565 tp_is_empty!213))))

(declare-fun mapValue!565 () T!45379)

(declare-fun mapRest!565 () (Array (_ BitVec 32) T!45379))

(declare-fun mapKey!565 () (_ BitVec 32))

(assert (=> mapNonEmpty!565 (= (arr!7340 a!416) (store mapRest!565 mapKey!565 mapValue!565))))

(assert (= (and start!57142 res!219283) b!262003))

(assert (= (and b!262003 res!219284) b!262001))

(assert (= (and b!262002 condMapEmpty!565) mapIsEmpty!565))

(assert (= (and b!262002 (not condMapEmpty!565)) mapNonEmpty!565))

(assert (= start!57142 b!262002))

(declare-fun m!392087 () Bool)

(assert (=> start!57142 m!392087))

(declare-fun m!392089 () Bool)

(assert (=> b!262003 m!392089))

(declare-fun m!392091 () Bool)

(assert (=> b!262003 m!392091))

(declare-fun m!392093 () Bool)

(assert (=> mapNonEmpty!565 m!392093))

(check-sat (not b!262003) (not start!57142) (not mapNonEmpty!565) tp_is_empty!213)
(check-sat)
