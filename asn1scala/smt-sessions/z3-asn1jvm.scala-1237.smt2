; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35050 () Bool)

(assert start!35050)

(declare-fun res!137458 () Bool)

(declare-fun e!114119 () Bool)

(assert (=> start!35050 (=> (not res!137458) (not e!114119))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35050 (= res!137458 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35050 e!114119))

(assert (=> start!35050 true))

(declare-datatypes ((array!8330 0))(
  ( (array!8331 (arr!4646 (Array (_ BitVec 32) (_ BitVec 8))) (size!3725 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6606 0))(
  ( (BitStream!6607 (buf!4177 array!8330) (currentByte!7796 (_ BitVec 32)) (currentBit!7791 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6606)

(declare-fun e!114118 () Bool)

(declare-fun inv!12 (BitStream!6606) Bool)

(assert (=> start!35050 (and (inv!12 thiss!1577) e!114118)))

(declare-fun b!165001 () Bool)

(declare-fun res!137459 () Bool)

(assert (=> b!165001 (=> (not res!137459) (not e!114119))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165001 (= res!137459 (validate_offset_bits!1 ((_ sign_extend 32) (size!3725 (buf!4177 thiss!1577))) ((_ sign_extend 32) (currentByte!7796 thiss!1577)) ((_ sign_extend 32) (currentBit!7791 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165002 () Bool)

(assert (=> b!165002 (= e!114119 (and (bvsle (bvadd (currentBit!7791 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsge (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7791 thiss!1577) nBits!511)) #b00000000000000000000000000001001)))))

(declare-fun b!165003 () Bool)

(declare-fun array_inv!3466 (array!8330) Bool)

(assert (=> b!165003 (= e!114118 (array_inv!3466 (buf!4177 thiss!1577)))))

(assert (= (and start!35050 res!137458) b!165001))

(assert (= (and b!165001 res!137459) b!165002))

(assert (= start!35050 b!165003))

(declare-fun m!262345 () Bool)

(assert (=> start!35050 m!262345))

(declare-fun m!262347 () Bool)

(assert (=> b!165001 m!262347))

(declare-fun m!262349 () Bool)

(assert (=> b!165003 m!262349))

(check-sat (not start!35050) (not b!165001) (not b!165003))
(check-sat)
(get-model)

(declare-fun d!57049 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57049 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7791 thiss!1577) (currentByte!7796 thiss!1577) (size!3725 (buf!4177 thiss!1577))))))

(declare-fun bs!14157 () Bool)

(assert (= bs!14157 d!57049))

(declare-fun m!262357 () Bool)

(assert (=> bs!14157 m!262357))

(assert (=> start!35050 d!57049))

(declare-fun d!57051 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57051 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3725 (buf!4177 thiss!1577))) ((_ sign_extend 32) (currentByte!7796 thiss!1577)) ((_ sign_extend 32) (currentBit!7791 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3725 (buf!4177 thiss!1577))) ((_ sign_extend 32) (currentByte!7796 thiss!1577)) ((_ sign_extend 32) (currentBit!7791 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14158 () Bool)

(assert (= bs!14158 d!57051))

(declare-fun m!262359 () Bool)

(assert (=> bs!14158 m!262359))

(assert (=> b!165001 d!57051))

(declare-fun d!57053 () Bool)

(assert (=> d!57053 (= (array_inv!3466 (buf!4177 thiss!1577)) (bvsge (size!3725 (buf!4177 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165003 d!57053))

(check-sat (not d!57049) (not d!57051))
(check-sat)
(get-model)

(declare-fun d!57067 () Bool)

(assert (=> d!57067 (= (invariant!0 (currentBit!7791 thiss!1577) (currentByte!7796 thiss!1577) (size!3725 (buf!4177 thiss!1577))) (and (bvsge (currentBit!7791 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7791 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7796 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7796 thiss!1577) (size!3725 (buf!4177 thiss!1577))) (and (= (currentBit!7791 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7796 thiss!1577) (size!3725 (buf!4177 thiss!1577)))))))))

(assert (=> d!57049 d!57067))

(declare-fun d!57069 () Bool)

(assert (=> d!57069 (= (remainingBits!0 ((_ sign_extend 32) (size!3725 (buf!4177 thiss!1577))) ((_ sign_extend 32) (currentByte!7796 thiss!1577)) ((_ sign_extend 32) (currentBit!7791 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3725 (buf!4177 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7796 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7791 thiss!1577)))))))

(assert (=> d!57051 d!57069))

(check-sat)
