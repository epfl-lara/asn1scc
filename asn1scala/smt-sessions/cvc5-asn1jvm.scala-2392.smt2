; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61030 () Bool)

(assert start!61030)

(declare-fun b!275066 () Bool)

(declare-fun e!194963 () Bool)

(declare-datatypes ((array!15656 0))(
  ( (array!15657 (arr!7768 (Array (_ BitVec 32) (_ BitVec 8))) (size!6781 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12376 0))(
  ( (BitStream!12377 (buf!7249 array!15656) (currentByte!13407 (_ BitVec 32)) (currentBit!13402 (_ BitVec 32))) )
))
(declare-fun b!177 () BitStream!12376)

(declare-fun lt!413459 () (_ BitVec 64))

(assert (=> b!275066 (= e!194963 (not (= ((_ sign_extend 32) (size!6781 (buf!7249 b!177))) (bvsdiv lt!413459 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!228784 () Bool)

(declare-fun e!194962 () Bool)

(assert (=> start!61030 (=> (not res!228784) (not e!194962))))

(declare-fun diffInBits!14 () (_ BitVec 64))

(assert (=> start!61030 (= res!228784 (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6781 (buf!7249 b!177)))) diffInBits!14))))

(assert (=> start!61030 e!194962))

(declare-fun e!194965 () Bool)

(declare-fun inv!12 (BitStream!12376) Bool)

(assert (=> start!61030 (and (inv!12 b!177) e!194965)))

(assert (=> start!61030 true))

(declare-fun b!275067 () Bool)

(declare-fun array_inv!6505 (array!15656) Bool)

(assert (=> b!275067 (= e!194965 (array_inv!6505 (buf!7249 b!177)))))

(declare-fun b!275065 () Bool)

(declare-fun res!228782 () Bool)

(assert (=> b!275065 (=> (not res!228782) (not e!194963))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275065 (= res!228782 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd (bitIndex!0 (size!6781 (buf!7249 b!177)) (currentByte!13407 b!177) (currentBit!13402 b!177)) diffInBits!14)))))

(declare-fun b!275064 () Bool)

(assert (=> b!275064 (= e!194962 e!194963)))

(declare-fun res!228783 () Bool)

(assert (=> b!275064 (=> (not res!228783) (not e!194963))))

(assert (=> b!275064 (= res!228783 (bvsle diffInBits!14 lt!413459))))

(assert (=> b!275064 (= lt!413459 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6781 (buf!7249 b!177)))))))

(assert (= (and start!61030 res!228784) b!275064))

(assert (= (and b!275064 res!228783) b!275065))

(assert (= (and b!275065 res!228782) b!275066))

(assert (= start!61030 b!275067))

(declare-fun m!407627 () Bool)

(assert (=> start!61030 m!407627))

(declare-fun m!407629 () Bool)

(assert (=> b!275067 m!407629))

(declare-fun m!407631 () Bool)

(assert (=> b!275065 m!407631))

(push 1)

(assert (not b!275067))

(assert (not start!61030))

(assert (not b!275065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

