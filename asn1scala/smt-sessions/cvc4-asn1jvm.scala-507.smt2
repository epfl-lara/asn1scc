; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14896 () Bool)

(assert start!14896)

(declare-fun res!63247 () Bool)

(declare-fun e!50254 () Bool)

(assert (=> start!14896 (=> (not res!63247) (not e!50254))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-datatypes ((array!3178 0))(
  ( (array!3179 (arr!2081 (Array (_ BitVec 32) (_ BitVec 8))) (size!1480 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2534 0))(
  ( (BitStream!2535 (buf!1864 array!3178) (currentByte!3662 (_ BitVec 32)) (currentBit!3657 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2534)

(assert (=> start!14896 (= res!63247 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!1480 (buf!1864 thiss!1090))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!3662 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!3657 thiss!1090)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1480 (buf!1864 thiss!1090))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!3662 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!3657 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!14896 e!50254))

(assert (=> start!14896 true))

(declare-fun e!50255 () Bool)

(declare-fun inv!12 (BitStream!2534) Bool)

(assert (=> start!14896 (and (inv!12 thiss!1090) e!50255)))

(declare-fun b!76559 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76559 (= e!50254 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!3657 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!3662 thiss!1090))) ((_ extract 31 0) ((_ sign_extend 32) (size!1480 (buf!1864 thiss!1090)))))))))

(declare-fun b!76560 () Bool)

(declare-fun array_inv!1326 (array!3178) Bool)

(assert (=> b!76560 (= e!50255 (array_inv!1326 (buf!1864 thiss!1090)))))

(assert (= (and start!14896 res!63247) b!76559))

(assert (= start!14896 b!76560))

(declare-fun m!121803 () Bool)

(assert (=> start!14896 m!121803))

(declare-fun m!121805 () Bool)

(assert (=> b!76559 m!121805))

(declare-fun m!121807 () Bool)

(assert (=> b!76560 m!121807))

(push 1)

(assert (not b!76559))

(assert (not start!14896))

(assert (not b!76560))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

