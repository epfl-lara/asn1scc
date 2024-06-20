; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51564 () Bool)

(assert start!51564)

(declare-fun res!199923 () Bool)

(declare-fun e!165642 () Bool)

(assert (=> start!51564 (=> (not res!199923) (not e!165642))))

(declare-datatypes ((array!12923 0))(
  ( (array!12924 (arr!6656 (Array (_ BitVec 32) (_ BitVec 8))) (size!5669 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10260 0))(
  ( (BitStream!10261 (buf!6123 array!12923) (currentByte!11381 (_ BitVec 32)) (currentBit!11376 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10260)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51564 (= res!199923 (validate_offset_bits!1 ((_ sign_extend 32) (size!5669 (buf!6123 thiss!1854))) ((_ sign_extend 32) (currentByte!11381 thiss!1854)) ((_ sign_extend 32) (currentBit!11376 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51564 e!165642))

(declare-fun e!165643 () Bool)

(declare-fun inv!12 (BitStream!10260) Bool)

(assert (=> start!51564 (and (inv!12 thiss!1854) e!165643)))

(declare-fun b!239338 () Bool)

(assert (=> b!239338 (= e!165642 (and (bvsle ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11376 thiss!1854))) #b00000000000000000000000000100000) (or (bvslt (currentByte!11381 thiss!1854) #b00000000000000000000000000000000) (bvsge (currentByte!11381 thiss!1854) (size!5669 (buf!6123 thiss!1854))))))))

(declare-fun b!239339 () Bool)

(declare-fun array_inv!5410 (array!12923) Bool)

(assert (=> b!239339 (= e!165643 (array_inv!5410 (buf!6123 thiss!1854)))))

(assert (= (and start!51564 res!199923) b!239338))

(assert (= start!51564 b!239339))

(declare-fun m!361483 () Bool)

(assert (=> start!51564 m!361483))

(declare-fun m!361485 () Bool)

(assert (=> start!51564 m!361485))

(declare-fun m!361487 () Bool)

(assert (=> b!239339 m!361487))

(check-sat (not start!51564) (not b!239339))
(check-sat)
(get-model)

(declare-fun d!80700 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80700 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5669 (buf!6123 thiss!1854))) ((_ sign_extend 32) (currentByte!11381 thiss!1854)) ((_ sign_extend 32) (currentBit!11376 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5669 (buf!6123 thiss!1854))) ((_ sign_extend 32) (currentByte!11381 thiss!1854)) ((_ sign_extend 32) (currentBit!11376 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20299 () Bool)

(assert (= bs!20299 d!80700))

(declare-fun m!361495 () Bool)

(assert (=> bs!20299 m!361495))

(assert (=> start!51564 d!80700))

(declare-fun d!80706 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80706 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11376 thiss!1854) (currentByte!11381 thiss!1854) (size!5669 (buf!6123 thiss!1854))))))

(declare-fun bs!20303 () Bool)

(assert (= bs!20303 d!80706))

(declare-fun m!361503 () Bool)

(assert (=> bs!20303 m!361503))

(assert (=> start!51564 d!80706))

(declare-fun d!80714 () Bool)

(assert (=> d!80714 (= (array_inv!5410 (buf!6123 thiss!1854)) (bvsge (size!5669 (buf!6123 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239339 d!80714))

(check-sat (not d!80700) (not d!80706))
(check-sat)
(get-model)

(declare-fun d!80720 () Bool)

(assert (=> d!80720 (= (remainingBits!0 ((_ sign_extend 32) (size!5669 (buf!6123 thiss!1854))) ((_ sign_extend 32) (currentByte!11381 thiss!1854)) ((_ sign_extend 32) (currentBit!11376 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5669 (buf!6123 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11381 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11376 thiss!1854)))))))

(assert (=> d!80700 d!80720))

(declare-fun d!80724 () Bool)

(assert (=> d!80724 (= (invariant!0 (currentBit!11376 thiss!1854) (currentByte!11381 thiss!1854) (size!5669 (buf!6123 thiss!1854))) (and (bvsge (currentBit!11376 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11376 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11381 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11381 thiss!1854) (size!5669 (buf!6123 thiss!1854))) (and (= (currentBit!11376 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11381 thiss!1854) (size!5669 (buf!6123 thiss!1854)))))))))

(assert (=> d!80706 d!80724))

(check-sat)
