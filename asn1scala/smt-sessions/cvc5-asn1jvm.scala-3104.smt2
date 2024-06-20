; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71482 () Bool)

(assert start!71482)

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20420 0))(
  ( (array!20421 (arr!9982 (Array (_ BitVec 32) (_ BitVec 8))) (size!8890 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13942 0))(
  ( (BitStream!13943 (buf!8032 array!20420) (currentByte!14826 (_ BitVec 32)) (currentBit!14821 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13942)

(assert (=> start!71482 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8890 (buf!8032 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14826 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14821 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8890 (buf!8032 thiss!1811))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14826 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14821 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71482 true))

(declare-fun e!231614 () Bool)

(declare-fun inv!12 (BitStream!13942) Bool)

(assert (=> start!71482 (and (inv!12 thiss!1811) e!231614)))

(declare-fun b!321517 () Bool)

(declare-fun array_inv!8442 (array!20420) Bool)

(assert (=> b!321517 (= e!231614 (array_inv!8442 (buf!8032 thiss!1811)))))

(assert (= start!71482 b!321517))

(declare-fun m!459883 () Bool)

(assert (=> start!71482 m!459883))

(declare-fun m!459885 () Bool)

(assert (=> b!321517 m!459885))

(push 1)

(assert (not b!321517))

(assert (not start!71482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105476 () Bool)

(assert (=> d!105476 (= (array_inv!8442 (buf!8032 thiss!1811)) (bvsge (size!8890 (buf!8032 thiss!1811)) #b00000000000000000000000000000000))))

(assert (=> b!321517 d!105476))

(declare-fun d!105478 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

