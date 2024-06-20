; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57172 () Bool)

(assert start!57172)

(declare-fun b!262199 () Bool)

(declare-fun e!182532 () Bool)

(declare-fun tp_is_empty!243 () Bool)

(declare-fun mapRes!610 () Bool)

(assert (=> b!262199 (= e!182532 (and tp_is_empty!243 mapRes!610))))

(declare-fun condMapEmpty!610 () Bool)

(declare-datatypes ((T!45509 0))(
  ( (T!45510 (val!121 Int)) )
))
(declare-datatypes ((array!14586 0))(
  ( (array!14587 (arr!7355 (Array (_ BitVec 32) T!45509)) (size!6368 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14586)

(declare-fun mapDefault!610 () T!45509)

(assert (=> b!262199 (= condMapEmpty!610 (= (arr!7355 a!416) ((as const (Array (_ BitVec 32) T!45509)) mapDefault!610)))))

(declare-fun b!262200 () Bool)

(declare-fun res!219436 () Bool)

(declare-fun e!182533 () Bool)

(assert (=> b!262200 (=> (not res!219436) (not e!182533))))

(declare-fun v!333 () T!45509)

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-fun arrayRangesEq!983 (array!14586 array!14586 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262200 (= res!219436 (arrayRangesEq!983 a!416 (array!14587 (store (arr!7355 a!416) at!218 v!333) (size!6368 a!416)) i!922 at!218))))

(declare-fun mapIsEmpty!610 () Bool)

(assert (=> mapIsEmpty!610 mapRes!610))

(declare-fun res!219437 () Bool)

(assert (=> start!57172 (=> (not res!219437) (not e!182533))))

(assert (=> start!57172 (= res!219437 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6368 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57172 e!182533))

(assert (=> start!57172 true))

(declare-fun array_inv!6097 (array!14586) Bool)

(assert (=> start!57172 (and (array_inv!6097 a!416) e!182532)))

(assert (=> start!57172 tp_is_empty!243))

(declare-fun mapNonEmpty!610 () Bool)

(declare-fun tp!610 () Bool)

(assert (=> mapNonEmpty!610 (= mapRes!610 (and tp!610 tp_is_empty!243))))

(declare-fun mapKey!610 () (_ BitVec 32))

(declare-fun mapValue!610 () T!45509)

(declare-fun mapRest!610 () (Array (_ BitVec 32) T!45509))

(assert (=> mapNonEmpty!610 (= (arr!7355 a!416) (store mapRest!610 mapKey!610 mapValue!610))))

(declare-fun b!262201 () Bool)

(assert (=> b!262201 (= e!182533 (and (not (= i!922 #b00000000000000000000000000000000)) (not (= (bvand i!922 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!922 #b10000000000000000000000000000000) (bvand (bvsub i!922 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(assert (= (and start!57172 res!219437) b!262200))

(assert (= (and b!262200 res!219436) b!262201))

(assert (= (and b!262199 condMapEmpty!610) mapIsEmpty!610))

(assert (= (and b!262199 (not condMapEmpty!610)) mapNonEmpty!610))

(assert (= start!57172 b!262199))

(declare-fun m!392267 () Bool)

(assert (=> b!262200 m!392267))

(declare-fun m!392269 () Bool)

(assert (=> b!262200 m!392269))

(declare-fun m!392271 () Bool)

(assert (=> start!57172 m!392271))

(declare-fun m!392273 () Bool)

(assert (=> mapNonEmpty!610 m!392273))

(check-sat (not b!262200) (not start!57172) (not mapNonEmpty!610) tp_is_empty!243)
(check-sat)
