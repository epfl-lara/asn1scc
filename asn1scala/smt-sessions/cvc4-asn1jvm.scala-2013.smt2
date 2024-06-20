; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51488 () Bool)

(assert start!51488)

(declare-fun res!199899 () Bool)

(declare-fun e!165570 () Bool)

(assert (=> start!51488 (=> (not res!199899) (not e!165570))))

(declare-datatypes ((array!12901 0))(
  ( (array!12902 (arr!6648 (Array (_ BitVec 32) (_ BitVec 8))) (size!5661 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10244 0))(
  ( (BitStream!10245 (buf!6115 array!12901) (currentByte!11355 (_ BitVec 32)) (currentBit!11350 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10244)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51488 (= res!199899 (validate_offset_bits!1 ((_ sign_extend 32) (size!5661 (buf!6115 thiss!1854))) ((_ sign_extend 32) (currentByte!11355 thiss!1854)) ((_ sign_extend 32) (currentBit!11350 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51488 e!165570))

(declare-fun e!165571 () Bool)

(declare-fun inv!12 (BitStream!10244) Bool)

(assert (=> start!51488 (and (inv!12 thiss!1854) e!165571)))

(declare-fun b!239290 () Bool)

(assert (=> b!239290 (= e!165570 (bvsge (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11350 thiss!1854)))) #b00000000000000000000000010000000))))

(declare-fun b!239291 () Bool)

(declare-fun array_inv!5402 (array!12901) Bool)

(assert (=> b!239291 (= e!165571 (array_inv!5402 (buf!6115 thiss!1854)))))

(assert (= (and start!51488 res!199899) b!239290))

(assert (= start!51488 b!239291))

(declare-fun m!361411 () Bool)

(assert (=> start!51488 m!361411))

(declare-fun m!361413 () Bool)

(assert (=> start!51488 m!361413))

(declare-fun m!361415 () Bool)

(assert (=> b!239291 m!361415))

(push 1)

(assert (not start!51488))

(assert (not b!239291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80638 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80638 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5661 (buf!6115 thiss!1854))) ((_ sign_extend 32) (currentByte!11355 thiss!1854)) ((_ sign_extend 32) (currentBit!11350 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5661 (buf!6115 thiss!1854))) ((_ sign_extend 32) (currentByte!11355 thiss!1854)) ((_ sign_extend 32) (currentBit!11350 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20279 () Bool)

(assert (= bs!20279 d!80638))

(declare-fun m!361419 () Bool)

(assert (=> bs!20279 m!361419))

(assert (=> start!51488 d!80638))

(declare-fun d!80642 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80642 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11350 thiss!1854) (currentByte!11355 thiss!1854) (size!5661 (buf!6115 thiss!1854))))))

(declare-fun bs!20281 () Bool)

(assert (= bs!20281 d!80642))

(declare-fun m!361423 () Bool)

(assert (=> bs!20281 m!361423))

(assert (=> start!51488 d!80642))

(declare-fun d!80646 () Bool)

(assert (=> d!80646 (= (array_inv!5402 (buf!6115 thiss!1854)) (bvsge (size!5661 (buf!6115 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239291 d!80646))

(push 1)

(assert (not d!80638))

(assert (not d!80642))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80660 () Bool)

(assert (=> d!80660 (= (remainingBits!0 ((_ sign_extend 32) (size!5661 (buf!6115 thiss!1854))) ((_ sign_extend 32) (currentByte!11355 thiss!1854)) ((_ sign_extend 32) (currentBit!11350 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5661 (buf!6115 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11355 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11350 thiss!1854)))))))

(assert (=> d!80638 d!80660))

(declare-fun d!80662 () Bool)

(assert (=> d!80662 (= (invariant!0 (currentBit!11350 thiss!1854) (currentByte!11355 thiss!1854) (size!5661 (buf!6115 thiss!1854))) (and (bvsge (currentBit!11350 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11350 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11355 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11355 thiss!1854) (size!5661 (buf!6115 thiss!1854))) (and (= (currentBit!11350 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11355 thiss!1854) (size!5661 (buf!6115 thiss!1854)))))))))

(assert (=> d!80642 d!80662))

(push 1)

(check-sat)

