; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15272 () Bool)

(assert start!15272)

(declare-fun res!64342 () Bool)

(declare-fun e!51121 () Bool)

(assert (=> start!15272 (=> (not res!64342) (not e!51121))))

(declare-fun bitNr!1 () (_ BitVec 32))

(declare-datatypes ((array!3312 0))(
  ( (array!3313 (arr!2138 (Array (_ BitVec 32) (_ BitVec 8))) (size!1537 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2636 0))(
  ( (BitStream!2637 (buf!1927 array!3312) (currentByte!3745 (_ BitVec 32)) (currentBit!3740 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2636)

(assert (=> start!15272 (= res!64342 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!1537 (buf!1927 thiss!1107))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3745 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3740 thiss!1107)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1537 (buf!1927 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3745 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3740 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!15272 e!51121))

(assert (=> start!15272 true))

(declare-fun e!51122 () Bool)

(declare-fun inv!12 (BitStream!2636) Bool)

(assert (=> start!15272 (and (inv!12 thiss!1107) e!51122)))

(declare-fun b!77915 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!77915 (= e!51121 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3740 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3745 thiss!1107))) ((_ extract 31 0) ((_ sign_extend 32) (size!1537 (buf!1927 thiss!1107)))))))))

(declare-fun b!77916 () Bool)

(declare-fun array_inv!1383 (array!3312) Bool)

(assert (=> b!77916 (= e!51122 (array_inv!1383 (buf!1927 thiss!1107)))))

(assert (= (and start!15272 res!64342) b!77915))

(assert (= start!15272 b!77916))

(declare-fun m!123545 () Bool)

(assert (=> start!15272 m!123545))

(declare-fun m!123547 () Bool)

(assert (=> b!77915 m!123547))

(declare-fun m!123549 () Bool)

(assert (=> b!77916 m!123549))

(push 1)

(assert (not b!77916))

(assert (not start!15272))

(assert (not b!77915))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

