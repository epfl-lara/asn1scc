; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71516 () Bool)

(assert start!71516)

(declare-fun res!263982 () Bool)

(declare-fun e!231662 () Bool)

(assert (=> start!71516 (=> (not res!263982) (not e!231662))))

(declare-fun nBits!568 () (_ BitVec 32))

(declare-datatypes ((array!20436 0))(
  ( (array!20437 (arr!9988 (Array (_ BitVec 32) (_ BitVec 8))) (size!8896 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13954 0))(
  ( (BitStream!13955 (buf!8038 array!20436) (currentByte!14835 (_ BitVec 32)) (currentBit!14830 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13954)

(declare-fun i!747 () (_ BitVec 32))

(assert (=> start!71516 (= res!263982 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8896 (buf!8038 thiss!1811))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14835 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14830 thiss!1811)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8896 (buf!8038 thiss!1811))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14835 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14830 thiss!1811)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71516 e!231662))

(assert (=> start!71516 true))

(declare-fun e!231661 () Bool)

(declare-fun inv!12 (BitStream!13954) Bool)

(assert (=> start!71516 (and (inv!12 thiss!1811) e!231661)))

(declare-fun b!321548 () Bool)

(declare-fun res!263983 () Bool)

(assert (=> b!321548 (=> (not res!263983) (not e!231662))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321548 (= res!263983 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14830 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14835 thiss!1811))) ((_ extract 31 0) ((_ sign_extend 32) (size!8896 (buf!8038 thiss!1811))))))))

(declare-fun b!321549 () Bool)

(assert (=> b!321549 (= e!231662 (bvslt ((_ sign_extend 32) (bvsub nBits!568 i!747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321550 () Bool)

(declare-fun array_inv!8448 (array!20436) Bool)

(assert (=> b!321550 (= e!231661 (array_inv!8448 (buf!8038 thiss!1811)))))

(assert (= (and start!71516 res!263982) b!321548))

(assert (= (and b!321548 res!263983) b!321549))

(assert (= start!71516 b!321550))

(declare-fun m!459921 () Bool)

(assert (=> start!71516 m!459921))

(declare-fun m!459923 () Bool)

(assert (=> b!321548 m!459923))

(declare-fun m!459925 () Bool)

(assert (=> b!321550 m!459925))

(push 1)

(assert (not b!321548))

(assert (not start!71516))

(assert (not b!321550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

