; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19880 () Bool)

(assert start!19880)

(declare-fun res!81260 () Bool)

(declare-fun e!64825 () Bool)

(assert (=> start!19880 (=> (not res!81260) (not e!64825))))

(declare-datatypes ((array!4645 0))(
  ( (array!4646 (arr!2714 (Array (_ BitVec 32) (_ BitVec 8))) (size!2121 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3716 0))(
  ( (BitStream!3717 (buf!2478 array!4645) (currentByte!4915 (_ BitVec 32)) (currentBit!4910 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3716)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!19880 (= res!81260 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2121 (buf!2478 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4915 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4910 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2121 (buf!2478 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4915 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4910 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19880 e!64825))

(assert (=> start!19880 true))

(declare-fun e!64826 () Bool)

(declare-fun inv!12 (BitStream!3716) Bool)

(assert (=> start!19880 (and (inv!12 thiss!1305) e!64826)))

(declare-fun b!99079 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99079 (= e!64825 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4910 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4915 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2121 (buf!2478 thiss!1305)))))))))

(declare-fun b!99080 () Bool)

(declare-fun array_inv!1923 (array!4645) Bool)

(assert (=> b!99080 (= e!64826 (array_inv!1923 (buf!2478 thiss!1305)))))

(assert (= (and start!19880 res!81260) b!99079))

(assert (= start!19880 b!99080))

(declare-fun m!144517 () Bool)

(assert (=> start!19880 m!144517))

(declare-fun m!144519 () Bool)

(assert (=> b!99079 m!144519))

(declare-fun m!144521 () Bool)

(assert (=> b!99080 m!144521))

(push 1)

(assert (not start!19880))

(assert (not b!99079))

(assert (not b!99080))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31278 () Bool)

(assert (=> d!31278 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4910 thiss!1305) (currentByte!4915 thiss!1305) (size!2121 (buf!2478 thiss!1305))))))

