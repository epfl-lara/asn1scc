; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71408 () Bool)

(assert start!71408)

(declare-fun res!263959 () Bool)

(declare-fun e!231562 () Bool)

(assert (=> start!71408 (=> (not res!263959) (not e!231562))))

(declare-datatypes ((array!20400 0))(
  ( (array!20401 (arr!9975 (Array (_ BitVec 32) (_ BitVec 8))) (size!8883 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13928 0))(
  ( (BitStream!13929 (buf!8025 array!20400) (currentByte!14801 (_ BitVec 32)) (currentBit!14796 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13928)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!71408 (= res!263959 (validate_offset_bit!0 ((_ sign_extend 32) (size!8883 (buf!8025 thiss!1701))) ((_ sign_extend 32) (currentByte!14801 thiss!1701)) ((_ sign_extend 32) (currentBit!14796 thiss!1701))))))

(assert (=> start!71408 e!231562))

(declare-fun e!231563 () Bool)

(declare-fun inv!12 (BitStream!13928) Bool)

(assert (=> start!71408 (and (inv!12 thiss!1701) e!231563)))

(declare-fun b!321486 () Bool)

(assert (=> b!321486 (= e!231562 (or (bvslt (currentByte!14801 thiss!1701) #b00000000000000000000000000000000) (bvsge (currentByte!14801 thiss!1701) (size!8883 (buf!8025 thiss!1701)))))))

(declare-fun b!321487 () Bool)

(declare-fun array_inv!8435 (array!20400) Bool)

(assert (=> b!321487 (= e!231563 (array_inv!8435 (buf!8025 thiss!1701)))))

(assert (= (and start!71408 res!263959) b!321486))

(assert (= start!71408 b!321487))

(declare-fun m!459823 () Bool)

(assert (=> start!71408 m!459823))

(declare-fun m!459825 () Bool)

(assert (=> start!71408 m!459825))

(declare-fun m!459827 () Bool)

(assert (=> b!321487 m!459827))

(push 1)

(assert (not b!321487))

(assert (not start!71408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105414 () Bool)

(assert (=> d!105414 (= (array_inv!8435 (buf!8025 thiss!1701)) (bvsge (size!8883 (buf!8025 thiss!1701)) #b00000000000000000000000000000000))))

(assert (=> b!321487 d!105414))

(declare-fun d!105418 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105418 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8883 (buf!8025 thiss!1701))) ((_ sign_extend 32) (currentByte!14801 thiss!1701)) ((_ sign_extend 32) (currentBit!14796 thiss!1701))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8883 (buf!8025 thiss!1701))) ((_ sign_extend 32) (currentByte!14801 thiss!1701)) ((_ sign_extend 32) (currentBit!14796 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27732 () Bool)

(assert (= bs!27732 d!105418))

(declare-fun m!459837 () Bool)

(assert (=> bs!27732 m!459837))

(assert (=> start!71408 d!105418))

(declare-fun d!105420 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105420 (= (inv!12 thiss!1701) (invariant!0 (currentBit!14796 thiss!1701) (currentByte!14801 thiss!1701) (size!8883 (buf!8025 thiss!1701))))))

(declare-fun bs!27733 () Bool)

(assert (= bs!27733 d!105420))

(declare-fun m!459839 () Bool)

(assert (=> bs!27733 m!459839))

(assert (=> start!71408 d!105420))

(push 1)

(assert (not d!105418))

(assert (not d!105420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105430 () Bool)

(assert (=> d!105430 (= (remainingBits!0 ((_ sign_extend 32) (size!8883 (buf!8025 thiss!1701))) ((_ sign_extend 32) (currentByte!14801 thiss!1701)) ((_ sign_extend 32) (currentBit!14796 thiss!1701))) (bvsub (bvmul ((_ sign_extend 32) (size!8883 (buf!8025 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14801 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14796 thiss!1701)))))))

(assert (=> d!105418 d!105430))

(declare-fun d!105432 () Bool)

(assert (=> d!105432 (= (invariant!0 (currentBit!14796 thiss!1701) (currentByte!14801 thiss!1701) (size!8883 (buf!8025 thiss!1701))) (and (bvsge (currentBit!14796 thiss!1701) #b00000000000000000000000000000000) (bvslt (currentBit!14796 thiss!1701) #b00000000000000000000000000001000) (bvsge (currentByte!14801 thiss!1701) #b00000000000000000000000000000000) (or (bvslt (currentByte!14801 thiss!1701) (size!8883 (buf!8025 thiss!1701))) (and (= (currentBit!14796 thiss!1701) #b00000000000000000000000000000000) (= (currentByte!14801 thiss!1701) (size!8883 (buf!8025 thiss!1701)))))))))

(assert (=> d!105420 d!105432))

(push 1)

(check-sat)

