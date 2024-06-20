; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33022 () Bool)

(assert start!33022)

(declare-fun res!133904 () Bool)

(declare-fun e!110143 () Bool)

(assert (=> start!33022 (=> (not res!133904) (not e!110143))))

(declare-datatypes ((array!7798 0))(
  ( (array!7799 (arr!4436 (Array (_ BitVec 32) (_ BitVec 8))) (size!3515 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6198 0))(
  ( (BitStream!6199 (buf!3973 array!7798) (currentByte!7339 (_ BitVec 32)) (currentBit!7334 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6198)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33022 (= res!133904 (validate_offset_byte!0 ((_ sign_extend 32) (size!3515 (buf!3973 thiss!1602))) ((_ sign_extend 32) (currentByte!7339 thiss!1602)) ((_ sign_extend 32) (currentBit!7334 thiss!1602))))))

(assert (=> start!33022 e!110143))

(declare-fun e!110144 () Bool)

(declare-fun inv!12 (BitStream!6198) Bool)

(assert (=> start!33022 (and (inv!12 thiss!1602) e!110144)))

(declare-fun b!160583 () Bool)

(assert (=> b!160583 (= e!110143 (and (bvslt (currentByte!7339 thiss!1602) (size!3515 (buf!3973 thiss!1602))) (bvslt (currentByte!7339 thiss!1602) #b00000000000000000000000000000000)))))

(declare-fun b!160584 () Bool)

(declare-fun array_inv!3262 (array!7798) Bool)

(assert (=> b!160584 (= e!110144 (array_inv!3262 (buf!3973 thiss!1602)))))

(assert (= (and start!33022 res!133904) b!160583))

(assert (= start!33022 b!160584))

(declare-fun m!253603 () Bool)

(assert (=> start!33022 m!253603))

(declare-fun m!253605 () Bool)

(assert (=> start!33022 m!253605))

(declare-fun m!253607 () Bool)

(assert (=> b!160584 m!253607))

(check-sat (not b!160584) (not start!33022))
(check-sat)
(get-model)

(declare-fun d!54473 () Bool)

(assert (=> d!54473 (= (array_inv!3262 (buf!3973 thiss!1602)) (bvsge (size!3515 (buf!3973 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160584 d!54473))

(declare-fun d!54475 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54475 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3515 (buf!3973 thiss!1602))) ((_ sign_extend 32) (currentByte!7339 thiss!1602)) ((_ sign_extend 32) (currentBit!7334 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3515 (buf!3973 thiss!1602))) ((_ sign_extend 32) (currentByte!7339 thiss!1602)) ((_ sign_extend 32) (currentBit!7334 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13518 () Bool)

(assert (= bs!13518 d!54475))

(declare-fun m!253619 () Bool)

(assert (=> bs!13518 m!253619))

(assert (=> start!33022 d!54475))

(declare-fun d!54479 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54479 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7334 thiss!1602) (currentByte!7339 thiss!1602) (size!3515 (buf!3973 thiss!1602))))))

(declare-fun bs!13520 () Bool)

(assert (= bs!13520 d!54479))

(declare-fun m!253623 () Bool)

(assert (=> bs!13520 m!253623))

(assert (=> start!33022 d!54479))

(check-sat (not d!54475) (not d!54479))
(check-sat)
(get-model)

(declare-fun d!54489 () Bool)

