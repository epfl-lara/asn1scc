; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57154 () Bool)

(assert start!57154)

(declare-fun b!262083 () Bool)

(declare-fun e!182456 () Bool)

(declare-fun tp_is_empty!225 () Bool)

(declare-fun mapRes!583 () Bool)

(assert (=> b!262083 (= e!182456 (and tp_is_empty!225 mapRes!583))))

(declare-fun condMapEmpty!583 () Bool)

(declare-datatypes ((T!45431 0))(
  ( (T!45432 (val!112 Int)) )
))
(declare-datatypes ((array!14568 0))(
  ( (array!14569 (arr!7346 (Array (_ BitVec 32) T!45431)) (size!6359 (_ BitVec 32))) )
))
(declare-fun a!416 () array!14568)

(declare-fun mapDefault!583 () T!45431)

(assert (=> b!262083 (= condMapEmpty!583 (= (arr!7346 a!416) ((as const (Array (_ BitVec 32) T!45431)) mapDefault!583)))))

(declare-fun mapIsEmpty!583 () Bool)

(assert (=> mapIsEmpty!583 mapRes!583))

(declare-fun b!262084 () Bool)

(declare-fun res!219347 () Bool)

(declare-fun e!182458 () Bool)

(assert (=> b!262084 (=> (not res!219347) (not e!182458))))

(declare-fun at!218 () (_ BitVec 32))

(declare-fun lt!404000 () array!14568)

(declare-fun i!922 () (_ BitVec 32))

(declare-fun arrayRangesEq!976 (array!14568 array!14568 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!262084 (= res!219347 (arrayRangesEq!976 a!416 lt!404000 (bvsub i!922 #b00000000000000000000000000000001) at!218))))

(declare-fun b!262085 () Bool)

(declare-fun e!182457 () Bool)

(assert (=> b!262085 (= e!182457 e!182458)))

(declare-fun res!219350 () Bool)

(assert (=> b!262085 (=> (not res!219350) (not e!182458))))

(assert (=> b!262085 (= res!219350 (arrayRangesEq!976 a!416 lt!404000 i!922 at!218))))

(declare-fun v!333 () T!45431)

(assert (=> b!262085 (= lt!404000 (array!14569 (store (arr!7346 a!416) at!218 v!333) (size!6359 a!416)))))

(declare-fun res!219348 () Bool)

(assert (=> start!57154 (=> (not res!219348) (not e!182457))))

(assert (=> start!57154 (= res!219348 (and (bvsle #b00000000000000000000000000000000 at!218) (bvslt at!218 (size!6359 a!416)) (bvsle #b00000000000000000000000000000000 i!922) (bvsle i!922 at!218)))))

(assert (=> start!57154 e!182457))

(assert (=> start!57154 true))

(declare-fun array_inv!6091 (array!14568) Bool)

(assert (=> start!57154 (and (array_inv!6091 a!416) e!182456)))

(assert (=> start!57154 tp_is_empty!225))

(declare-fun b!262086 () Bool)

(assert (=> b!262086 (= e!182458 (not true))))

(assert (=> b!262086 (arrayRangesEq!976 a!416 lt!404000 #b00000000000000000000000000000000 at!218)))

(declare-datatypes ((Unit!18701 0))(
  ( (Unit!18702) )
))
(declare-fun lt!403999 () Unit!18701)

(declare-fun rec!38 (array!14568 (_ BitVec 32) T!45431 (_ BitVec 32)) Unit!18701)

(assert (=> b!262086 (= lt!403999 (rec!38 a!416 at!218 v!333 (bvsub i!922 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!583 () Bool)

(declare-fun tp!583 () Bool)

(assert (=> mapNonEmpty!583 (= mapRes!583 (and tp!583 tp_is_empty!225))))

(declare-fun mapValue!583 () T!45431)

(declare-fun mapKey!583 () (_ BitVec 32))

(declare-fun mapRest!583 () (Array (_ BitVec 32) T!45431))

(assert (=> mapNonEmpty!583 (= (arr!7346 a!416) (store mapRest!583 mapKey!583 mapValue!583))))

(declare-fun b!262087 () Bool)

(declare-fun res!219349 () Bool)

(assert (=> b!262087 (=> (not res!219349) (not e!182458))))

(assert (=> b!262087 (= res!219349 (and (not (= i!922 #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (bvsub i!922 #b00000000000000000000000000000001)) (bvsle (bvsub i!922 #b00000000000000000000000000000001) at!218)))))

(assert (= (and start!57154 res!219348) b!262085))

(assert (= (and b!262085 res!219350) b!262087))

(assert (= (and b!262087 res!219349) b!262084))

(assert (= (and b!262084 res!219347) b!262086))

(assert (= (and b!262083 condMapEmpty!583) mapIsEmpty!583))

(assert (= (and b!262083 (not condMapEmpty!583)) mapNonEmpty!583))

(assert (= start!57154 b!262083))

(declare-fun m!392159 () Bool)

(assert (=> b!262084 m!392159))

(declare-fun m!392161 () Bool)

(assert (=> mapNonEmpty!583 m!392161))

(declare-fun m!392163 () Bool)

(assert (=> b!262085 m!392163))

(declare-fun m!392165 () Bool)

(assert (=> b!262085 m!392165))

(declare-fun m!392167 () Bool)

(assert (=> start!57154 m!392167))

(declare-fun m!392169 () Bool)

(assert (=> b!262086 m!392169))

(declare-fun m!392171 () Bool)

(assert (=> b!262086 m!392171))

(check-sat (not b!262085) (not b!262086) tp_is_empty!225 (not mapNonEmpty!583) (not start!57154) (not b!262084))
(check-sat)
