; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50180 () Bool)

(assert start!50180)

(declare-fun res!197034 () Bool)

(declare-fun e!162906 () Bool)

(assert (=> start!50180 (=> (not res!197034) (not e!162906))))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-fun i!756 () (_ BitVec 32))

(declare-datatypes ((array!12408 0))(
  ( (array!12409 (arr!6437 (Array (_ BitVec 32) (_ BitVec 8))) (size!5450 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9864 0))(
  ( (BitStream!9865 (buf!5925 array!12408) (currentByte!11032 (_ BitVec 32)) (currentBit!11027 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9864)

(assert (=> start!50180 (= res!197034 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5450 (buf!5925 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11032 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11027 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5450 (buf!5925 thiss!1848))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11032 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11027 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50180 e!162906))

(assert (=> start!50180 true))

(declare-fun e!162907 () Bool)

(declare-fun inv!12 (BitStream!9864) Bool)

(assert (=> start!50180 (and (inv!12 thiss!1848) e!162907)))

(declare-fun b!235687 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235687 (= e!162906 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11027 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11032 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (size!5450 (buf!5925 thiss!1848)))))))))

(declare-fun b!235688 () Bool)

(declare-fun array_inv!5191 (array!12408) Bool)

(assert (=> b!235688 (= e!162907 (array_inv!5191 (buf!5925 thiss!1848)))))

(assert (= (and start!50180 res!197034) b!235687))

(assert (= start!50180 b!235688))

(declare-fun m!358379 () Bool)

(assert (=> start!50180 m!358379))

(declare-fun m!358381 () Bool)

(assert (=> b!235687 m!358381))

(declare-fun m!358383 () Bool)

(assert (=> b!235688 m!358383))

(check-sat (not start!50180) (not b!235688) (not b!235687))
(check-sat)
(get-model)

(declare-fun d!79550 () Bool)

(assert (=> d!79550 (= (inv!12 thiss!1848) (invariant!0 (currentBit!11027 thiss!1848) (currentByte!11032 thiss!1848) (size!5450 (buf!5925 thiss!1848))))))

(declare-fun bs!19833 () Bool)

(assert (= bs!19833 d!79550))

(declare-fun m!358391 () Bool)

(assert (=> bs!19833 m!358391))

(assert (=> start!50180 d!79550))

(declare-fun d!79552 () Bool)

(assert (=> d!79552 (= (array_inv!5191 (buf!5925 thiss!1848)) (bvsge (size!5450 (buf!5925 thiss!1848)) #b00000000000000000000000000000000))))

(assert (=> b!235688 d!79552))

(declare-fun d!79554 () Bool)

(assert (=> d!79554 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11027 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11032 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (size!5450 (buf!5925 thiss!1848))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11027 thiss!1848))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11027 thiss!1848))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11032 thiss!1848))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11032 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (size!5450 (buf!5925 thiss!1848))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11027 thiss!1848))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11032 thiss!1848))) ((_ extract 31 0) ((_ sign_extend 32) (size!5450 (buf!5925 thiss!1848)))))))))))

(assert (=> b!235687 d!79554))

(check-sat (not d!79550))
(check-sat)
