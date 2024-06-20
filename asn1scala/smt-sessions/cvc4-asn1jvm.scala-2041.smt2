; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52046 () Bool)

(assert start!52046)

(declare-fun res!200205 () Bool)

(declare-fun e!166290 () Bool)

(assert (=> start!52046 (=> (not res!200205) (not e!166290))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13101 0))(
  ( (array!13102 (arr!6726 (Array (_ BitVec 32) (_ BitVec 8))) (size!5739 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10400 0))(
  ( (BitStream!10401 (buf!6193 array!13101) (currentByte!11533 (_ BitVec 32)) (currentBit!11528 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10400)

(assert (=> start!52046 (= res!200205 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle ((_ sign_extend 32) (size!5739 (buf!6193 thiss!982))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11533 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11528 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5739 (buf!6193 thiss!982))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11533 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11528 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52046 e!166290))

(assert (=> start!52046 true))

(declare-fun e!166291 () Bool)

(declare-fun inv!12 (BitStream!10400) Bool)

(assert (=> start!52046 (and (inv!12 thiss!982) e!166291)))

(declare-fun b!239830 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239830 (= e!166290 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11528 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11533 thiss!982))) ((_ extract 31 0) ((_ sign_extend 32) (size!5739 (buf!6193 thiss!982)))))))))

(declare-fun b!239831 () Bool)

(declare-fun array_inv!5480 (array!13101) Bool)

(assert (=> b!239831 (= e!166291 (array_inv!5480 (buf!6193 thiss!982)))))

(assert (= (and start!52046 res!200205) b!239830))

(assert (= start!52046 b!239831))

(declare-fun m!362147 () Bool)

(assert (=> start!52046 m!362147))

(declare-fun m!362149 () Bool)

(assert (=> b!239830 m!362149))

(declare-fun m!362151 () Bool)

(assert (=> b!239831 m!362151))

(push 1)

(assert (not start!52046))

(assert (not b!239831))

(assert (not b!239830))

(check-sat)

(pop 1)

(push 1)

(check-sat)

