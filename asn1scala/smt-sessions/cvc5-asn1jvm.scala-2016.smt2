; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51562 () Bool)

(assert start!51562)

(declare-fun res!199920 () Bool)

(declare-fun e!165633 () Bool)

(assert (=> start!51562 (=> (not res!199920) (not e!165633))))

(declare-datatypes ((array!12921 0))(
  ( (array!12922 (arr!6655 (Array (_ BitVec 32) (_ BitVec 8))) (size!5668 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10258 0))(
  ( (BitStream!10259 (buf!6122 array!12921) (currentByte!11380 (_ BitVec 32)) (currentBit!11375 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10258)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51562 (= res!199920 (validate_offset_bits!1 ((_ sign_extend 32) (size!5668 (buf!6122 thiss!1854))) ((_ sign_extend 32) (currentByte!11380 thiss!1854)) ((_ sign_extend 32) (currentBit!11375 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51562 e!165633))

(declare-fun e!165634 () Bool)

(declare-fun inv!12 (BitStream!10258) Bool)

(assert (=> start!51562 (and (inv!12 thiss!1854) e!165634)))

(declare-fun b!239332 () Bool)

(assert (=> b!239332 (= e!165633 (and (bvsle ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11375 thiss!1854))) #b00000000000000000000000000100000) (or (bvslt (currentByte!11380 thiss!1854) #b00000000000000000000000000000000) (bvsge (currentByte!11380 thiss!1854) (size!5668 (buf!6122 thiss!1854))))))))

(declare-fun b!239333 () Bool)

(declare-fun array_inv!5409 (array!12921) Bool)

(assert (=> b!239333 (= e!165634 (array_inv!5409 (buf!6122 thiss!1854)))))

(assert (= (and start!51562 res!199920) b!239332))

(assert (= start!51562 b!239333))

(declare-fun m!361477 () Bool)

(assert (=> start!51562 m!361477))

(declare-fun m!361479 () Bool)

(assert (=> start!51562 m!361479))

(declare-fun m!361481 () Bool)

(assert (=> b!239333 m!361481))

(push 1)

(assert (not b!239333))

(assert (not start!51562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80702 () Bool)

(assert (=> d!80702 (= (array_inv!5409 (buf!6122 thiss!1854)) (bvsge (size!5668 (buf!6122 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239333 d!80702))

(declare-fun d!80704 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80704 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5668 (buf!6122 thiss!1854))) ((_ sign_extend 32) (currentByte!11380 thiss!1854)) ((_ sign_extend 32) (currentBit!11375 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5668 (buf!6122 thiss!1854))) ((_ sign_extend 32) (currentByte!11380 thiss!1854)) ((_ sign_extend 32) (currentBit!11375 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20300 () Bool)

(assert (= bs!20300 d!80704))

(declare-fun m!361497 () Bool)

(assert (=> bs!20300 m!361497))

(assert (=> start!51562 d!80704))

(declare-fun d!80708 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80708 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11375 thiss!1854) (currentByte!11380 thiss!1854) (size!5668 (buf!6122 thiss!1854))))))

(declare-fun bs!20301 () Bool)

(assert (= bs!20301 d!80708))

(declare-fun m!361499 () Bool)

(assert (=> bs!20301 m!361499))

(assert (=> start!51562 d!80708))

(push 1)

(assert (not d!80708))

(assert (not d!80704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80718 () Bool)

(assert (=> d!80718 (= (invariant!0 (currentBit!11375 thiss!1854) (currentByte!11380 thiss!1854) (size!5668 (buf!6122 thiss!1854))) (and (bvsge (currentBit!11375 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11375 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11380 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11380 thiss!1854) (size!5668 (buf!6122 thiss!1854))) (and (= (currentBit!11375 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11380 thiss!1854) (size!5668 (buf!6122 thiss!1854)))))))))

(assert (=> d!80708 d!80718))

(declare-fun d!80722 () Bool)

(assert (=> d!80722 (= (remainingBits!0 ((_ sign_extend 32) (size!5668 (buf!6122 thiss!1854))) ((_ sign_extend 32) (currentByte!11380 thiss!1854)) ((_ sign_extend 32) (currentBit!11375 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5668 (buf!6122 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11380 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11375 thiss!1854)))))))

(assert (=> d!80704 d!80722))

(push 1)

(check-sat)

(pop 1)

