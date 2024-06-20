; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36672 () Bool)

(assert start!36672)

(declare-fun res!140068 () Bool)

(declare-fun e!116913 () Bool)

(assert (=> start!36672 (=> (not res!140068) (not e!116913))))

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8744 0))(
  ( (array!8745 (arr!4802 (Array (_ BitVec 32) (_ BitVec 8))) (size!3881 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6918 0))(
  ( (BitStream!6919 (buf!4333 array!8744) (currentByte!8197 (_ BitVec 32)) (currentBit!8192 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6918)

(assert (=> start!36672 (= res!140068 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3881 (buf!4333 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8197 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8192 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3881 (buf!4333 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8197 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8192 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36672 e!116913))

(assert (=> start!36672 true))

(declare-fun e!116912 () Bool)

(declare-fun inv!12 (BitStream!6918) Bool)

(assert (=> start!36672 (and (inv!12 thiss!1894) e!116912)))

(declare-fun b!168289 () Bool)

(declare-fun res!140069 () Bool)

(assert (=> b!168289 (=> (not res!140069) (not e!116913))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168289 (= res!140069 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8192 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8197 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (size!3881 (buf!4333 thiss!1894))))))))

(declare-fun b!168290 () Bool)

(assert (=> b!168290 (= e!116913 (bvslt ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!168291 () Bool)

(declare-fun array_inv!3622 (array!8744) Bool)

(assert (=> b!168291 (= e!116912 (array_inv!3622 (buf!4333 thiss!1894)))))

(assert (= (and start!36672 res!140068) b!168289))

(assert (= (and b!168289 res!140069) b!168290))

(assert (= start!36672 b!168291))

(declare-fun m!267927 () Bool)

(assert (=> start!36672 m!267927))

(declare-fun m!267929 () Bool)

(assert (=> b!168289 m!267929))

(declare-fun m!267931 () Bool)

(assert (=> b!168291 m!267931))

(check-sat (not b!168291) (not b!168289) (not start!36672))
(check-sat)
