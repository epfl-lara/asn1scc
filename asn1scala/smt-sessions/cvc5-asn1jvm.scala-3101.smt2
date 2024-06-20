; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71404 () Bool)

(assert start!71404)

(declare-fun res!263953 () Bool)

(declare-fun e!231544 () Bool)

(assert (=> start!71404 (=> (not res!263953) (not e!231544))))

(declare-datatypes ((array!20396 0))(
  ( (array!20397 (arr!9973 (Array (_ BitVec 32) (_ BitVec 8))) (size!8881 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13924 0))(
  ( (BitStream!13925 (buf!8023 array!20396) (currentByte!14799 (_ BitVec 32)) (currentBit!14794 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13924)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!71404 (= res!263953 (validate_offset_bit!0 ((_ sign_extend 32) (size!8881 (buf!8023 thiss!1701))) ((_ sign_extend 32) (currentByte!14799 thiss!1701)) ((_ sign_extend 32) (currentBit!14794 thiss!1701))))))

(assert (=> start!71404 e!231544))

(declare-fun e!231545 () Bool)

(declare-fun inv!12 (BitStream!13924) Bool)

(assert (=> start!71404 (and (inv!12 thiss!1701) e!231545)))

(declare-fun b!321474 () Bool)

(assert (=> b!321474 (= e!231544 (or (bvslt (currentByte!14799 thiss!1701) #b00000000000000000000000000000000) (bvsge (currentByte!14799 thiss!1701) (size!8881 (buf!8023 thiss!1701)))))))

(declare-fun b!321475 () Bool)

(declare-fun array_inv!8433 (array!20396) Bool)

(assert (=> b!321475 (= e!231545 (array_inv!8433 (buf!8023 thiss!1701)))))

(assert (= (and start!71404 res!263953) b!321474))

(assert (= start!71404 b!321475))

(declare-fun m!459811 () Bool)

(assert (=> start!71404 m!459811))

(declare-fun m!459813 () Bool)

(assert (=> start!71404 m!459813))

(declare-fun m!459815 () Bool)

(assert (=> b!321475 m!459815))

(push 1)

(assert (not start!71404))

(assert (not b!321475))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105410 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105410 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8881 (buf!8023 thiss!1701))) ((_ sign_extend 32) (currentByte!14799 thiss!1701)) ((_ sign_extend 32) (currentBit!14794 thiss!1701))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8881 (buf!8023 thiss!1701))) ((_ sign_extend 32) (currentByte!14799 thiss!1701)) ((_ sign_extend 32) (currentBit!14794 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27730 () Bool)

(assert (= bs!27730 d!105410))

(declare-fun m!459833 () Bool)

(assert (=> bs!27730 m!459833))

(assert (=> start!71404 d!105410))

(declare-fun d!105412 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105412 (= (inv!12 thiss!1701) (invariant!0 (currentBit!14794 thiss!1701) (currentByte!14799 thiss!1701) (size!8881 (buf!8023 thiss!1701))))))

(declare-fun bs!27731 () Bool)

(assert (= bs!27731 d!105412))

(declare-fun m!459835 () Bool)

(assert (=> bs!27731 m!459835))

(assert (=> start!71404 d!105412))

(declare-fun d!105416 () Bool)

(assert (=> d!105416 (= (array_inv!8433 (buf!8023 thiss!1701)) (bvsge (size!8881 (buf!8023 thiss!1701)) #b00000000000000000000000000000000))))

(assert (=> b!321475 d!105416))

(push 1)

(assert (not d!105410))

(assert (not d!105412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105426 () Bool)

(assert (=> d!105426 (= (remainingBits!0 ((_ sign_extend 32) (size!8881 (buf!8023 thiss!1701))) ((_ sign_extend 32) (currentByte!14799 thiss!1701)) ((_ sign_extend 32) (currentBit!14794 thiss!1701))) (bvsub (bvmul ((_ sign_extend 32) (size!8881 (buf!8023 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14799 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14794 thiss!1701)))))))

(assert (=> d!105410 d!105426))

(declare-fun d!105428 () Bool)

(assert (=> d!105428 (= (invariant!0 (currentBit!14794 thiss!1701) (currentByte!14799 thiss!1701) (size!8881 (buf!8023 thiss!1701))) (and (bvsge (currentBit!14794 thiss!1701) #b00000000000000000000000000000000) (bvslt (currentBit!14794 thiss!1701) #b00000000000000000000000000001000) (bvsge (currentByte!14799 thiss!1701) #b00000000000000000000000000000000) (or (bvslt (currentByte!14799 thiss!1701) (size!8881 (buf!8023 thiss!1701))) (and (= (currentBit!14794 thiss!1701) #b00000000000000000000000000000000) (= (currentByte!14799 thiss!1701) (size!8881 (buf!8023 thiss!1701)))))))))

(assert (=> d!105412 d!105428))

(push 1)

(check-sat)

(pop 1)

