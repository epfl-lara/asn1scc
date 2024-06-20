; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59690 () Bool)

(assert start!59690)

(declare-fun res!227020 () Bool)

(declare-fun e!192468 () Bool)

(assert (=> start!59690 (=> (not res!227020) (not e!192468))))

(declare-datatypes ((array!15206 0))(
  ( (array!15207 (arr!7597 (Array (_ BitVec 32) (_ BitVec 8))) (size!6610 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12034 0))(
  ( (BitStream!12035 (buf!7078 array!15206) (currentByte!13082 (_ BitVec 32)) (currentBit!13077 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12034)

(assert (=> start!59690 (= res!227020 (not (= (size!6610 (buf!7078 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59690 e!192468))

(declare-fun e!192467 () Bool)

(declare-fun inv!12 (BitStream!12034) Bool)

(assert (=> start!59690 (and (inv!12 bs!71) e!192467)))

(declare-fun b!272638 () Bool)

(assert (=> b!272638 (= e!192468 (not true))))

(declare-fun lt!410471 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272638 (= lt!410471 (bitIndex!0 (size!6610 (buf!7078 bs!71)) (currentByte!13082 bs!71) (currentBit!13077 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15206 array!15206 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272638 (arrayBitRangesEq!0 (buf!7078 bs!71) (buf!7078 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6610 (buf!7078 bs!71)))))))

(declare-datatypes ((Unit!19199 0))(
  ( (Unit!19200) )
))
(declare-fun lt!410470 () Unit!19199)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15206) Unit!19199)

(assert (=> b!272638 (= lt!410470 (arrayBitEqImpliesRangesEqLemma!0 (buf!7078 bs!71)))))

(declare-fun b!272639 () Bool)

(declare-fun array_inv!6334 (array!15206) Bool)

(assert (=> b!272639 (= e!192467 (array_inv!6334 (buf!7078 bs!71)))))

(assert (= (and start!59690 res!227020) b!272638))

(assert (= start!59690 b!272639))

(declare-fun m!405459 () Bool)

(assert (=> start!59690 m!405459))

(declare-fun m!405461 () Bool)

(assert (=> b!272638 m!405461))

(declare-fun m!405463 () Bool)

(assert (=> b!272638 m!405463))

(declare-fun m!405465 () Bool)

(assert (=> b!272638 m!405465))

(declare-fun m!405467 () Bool)

(assert (=> b!272639 m!405467))

(push 1)

(assert (not start!59690))

(assert (not b!272638))

(assert (not b!272639))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

