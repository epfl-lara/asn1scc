; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18000 () Bool)

(assert start!18000)

(declare-fun e!58560 () Bool)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun b!88494 () Bool)

(declare-fun lt!136215 () (_ BitVec 64))

(declare-fun lt!136214 () (_ BitVec 64))

(assert (=> b!88494 (= e!58560 (and (= lt!136215 (bvand ((_ sign_extend 32) i!576) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!136215 (bvand (bvadd lt!136214 ((_ sign_extend 32) i!576)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!88494 (= lt!136215 (bvand lt!136214 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!4166 0))(
  ( (array!4167 (arr!2518 (Array (_ BitVec 32) (_ BitVec 8))) (size!1881 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3324 0))(
  ( (BitStream!3325 (buf!2271 array!4166) (currentByte!4504 (_ BitVec 32)) (currentBit!4499 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3324)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88494 (= lt!136214 (bitIndex!0 (size!1881 (buf!2271 thiss!1151)) (currentByte!4504 thiss!1151) (currentBit!4499 thiss!1151)))))

(declare-fun res!72864 () Bool)

(assert (=> start!18000 (=> (not res!72864) (not e!58560))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!18000 (= res!72864 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18000 e!58560))

(assert (=> start!18000 true))

(declare-fun e!58562 () Bool)

(declare-fun inv!12 (BitStream!3324) Bool)

(assert (=> start!18000 (and (inv!12 thiss!1151) e!58562)))

(declare-fun thiss!1152 () BitStream!3324)

(declare-fun e!58563 () Bool)

(assert (=> start!18000 (and (inv!12 thiss!1152) e!58563)))

(declare-fun b!88495 () Bool)

(declare-fun res!72868 () Bool)

(assert (=> b!88495 (=> (not res!72868) (not e!58560))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88495 (= res!72868 (invariant!0 (currentBit!4499 thiss!1152) (currentByte!4504 thiss!1152) (size!1881 (buf!2271 thiss!1152))))))

(declare-fun b!88496 () Bool)

(declare-fun res!72865 () Bool)

(assert (=> b!88496 (=> (not res!72865) (not e!58560))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88496 (= res!72865 (validate_offset_bits!1 ((_ sign_extend 32) (size!1881 (buf!2271 thiss!1151))) ((_ sign_extend 32) (currentByte!4504 thiss!1151)) ((_ sign_extend 32) (currentBit!4499 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88497 () Bool)

(declare-fun array_inv!1727 (array!4166) Bool)

(assert (=> b!88497 (= e!58562 (array_inv!1727 (buf!2271 thiss!1151)))))

(declare-fun b!88498 () Bool)

(declare-fun res!72863 () Bool)

(assert (=> b!88498 (=> (not res!72863) (not e!58560))))

(assert (=> b!88498 (= res!72863 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88499 () Bool)

(assert (=> b!88499 (= e!58563 (array_inv!1727 (buf!2271 thiss!1152)))))

(declare-fun b!88500 () Bool)

(declare-fun res!72866 () Bool)

(assert (=> b!88500 (=> (not res!72866) (not e!58560))))

(assert (=> b!88500 (= res!72866 (and (bvsle i!576 nBits!336) (= (size!1881 (buf!2271 thiss!1152)) (size!1881 (buf!2271 thiss!1151)))))))

(declare-fun b!88501 () Bool)

(declare-fun res!72867 () Bool)

(assert (=> b!88501 (=> (not res!72867) (not e!58560))))

(assert (=> b!88501 (= res!72867 (invariant!0 (currentBit!4499 thiss!1151) (currentByte!4504 thiss!1151) (size!1881 (buf!2271 thiss!1151))))))

(assert (= (and start!18000 res!72864) b!88496))

(assert (= (and b!88496 res!72865) b!88501))

(assert (= (and b!88501 res!72867) b!88498))

(assert (= (and b!88498 res!72863) b!88495))

(assert (= (and b!88495 res!72868) b!88500))

(assert (= (and b!88500 res!72866) b!88494))

(assert (= start!18000 b!88497))

(assert (= start!18000 b!88499))

(declare-fun m!133653 () Bool)

(assert (=> b!88495 m!133653))

(declare-fun m!133655 () Bool)

(assert (=> b!88496 m!133655))

(declare-fun m!133657 () Bool)

(assert (=> b!88497 m!133657))

(declare-fun m!133659 () Bool)

(assert (=> start!18000 m!133659))

(declare-fun m!133661 () Bool)

(assert (=> start!18000 m!133661))

(declare-fun m!133663 () Bool)

(assert (=> b!88494 m!133663))

(declare-fun m!133665 () Bool)

(assert (=> b!88499 m!133665))

(declare-fun m!133667 () Bool)

(assert (=> b!88501 m!133667))

(check-sat (not b!88494) (not b!88499) (not start!18000) (not b!88501) (not b!88495) (not b!88496) (not b!88497))
(check-sat)
(get-model)

(declare-fun d!27778 () Bool)

(assert (=> d!27778 (= (array_inv!1727 (buf!2271 thiss!1152)) (bvsge (size!1881 (buf!2271 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!88499 d!27778))

(declare-fun d!27780 () Bool)

(declare-fun e!58583 () Bool)

(assert (=> d!27780 e!58583))

(declare-fun res!72896 () Bool)

(assert (=> d!27780 (=> (not res!72896) (not e!58583))))

(declare-fun lt!136250 () (_ BitVec 64))

(declare-fun lt!136246 () (_ BitVec 64))

(declare-fun lt!136248 () (_ BitVec 64))

(assert (=> d!27780 (= res!72896 (= lt!136250 (bvsub lt!136246 lt!136248)))))

(assert (=> d!27780 (or (= (bvand lt!136246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136248 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136246 lt!136248) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!27780 (= lt!136248 (remainingBits!0 ((_ sign_extend 32) (size!1881 (buf!2271 thiss!1151))) ((_ sign_extend 32) (currentByte!4504 thiss!1151)) ((_ sign_extend 32) (currentBit!4499 thiss!1151))))))

(declare-fun lt!136247 () (_ BitVec 64))

(declare-fun lt!136249 () (_ BitVec 64))

(assert (=> d!27780 (= lt!136246 (bvmul lt!136247 lt!136249))))

(assert (=> d!27780 (or (= lt!136247 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136249 (bvsdiv (bvmul lt!136247 lt!136249) lt!136247)))))

(assert (=> d!27780 (= lt!136249 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!27780 (= lt!136247 ((_ sign_extend 32) (size!1881 (buf!2271 thiss!1151))))))

(assert (=> d!27780 (= lt!136250 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4504 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4499 thiss!1151))))))

(assert (=> d!27780 (invariant!0 (currentBit!4499 thiss!1151) (currentByte!4504 thiss!1151) (size!1881 (buf!2271 thiss!1151)))))

(assert (=> d!27780 (= (bitIndex!0 (size!1881 (buf!2271 thiss!1151)) (currentByte!4504 thiss!1151) (currentBit!4499 thiss!1151)) lt!136250)))

(declare-fun b!88534 () Bool)

(declare-fun res!72895 () Bool)

(assert (=> b!88534 (=> (not res!72895) (not e!58583))))

(assert (=> b!88534 (= res!72895 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136250))))

(declare-fun b!88535 () Bool)

(declare-fun lt!136251 () (_ BitVec 64))

(assert (=> b!88535 (= e!58583 (bvsle lt!136250 (bvmul lt!136251 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!88535 (or (= lt!136251 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136251 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136251)))))

(assert (=> b!88535 (= lt!136251 ((_ sign_extend 32) (size!1881 (buf!2271 thiss!1151))))))

(assert (= (and d!27780 res!72896) b!88534))

(assert (= (and b!88534 res!72895) b!88535))

(declare-fun m!133687 () Bool)

(assert (=> d!27780 m!133687))

(assert (=> d!27780 m!133667))

(assert (=> b!88494 d!27780))

(declare-fun d!27794 () Bool)

(assert (=> d!27794 (= (invariant!0 (currentBit!4499 thiss!1152) (currentByte!4504 thiss!1152) (size!1881 (buf!2271 thiss!1152))) (and (bvsge (currentBit!4499 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4499 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4504 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4504 thiss!1152) (size!1881 (buf!2271 thiss!1152))) (and (= (currentBit!4499 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4504 thiss!1152) (size!1881 (buf!2271 thiss!1152)))))))))

(assert (=> b!88495 d!27794))

(declare-fun d!27798 () Bool)

(assert (=> d!27798 (= (invariant!0 (currentBit!4499 thiss!1151) (currentByte!4504 thiss!1151) (size!1881 (buf!2271 thiss!1151))) (and (bvsge (currentBit!4499 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4499 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4504 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4504 thiss!1151) (size!1881 (buf!2271 thiss!1151))) (and (= (currentBit!4499 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4504 thiss!1151) (size!1881 (buf!2271 thiss!1151)))))))))

(assert (=> b!88501 d!27798))

(declare-fun d!27800 () Bool)

(assert (=> d!27800 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1881 (buf!2271 thiss!1151))) ((_ sign_extend 32) (currentByte!4504 thiss!1151)) ((_ sign_extend 32) (currentBit!4499 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1881 (buf!2271 thiss!1151))) ((_ sign_extend 32) (currentByte!4504 thiss!1151)) ((_ sign_extend 32) (currentBit!4499 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6879 () Bool)

(assert (= bs!6879 d!27800))

(assert (=> bs!6879 m!133687))

(assert (=> b!88496 d!27800))

(declare-fun d!27806 () Bool)

(assert (=> d!27806 (= (array_inv!1727 (buf!2271 thiss!1151)) (bvsge (size!1881 (buf!2271 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!88497 d!27806))

(declare-fun d!27808 () Bool)

(assert (=> d!27808 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4499 thiss!1151) (currentByte!4504 thiss!1151) (size!1881 (buf!2271 thiss!1151))))))

(declare-fun bs!6881 () Bool)

(assert (= bs!6881 d!27808))

(assert (=> bs!6881 m!133667))

(assert (=> start!18000 d!27808))

(declare-fun d!27812 () Bool)

(assert (=> d!27812 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4499 thiss!1152) (currentByte!4504 thiss!1152) (size!1881 (buf!2271 thiss!1152))))))

(declare-fun bs!6883 () Bool)

(assert (= bs!6883 d!27812))

(assert (=> bs!6883 m!133653))

(assert (=> start!18000 d!27812))

(check-sat (not d!27808) (not d!27800) (not d!27812) (not d!27780))
