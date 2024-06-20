; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57148 () Bool)

(assert start!57148)

(declare-fun res!219311 () Bool)

(declare-fun e!182429 () Bool)

(assert (=> start!57148 (=> (not res!219311) (not e!182429))))

(declare-fun at!218 () (_ BitVec 32))

(declare-fun i!922 () (_ BitVec 32))

(declare-datatypes ((T!45405 0))(
  ( (T!45406 (val!109 Int)) )
))
(declare-datatypes ((array!14562 0))(
  ( (array!14563 (arr!7343 (Array (_ BitVec 32) T!45405)) (size!6356 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14562)

(assert (=> start!57148 (= res!219311 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6356 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57148 e!182429))

(assert (=> start!57148 true))

(declare-fun e!182430 () Bool)

(declare-fun array_inv!6088 (array!14562) Bool)

(assert (=> start!57148 (and (array_inv!6088 a!416) e!182430)))

(declare-fun tp_is_empty!219 () Bool)

(assert (=> start!57148 tp_is_empty!219))

(declare-fun mapIsEmpty!574 () Bool)

(declare-fun mapRes!574 () Bool)

(assert (=> mapIsEmpty!574 mapRes!574))

(declare-fun b!262038 () Bool)

(declare-fun res!219313 () Bool)

(declare-fun e!182431 () Bool)

(assert (=> b!262038 (=> (not res!219313) (not e!182431))))

(declare-fun lt!403982 () array!14562)

(declare-fun arrayRangesEq!973 (array!14562 array!14562 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262038 (= res!219313 (arrayRangesEq!973 a!416 lt!403982 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun b!262039 () Bool)

(assert (=> b!262039 (= e!182431 (not true))))

(assert (=> b!262039 (arrayRangesEq!973 a!416 lt!403982 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18695 0))(
  ( (Unit!18696) )
))
(declare-fun lt!403981 () Unit!18695)

(declare-fun v!333 () T!45405)

(declare-fun rec!35 (array!14562 (_ BitVec 32) T!45405 (_ BitVec 32)) Unit!18695)

(assert (=> b!262039 (= lt!403981 (rec!35 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun b!262040 () Bool)

(assert (=> b!262040 (= e!182429 e!182431)))

(declare-fun res!219312 () Bool)

(assert (=> b!262040 (=> (not res!219312) (not e!182431))))

(assert (=> b!262040 (= res!219312 (arrayRangesEq!973 a!416 lt!403982 i!922 at!218))))

(assert (=> b!262040 (= lt!403982 (array!14563 (store (arr!7343 a!416) at!218 v!333) (size!6356 a!416)))))

(declare-fun b!262041 () Bool)

(assert (=> b!262041 (= e!182430 (and tp_is_empty!219 mapRes!574))))

(declare-fun condMapEmpty!574 () Bool)

(declare-fun mapDefault!574 () T!45405)

(assert (=> b!262041 (= condMapEmpty!574 (= (arr!7343 a!416) ((as const (Array (_ BitVec 32) T!45405)) mapDefault!574)))))

(declare-fun mapNonEmpty!574 () Bool)

(declare-fun tp!574 () Bool)

(assert (=> mapNonEmpty!574 (= mapRes!574 (and tp!574 tp_is_empty!219))))

(declare-fun mapKey!574 () (_ BitVec 32))

(declare-fun mapRest!574 () (Array (_ BitVec 32) T!45405))

(declare-fun mapValue!574 () T!45405)

(assert (=> mapNonEmpty!574 (= (arr!7343 a!416) (store mapRest!574 mapKey!574 mapValue!574))))

(declare-fun b!262042 () Bool)

(declare-fun res!219314 () Bool)

(assert (=> b!262042 (=> (not res!219314) (not e!182431))))

(assert (=> b!262042 (= res!219314 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(assert (= (and start!57148 res!219311) b!262040))

(assert (= (and b!262040 res!219312) b!262042))

(assert (= (and b!262042 res!219314) b!262038))

(assert (= (and b!262038 res!219313) b!262039))

(assert (= (and b!262041 condMapEmpty!574) mapIsEmpty!574))

(assert (= (and b!262041 (not condMapEmpty!574)) mapNonEmpty!574))

(assert (= start!57148 b!262041))

(declare-fun m!392117 () Bool)

(assert (=> b!262040 m!392117))

(declare-fun m!392119 () Bool)

(assert (=> b!262040 m!392119))

(declare-fun m!392121 () Bool)

(assert (=> start!57148 m!392121))

(declare-fun m!392123 () Bool)

(assert (=> b!262039 m!392123))

(declare-fun m!392125 () Bool)

(assert (=> b!262039 m!392125))

(declare-fun m!392127 () Bool)

(assert (=> b!262038 m!392127))

(declare-fun m!392129 () Bool)

(assert (=> mapNonEmpty!574 m!392129))

(check-sat (not start!57148) (not b!262040) (not mapNonEmpty!574) (not b!262038) (not b!262039) tp_is_empty!219)
(check-sat)
