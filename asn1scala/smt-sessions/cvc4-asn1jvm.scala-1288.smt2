; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36658 () Bool)

(assert start!36658)

(declare-fun res!140057 () Bool)

(declare-fun e!116893 () Bool)

(assert (=> start!36658 (=> (not res!140057) (not e!116893))))

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8738 0))(
  ( (array!8739 (arr!4800 (Array (_ BitVec 32) (_ BitVec 8))) (size!3879 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6914 0))(
  ( (BitStream!6915 (buf!4331 array!8738) (currentByte!8193 (_ BitVec 32)) (currentBit!8188 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6914)

(assert (=> start!36658 (= res!140057 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3879 (buf!4331 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8193 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8188 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3879 (buf!4331 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8193 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8188 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36658 e!116893))

(assert (=> start!36658 true))

(declare-fun e!116894 () Bool)

(declare-fun inv!12 (BitStream!6914) Bool)

(assert (=> start!36658 (and (inv!12 thiss!1894) e!116894)))

(declare-fun b!168272 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168272 (= e!116893 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8188 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8193 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (size!3879 (buf!4331 thiss!1894)))))))))

(declare-fun b!168273 () Bool)

(declare-fun array_inv!3620 (array!8738) Bool)

(assert (=> b!168273 (= e!116894 (array_inv!3620 (buf!4331 thiss!1894)))))

(assert (= (and start!36658 res!140057) b!168272))

(assert (= start!36658 b!168273))

(declare-fun m!267913 () Bool)

(assert (=> start!36658 m!267913))

(declare-fun m!267915 () Bool)

(assert (=> b!168272 m!267915))

(declare-fun m!267917 () Bool)

(assert (=> b!168273 m!267917))

(push 1)

(assert (not start!36658))

(assert (not b!168273))

(assert (not b!168272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

