; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57200 () Bool)

(assert start!57200)

(declare-fun mapIsEmpty!649 () Bool)

(declare-fun mapRes!649 () Bool)

(assert (=> mapIsEmpty!649 mapRes!649))

(declare-fun b!262354 () Bool)

(declare-fun res!219555 () Bool)

(declare-fun e!182637 () Bool)

(assert (=> b!262354 (=> (not res!219555) (not e!182637))))

(declare-fun at!218 () (_ BitVec 32))

(declare-datatypes ((T!45613 0))(
  ( (T!45614 (val!133 Int)) )
))
(declare-datatypes ((array!14611 0))(
  ( (array!14612 (arr!7367 (Array (_ BitVec 32) T!45613)) (size!6380 (_ BitVec 32))) )
))
(declare-fun lt!404063 () array!14611)

(declare-fun i!922 () (_ BitVec 32))

(declare-fun a!416 () array!14611)

(declare-fun arrayRangesEq!991 (array!14611 array!14611 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262354 (= res!219555 (arrayRangesEq!991 a!416 lt!404063 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun res!219553 () Bool)

(declare-fun e!182635 () Bool)

(assert (=> start!57200 (=> (not res!219553) (not e!182635))))

(assert (=> start!57200 (= res!219553 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6380 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57200 e!182635))

(assert (=> start!57200 true))

(declare-fun e!182636 () Bool)

(declare-fun array_inv!6106 (array!14611) Bool)

(assert (=> start!57200 (and (array_inv!6106 a!416) e!182636)))

(declare-fun tp_is_empty!267 () Bool)

(assert (=> start!57200 tp_is_empty!267))

(declare-fun b!262355 () Bool)

(assert (=> b!262355 (= e!182636 (and tp_is_empty!267 mapRes!649))))

(declare-fun condMapEmpty!649 () Bool)

(declare-fun mapDefault!649 () T!45613)

(assert (=> b!262355 (= condMapEmpty!649 (= (arr!7367 a!416) ((as const (Array (_ BitVec 32) T!45613)) mapDefault!649)))))

(declare-fun b!262356 () Bool)

(assert (=> b!262356 (= e!182635 e!182637)))

(declare-fun res!219554 () Bool)

(assert (=> b!262356 (=> (not res!219554) (not e!182637))))

(assert (=> b!262356 (= res!219554 (arrayRangesEq!991 a!416 lt!404063 i!922 at!218))))

(declare-fun v!333 () T!45613)

(assert (=> b!262356 (= lt!404063 (array!14612 (store (arr!7367 a!416) at!218 v!333) (size!6380 a!416)))))

(declare-fun b!262357 () Bool)

(assert (=> b!262357 (= e!182637 (not true))))

(assert (=> b!262357 (arrayRangesEq!991 a!416 lt!404063 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18711 0))(
  ( (Unit!18712) )
))
(declare-fun lt!404062 () Unit!18711)

(declare-fun rec!43 (array!14611 (_ BitVec 32) T!45613 (_ BitVec 32)) Unit!18711)

(assert (=> b!262357 (= lt!404062 (rec!43 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun b!262358 () Bool)

(declare-fun res!219556 () Bool)

(assert (=> b!262358 (=> (not res!219556) (not e!182637))))

(assert (=> b!262358 (= res!219556 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(declare-fun mapNonEmpty!649 () Bool)

(declare-fun tp!649 () Bool)

(assert (=> mapNonEmpty!649 (= mapRes!649 (and tp!649 tp_is_empty!267))))

(declare-fun mapValue!649 () T!45613)

(declare-fun mapKey!649 () (_ BitVec 32))

(declare-fun mapRest!649 () (Array (_ BitVec 32) T!45613))

(assert (=> mapNonEmpty!649 (= (arr!7367 a!416) (store mapRest!649 mapKey!649 mapValue!649))))

(assert (= (and start!57200 res!219553) b!262356))

(assert (= (and b!262356 res!219554) b!262358))

(assert (= (and b!262358 res!219556) b!262354))

(assert (= (and b!262354 res!219555) b!262357))

(assert (= (and b!262355 condMapEmpty!649) mapIsEmpty!649))

(assert (= (and b!262355 (not condMapEmpty!649)) mapNonEmpty!649))

(assert (= start!57200 b!262355))

(declare-fun m!392395 () Bool)

(assert (=> start!57200 m!392395))

(declare-fun m!392397 () Bool)

(assert (=> b!262357 m!392397))

(declare-fun m!392399 () Bool)

(assert (=> b!262357 m!392399))

(declare-fun m!392401 () Bool)

(assert (=> mapNonEmpty!649 m!392401))

(declare-fun m!392403 () Bool)

(assert (=> b!262356 m!392403))

(declare-fun m!392405 () Bool)

(assert (=> b!262356 m!392405))

(declare-fun m!392407 () Bool)

(assert (=> b!262354 m!392407))

(check-sat (not b!262356) (not b!262354) (not start!57200) tp_is_empty!267 (not mapNonEmpty!649) (not b!262357))
(check-sat)
