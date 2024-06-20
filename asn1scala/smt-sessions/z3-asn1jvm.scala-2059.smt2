; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52408 () Bool)

(assert start!52408)

(declare-fun res!201315 () Bool)

(declare-fun e!167139 () Bool)

(assert (=> start!52408 (=> (not res!201315) (not e!167139))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13224 0))(
  ( (array!13225 (arr!6779 (Array (_ BitVec 32) (_ BitVec 8))) (size!5792 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10506 0))(
  ( (BitStream!10507 (buf!6258 array!13224) (currentByte!11620 (_ BitVec 32)) (currentBit!11615 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10506)

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> start!52408 (= res!201315 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297) (bvsle ((_ sign_extend 32) (size!5792 (buf!6258 thiss!1005))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11620 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11615 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5792 (buf!6258 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11620 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11615 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52408 e!167139))

(assert (=> start!52408 true))

(declare-fun e!167140 () Bool)

(declare-fun inv!12 (BitStream!10506) Bool)

(assert (=> start!52408 (and (inv!12 thiss!1005) e!167140)))

(declare-fun b!241171 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241171 (= e!167139 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11615 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11620 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (size!5792 (buf!6258 thiss!1005)))))))))

(declare-fun b!241172 () Bool)

(declare-fun array_inv!5533 (array!13224) Bool)

(assert (=> b!241172 (= e!167140 (array_inv!5533 (buf!6258 thiss!1005)))))

(assert (= (and start!52408 res!201315) b!241171))

(assert (= start!52408 b!241172))

(declare-fun m!363897 () Bool)

(assert (=> start!52408 m!363897))

(declare-fun m!363899 () Bool)

(assert (=> b!241171 m!363899))

(declare-fun m!363901 () Bool)

(assert (=> b!241172 m!363901))

(check-sat (not b!241172) (not b!241171) (not start!52408))
(check-sat)
(get-model)

(declare-fun d!81486 () Bool)

(assert (=> d!81486 (= (array_inv!5533 (buf!6258 thiss!1005)) (bvsge (size!5792 (buf!6258 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!241172 d!81486))

(declare-fun d!81488 () Bool)

(assert (=> d!81488 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11615 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11620 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (size!5792 (buf!6258 thiss!1005))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11615 thiss!1005))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11615 thiss!1005))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11620 thiss!1005))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11620 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (size!5792 (buf!6258 thiss!1005))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11615 thiss!1005))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11620 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (size!5792 (buf!6258 thiss!1005)))))))))))

(assert (=> b!241171 d!81488))

(declare-fun d!81490 () Bool)

(assert (=> d!81490 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11615 thiss!1005) (currentByte!11620 thiss!1005) (size!5792 (buf!6258 thiss!1005))))))

(declare-fun bs!20576 () Bool)

(assert (= bs!20576 d!81490))

(declare-fun m!363909 () Bool)

(assert (=> bs!20576 m!363909))

(assert (=> start!52408 d!81490))

(check-sat (not d!81490))
(check-sat)
