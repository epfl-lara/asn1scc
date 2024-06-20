; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50268 () Bool)

(assert start!50268)

(declare-fun res!197145 () Bool)

(declare-fun e!163114 () Bool)

(assert (=> start!50268 (=> (not res!197145) (not e!163114))))

(declare-datatypes ((array!12464 0))(
  ( (array!12465 (arr!6462 (Array (_ BitVec 32) (_ BitVec 8))) (size!5475 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9914 0))(
  ( (BitStream!9915 (buf!5950 array!12464) (currentByte!11061 (_ BitVec 32)) (currentBit!11056 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9914)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50268 (= res!197145 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5475 (buf!5950 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11061 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11056 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5475 (buf!5950 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11061 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11056 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50268 e!163114))

(assert (=> start!50268 true))

(declare-fun e!163113 () Bool)

(declare-fun inv!12 (BitStream!9914) Bool)

(assert (=> start!50268 (and (inv!12 thiss!1830) e!163113)))

(declare-fun b!235872 () Bool)

(declare-fun res!197144 () Bool)

(assert (=> b!235872 (=> (not res!197144) (not e!163114))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235872 (= res!197144 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11056 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11061 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (size!5475 (buf!5950 thiss!1830))))))))

(declare-fun b!235873 () Bool)

(assert (=> b!235873 (= e!163114 (bvslt ((_ sign_extend 32) (bvsub nBits!581 i!752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235874 () Bool)

(declare-fun array_inv!5216 (array!12464) Bool)

(assert (=> b!235874 (= e!163113 (array_inv!5216 (buf!5950 thiss!1830)))))

(assert (= (and start!50268 res!197145) b!235872))

(assert (= (and b!235872 res!197144) b!235873))

(assert (= start!50268 b!235874))

(declare-fun m!358533 () Bool)

(assert (=> start!50268 m!358533))

(declare-fun m!358535 () Bool)

(assert (=> b!235872 m!358535))

(declare-fun m!358537 () Bool)

(assert (=> b!235874 m!358537))

(push 1)

(assert (not start!50268))

(assert (not b!235872))

(assert (not b!235874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

