; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36628 () Bool)

(assert start!36628)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8720 0))(
  ( (array!8721 (arr!4792 (Array (_ BitVec 32) (_ BitVec 8))) (size!3871 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6898 0))(
  ( (BitStream!6899 (buf!4323 array!8720) (currentByte!8183 (_ BitVec 32)) (currentBit!8178 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6898)

(assert (=> start!36628 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (or (bvsgt ((_ sign_extend 32) (size!3871 (buf!4323 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8183 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8178 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!36628 true))

(declare-fun e!116837 () Bool)

(declare-fun inv!12 (BitStream!6898) Bool)

(assert (=> start!36628 (and (inv!12 thiss!1894) e!116837)))

(declare-fun b!168240 () Bool)

(declare-fun array_inv!3612 (array!8720) Bool)

(assert (=> b!168240 (= e!116837 (array_inv!3612 (buf!4323 thiss!1894)))))

(assert (= start!36628 b!168240))

(declare-fun m!267873 () Bool)

(assert (=> start!36628 m!267873))

(declare-fun m!267875 () Bool)

(assert (=> b!168240 m!267875))

(push 1)

(assert (not b!168240))

(assert (not start!36628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

