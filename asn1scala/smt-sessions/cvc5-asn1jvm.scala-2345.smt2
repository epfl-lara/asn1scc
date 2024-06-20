; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59810 () Bool)

(assert start!59810)

(declare-fun res!227254 () Bool)

(declare-fun e!192881 () Bool)

(assert (=> start!59810 (=> (not res!227254) (not e!192881))))

(declare-datatypes ((array!15272 0))(
  ( (array!15273 (arr!7627 (Array (_ BitVec 32) (_ BitVec 8))) (size!6640 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12094 0))(
  ( (BitStream!12095 (buf!7108 array!15272) (currentByte!13118 (_ BitVec 32)) (currentBit!13113 (_ BitVec 32))) )
))
(declare-fun bs!71 () BitStream!12094)

(assert (=> start!59810 (= res!227254 (not (= (size!6640 (buf!7108 bs!71)) #b00000000000000000000000000000000)))))

(assert (=> start!59810 e!192881))

(declare-fun e!192882 () Bool)

(declare-fun inv!12 (BitStream!12094) Bool)

(assert (=> start!59810 (and (inv!12 bs!71) e!192882)))

(declare-fun b!272998 () Bool)

(assert (=> b!272998 (= e!192881 (not true))))

(declare-fun lt!410885 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!272998 (= lt!410885 (bitIndex!0 (size!6640 (buf!7108 bs!71)) (currentByte!13118 bs!71) (currentBit!13113 bs!71)))))

(declare-fun arrayBitRangesEq!0 (array!15272 array!15272 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!272998 (arrayBitRangesEq!0 (buf!7108 bs!71) (buf!7108 bs!71) #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6640 (buf!7108 bs!71)))))))

(declare-datatypes ((Unit!19259 0))(
  ( (Unit!19260) )
))
(declare-fun lt!410884 () Unit!19259)

(declare-fun arrayBitEqImpliesRangesEqLemma!0 (array!15272) Unit!19259)

(assert (=> b!272998 (= lt!410884 (arrayBitEqImpliesRangesEqLemma!0 (buf!7108 bs!71)))))

(declare-fun b!272999 () Bool)

(declare-fun array_inv!6364 (array!15272) Bool)

(assert (=> b!272999 (= e!192882 (array_inv!6364 (buf!7108 bs!71)))))

(assert (= (and start!59810 res!227254) b!272998))

(assert (= start!59810 b!272999))

(declare-fun m!405873 () Bool)

(assert (=> start!59810 m!405873))

(declare-fun m!405875 () Bool)

(assert (=> b!272998 m!405875))

(declare-fun m!405877 () Bool)

(assert (=> b!272998 m!405877))

(declare-fun m!405879 () Bool)

(assert (=> b!272998 m!405879))

(declare-fun m!405881 () Bool)

(assert (=> b!272999 m!405881))

(push 1)

(assert (not b!272999))

(assert (not b!272998))

(assert (not start!59810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

