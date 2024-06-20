; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51486 () Bool)

(assert start!51486)

(declare-fun res!199896 () Bool)

(declare-fun e!165561 () Bool)

(assert (=> start!51486 (=> (not res!199896) (not e!165561))))

(declare-datatypes ((array!12899 0))(
  ( (array!12900 (arr!6647 (Array (_ BitVec 32) (_ BitVec 8))) (size!5660 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10242 0))(
  ( (BitStream!10243 (buf!6114 array!12899) (currentByte!11354 (_ BitVec 32)) (currentBit!11349 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10242)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51486 (= res!199896 (validate_offset_bits!1 ((_ sign_extend 32) (size!5660 (buf!6114 thiss!1854))) ((_ sign_extend 32) (currentByte!11354 thiss!1854)) ((_ sign_extend 32) (currentBit!11349 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51486 e!165561))

(declare-fun e!165562 () Bool)

(declare-fun inv!12 (BitStream!10242) Bool)

(assert (=> start!51486 (and (inv!12 thiss!1854) e!165562)))

(declare-fun b!239284 () Bool)

(assert (=> b!239284 (= e!165561 (bvsge (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11349 thiss!1854)))) #b00000000000000000000000010000000))))

(declare-fun b!239285 () Bool)

(declare-fun array_inv!5401 (array!12899) Bool)

(assert (=> b!239285 (= e!165562 (array_inv!5401 (buf!6114 thiss!1854)))))

(assert (= (and start!51486 res!199896) b!239284))

(assert (= start!51486 b!239285))

(declare-fun m!361405 () Bool)

(assert (=> start!51486 m!361405))

(declare-fun m!361407 () Bool)

(assert (=> start!51486 m!361407))

(declare-fun m!361409 () Bool)

(assert (=> b!239285 m!361409))

(check-sat (not start!51486) (not b!239285))
(check-sat)
(get-model)

(declare-fun d!80644 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80644 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5660 (buf!6114 thiss!1854))) ((_ sign_extend 32) (currentByte!11354 thiss!1854)) ((_ sign_extend 32) (currentBit!11349 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5660 (buf!6114 thiss!1854))) ((_ sign_extend 32) (currentByte!11354 thiss!1854)) ((_ sign_extend 32) (currentBit!11349 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20282 () Bool)

(assert (= bs!20282 d!80644))

(declare-fun m!361425 () Bool)

(assert (=> bs!20282 m!361425))

(assert (=> start!51486 d!80644))

(declare-fun d!80648 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80648 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11349 thiss!1854) (currentByte!11354 thiss!1854) (size!5660 (buf!6114 thiss!1854))))))

(declare-fun bs!20283 () Bool)

(assert (= bs!20283 d!80648))

(declare-fun m!361427 () Bool)

(assert (=> bs!20283 m!361427))

(assert (=> start!51486 d!80648))

(declare-fun d!80650 () Bool)

(assert (=> d!80650 (= (array_inv!5401 (buf!6114 thiss!1854)) (bvsge (size!5660 (buf!6114 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239285 d!80650))

(check-sat (not d!80648) (not d!80644))
(check-sat)
(get-model)

(declare-fun d!80654 () Bool)

(assert (=> d!80654 (= (invariant!0 (currentBit!11349 thiss!1854) (currentByte!11354 thiss!1854) (size!5660 (buf!6114 thiss!1854))) (and (bvsge (currentBit!11349 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11349 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11354 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11354 thiss!1854) (size!5660 (buf!6114 thiss!1854))) (and (= (currentBit!11349 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11354 thiss!1854) (size!5660 (buf!6114 thiss!1854)))))))))

(assert (=> d!80648 d!80654))

(declare-fun d!80658 () Bool)

(assert (=> d!80658 (= (remainingBits!0 ((_ sign_extend 32) (size!5660 (buf!6114 thiss!1854))) ((_ sign_extend 32) (currentByte!11354 thiss!1854)) ((_ sign_extend 32) (currentBit!11349 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5660 (buf!6114 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11354 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11349 thiss!1854)))))))

(assert (=> d!80644 d!80658))

(check-sat)
