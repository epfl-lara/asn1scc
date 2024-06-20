; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54 () Bool)

(assert start!54)

(declare-datatypes ((array!23 0))(
  ( (array!24 (arr!398 (Array (_ BitVec 32) (_ BitVec 8))) (size!11 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6 0))(
  ( (BitStream!7 (buf!323 array!23) (currentByte!1206 (_ BitVec 32)) (currentBit!1201 (_ BitVec 32))) )
))
(declare-fun thiss!909 () BitStream!6)

(assert (=> start!54 (and (bvsgt (currentBit!1201 thiss!909) #b00000000000000000000000000000000) (= (bvand (currentByte!1206 thiss!909) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!1206 thiss!909) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!1206 thiss!909)) #b10000000000000000000000000000000))))))

(declare-fun e!64 () Bool)

(declare-fun inv!12 (BitStream!6) Bool)

(assert (=> start!54 (and (inv!12 thiss!909) e!64)))

(declare-fun b!355 () Bool)

(declare-fun array_inv!8 (array!23) Bool)

(assert (=> b!355 (= e!64 (array_inv!8 (buf!323 thiss!909)))))

(assert (= start!54 b!355))

(declare-fun m!47 () Bool)

(assert (=> start!54 m!47))

(declare-fun m!49 () Bool)

(assert (=> b!355 m!49))

(check-sat (not start!54) (not b!355))
(check-sat)
(get-model)

(declare-fun d!716 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!716 (= (inv!12 thiss!909) (invariant!0 (currentBit!1201 thiss!909) (currentByte!1206 thiss!909) (size!11 (buf!323 thiss!909))))))

(declare-fun bs!339 () Bool)

(assert (= bs!339 d!716))

(declare-fun m!55 () Bool)

(assert (=> bs!339 m!55))

(assert (=> start!54 d!716))

(declare-fun d!724 () Bool)

(assert (=> d!724 (= (array_inv!8 (buf!323 thiss!909)) (bvsge (size!11 (buf!323 thiss!909)) #b00000000000000000000000000000000))))

(assert (=> b!355 d!724))

(check-sat (not d!716))
(check-sat)
(get-model)

(declare-fun d!728 () Bool)

(assert (=> d!728 (= (invariant!0 (currentBit!1201 thiss!909) (currentByte!1206 thiss!909) (size!11 (buf!323 thiss!909))) (and (bvsge (currentBit!1201 thiss!909) #b00000000000000000000000000000000) (bvslt (currentBit!1201 thiss!909) #b00000000000000000000000000001000) (bvsge (currentByte!1206 thiss!909) #b00000000000000000000000000000000) (or (bvslt (currentByte!1206 thiss!909) (size!11 (buf!323 thiss!909))) (and (= (currentBit!1201 thiss!909) #b00000000000000000000000000000000) (= (currentByte!1206 thiss!909) (size!11 (buf!323 thiss!909)))))))))

(assert (=> d!716 d!728))

(check-sat)
