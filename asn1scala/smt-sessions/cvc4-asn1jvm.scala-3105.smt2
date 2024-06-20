; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71502 () Bool)

(assert start!71502)

(declare-fun res!263977 () Bool)

(declare-fun e!231652 () Bool)

(assert (=> start!71502 (=> (not res!263977) (not e!231652))))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20432 0))(
  ( (array!20433 (arr!9987 (Array (_ BitVec 32) (_ BitVec 8))) (size!8895 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13952 0))(
  ( (BitStream!13953 (buf!8037 array!20432) (currentByte!14832 (_ BitVec 32)) (currentBit!14827 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13952)

(declare-fun i!747 () (_ BitVec 32))

(assert (=> start!71502 (= res!263977 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8895 (buf!8037 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14832 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14827 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8895 (buf!8037 thiss!1811))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14832 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14827 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71502 e!231652))

(assert (=> start!71502 true))

(declare-fun e!231653 () Bool)

(declare-fun inv!12 (BitStream!13952) Bool)

(assert (=> start!71502 (and (inv!12 thiss!1811) e!231653)))

(declare-fun b!321540 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321540 (= e!231652 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14827 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14832 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (size!8895 (buf!8037 thiss!1811)))))))))

(declare-fun b!321541 () Bool)

(declare-fun array_inv!8447 (array!20432) Bool)

(assert (=> b!321541 (= e!231653 (array_inv!8447 (buf!8037 thiss!1811)))))

(assert (= (and start!71502 res!263977) b!321540))

(assert (= start!71502 b!321541))

(declare-fun m!459911 () Bool)

(assert (=> start!71502 m!459911))

(declare-fun m!459913 () Bool)

(assert (=> b!321540 m!459913))

(declare-fun m!459915 () Bool)

(assert (=> b!321541 m!459915))

(push 1)

(assert (not b!321541))

(assert (not b!321540))

(assert (not start!71502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

