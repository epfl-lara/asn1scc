; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61040 () Bool)

(assert start!61040)

(declare-datatypes ((array!15666 0))(
  ( (array!15667 (arr!7773 (Array (_ BitVec 32) (_ BitVec 8))) (size!6786 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12386 0))(
  ( (BitStream!12387 (buf!7254 array!15666) (currentByte!13412 (_ BitVec 32)) (currentBit!13407 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12386)

(declare-fun bs2!19 () BitStream!12386)

(assert (=> start!61040 (and (= (size!6786 (buf!7254 bs1!11)) (size!6786 (buf!7254 bs2!19))) (or (bvsgt ((_ sign_extend 32) (size!6786 (buf!7254 bs1!11))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13412 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13407 bs1!11)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!195022 () Bool)

(declare-fun inv!12 (BitStream!12386) Bool)

(assert (=> start!61040 (and (inv!12 bs1!11) e!195022)))

(declare-fun e!195024 () Bool)

(assert (=> start!61040 (and (inv!12 bs2!19) e!195024)))

(declare-fun b!275108 () Bool)

(declare-fun array_inv!6510 (array!15666) Bool)

(assert (=> b!275108 (= e!195022 (array_inv!6510 (buf!7254 bs1!11)))))

(declare-fun b!275109 () Bool)

(assert (=> b!275109 (= e!195024 (array_inv!6510 (buf!7254 bs2!19)))))

(assert (= start!61040 b!275108))

(assert (= start!61040 b!275109))

(declare-fun m!407661 () Bool)

(assert (=> start!61040 m!407661))

(declare-fun m!407663 () Bool)

(assert (=> start!61040 m!407663))

(declare-fun m!407665 () Bool)

(assert (=> b!275108 m!407665))

(declare-fun m!407667 () Bool)

(assert (=> b!275109 m!407667))

(push 1)

(assert (not b!275108))

(assert (not b!275109))

(assert (not start!61040))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

