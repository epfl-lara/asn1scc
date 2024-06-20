; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51872 () Bool)

(assert start!51872)

(declare-fun lt!374202 () (_ BitVec 32))

(declare-datatypes ((array!13032 0))(
  ( (array!13033 (arr!6697 (Array (_ BitVec 32) (_ BitVec 8))) (size!5710 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10342 0))(
  ( (BitStream!10343 (buf!6164 array!13032) (currentByte!11477 (_ BitVec 32)) (currentBit!11472 (_ BitVec 32))) )
))
(declare-fun thiss!1948 () BitStream!10342)

(assert (=> start!51872 (= lt!374202 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!11477 thiss!1948) #b00000000000000000000000000000011)) (currentBit!11472 thiss!1948)))))

(assert (=> start!51872 (and (not (= #b00000000000000000000000000000000 (bvand lt!374202 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000100000 lt!374202) #b10000000000000000000000000000000))))))

(declare-fun e!165994 () Bool)

(declare-fun inv!12 (BitStream!10342) Bool)

(assert (=> start!51872 (and (inv!12 thiss!1948) e!165994)))

(declare-fun b!239597 () Bool)

(declare-fun array_inv!5451 (array!13032) Bool)

(assert (=> b!239597 (= e!165994 (array_inv!5451 (buf!6164 thiss!1948)))))

(assert (= start!51872 b!239597))

(declare-fun m!361849 () Bool)

(assert (=> start!51872 m!361849))

(declare-fun m!361851 () Bool)

(assert (=> b!239597 m!361851))

(push 1)

(assert (not b!239597))

(assert (not start!51872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80976 () Bool)

(assert (=> d!80976 (= (array_inv!5451 (buf!6164 thiss!1948)) (bvsge (size!5710 (buf!6164 thiss!1948)) #b00000000000000000000000000000000))))

(assert (=> b!239597 d!80976))

(declare-fun d!80978 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80978 (= (inv!12 thiss!1948) (invariant!0 (currentBit!11472 thiss!1948) (currentByte!11477 thiss!1948) (size!5710 (buf!6164 thiss!1948))))))

(declare-fun bs!20398 () Bool)

(assert (= bs!20398 d!80978))

(declare-fun m!361861 () Bool)

(assert (=> bs!20398 m!361861))

(assert (=> start!51872 d!80978))

(push 1)

(assert (not d!80978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80982 () Bool)

(assert (=> d!80982 (= (invariant!0 (currentBit!11472 thiss!1948) (currentByte!11477 thiss!1948) (size!5710 (buf!6164 thiss!1948))) (and (bvsge (currentBit!11472 thiss!1948) #b00000000000000000000000000000000) (bvslt (currentBit!11472 thiss!1948) #b00000000000000000000000000001000) (bvsge (currentByte!11477 thiss!1948) #b00000000000000000000000000000000) (or (bvslt (currentByte!11477 thiss!1948) (size!5710 (buf!6164 thiss!1948))) (and (= (currentBit!11472 thiss!1948) #b00000000000000000000000000000000) (= (currentByte!11477 thiss!1948) (size!5710 (buf!6164 thiss!1948)))))))))

(assert (=> d!80978 d!80982))

(push 1)

(check-sat)

(pop 1)

