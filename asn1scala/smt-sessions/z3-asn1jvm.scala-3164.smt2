; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72696 () Bool)

(assert start!72696)

(declare-fun res!266233 () Bool)

(declare-fun e!233837 () Bool)

(assert (=> start!72696 (=> (not res!266233) (not e!233837))))

(declare-datatypes ((array!20836 0))(
  ( (array!20837 (arr!10151 (Array (_ BitVec 32) (_ BitVec 8))) (size!9059 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14280 0))(
  ( (BitStream!14281 (buf!8201 array!20836) (currentByte!15156 (_ BitVec 32)) (currentBit!15151 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14280)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72696 (= res!266233 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9059 (buf!8201 thiss!877))) ((_ sign_extend 32) (currentByte!15156 thiss!877)) ((_ sign_extend 32) (currentBit!15151 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72696 e!233837))

(declare-fun e!233836 () Bool)

(declare-fun inv!12 (BitStream!14280) Bool)

(assert (=> start!72696 (and (inv!12 thiss!877) e!233836)))

(declare-fun b!324389 () Bool)

(declare-fun res!266232 () Bool)

(assert (=> b!324389 (=> (not res!266232) (not e!233837))))

(assert (=> b!324389 (= res!266232 (bvslt (currentBit!15151 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324390 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324390 (= e!233837 (not (invariant!0 (currentBit!15151 thiss!877) (currentByte!15156 thiss!877) (size!9059 (buf!8201 thiss!877)))))))

(declare-fun b!324391 () Bool)

(declare-fun array_inv!8611 (array!20836) Bool)

(assert (=> b!324391 (= e!233836 (array_inv!8611 (buf!8201 thiss!877)))))

(assert (= (and start!72696 res!266233) b!324389))

(assert (= (and b!324389 res!266232) b!324390))

(assert (= start!72696 b!324391))

(declare-fun m!462513 () Bool)

(assert (=> start!72696 m!462513))

(declare-fun m!462515 () Bool)

(assert (=> start!72696 m!462515))

(declare-fun m!462517 () Bool)

(assert (=> b!324390 m!462517))

(declare-fun m!462519 () Bool)

(assert (=> b!324391 m!462519))

(check-sat (not b!324391) (not b!324390) (not start!72696))
(check-sat)
(get-model)

(declare-fun d!106616 () Bool)

(assert (=> d!106616 (= (array_inv!8611 (buf!8201 thiss!877)) (bvsge (size!9059 (buf!8201 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324391 d!106616))

(declare-fun d!106618 () Bool)

(assert (=> d!106618 (= (invariant!0 (currentBit!15151 thiss!877) (currentByte!15156 thiss!877) (size!9059 (buf!8201 thiss!877))) (and (bvsge (currentBit!15151 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15151 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15156 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15156 thiss!877) (size!9059 (buf!8201 thiss!877))) (and (= (currentBit!15151 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15156 thiss!877) (size!9059 (buf!8201 thiss!877)))))))))

(assert (=> b!324390 d!106618))

(declare-fun d!106626 () Bool)

(assert (=> d!106626 (= (remainingBits!0 ((_ sign_extend 32) (size!9059 (buf!8201 thiss!877))) ((_ sign_extend 32) (currentByte!15156 thiss!877)) ((_ sign_extend 32) (currentBit!15151 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9059 (buf!8201 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15156 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15151 thiss!877)))))))

(assert (=> start!72696 d!106626))

(declare-fun d!106634 () Bool)

(assert (=> d!106634 (= (inv!12 thiss!877) (invariant!0 (currentBit!15151 thiss!877) (currentByte!15156 thiss!877) (size!9059 (buf!8201 thiss!877))))))

(declare-fun bs!28089 () Bool)

(assert (= bs!28089 d!106634))

(assert (=> bs!28089 m!462517))

(assert (=> start!72696 d!106634))

(check-sat (not d!106634))
