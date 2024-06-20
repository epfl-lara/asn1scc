; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54846 () Bool)

(assert start!54846)

(declare-fun res!215170 () Bool)

(declare-fun e!177947 () Bool)

(assert (=> start!54846 (=> (not res!215170) (not e!177947))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13882 0))(
  ( (array!13883 (arr!7079 (Array (_ BitVec 32) (_ BitVec 8))) (size!6092 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11106 0))(
  ( (BitStream!11107 (buf!6614 array!13882) (currentByte!12101 (_ BitVec 32)) (currentBit!12096 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11106)

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!54846 (= res!215170 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535) (bvsle ((_ sign_extend 32) (size!6092 (buf!6614 thiss!1754))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12101 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12096 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6092 (buf!6614 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12101 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12096 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54846 e!177947))

(assert (=> start!54846 true))

(declare-fun e!177948 () Bool)

(declare-fun inv!12 (BitStream!11106) Bool)

(assert (=> start!54846 (and (inv!12 thiss!1754) e!177948)))

(declare-fun b!256719 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256719 (= e!177947 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12096 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12101 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (size!6092 (buf!6614 thiss!1754)))))))))

(declare-fun b!256720 () Bool)

(declare-fun array_inv!5833 (array!13882) Bool)

(assert (=> b!256720 (= e!177948 (array_inv!5833 (buf!6614 thiss!1754)))))

(assert (= (and start!54846 res!215170) b!256719))

(assert (= start!54846 b!256720))

(declare-fun m!386325 () Bool)

(assert (=> start!54846 m!386325))

(declare-fun m!386327 () Bool)

(assert (=> b!256719 m!386327))

(declare-fun m!386329 () Bool)

(assert (=> b!256720 m!386329))

(check-sat (not start!54846) (not b!256720) (not b!256719))
(check-sat)
(get-model)

(declare-fun d!86100 () Bool)

(assert (=> d!86100 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12096 thiss!1754) (currentByte!12101 thiss!1754) (size!6092 (buf!6614 thiss!1754))))))

(declare-fun bs!21761 () Bool)

(assert (= bs!21761 d!86100))

(declare-fun m!386337 () Bool)

(assert (=> bs!21761 m!386337))

(assert (=> start!54846 d!86100))

(declare-fun d!86102 () Bool)

(assert (=> d!86102 (= (array_inv!5833 (buf!6614 thiss!1754)) (bvsge (size!6092 (buf!6614 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256720 d!86102))

(declare-fun d!86104 () Bool)

(assert (=> d!86104 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12096 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12101 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (size!6092 (buf!6614 thiss!1754))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12096 thiss!1754))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12096 thiss!1754))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12101 thiss!1754))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12101 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (size!6092 (buf!6614 thiss!1754))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12096 thiss!1754))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12101 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (size!6092 (buf!6614 thiss!1754)))))))))))

(assert (=> b!256719 d!86104))

(check-sat (not d!86100))
(check-sat)
