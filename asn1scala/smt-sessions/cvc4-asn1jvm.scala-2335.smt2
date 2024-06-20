; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59694 () Bool)

(assert start!59694)

(declare-fun res!227026 () Bool)

(declare-fun e!192485 () Bool)

(assert (=> start!59694 (=> (not res!227026) (not e!192485))))

(declare-datatypes ((array!15210 0))(
  ( (array!15211 (arr!7599 (Array (_ BitVec 32) (_ BitVec 8))) (size!6612 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12038 0))(
  ( (BitStream!12039 (buf!7080 array!15210) (currentByte!13084 (_ BitVec 32)) (currentBit!13079 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12038)

(assert (=> start!59694 (= res!227026 (not (= (size!6612 (buf!7080 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59694 e!192485))

(declare-fun e!192486 () Bool)

(declare-fun inv!12 (BitStream!12038) Bool)

(assert (=> start!59694 (and (inv!12 bs!71) e!192486)))

(declare-fun b!272650 () Bool)

(assert (=> b!272650 (= e!192485 (not true))))

(declare-fun lt!410483 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272650 (= lt!410483 (bitIndex!0 (size!6612 (buf!7080 bs!71)) (currentByte!13084 bs!71) (currentBit!13079 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15210 array!15210 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272650 (arrayBitRangesEq!0 (buf!7080 bs!71) (buf!7080 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6612 (buf!7080 bs!71)))))))

(declare-datatypes ((Unit!19203 0))(
  ( (Unit!19204) )
))
(declare-fun lt!410482 () Unit!19203)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15210) Unit!19203)

(assert (=> b!272650 (= lt!410482 (arrayBitEqImpliesRangesEqLemma!0 (buf!7080 bs!71)))))

(declare-fun b!272651 () Bool)

(declare-fun array_inv!6336 (array!15210) Bool)

(assert (=> b!272651 (= e!192486 (array_inv!6336 (buf!7080 bs!71)))))

(assert (= (and start!59694 res!227026) b!272650))

(assert (= start!59694 b!272651))

(declare-fun m!405479 () Bool)

(assert (=> start!59694 m!405479))

(declare-fun m!405481 () Bool)

(assert (=> b!272650 m!405481))

(declare-fun m!405483 () Bool)

(assert (=> b!272650 m!405483))

(declare-fun m!405485 () Bool)

(assert (=> b!272650 m!405485))

(declare-fun m!405487 () Bool)

(assert (=> b!272651 m!405487))

(push 1)

(assert (not start!59694))

(assert (not b!272650))

(assert (not b!272651))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

