; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50164 () Bool)

(assert start!50164)

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12400 0))(
  ( (array!12401 (arr!6434 (Array (_ BitVec 32) (_ BitVec 8))) (size!5447 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9858 0))(
  ( (BitStream!9859 (buf!5922 array!12400) (currentByte!11028 (_ BitVec 32)) (currentBit!11023 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9858)

(assert (=> start!50164 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5447 (buf!5922 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11028 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11023 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5447 (buf!5922 thiss!1848))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11028 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11023 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50164 true))

(declare-fun e!162883 () Bool)

(declare-fun inv!12 (BitStream!9858) Bool)

(assert (=> start!50164 (and (inv!12 thiss!1848) e!162883)))

(declare-fun b!235673 () Bool)

(declare-fun array_inv!5188 (array!12400) Bool)

(assert (=> b!235673 (= e!162883 (array_inv!5188 (buf!5922 thiss!1848)))))

(assert (= start!50164 b!235673))

(declare-fun m!358361 () Bool)

(assert (=> start!50164 m!358361))

(declare-fun m!358363 () Bool)

(assert (=> b!235673 m!358363))

(check-sat (not start!50164) (not b!235673))
(check-sat)
(get-model)

(declare-fun d!79538 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79538 (= (inv!12 thiss!1848) (invariant!0 (currentBit!11023 thiss!1848) (currentByte!11028 thiss!1848) (size!5447 (buf!5922 thiss!1848))))))

(declare-fun bs!19828 () Bool)

(assert (= bs!19828 d!79538))

(declare-fun m!358369 () Bool)

(assert (=> bs!19828 m!358369))

(assert (=> start!50164 d!79538))

(declare-fun d!79540 () Bool)

(assert (=> d!79540 (= (array_inv!5188 (buf!5922 thiss!1848)) (bvsge (size!5447 (buf!5922 thiss!1848)) #b00000000000000000000000000000000))))

(assert (=> b!235673 d!79540))

(check-sat (not d!79538))
(check-sat)
(get-model)

(declare-fun d!79542 () Bool)

(assert (=> d!79542 (= (invariant!0 (currentBit!11023 thiss!1848) (currentByte!11028 thiss!1848) (size!5447 (buf!5922 thiss!1848))) (and (bvsge (currentBit!11023 thiss!1848) #b00000000000000000000000000000000) (bvslt (currentBit!11023 thiss!1848) #b00000000000000000000000000001000) (bvsge (currentByte!11028 thiss!1848) #b00000000000000000000000000000000) (or (bvslt (currentByte!11028 thiss!1848) (size!5447 (buf!5922 thiss!1848))) (and (= (currentBit!11023 thiss!1848) #b00000000000000000000000000000000) (= (currentByte!11028 thiss!1848) (size!5447 (buf!5922 thiss!1848)))))))))

(assert (=> d!79538 d!79542))

(check-sat)
