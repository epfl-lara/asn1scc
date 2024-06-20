; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71232 () Bool)

(assert start!71232)

(declare-datatypes ((array!20324 0))(
  ( (array!20325 (arr!9947 (Array (_ BitVec 32) (_ BitVec 8))) (size!8855 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13872 0))(
  ( (BitStream!13873 (buf!7997 array!20324) (currentByte!14762 (_ BitVec 32)) (currentBit!14757 (_ BitVec 32))) )
))
(declare-fun thiss!911 () BitStream!13872)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!71232 (not (invariant!0 (currentBit!14757 thiss!911) (currentByte!14762 thiss!911) (size!8855 (buf!7997 thiss!911))))))

(declare-fun e!231350 () Bool)

(declare-fun inv!12 (BitStream!13872) Bool)

(assert (=> start!71232 (and (inv!12 thiss!911) e!231350)))

(declare-fun b!321349 () Bool)

(declare-fun array_inv!8407 (array!20324) Bool)

(assert (=> b!321349 (= e!231350 (array_inv!8407 (buf!7997 thiss!911)))))

(assert (= start!71232 b!321349))

(declare-fun m!459633 () Bool)

(assert (=> start!71232 m!459633))

(declare-fun m!459635 () Bool)

(assert (=> start!71232 m!459635))

(declare-fun m!459637 () Bool)

(assert (=> b!321349 m!459637))

(check-sat (not b!321349) (not start!71232))
(check-sat)
(get-model)

(declare-fun d!105258 () Bool)

(assert (=> d!105258 (= (array_inv!8407 (buf!7997 thiss!911)) (bvsge (size!8855 (buf!7997 thiss!911)) #b00000000000000000000000000000000))))

(assert (=> b!321349 d!105258))

(declare-fun d!105264 () Bool)

(assert (=> d!105264 (= (invariant!0 (currentBit!14757 thiss!911) (currentByte!14762 thiss!911) (size!8855 (buf!7997 thiss!911))) (and (bvsge (currentBit!14757 thiss!911) #b00000000000000000000000000000000) (bvslt (currentBit!14757 thiss!911) #b00000000000000000000000000001000) (bvsge (currentByte!14762 thiss!911) #b00000000000000000000000000000000) (or (bvslt (currentByte!14762 thiss!911) (size!8855 (buf!7997 thiss!911))) (and (= (currentBit!14757 thiss!911) #b00000000000000000000000000000000) (= (currentByte!14762 thiss!911) (size!8855 (buf!7997 thiss!911)))))))))

(assert (=> start!71232 d!105264))

(declare-fun d!105270 () Bool)

(assert (=> d!105270 (= (inv!12 thiss!911) (invariant!0 (currentBit!14757 thiss!911) (currentByte!14762 thiss!911) (size!8855 (buf!7997 thiss!911))))))

(declare-fun bs!27680 () Bool)

(assert (= bs!27680 d!105270))

(assert (=> bs!27680 m!459633))

(assert (=> start!71232 d!105270))

(check-sat (not d!105270))
(check-sat)
