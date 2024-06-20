; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38106 () Bool)

(assert start!38106)

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9163 0))(
  ( (array!9164 (arr!4980 (Array (_ BitVec 32) (_ BitVec 8))) (size!4050 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7208 0))(
  ( (BitStream!7209 (buf!4478 array!9163) (currentByte!8510 (_ BitVec 32)) (currentBit!8505 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7208)

(assert (=> start!38106 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!4050 (buf!4478 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8510 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8505 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!38106 true))

(declare-fun e!119970 () Bool)

(declare-fun inv!12 (BitStream!7208) Bool)

(assert (=> start!38106 (and (inv!12 thiss!1817) e!119970)))

(declare-fun b!171729 () Bool)

(declare-fun array_inv!3791 (array!9163) Bool)

(assert (=> b!171729 (= e!119970 (array_inv!3791 (buf!4478 thiss!1817)))))

(assert (= start!38106 b!171729))

(declare-fun m!270975 () Bool)

(assert (=> start!38106 m!270975))

(declare-fun m!270977 () Bool)

(assert (=> b!171729 m!270977))

(push 1)

(assert (not b!171729))

(assert (not start!38106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

