; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36674 () Bool)

(assert start!36674)

(declare-fun res!140074 () Bool)

(declare-fun e!116921 () Bool)

(assert (=> start!36674 (=> (not res!140074) (not e!116921))))

(declare-fun nBits!600 () (_ BitVec 32))

(declare-datatypes ((array!8746 0))(
  ( (array!8747 (arr!4803 (Array (_ BitVec 32) (_ BitVec 8))) (size!3882 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6920 0))(
  ( (BitStream!6921 (buf!4334 array!8746) (currentByte!8198 (_ BitVec 32)) (currentBit!8193 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6920)

(assert (=> start!36674 (= res!140074 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000) (bvsle ((_ sign_extend 32) (size!3882 (buf!4334 thiss!1894))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8198 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8193 thiss!1894)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3882 (buf!4334 thiss!1894))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8198 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8193 thiss!1894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!36674 e!116921))

(assert (=> start!36674 true))

(declare-fun e!116920 () Bool)

(declare-fun inv!12 (BitStream!6920) Bool)

(assert (=> start!36674 (and (inv!12 thiss!1894) e!116920)))

(declare-fun b!168298 () Bool)

(declare-fun res!140075 () Bool)

(assert (=> b!168298 (=> (not res!140075) (not e!116921))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168298 (= res!140075 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8193 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8198 thiss!1894))) ((_ extract 31 0) ((_ sign_extend 32) (size!3882 (buf!4334 thiss!1894))))))))

(declare-fun b!168299 () Bool)

(assert (=> b!168299 (= e!116921 (bvslt ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!168300 () Bool)

(declare-fun array_inv!3623 (array!8746) Bool)

(assert (=> b!168300 (= e!116920 (array_inv!3623 (buf!4334 thiss!1894)))))

(assert (= (and start!36674 res!140074) b!168298))

(assert (= (and b!168298 res!140075) b!168299))

(assert (= start!36674 b!168300))

(declare-fun m!267933 () Bool)

(assert (=> start!36674 m!267933))

(declare-fun m!267935 () Bool)

(assert (=> b!168298 m!267935))

(declare-fun m!267937 () Bool)

(assert (=> b!168300 m!267937))

(push 1)

