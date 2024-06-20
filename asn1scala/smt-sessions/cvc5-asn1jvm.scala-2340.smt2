; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59720 () Bool)

(assert start!59720)

(declare-fun res!227065 () Bool)

(declare-fun e!192604 () Bool)

(assert (=> start!59720 (=> (not res!227065) (not e!192604))))

(declare-datatypes ((array!15236 0))(
  ( (array!15237 (arr!7612 (Array (_ BitVec 32) (_ BitVec 8))) (size!6625 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12064 0))(
  ( (BitStream!12065 (buf!7093 array!15236) (currentByte!13097 (_ BitVec 32)) (currentBit!13092 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12064)

(assert (=> start!59720 (= res!227065 (not (= (size!6625 (buf!7093 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59720 e!192604))

(declare-fun e!192603 () Bool)

(declare-fun inv!12 (BitStream!12064) Bool)

(assert (=> start!59720 (and (inv!12 bs!71) e!192603)))

(declare-fun b!272728 () Bool)

(assert (=> b!272728 (= e!192604 (not true))))

(declare-fun lt!410560 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272728 (= lt!410560 (bitIndex!0 (size!6625 (buf!7093 bs!71)) (currentByte!13097 bs!71) (currentBit!13092 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15236 array!15236 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272728 (arrayBitRangesEq!0 (buf!7093 bs!71) (buf!7093 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6625 (buf!7093 bs!71)))))))

(declare-datatypes ((Unit!19229 0))(
  ( (Unit!19230) )
))
(declare-fun lt!410561 () Unit!19229)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15236) Unit!19229)

(assert (=> b!272728 (= lt!410561 (arrayBitEqImpliesRangesEqLemma!0 (buf!7093 bs!71)))))

(declare-fun b!272729 () Bool)

(declare-fun array_inv!6349 (array!15236) Bool)

(assert (=> b!272729 (= e!192603 (array_inv!6349 (buf!7093 bs!71)))))

(assert (= (and start!59720 res!227065) b!272728))

(assert (= start!59720 b!272729))

(declare-fun m!405603 () Bool)

(assert (=> start!59720 m!405603))

(declare-fun m!405605 () Bool)

(assert (=> b!272728 m!405605))

(declare-fun m!405607 () Bool)

(assert (=> b!272728 m!405607))

(declare-fun m!405609 () Bool)

(assert (=> b!272728 m!405609))

(declare-fun m!405611 () Bool)

(assert (=> b!272729 m!405611))

(push 1)

(assert (not start!59720))

(assert (not b!272728))

(assert (not b!272729))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

