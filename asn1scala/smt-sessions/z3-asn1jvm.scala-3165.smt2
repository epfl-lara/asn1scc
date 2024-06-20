; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72726 () Bool)

(assert start!72726)

(declare-fun res!266251 () Bool)

(declare-fun e!233865 () Bool)

(assert (=> start!72726 (=> (not res!266251) (not e!233865))))

(declare-datatypes ((array!20845 0))(
  ( (array!20846 (arr!10154 (Array (_ BitVec 32) (_ BitVec 8))) (size!9062 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14286 0))(
  ( (BitStream!14287 (buf!8204 array!20845) (currentByte!15165 (_ BitVec 32)) (currentBit!15160 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14286)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72726 (= res!266251 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9062 (buf!8204 thiss!877))) ((_ sign_extend 32) (currentByte!15165 thiss!877)) ((_ sign_extend 32) (currentBit!15160 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72726 e!233865))

(declare-fun e!233863 () Bool)

(declare-fun inv!12 (BitStream!14286) Bool)

(assert (=> start!72726 (and (inv!12 thiss!877) e!233863)))

(declare-fun b!324416 () Bool)

(declare-fun res!266250 () Bool)

(assert (=> b!324416 (=> (not res!266250) (not e!233865))))

(assert (=> b!324416 (= res!266250 (bvslt (currentBit!15160 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324417 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324417 (= e!233865 (not (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15160 thiss!877)) (currentByte!15165 thiss!877) (size!9062 (buf!8204 thiss!877)))))))

(declare-fun b!324418 () Bool)

(declare-fun array_inv!8614 (array!20845) Bool)

(assert (=> b!324418 (= e!233863 (array_inv!8614 (buf!8204 thiss!877)))))

(assert (= (and start!72726 res!266251) b!324416))

(assert (= (and b!324416 res!266250) b!324417))

(assert (= start!72726 b!324418))

(declare-fun m!462537 () Bool)

(assert (=> start!72726 m!462537))

(declare-fun m!462539 () Bool)

(assert (=> start!72726 m!462539))

(declare-fun m!462541 () Bool)

(assert (=> b!324417 m!462541))

(declare-fun m!462543 () Bool)

(assert (=> b!324418 m!462543))

(check-sat (not b!324418) (not b!324417) (not start!72726))
(check-sat)
(get-model)

(declare-fun d!106642 () Bool)

(assert (=> d!106642 (= (array_inv!8614 (buf!8204 thiss!877)) (bvsge (size!9062 (buf!8204 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324418 d!106642))

(declare-fun d!106644 () Bool)

(assert (=> d!106644 (= (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15160 thiss!877)) (currentByte!15165 thiss!877) (size!9062 (buf!8204 thiss!877))) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentBit!15160 thiss!877)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentBit!15160 thiss!877)) #b00000000000000000000000000001000) (bvsge (currentByte!15165 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15165 thiss!877) (size!9062 (buf!8204 thiss!877))) (and (= (bvadd #b00000000000000000000000000000001 (currentBit!15160 thiss!877)) #b00000000000000000000000000000000) (= (currentByte!15165 thiss!877) (size!9062 (buf!8204 thiss!877)))))))))

(assert (=> b!324417 d!106644))

(declare-fun d!106654 () Bool)

(assert (=> d!106654 (= (remainingBits!0 ((_ sign_extend 32) (size!9062 (buf!8204 thiss!877))) ((_ sign_extend 32) (currentByte!15165 thiss!877)) ((_ sign_extend 32) (currentBit!15160 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9062 (buf!8204 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15165 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15160 thiss!877)))))))

(assert (=> start!72726 d!106654))

(declare-fun d!106662 () Bool)

(assert (=> d!106662 (= (inv!12 thiss!877) (invariant!0 (currentBit!15160 thiss!877) (currentByte!15165 thiss!877) (size!9062 (buf!8204 thiss!877))))))

(declare-fun bs!28095 () Bool)

(assert (= bs!28095 d!106662))

(declare-fun m!462555 () Bool)

(assert (=> bs!28095 m!462555))

(assert (=> start!72726 d!106662))

(check-sat (not d!106662))
(check-sat)
(get-model)

(declare-fun d!106670 () Bool)

(assert (=> d!106670 (= (invariant!0 (currentBit!15160 thiss!877) (currentByte!15165 thiss!877) (size!9062 (buf!8204 thiss!877))) (and (bvsge (currentBit!15160 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15160 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15165 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15165 thiss!877) (size!9062 (buf!8204 thiss!877))) (and (= (currentBit!15160 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15165 thiss!877) (size!9062 (buf!8204 thiss!877)))))))))

(assert (=> d!106662 d!106670))

(check-sat)
