; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71442 () Bool)

(assert start!71442)

(declare-fun res!263965 () Bool)

(declare-fun e!231580 () Bool)

(assert (=> start!71442 (=> (not res!263965) (not e!231580))))

(declare-datatypes ((array!20407 0))(
  ( (array!20408 (arr!9977 (Array (_ BitVec 32) (_ BitVec 8))) (size!8885 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13932 0))(
  ( (BitStream!13933 (buf!8027 array!20407) (currentByte!14812 (_ BitVec 32)) (currentBit!14807 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13932)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!71442 (= res!263965 (validate_offset_bit!0 ((_ sign_extend 32) (size!8885 (buf!8027 thiss!1701))) ((_ sign_extend 32) (currentByte!14812 thiss!1701)) ((_ sign_extend 32) (currentBit!14807 thiss!1701))))))

(assert (=> start!71442 e!231580))

(declare-fun e!231581 () Bool)

(declare-fun inv!12 (BitStream!13932) Bool)

(assert (=> start!71442 (and (inv!12 thiss!1701) e!231581)))

(declare-fun b!321498 () Bool)

(assert (=> b!321498 (= e!231580 (or (bvslt (currentBit!14807 thiss!1701) #b00000000000000000000000000000000) (bvsge (currentBit!14807 thiss!1701) #b00000000000000000000000000001000)))))

(declare-fun b!321499 () Bool)

(declare-fun array_inv!8437 (array!20407) Bool)

(assert (=> b!321499 (= e!231581 (array_inv!8437 (buf!8027 thiss!1701)))))

(assert (= (and start!71442 res!263965) b!321498))

(assert (= start!71442 b!321499))

(declare-fun m!459847 () Bool)

(assert (=> start!71442 m!459847))

(declare-fun m!459849 () Bool)

(assert (=> start!71442 m!459849))

(declare-fun m!459851 () Bool)

(assert (=> b!321499 m!459851))

(check-sat (not b!321499) (not start!71442))
(check-sat)
(get-model)

(declare-fun d!105436 () Bool)

(assert (=> d!105436 (= (array_inv!8437 (buf!8027 thiss!1701)) (bvsge (size!8885 (buf!8027 thiss!1701)) #b00000000000000000000000000000000))))

(assert (=> b!321499 d!105436))

(declare-fun d!105438 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105438 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8885 (buf!8027 thiss!1701))) ((_ sign_extend 32) (currentByte!14812 thiss!1701)) ((_ sign_extend 32) (currentBit!14807 thiss!1701))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8885 (buf!8027 thiss!1701))) ((_ sign_extend 32) (currentByte!14812 thiss!1701)) ((_ sign_extend 32) (currentBit!14807 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27737 () Bool)

(assert (= bs!27737 d!105438))

(declare-fun m!459859 () Bool)

(assert (=> bs!27737 m!459859))

(assert (=> start!71442 d!105438))

(declare-fun d!105440 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105440 (= (inv!12 thiss!1701) (invariant!0 (currentBit!14807 thiss!1701) (currentByte!14812 thiss!1701) (size!8885 (buf!8027 thiss!1701))))))

(declare-fun bs!27738 () Bool)

(assert (= bs!27738 d!105440))

(declare-fun m!459861 () Bool)

(assert (=> bs!27738 m!459861))

(assert (=> start!71442 d!105440))

(check-sat (not d!105440) (not d!105438))
(check-sat)
(get-model)

(declare-fun d!105454 () Bool)

(assert (=> d!105454 (= (invariant!0 (currentBit!14807 thiss!1701) (currentByte!14812 thiss!1701) (size!8885 (buf!8027 thiss!1701))) (and (bvsge (currentBit!14807 thiss!1701) #b00000000000000000000000000000000) (bvslt (currentBit!14807 thiss!1701) #b00000000000000000000000000001000) (bvsge (currentByte!14812 thiss!1701) #b00000000000000000000000000000000) (or (bvslt (currentByte!14812 thiss!1701) (size!8885 (buf!8027 thiss!1701))) (and (= (currentBit!14807 thiss!1701) #b00000000000000000000000000000000) (= (currentByte!14812 thiss!1701) (size!8885 (buf!8027 thiss!1701)))))))))

(assert (=> d!105440 d!105454))

(declare-fun d!105456 () Bool)

(assert (=> d!105456 (= (remainingBits!0 ((_ sign_extend 32) (size!8885 (buf!8027 thiss!1701))) ((_ sign_extend 32) (currentByte!14812 thiss!1701)) ((_ sign_extend 32) (currentBit!14807 thiss!1701))) (bvsub (bvmul ((_ sign_extend 32) (size!8885 (buf!8027 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14812 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14807 thiss!1701)))))))

(assert (=> d!105438 d!105456))

(check-sat)
