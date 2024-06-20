; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59682 () Bool)

(assert start!59682)

(declare-fun res!227008 () Bool)

(declare-fun e!192433 () Bool)

(assert (=> start!59682 (=> (not res!227008) (not e!192433))))

(declare-datatypes ((array!15198 0))(
  ( (array!15199 (arr!7593 (Array (_ BitVec 32) (_ BitVec 8))) (size!6606 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12026 0))(
  ( (BitStream!12027 (buf!7074 array!15198) (currentByte!13078 (_ BitVec 32)) (currentBit!13073 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12026)

(assert (=> start!59682 (= res!227008 (not (= (size!6606 (buf!7074 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59682 e!192433))

(declare-fun e!192432 () Bool)

(declare-fun inv!12 (BitStream!12026) Bool)

(assert (=> start!59682 (and (inv!12 bs!71) e!192432)))

(declare-fun b!272614 () Bool)

(assert (=> b!272614 (= e!192433 (not true))))

(declare-fun lt!410447 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272614 (= lt!410447 (bitIndex!0 (size!6606 (buf!7074 bs!71)) (currentByte!13078 bs!71) (currentBit!13073 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15198 array!15198 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272614 (arrayBitRangesEq!0 (buf!7074 bs!71) (buf!7074 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6606 (buf!7074 bs!71)))))))

(declare-datatypes ((Unit!19191 0))(
  ( (Unit!19192) )
))
(declare-fun lt!410446 () Unit!19191)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15198) Unit!19191)

(assert (=> b!272614 (= lt!410446 (arrayBitEqImpliesRangesEqLemma!0 (buf!7074 bs!71)))))

(declare-fun b!272615 () Bool)

(declare-fun array_inv!6330 (array!15198) Bool)

(assert (=> b!272615 (= e!192432 (array_inv!6330 (buf!7074 bs!71)))))

(assert (= (and start!59682 res!227008) b!272614))

(assert (= start!59682 b!272615))

(declare-fun m!405419 () Bool)

(assert (=> start!59682 m!405419))

(declare-fun m!405421 () Bool)

(assert (=> b!272614 m!405421))

(declare-fun m!405423 () Bool)

(assert (=> b!272614 m!405423))

(declare-fun m!405425 () Bool)

(assert (=> b!272614 m!405425))

(declare-fun m!405427 () Bool)

(assert (=> b!272615 m!405427))

(push 1)

(assert (not b!272615))

(assert (not start!59682))

(assert (not b!272614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

