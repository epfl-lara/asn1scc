; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50264 () Bool)

(assert start!50264)

(declare-fun res!197132 () Bool)

(declare-fun e!163096 () Bool)

(assert (=> start!50264 (=> (not res!197132) (not e!163096))))

(declare-datatypes ((array!12460 0))(
  ( (array!12461 (arr!6460 (Array (_ BitVec 32) (_ BitVec 8))) (size!5473 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9910 0))(
  ( (BitStream!9911 (buf!5948 array!12460) (currentByte!11059 (_ BitVec 32)) (currentBit!11054 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9910)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50264 (= res!197132 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5473 (buf!5948 thiss!1830))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11059 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11054 thiss!1830)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5473 (buf!5948 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11059 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11054 thiss!1830)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50264 e!163096))

(assert (=> start!50264 true))

(declare-fun e!163097 () Bool)

(declare-fun inv!12 (BitStream!9910) Bool)

(assert (=> start!50264 (and (inv!12 thiss!1830) e!163097)))

(declare-fun b!235854 () Bool)

(declare-fun res!197133 () Bool)

(assert (=> b!235854 (=> (not res!197133) (not e!163096))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235854 (= res!197133 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11054 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11059 thiss!1830))) ((_ extract 31 0) ((_ sign_extend 32) (size!5473 (buf!5948 thiss!1830))))))))

(declare-fun b!235855 () Bool)

(assert (=> b!235855 (= e!163096 (bvslt ((_ sign_extend 32) (bvsub nBits!581 i!752)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235856 () Bool)

(declare-fun array_inv!5214 (array!12460) Bool)

(assert (=> b!235856 (= e!163097 (array_inv!5214 (buf!5948 thiss!1830)))))

(assert (= (and start!50264 res!197132) b!235854))

(assert (= (and b!235854 res!197133) b!235855))

(assert (= start!50264 b!235856))

(declare-fun m!358521 () Bool)

(assert (=> start!50264 m!358521))

(declare-fun m!358523 () Bool)

(assert (=> b!235854 m!358523))

(declare-fun m!358525 () Bool)

(assert (=> b!235856 m!358525))

(push 1)

(assert (not b!235856))

(assert (not start!50264))

(assert (not b!235854))

(check-sat)

(pop 1)

(push 1)

(check-sat)

