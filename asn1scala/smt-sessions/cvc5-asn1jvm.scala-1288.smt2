; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36654 () Bool)

(assert start!36654)

(declare-fun res!140051 () Bool)

(declare-fun e!116875 () Bool)

(assert (=> start!36654 (=> (not res!140051) (not e!116875))))

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8734 0))(
  ( (array!8735 (arr!4798 (Array (_ BitVec 32) (_ BitVec 8))) (size!3877 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6910 0))(
  ( (BitStream!6911 (buf!4329 array!8734) (currentByte!8191 (_ BitVec 32)) (currentBit!8186 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6910)

(assert (=> start!36654 (= res!140051 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3877 (buf!4329 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8191 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8186 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3877 (buf!4329 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8191 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8186 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36654 e!116875))

(assert (=> start!36654 true))

(declare-fun e!116876 () Bool)

(declare-fun inv!12 (BitStream!6910) Bool)

(assert (=> start!36654 (and (inv!12 thiss!1894) e!116876)))

(declare-fun b!168260 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168260 (= e!116875 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8186 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8191 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (size!3877 (buf!4329 thiss!1894)))))))))

(declare-fun b!168261 () Bool)

(declare-fun array_inv!3618 (array!8734) Bool)

(assert (=> b!168261 (= e!116876 (array_inv!3618 (buf!4329 thiss!1894)))))

(assert (= (and start!36654 res!140051) b!168260))

(assert (= start!36654 b!168261))

(declare-fun m!267901 () Bool)

(assert (=> start!36654 m!267901))

(declare-fun m!267903 () Bool)

(assert (=> b!168260 m!267903))

(declare-fun m!267905 () Bool)

(assert (=> b!168261 m!267905))

(push 1)

(assert (not b!168261))

(assert (not b!168260))

(assert (not start!36654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

