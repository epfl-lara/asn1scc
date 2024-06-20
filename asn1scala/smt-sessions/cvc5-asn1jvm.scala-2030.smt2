; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51852 () Bool)

(assert start!51852)

(declare-fun lt!374187 () (_ BitVec 32))

(declare-fun lt!374186 () (_ BitVec 32))

(assert (=> start!51852 (= lt!374187 (bvand lt!374186 #b10000000000000000000000000000000))))

(declare-datatypes ((array!13023 0))(
  ( (array!13024 (arr!6694 (Array (_ BitVec 32) (_ BitVec 8))) (size!5707 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10336 0))(
  ( (BitStream!10337 (buf!6161 array!13023) (currentByte!11473 (_ BitVec 32)) (currentBit!11468 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10336)

(assert (=> start!51852 (= lt!374186 (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11473 thiss!1948) #b00000000000000000000000000000011)))))

(assert (=> start!51852 (and (= lt!374187 (bvand (currentBit!11468 thiss!1948) #b10000000000000000000000000000000)) (not (= lt!374187 (bvand (bvadd lt!374186 (currentBit!11468 thiss!1948)) #b10000000000000000000000000000000))))))

(declare-fun e!165976 () Bool)

(declare-fun inv!12 (BitStream!10336) Bool)

(assert (=> start!51852 (and (inv!12 thiss!1948) e!165976)))

(declare-fun b!239588 () Bool)

(declare-fun array_inv!5448 (array!13023) Bool)

(assert (=> b!239588 (= e!165976 (array_inv!5448 (buf!6161 thiss!1948)))))

(assert (= start!51852 b!239588))

(declare-fun m!361831 () Bool)

(assert (=> start!51852 m!361831))

(declare-fun m!361833 () Bool)

(assert (=> b!239588 m!361833))

(push 1)

(assert (not b!239588))

(assert (not start!51852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80958 () Bool)

(assert (=> d!80958 (= (array_inv!5448 (buf!6161 thiss!1948)) (bvsge (size!5707 (buf!6161 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239588 d!80958))

(declare-fun d!80960 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80960 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11468 thiss!1948) (currentByte!11473 thiss!1948) (size!5707 (buf!6161 thiss!1948))))))

(declare-fun bs!20392 () Bool)

(assert (= bs!20392 d!80960))

(declare-fun m!361843 () Bool)

(assert (=> bs!20392 m!361843))

(assert (=> start!51852 d!80960))

(push 1)

(assert (not d!80960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80966 () Bool)

(assert (=> d!80966 (= (invariant!0 (currentBit!11468 thiss!1948) (currentByte!11473 thiss!1948) (size!5707 (buf!6161 thiss!1948))) (and (bvsge (currentBit!11468 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11468 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11473 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11473 thiss!1948) (size!5707 (buf!6161 thiss!1948))) (and (= (currentBit!11468 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11473 thiss!1948) (size!5707 (buf!6161 thiss!1948)))))))))

(assert (=> d!80960 d!80966))

(push 1)

(check-sat)

(pop 1)

