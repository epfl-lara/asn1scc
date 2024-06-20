; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51408 () Bool)

(assert start!51408)

(declare-fun res!199869 () Bool)

(declare-fun e!165480 () Bool)

(assert (=> start!51408 (=> (not res!199869) (not e!165480))))

(declare-datatypes ((array!12875 0))(
  ( (array!12876 (arr!6638 (Array (_ BitVec 32) (_ BitVec 8))) (size!5651 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10224 0))(
  ( (BitStream!10225 (buf!6105 array!12875) (currentByte!11327 (_ BitVec 32)) (currentBit!11322 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10224)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51408 (= res!199869 (validate_offset_bits!1 ((_ sign_extend 32) (size!5651 (buf!6105 thiss!1854))) ((_ sign_extend 32) (currentByte!11327 thiss!1854)) ((_ sign_extend 32) (currentBit!11322 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51408 e!165480))

(declare-fun e!165481 () Bool)

(declare-fun inv!12 (BitStream!10224) Bool)

(assert (=> start!51408 (and (inv!12 thiss!1854) e!165481)))

(declare-fun b!239230 () Bool)

(assert (=> b!239230 (= e!165480 (bvsge (currentBit!11322 thiss!1854) #b00000000000000000000000010000000))))

(declare-fun b!239231 () Bool)

(declare-fun array_inv!5392 (array!12875) Bool)

(assert (=> b!239231 (= e!165481 (array_inv!5392 (buf!6105 thiss!1854)))))

(assert (= (and start!51408 res!199869) b!239230))

(assert (= start!51408 b!239231))

(declare-fun m!361327 () Bool)

(assert (=> start!51408 m!361327))

(declare-fun m!361329 () Bool)

(assert (=> start!51408 m!361329))

(declare-fun m!361331 () Bool)

(assert (=> b!239231 m!361331))

(check-sat (not b!239231) (not start!51408))
(check-sat)
(get-model)

(declare-fun d!80570 () Bool)

(assert (=> d!80570 (= (array_inv!5392 (buf!6105 thiss!1854)) (bvsge (size!5651 (buf!6105 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239231 d!80570))

(declare-fun d!80573 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80573 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5651 (buf!6105 thiss!1854))) ((_ sign_extend 32) (currentByte!11327 thiss!1854)) ((_ sign_extend 32) (currentBit!11322 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5651 (buf!6105 thiss!1854))) ((_ sign_extend 32) (currentByte!11327 thiss!1854)) ((_ sign_extend 32) (currentBit!11322 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20257 () Bool)

(assert (= bs!20257 d!80573))

(declare-fun m!361339 () Bool)

(assert (=> bs!20257 m!361339))

(assert (=> start!51408 d!80573))

(declare-fun d!80576 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80576 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11322 thiss!1854) (currentByte!11327 thiss!1854) (size!5651 (buf!6105 thiss!1854))))))

(declare-fun bs!20260 () Bool)

(assert (= bs!20260 d!80576))

(declare-fun m!361345 () Bool)

(assert (=> bs!20260 m!361345))

(assert (=> start!51408 d!80576))

(check-sat (not d!80576) (not d!80573))
(check-sat)
(get-model)

(declare-fun d!80586 () Bool)

(assert (=> d!80586 (= (invariant!0 (currentBit!11322 thiss!1854) (currentByte!11327 thiss!1854) (size!5651 (buf!6105 thiss!1854))) (and (bvsge (currentBit!11322 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11322 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11327 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11327 thiss!1854) (size!5651 (buf!6105 thiss!1854))) (and (= (currentBit!11322 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11327 thiss!1854) (size!5651 (buf!6105 thiss!1854)))))))))

(assert (=> d!80576 d!80586))

(declare-fun d!80590 () Bool)

(assert (=> d!80590 (= (remainingBits!0 ((_ sign_extend 32) (size!5651 (buf!6105 thiss!1854))) ((_ sign_extend 32) (currentByte!11327 thiss!1854)) ((_ sign_extend 32) (currentBit!11322 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5651 (buf!6105 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11327 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11322 thiss!1854)))))))

(assert (=> d!80573 d!80590))

(check-sat)
