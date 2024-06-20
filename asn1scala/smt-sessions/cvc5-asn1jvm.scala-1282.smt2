; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36582 () Bool)

(assert start!36582)

(declare-fun nBits!601 () (_ BitVec 32))

(declare-datatypes ((array!8693 0))(
  ( (array!8694 (arr!4780 (Array (_ BitVec 32) (_ BitVec 8))) (size!3859 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6874 0))(
  ( (BitStream!6875 (buf!4311 array!8693) (currentByte!8168 (_ BitVec 32)) (currentBit!8163 (_ BitVec 32))) )
))
(declare-fun thiss!1909 () BitStream!6874)

(assert (=> start!36582 (and (bvsge nBits!601 #b00000000000000000000000000000001) (bvslt nBits!601 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!3859 (buf!4311 thiss!1909))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8168 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8163 thiss!1909)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!36582 true))

(declare-fun e!116747 () Bool)

(declare-fun inv!12 (BitStream!6874) Bool)

(assert (=> start!36582 (and (inv!12 thiss!1909) e!116747)))

(declare-fun b!168177 () Bool)

(declare-fun array_inv!3600 (array!8693) Bool)

(assert (=> b!168177 (= e!116747 (array_inv!3600 (buf!4311 thiss!1909)))))

(assert (= start!36582 b!168177))

(declare-fun m!267807 () Bool)

(assert (=> start!36582 m!267807))

(declare-fun m!267809 () Bool)

(assert (=> b!168177 m!267809))

(push 1)

(assert (not start!36582))

(assert (not b!168177))

(check-sat)

(pop 1)

(push 1)

(check-sat)

