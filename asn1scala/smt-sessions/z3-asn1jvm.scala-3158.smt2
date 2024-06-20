; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72544 () Bool)

(assert start!72544)

(declare-fun res!266095 () Bool)

(declare-fun e!233644 () Bool)

(assert (=> start!72544 (=> (not res!266095) (not e!233644))))

(declare-datatypes ((array!20787 0))(
  ( (array!20788 (arr!10133 (Array (_ BitVec 32) (_ BitVec 8))) (size!9041 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14244 0))(
  ( (BitStream!14245 (buf!8183 array!20787) (currentByte!15114 (_ BitVec 32)) (currentBit!15109 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14244)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72544 (= res!266095 (validate_offset_bit!0 ((_ sign_extend 32) (size!9041 (buf!8183 thiss!1702))) ((_ sign_extend 32) (currentByte!15114 thiss!1702)) ((_ sign_extend 32) (currentBit!15109 thiss!1702))))))

(assert (=> start!72544 e!233644))

(declare-fun e!233645 () Bool)

(declare-fun inv!12 (BitStream!14244) Bool)

(assert (=> start!72544 (and (inv!12 thiss!1702) e!233645)))

(declare-fun b!324198 () Bool)

(assert (=> b!324198 (= e!233644 (or (bvslt (currentBit!15109 thiss!1702) #b00000000000000000000000000000000) (bvsge (currentBit!15109 thiss!1702) #b00000000000000000000000000001000)))))

(declare-fun b!324199 () Bool)

(declare-fun array_inv!8593 (array!20787) Bool)

(assert (=> b!324199 (= e!233645 (array_inv!8593 (buf!8183 thiss!1702)))))

(assert (= (and start!72544 res!266095) b!324198))

(assert (= start!72544 b!324199))

(declare-fun m!462305 () Bool)

(assert (=> start!72544 m!462305))

(declare-fun m!462307 () Bool)

(assert (=> start!72544 m!462307))

(declare-fun m!462309 () Bool)

(assert (=> b!324199 m!462309))

(check-sat (not start!72544) (not b!324199))
(check-sat)
(get-model)

(declare-fun d!106482 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106482 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9041 (buf!8183 thiss!1702))) ((_ sign_extend 32) (currentByte!15114 thiss!1702)) ((_ sign_extend 32) (currentBit!15109 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9041 (buf!8183 thiss!1702))) ((_ sign_extend 32) (currentByte!15114 thiss!1702)) ((_ sign_extend 32) (currentBit!15109 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28048 () Bool)

(assert (= bs!28048 d!106482))

(declare-fun m!462317 () Bool)

(assert (=> bs!28048 m!462317))

(assert (=> start!72544 d!106482))

(declare-fun d!106484 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106484 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15109 thiss!1702) (currentByte!15114 thiss!1702) (size!9041 (buf!8183 thiss!1702))))))

(declare-fun bs!28049 () Bool)

(assert (= bs!28049 d!106484))

(declare-fun m!462319 () Bool)

(assert (=> bs!28049 m!462319))

(assert (=> start!72544 d!106484))

(declare-fun d!106486 () Bool)

(assert (=> d!106486 (= (array_inv!8593 (buf!8183 thiss!1702)) (bvsge (size!9041 (buf!8183 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324199 d!106486))

(check-sat (not d!106484) (not d!106482))
(check-sat)
(get-model)

(declare-fun d!106500 () Bool)

(assert (=> d!106500 (= (invariant!0 (currentBit!15109 thiss!1702) (currentByte!15114 thiss!1702) (size!9041 (buf!8183 thiss!1702))) (and (bvsge (currentBit!15109 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15109 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15114 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15114 thiss!1702) (size!9041 (buf!8183 thiss!1702))) (and (= (currentBit!15109 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15114 thiss!1702) (size!9041 (buf!8183 thiss!1702)))))))))

(assert (=> d!106484 d!106500))

(declare-fun d!106502 () Bool)

(assert (=> d!106502 (= (remainingBits!0 ((_ sign_extend 32) (size!9041 (buf!8183 thiss!1702))) ((_ sign_extend 32) (currentByte!15114 thiss!1702)) ((_ sign_extend 32) (currentBit!15109 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9041 (buf!8183 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15114 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15109 thiss!1702)))))))

(assert (=> d!106482 d!106502))

(check-sat)
