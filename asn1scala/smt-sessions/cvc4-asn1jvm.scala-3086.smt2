; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71048 () Bool)

(assert start!71048)

(declare-fun res!263518 () Bool)

(declare-fun e!231013 () Bool)

(assert (=> start!71048 (=> (not res!263518) (not e!231013))))

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20278 0))(
  ( (array!20279 (arr!9930 (Array (_ BitVec 32) (_ BitVec 8))) (size!8838 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13838 0))(
  ( (BitStream!13839 (buf!7980 array!20278) (currentByte!14715 (_ BitVec 32)) (currentBit!14710 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13838)

(assert (=> start!71048 (= res!263518 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8838 (buf!7980 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14715 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14710 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8838 (buf!7980 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14715 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14710 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71048 e!231013))

(assert (=> start!71048 true))

(declare-fun e!231014 () Bool)

(declare-fun inv!12 (BitStream!13838) Bool)

(assert (=> start!71048 (and (inv!12 thiss!1780) e!231014)))

(declare-fun b!320822 () Bool)

(declare-fun res!263517 () Bool)

(assert (=> b!320822 (=> (not res!263517) (not e!231013))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320822 (= res!263517 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14710 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14715 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (size!8838 (buf!7980 thiss!1780))))))))

(declare-fun b!320823 () Bool)

(assert (=> b!320823 (= e!231013 (bvslt ((_ sign_extend 32) nBits!542) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320824 () Bool)

(declare-fun array_inv!8390 (array!20278) Bool)

(assert (=> b!320824 (= e!231014 (array_inv!8390 (buf!7980 thiss!1780)))))

(assert (= (and start!71048 res!263518) b!320822))

(assert (= (and b!320822 res!263517) b!320823))

(assert (= start!71048 b!320824))

(declare-fun m!459189 () Bool)

(assert (=> start!71048 m!459189))

(declare-fun m!459191 () Bool)

(assert (=> b!320822 m!459191))

(declare-fun m!459193 () Bool)

(assert (=> b!320824 m!459193))

(push 1)

(assert (not b!320824))

(assert (not b!320822))

(assert (not start!71048))

(check-sat)

