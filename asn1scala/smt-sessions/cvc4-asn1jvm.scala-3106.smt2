; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71520 () Bool)

(assert start!71520)

(declare-fun res!263995 () Bool)

(declare-fun e!231680 () Bool)

(assert (=> start!71520 (=> (not res!263995) (not e!231680))))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20440 0))(
  ( (array!20441 (arr!9990 (Array (_ BitVec 32) (_ BitVec 8))) (size!8898 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13958 0))(
  ( (BitStream!13959 (buf!8040 array!20440) (currentByte!14837 (_ BitVec 32)) (currentBit!14832 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13958)

(declare-fun i!747 () (_ BitVec 32))

(assert (=> start!71520 (= res!263995 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8898 (buf!8040 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14837 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14832 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8898 (buf!8040 thiss!1811))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14837 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14832 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71520 e!231680))

(assert (=> start!71520 true))

(declare-fun e!231679 () Bool)

(declare-fun inv!12 (BitStream!13958) Bool)

(assert (=> start!71520 (and (inv!12 thiss!1811) e!231679)))

(declare-fun b!321566 () Bool)

(declare-fun res!263994 () Bool)

(assert (=> b!321566 (=> (not res!263994) (not e!231680))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321566 (= res!263994 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14832 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14837 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (size!8898 (buf!8040 thiss!1811))))))))

(declare-fun b!321567 () Bool)

(assert (=> b!321567 (= e!231680 (bvslt ((_ sign_extend 32) (bvsub nBits!568 i!747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321568 () Bool)

(declare-fun array_inv!8450 (array!20440) Bool)

(assert (=> b!321568 (= e!231679 (array_inv!8450 (buf!8040 thiss!1811)))))

(assert (= (and start!71520 res!263995) b!321566))

(assert (= (and b!321566 res!263994) b!321567))

(assert (= start!71520 b!321568))

(declare-fun m!459933 () Bool)

(assert (=> start!71520 m!459933))

(declare-fun m!459935 () Bool)

(assert (=> b!321566 m!459935))

(declare-fun m!459937 () Bool)

(assert (=> b!321568 m!459937))

(push 1)

(assert (not b!321568))

(assert (not b!321566))

(assert (not start!71520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

