; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72934 () Bool)

(assert start!72934)

(declare-fun res!266562 () Bool)

(declare-fun e!234137 () Bool)

(assert (=> start!72934 (=> (not res!266562) (not e!234137))))

(declare-datatypes ((array!20911 0))(
  ( (array!20912 (arr!10178 (Array (_ BitVec 32) (_ BitVec 8))) (size!9086 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14334 0))(
  ( (BitStream!14335 (buf!8228 array!20911) (currentByte!15233 (_ BitVec 32)) (currentBit!15228 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14334)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72934 (= res!266562 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9086 (buf!8228 thiss!877))) ((_ sign_extend 32) (currentByte!15233 thiss!877)) ((_ sign_extend 32) (currentBit!15228 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72934 e!234137))

(declare-fun e!234136 () Bool)

(declare-fun inv!12 (BitStream!14334) Bool)

(assert (=> start!72934 (and (inv!12 thiss!877) e!234136)))

(declare-fun b!324800 () Bool)

(declare-fun res!266563 () Bool)

(assert (=> b!324800 (=> (not res!266563) (not e!234137))))

(assert (=> b!324800 (= res!266563 (bvsge (currentBit!15228 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324801 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324801 (= e!234137 (not (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15233 thiss!877)) (size!9086 (buf!8228 thiss!877)))))))

(declare-fun b!324802 () Bool)

(declare-fun array_inv!8638 (array!20911) Bool)

(assert (=> b!324802 (= e!234136 (array_inv!8638 (buf!8228 thiss!877)))))

(assert (= (and start!72934 res!266562) b!324800))

(assert (= (and b!324800 res!266563) b!324801))

(assert (= start!72934 b!324802))

(declare-fun m!462855 () Bool)

(assert (=> start!72934 m!462855))

(declare-fun m!462857 () Bool)

(assert (=> start!72934 m!462857))

(declare-fun m!462859 () Bool)

(assert (=> b!324801 m!462859))

(declare-fun m!462861 () Bool)

(assert (=> b!324802 m!462861))

(check-sat (not b!324802) (not b!324801) (not start!72934))
(check-sat)
(get-model)

(declare-fun d!106856 () Bool)

(assert (=> d!106856 (= (array_inv!8638 (buf!8228 thiss!877)) (bvsge (size!9086 (buf!8228 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324802 d!106856))

(declare-fun d!106858 () Bool)

(assert (=> d!106858 (= (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15233 thiss!877)) (size!9086 (buf!8228 thiss!877))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!15233 thiss!877)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!15233 thiss!877)) (size!9086 (buf!8228 thiss!877))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!15233 thiss!877)) (size!9086 (buf!8228 thiss!877)))))))))

(assert (=> b!324801 d!106858))

(declare-fun d!106864 () Bool)

(assert (=> d!106864 (= (remainingBits!0 ((_ sign_extend 32) (size!9086 (buf!8228 thiss!877))) ((_ sign_extend 32) (currentByte!15233 thiss!877)) ((_ sign_extend 32) (currentBit!15228 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9086 (buf!8228 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15233 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15228 thiss!877)))))))

(assert (=> start!72934 d!106864))

(declare-fun d!106872 () Bool)

(assert (=> d!106872 (= (inv!12 thiss!877) (invariant!0 (currentBit!15228 thiss!877) (currentByte!15233 thiss!877) (size!9086 (buf!8228 thiss!877))))))

(declare-fun bs!28137 () Bool)

(assert (= bs!28137 d!106872))

(declare-fun m!462873 () Bool)

(assert (=> bs!28137 m!462873))

(assert (=> start!72934 d!106872))

(check-sat (not d!106872))
(check-sat)
(get-model)

(declare-fun d!106880 () Bool)

(assert (=> d!106880 (= (invariant!0 (currentBit!15228 thiss!877) (currentByte!15233 thiss!877) (size!9086 (buf!8228 thiss!877))) (and (bvsge (currentBit!15228 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15228 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15233 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15233 thiss!877) (size!9086 (buf!8228 thiss!877))) (and (= (currentBit!15228 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15233 thiss!877) (size!9086 (buf!8228 thiss!877)))))))))

(assert (=> d!106872 d!106880))

(check-sat)
