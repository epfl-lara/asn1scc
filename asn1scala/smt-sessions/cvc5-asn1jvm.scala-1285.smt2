; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36622 () Bool)

(assert start!36622)

(declare-fun res!140035 () Bool)

(declare-fun e!116813 () Bool)

(assert (=> start!36622 (=> (not res!140035) (not e!116813))))

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8714 0))(
  ( (array!8715 (arr!4789 (Array (_ BitVec 32) (_ BitVec 8))) (size!3868 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6892 0))(
  ( (BitStream!6893 (buf!4320 array!8714) (currentByte!8180 (_ BitVec 32)) (currentBit!8175 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6892)

(assert (=> start!36622 (= res!140035 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3868 (buf!4320 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8180 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8175 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3868 (buf!4320 thiss!1909))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8180 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8175 thiss!1909)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36622 e!116813))

(assert (=> start!36622 true))

(declare-fun e!116814 () Bool)

(declare-fun inv!12 (BitStream!6892) Bool)

(assert (=> start!36622 (and (inv!12 thiss!1909) e!116814)))

(declare-fun b!168217 () Bool)

(declare-fun res!140036 () Bool)

(assert (=> b!168217 (=> (not res!140036) (not e!116813))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168217 (= res!140036 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8175 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8180 thiss!1909))) ((_ extract 31 0) ((_ sign_extend 32) (size!3868 (buf!4320 thiss!1909))))))))

(declare-fun b!168218 () Bool)

(assert (=> b!168218 (= e!116813 (bvslt ((_ sign_extend 32) nBits!601) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!168219 () Bool)

(declare-fun array_inv!3609 (array!8714) Bool)

(assert (=> b!168219 (= e!116814 (array_inv!3609 (buf!4320 thiss!1909)))))

(assert (= (and start!36622 res!140035) b!168217))

(assert (= (and b!168217 res!140036) b!168218))

(assert (= start!36622 b!168219))

(declare-fun m!267855 () Bool)

(assert (=> start!36622 m!267855))

(declare-fun m!267857 () Bool)

(assert (=> b!168217 m!267857))

(declare-fun m!267859 () Bool)

(assert (=> b!168219 m!267859))

(push 1)

(assert (not b!168217))

(assert (not start!36622))

(assert (not b!168219))

(check-sat)

