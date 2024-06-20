; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71406 () Bool)

(assert start!71406)

(declare-fun res!263956 () Bool)

(declare-fun e!231553 () Bool)

(assert (=> start!71406 (=> (not res!263956) (not e!231553))))

(declare-datatypes ((array!20398 0))(
  ( (array!20399 (arr!9974 (Array (_ BitVec 32) (_ BitVec 8))) (size!8882 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13926 0))(
  ( (BitStream!13927 (buf!8024 array!20398) (currentByte!14800 (_ BitVec 32)) (currentBit!14795 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13926)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!71406 (= res!263956 (validate_offset_bit!0 ((_ sign_extend 32) (size!8882 (buf!8024 thiss!1701))) ((_ sign_extend 32) (currentByte!14800 thiss!1701)) ((_ sign_extend 32) (currentBit!14795 thiss!1701))))))

(assert (=> start!71406 e!231553))

(declare-fun e!231554 () Bool)

(declare-fun inv!12 (BitStream!13926) Bool)

(assert (=> start!71406 (and (inv!12 thiss!1701) e!231554)))

(declare-fun b!321480 () Bool)

(assert (=> b!321480 (= e!231553 (or (bvslt (currentByte!14800 thiss!1701) #b00000000000000000000000000000000) (bvsge (currentByte!14800 thiss!1701) (size!8882 (buf!8024 thiss!1701)))))))

(declare-fun b!321481 () Bool)

(declare-fun array_inv!8434 (array!20398) Bool)

(assert (=> b!321481 (= e!231554 (array_inv!8434 (buf!8024 thiss!1701)))))

(assert (= (and start!71406 res!263956) b!321480))

(assert (= start!71406 b!321481))

(declare-fun m!459817 () Bool)

(assert (=> start!71406 m!459817))

(declare-fun m!459819 () Bool)

(assert (=> start!71406 m!459819))

(declare-fun m!459821 () Bool)

(assert (=> b!321481 m!459821))

(check-sat (not b!321481) (not start!71406))
(check-sat)
(get-model)

(declare-fun d!105404 () Bool)

(assert (=> d!105404 (= (array_inv!8434 (buf!8024 thiss!1701)) (bvsge (size!8882 (buf!8024 thiss!1701)) #b00000000000000000000000000000000))))

(assert (=> b!321481 d!105404))

(declare-fun d!105406 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105406 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8882 (buf!8024 thiss!1701))) ((_ sign_extend 32) (currentByte!14800 thiss!1701)) ((_ sign_extend 32) (currentBit!14795 thiss!1701))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8882 (buf!8024 thiss!1701))) ((_ sign_extend 32) (currentByte!14800 thiss!1701)) ((_ sign_extend 32) (currentBit!14795 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27728 () Bool)

(assert (= bs!27728 d!105406))

(declare-fun m!459829 () Bool)

(assert (=> bs!27728 m!459829))

(assert (=> start!71406 d!105406))

(declare-fun d!105408 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105408 (= (inv!12 thiss!1701) (invariant!0 (currentBit!14795 thiss!1701) (currentByte!14800 thiss!1701) (size!8882 (buf!8024 thiss!1701))))))

(declare-fun bs!27729 () Bool)

(assert (= bs!27729 d!105408))

(declare-fun m!459831 () Bool)

(assert (=> bs!27729 m!459831))

(assert (=> start!71406 d!105408))

(check-sat (not d!105408) (not d!105406))
(check-sat)
(get-model)

(declare-fun d!105422 () Bool)

(assert (=> d!105422 (= (invariant!0 (currentBit!14795 thiss!1701) (currentByte!14800 thiss!1701) (size!8882 (buf!8024 thiss!1701))) (and (bvsge (currentBit!14795 thiss!1701) #b00000000000000000000000000000000) (bvslt (currentBit!14795 thiss!1701) #b00000000000000000000000000001000) (bvsge (currentByte!14800 thiss!1701) #b00000000000000000000000000000000) (or (bvslt (currentByte!14800 thiss!1701) (size!8882 (buf!8024 thiss!1701))) (and (= (currentBit!14795 thiss!1701) #b00000000000000000000000000000000) (= (currentByte!14800 thiss!1701) (size!8882 (buf!8024 thiss!1701)))))))))

(assert (=> d!105408 d!105422))

(declare-fun d!105424 () Bool)

(assert (=> d!105424 (= (remainingBits!0 ((_ sign_extend 32) (size!8882 (buf!8024 thiss!1701))) ((_ sign_extend 32) (currentByte!14800 thiss!1701)) ((_ sign_extend 32) (currentBit!14795 thiss!1701))) (bvsub (bvmul ((_ sign_extend 32) (size!8882 (buf!8024 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14800 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14795 thiss!1701)))))))

(assert (=> d!105406 d!105424))

(check-sat)
