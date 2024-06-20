; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54832 () Bool)

(assert start!54832)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(declare-datatypes ((array!13875 0))(
  ( (array!13876 (arr!7076 (Array (_ BitVec 32) (_ BitVec 8))) (size!6089 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11100 0))(
  ( (BitStream!11101 (buf!6611 array!13875) (currentByte!12097 (_ BitVec 32)) (currentBit!12092 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11100)

(assert (=> start!54832 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535) (bvsle ((_ sign_extend 32) (size!6089 (buf!6611 thiss!1754))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12097 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12092 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!6089 (buf!6611 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!12097 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!12092 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54832 true))

(declare-fun e!177924 () Bool)

(declare-fun inv!12 (BitStream!11100) Bool)

(assert (=> start!54832 (and (inv!12 thiss!1754) e!177924)))

(declare-fun b!256705 () Bool)

(declare-fun array_inv!5830 (array!13875) Bool)

(assert (=> b!256705 (= e!177924 (array_inv!5830 (buf!6611 thiss!1754)))))

(assert (= start!54832 b!256705))

(declare-fun m!386309 () Bool)

(assert (=> start!54832 m!386309))

(declare-fun m!386311 () Bool)

(assert (=> b!256705 m!386311))

(check-sat (not b!256705) (not start!54832))
(check-sat)
(get-model)

(declare-fun d!86090 () Bool)

(assert (=> d!86090 (= (array_inv!5830 (buf!6611 thiss!1754)) (bvsge (size!6089 (buf!6611 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256705 d!86090))

(declare-fun d!86092 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86092 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12092 thiss!1754) (currentByte!12097 thiss!1754) (size!6089 (buf!6611 thiss!1754))))))

(declare-fun bs!21757 () Bool)

(assert (= bs!21757 d!86092))

(declare-fun m!386317 () Bool)

(assert (=> bs!21757 m!386317))

(assert (=> start!54832 d!86092))

(check-sat (not d!86092))
(check-sat)
(get-model)

(declare-fun d!86094 () Bool)

(assert (=> d!86094 (= (invariant!0 (currentBit!12092 thiss!1754) (currentByte!12097 thiss!1754) (size!6089 (buf!6611 thiss!1754))) (and (bvsge (currentBit!12092 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12092 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12097 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12097 thiss!1754) (size!6089 (buf!6611 thiss!1754))) (and (= (currentBit!12092 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12097 thiss!1754) (size!6089 (buf!6611 thiss!1754)))))))))

(assert (=> d!86092 d!86094))

(check-sat)
