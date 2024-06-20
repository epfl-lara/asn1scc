; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59768 () Bool)

(assert start!59768)

(declare-fun res!227164 () Bool)

(declare-fun e!192756 () Bool)

(assert (=> start!59768 (=> (not res!227164) (not e!192756))))

(declare-datatypes ((array!15257 0))(
  ( (array!15258 (arr!7621 (Array (_ BitVec 32) (_ BitVec 8))) (size!6634 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12082 0))(
  ( (BitStream!12083 (buf!7102 array!15257) (currentByte!13109 (_ BitVec 32)) (currentBit!13104 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12082)

(assert (=> start!59768 (= res!227164 (not (= (size!6634 (buf!7102 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59768 e!192756))

(declare-fun e!192757 () Bool)

(declare-fun inv!12 (BitStream!12082) Bool)

(assert (=> start!59768 (and (inv!12 bs!71) e!192757)))

(declare-fun b!272872 () Bool)

(assert (=> b!272872 (= e!192756 (not true))))

(declare-fun lt!410732 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272872 (= lt!410732 (bitIndex!0 (size!6634 (buf!7102 bs!71)) (currentByte!13109 bs!71) (currentBit!13104 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15257 array!15257 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272872 (arrayBitRangesEq!0 (buf!7102 bs!71) (buf!7102 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6634 (buf!7102 bs!71)))))))

(declare-datatypes ((Unit!19247 0))(
  ( (Unit!19248) )
))
(declare-fun lt!410731 () Unit!19247)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15257) Unit!19247)

(assert (=> b!272872 (= lt!410731 (arrayBitEqImpliesRangesEqLemma!0 (buf!7102 bs!71)))))

(declare-fun b!272873 () Bool)

(declare-fun array_inv!6358 (array!15257) Bool)

(assert (=> b!272873 (= e!192757 (array_inv!6358 (buf!7102 bs!71)))))

(assert (= (and start!59768 res!227164) b!272872))

(assert (= start!59768 b!272873))

(declare-fun m!405753 () Bool)

(assert (=> start!59768 m!405753))

(declare-fun m!405755 () Bool)

(assert (=> b!272872 m!405755))

(declare-fun m!405757 () Bool)

(assert (=> b!272872 m!405757))

(declare-fun m!405759 () Bool)

(assert (=> b!272872 m!405759))

(declare-fun m!405761 () Bool)

(assert (=> b!272873 m!405761))

(push 1)

(assert (not b!272872))

(assert (not b!272873))

(assert (not start!59768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

