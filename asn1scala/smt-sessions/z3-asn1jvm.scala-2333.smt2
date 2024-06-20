; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59680 () Bool)

(assert start!59680)

(declare-fun res!227005 () Bool)

(declare-fun e!192424 () Bool)

(assert (=> start!59680 (=> (not res!227005) (not e!192424))))

(declare-datatypes ((array!15196 0))(
  ( (array!15197 (arr!7592 (Array (_ BitVec 32) (_ BitVec 8))) (size!6605 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12024 0))(
  ( (BitStream!12025 (buf!7073 array!15196) (currentByte!13077 (_ BitVec 32)) (currentBit!13072 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12024)

(assert (=> start!59680 (= res!227005 (not (= (size!6605 (buf!7073 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59680 e!192424))

(declare-fun e!192423 () Bool)

(declare-fun inv!12 (BitStream!12024) Bool)

(assert (=> start!59680 (and (inv!12 bs!71) e!192423)))

(declare-fun b!272608 () Bool)

(assert (=> b!272608 (= e!192424 (not true))))

(declare-fun lt!410441 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272608 (= lt!410441 (bitIndex!0 (size!6605 (buf!7073 bs!71)) (currentByte!13077 bs!71) (currentBit!13072 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15196 array!15196 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272608 (arrayBitRangesEq!0 (buf!7073 bs!71) (buf!7073 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6605 (buf!7073 bs!71)))))))

(declare-datatypes ((Unit!19189 0))(
  ( (Unit!19190) )
))
(declare-fun lt!410440 () Unit!19189)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15196) Unit!19189)

(assert (=> b!272608 (= lt!410440 (arrayBitEqImpliesRangesEqLemma!0 (buf!7073 bs!71)))))

(declare-fun b!272609 () Bool)

(declare-fun array_inv!6329 (array!15196) Bool)

(assert (=> b!272609 (= e!192423 (array_inv!6329 (buf!7073 bs!71)))))

(assert (= (and start!59680 res!227005) b!272608))

(assert (= start!59680 b!272609))

(declare-fun m!405409 () Bool)

(assert (=> start!59680 m!405409))

(declare-fun m!405411 () Bool)

(assert (=> b!272608 m!405411))

(declare-fun m!405413 () Bool)

(assert (=> b!272608 m!405413))

(declare-fun m!405415 () Bool)

(assert (=> b!272608 m!405415))

(declare-fun m!405417 () Bool)

(assert (=> b!272609 m!405417))

(check-sat (not b!272609) (not start!59680) (not b!272608))
