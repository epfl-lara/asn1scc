; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59696 () Bool)

(assert start!59696)

(declare-fun res!227029 () Bool)

(declare-fun e!192496 () Bool)

(assert (=> start!59696 (=> (not res!227029) (not e!192496))))

(declare-datatypes ((array!15212 0))(
  ( (array!15213 (arr!7600 (Array (_ BitVec 32) (_ BitVec 8))) (size!6613 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12040 0))(
  ( (BitStream!12041 (buf!7081 array!15212) (currentByte!13085 (_ BitVec 32)) (currentBit!13080 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12040)

(assert (=> start!59696 (= res!227029 (not (= (size!6613 (buf!7081 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59696 e!192496))

(declare-fun e!192494 () Bool)

(declare-fun inv!12 (BitStream!12040) Bool)

(assert (=> start!59696 (and (inv!12 bs!71) e!192494)))

(declare-fun b!272656 () Bool)

(assert (=> b!272656 (= e!192496 (not true))))

(declare-fun lt!410488 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272656 (= lt!410488 (bitIndex!0 (size!6613 (buf!7081 bs!71)) (currentByte!13085 bs!71) (currentBit!13080 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15212 array!15212 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272656 (arrayBitRangesEq!0 (buf!7081 bs!71) (buf!7081 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6613 (buf!7081 bs!71)))))))

(declare-datatypes ((Unit!19205 0))(
  ( (Unit!19206) )
))
(declare-fun lt!410489 () Unit!19205)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15212) Unit!19205)

(assert (=> b!272656 (= lt!410489 (arrayBitEqImpliesRangesEqLemma!0 (buf!7081 bs!71)))))

(declare-fun b!272657 () Bool)

(declare-fun array_inv!6337 (array!15212) Bool)

(assert (=> b!272657 (= e!192494 (array_inv!6337 (buf!7081 bs!71)))))

(assert (= (and start!59696 res!227029) b!272656))

(assert (= start!59696 b!272657))

(declare-fun m!405489 () Bool)

(assert (=> start!59696 m!405489))

(declare-fun m!405491 () Bool)

(assert (=> b!272656 m!405491))

(declare-fun m!405493 () Bool)

(assert (=> b!272656 m!405493))

(declare-fun m!405495 () Bool)

(assert (=> b!272656 m!405495))

(declare-fun m!405497 () Bool)

(assert (=> b!272657 m!405497))

(push 1)

(assert (not start!59696))

(assert (not b!272656))

(assert (not b!272657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

