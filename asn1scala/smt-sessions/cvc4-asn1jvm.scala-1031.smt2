; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29624 () Bool)

(assert start!29624)

(declare-fun b!152732 () Bool)

(declare-fun e!102231 () Bool)

(declare-datatypes ((array!6843 0))(
  ( (array!6844 (arr!3913 (Array (_ BitVec 32) (_ BitVec 8))) (size!3090 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5438 0))(
  ( (BitStream!5439 (buf!3593 array!6843) (currentByte!6564 (_ BitVec 32)) (currentBit!6559 (_ BitVec 32))) )
))
(declare-fun bs2!18 () BitStream!5438)

(declare-fun array_inv!2879 (array!6843) Bool)

(assert (=> b!152732 (= e!102231 (array_inv!2879 (buf!3593 bs2!18)))))

(declare-fun b!152729 () Bool)

(declare-fun res!128000 () Bool)

(declare-fun e!102229 () Bool)

(assert (=> b!152729 (=> (not res!128000) (not e!102229))))

(declare-fun bs1!10 () BitStream!5438)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152729 (= res!128000 (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3090 (buf!3593 bs1!10)) (currentByte!6564 bs1!10) (currentBit!6559 bs1!10))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3090 (buf!3593 bs1!10))))))))

(declare-fun b!152730 () Bool)

(assert (=> b!152730 (= e!102229 false)))

(declare-fun lt!239200 () (_ BitVec 64))

(assert (=> b!152730 (= lt!239200 (bitIndex!0 (size!3090 (buf!3593 bs2!18)) (currentByte!6564 bs2!18) (currentBit!6559 bs2!18)))))

(declare-fun b!152731 () Bool)

(declare-fun e!102228 () Bool)

(assert (=> b!152731 (= e!102228 (array_inv!2879 (buf!3593 bs1!10)))))

(declare-fun res!128001 () Bool)

(assert (=> start!29624 (=> (not res!128001) (not e!102229))))

(assert (=> start!29624 (= res!128001 (= (size!3090 (buf!3593 bs1!10)) (size!3090 (buf!3593 bs2!18))))))

(assert (=> start!29624 e!102229))

(declare-fun inv!12 (BitStream!5438) Bool)

(assert (=> start!29624 (and (inv!12 bs1!10) e!102228)))

(assert (=> start!29624 (and (inv!12 bs2!18) e!102231)))

(assert (= (and start!29624 res!128001) b!152729))

(assert (= (and b!152729 res!128000) b!152730))

(assert (= start!29624 b!152731))

(assert (= start!29624 b!152732))

(declare-fun m!238573 () Bool)

(assert (=> b!152730 m!238573))

(declare-fun m!238575 () Bool)

(assert (=> b!152731 m!238575))

(declare-fun m!238577 () Bool)

(assert (=> b!152729 m!238577))

(declare-fun m!238579 () Bool)

(assert (=> start!29624 m!238579))

(declare-fun m!238581 () Bool)

(assert (=> start!29624 m!238581))

(declare-fun m!238583 () Bool)

(assert (=> b!152732 m!238583))

(push 1)

(assert (not start!29624))

(assert (not b!152731))

(assert (not b!152730))

(assert (not b!152729))

(assert (not b!152732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

