; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72394 () Bool)

(assert start!72394)

(declare-fun res!265981 () Bool)

(declare-fun e!233497 () Bool)

(assert (=> start!72394 (=> (not res!265981) (not e!233497))))

(declare-datatypes ((array!20751 0))(
  ( (array!20752 (arr!10121 (Array (_ BitVec 32) (_ BitVec 8))) (size!9029 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14220 0))(
  ( (BitStream!14221 (buf!8171 array!20751) (currentByte!15069 (_ BitVec 32)) (currentBit!15064 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14220)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72394 (= res!265981 (validate_offset_bit!0 ((_ sign_extend 32) (size!9029 (buf!8171 thiss!1702))) ((_ sign_extend 32) (currentByte!15069 thiss!1702)) ((_ sign_extend 32) (currentBit!15064 thiss!1702))))))

(assert (=> start!72394 e!233497))

(declare-fun e!233498 () Bool)

(declare-fun inv!12 (BitStream!14220) Bool)

(assert (=> start!72394 (and (inv!12 thiss!1702) e!233498)))

(declare-fun b!324048 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!324048 (= e!233497 (bvsle (remainingBits!0 ((_ sign_extend 32) (size!9029 (buf!8171 thiss!1702))) ((_ sign_extend 32) (currentByte!15069 thiss!1702)) ((_ sign_extend 32) (currentBit!15064 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!324049 () Bool)

(declare-fun array_inv!8581 (array!20751) Bool)

(assert (=> b!324049 (= e!233498 (array_inv!8581 (buf!8171 thiss!1702)))))

(assert (= (and start!72394 res!265981) b!324048))

(assert (= start!72394 b!324049))

(declare-fun m!462127 () Bool)

(assert (=> start!72394 m!462127))

(declare-fun m!462129 () Bool)

(assert (=> start!72394 m!462129))

(declare-fun m!462131 () Bool)

(assert (=> b!324048 m!462131))

(declare-fun m!462133 () Bool)

(assert (=> b!324049 m!462133))

(check-sat (not b!324049) (not start!72394) (not b!324048))
(check-sat)
(get-model)

(declare-fun d!106330 () Bool)

(assert (=> d!106330 (= (array_inv!8581 (buf!8171 thiss!1702)) (bvsge (size!9029 (buf!8171 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324049 d!106330))

(declare-fun d!106334 () Bool)

(assert (=> d!106334 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9029 (buf!8171 thiss!1702))) ((_ sign_extend 32) (currentByte!15069 thiss!1702)) ((_ sign_extend 32) (currentBit!15064 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9029 (buf!8171 thiss!1702))) ((_ sign_extend 32) (currentByte!15069 thiss!1702)) ((_ sign_extend 32) (currentBit!15064 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28012 () Bool)

(assert (= bs!28012 d!106334))

(assert (=> bs!28012 m!462131))

(assert (=> start!72394 d!106334))

(declare-fun d!106340 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106340 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15064 thiss!1702) (currentByte!15069 thiss!1702) (size!9029 (buf!8171 thiss!1702))))))

(declare-fun bs!28015 () Bool)

(assert (= bs!28015 d!106340))

(declare-fun m!462143 () Bool)

(assert (=> bs!28015 m!462143))

(assert (=> start!72394 d!106340))

(declare-fun d!106350 () Bool)

(assert (=> d!106350 (= (remainingBits!0 ((_ sign_extend 32) (size!9029 (buf!8171 thiss!1702))) ((_ sign_extend 32) (currentByte!15069 thiss!1702)) ((_ sign_extend 32) (currentBit!15064 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9029 (buf!8171 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15069 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15064 thiss!1702)))))))

(assert (=> b!324048 d!106350))

(check-sat (not d!106334) (not d!106340))
(check-sat)
