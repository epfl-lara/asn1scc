; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36638 () Bool)

(assert start!36638)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8730 0))(
  ( (array!8731 (arr!4797 (Array (_ BitVec 32) (_ BitVec 8))) (size!3876 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6908 0))(
  ( (BitStream!6909 (buf!4328 array!8730) (currentByte!8188 (_ BitVec 32)) (currentBit!8183 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6908)

(assert (=> start!36638 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3876 (buf!4328 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8188 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8183 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!3876 (buf!4328 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!8188 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!8183 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36638 true))

(declare-fun e!116867 () Bool)

(declare-fun inv!12 (BitStream!6908) Bool)

(assert (=> start!36638 (and (inv!12 thiss!1894) e!116867)))

(declare-fun b!168255 () Bool)

(declare-fun array_inv!3617 (array!8730) Bool)

(assert (=> b!168255 (= e!116867 (array_inv!3617 (buf!4328 thiss!1894)))))

(assert (= start!36638 b!168255))

(declare-fun m!267893 () Bool)

(assert (=> start!36638 m!267893))

(declare-fun m!267895 () Bool)

(assert (=> b!168255 m!267895))

(push 1)

(assert (not start!36638))

(assert (not b!168255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

