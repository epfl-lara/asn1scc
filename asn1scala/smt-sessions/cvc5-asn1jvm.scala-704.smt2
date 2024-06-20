; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19854 () Bool)

(assert start!19854)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((array!4627 0))(
  ( (array!4628 (arr!2706 (Array (_ BitVec 32) (_ BitVec 8))) (size!2113 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3700 0))(
  ( (BitStream!3701 (buf!2470 array!4627) (currentByte!4906 (_ BitVec 32)) (currentBit!4901 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3700)

(assert (=> start!19854 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!2113 (buf!2470 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4906 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4901 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!19854 true))

(declare-fun e!64769 () Bool)

(declare-fun inv!12 (BitStream!3700) Bool)

(assert (=> start!19854 (and (inv!12 thiss!1305) e!64769)))

(declare-fun b!99047 () Bool)

(declare-fun array_inv!1915 (array!4627) Bool)

(assert (=> b!99047 (= e!64769 (array_inv!1915 (buf!2470 thiss!1305)))))

(assert (= start!19854 b!99047))

(declare-fun m!144477 () Bool)

(assert (=> start!19854 m!144477))

(declare-fun m!144479 () Bool)

(assert (=> b!99047 m!144479))

(push 1)

(assert (not b!99047))

(assert (not start!19854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

