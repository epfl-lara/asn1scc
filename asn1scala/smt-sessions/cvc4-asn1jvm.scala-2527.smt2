; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63832 () Bool)

(assert start!63832)

(declare-fun res!235355 () Bool)

(declare-fun e!203103 () Bool)

(assert (=> start!63832 (=> (not res!235355) (not e!203103))))

(declare-datatypes ((array!16642 0))(
  ( (array!16643 (arr!8175 (Array (_ BitVec 32) (_ BitVec 8))) (size!7179 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12728 0))(
  ( (BitStream!12729 (buf!7425 array!16642) (currentByte!13786 (_ BitVec 32)) (currentBit!13781 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12728)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63832 (= res!235355 (validate_offset_bits!1 ((_ sign_extend 32) (size!7179 (buf!7425 thiss!1929))) ((_ sign_extend 32) (currentByte!13786 thiss!1929)) ((_ sign_extend 32) (currentBit!13781 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13781 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63832 e!203103))

(declare-fun e!203101 () Bool)

(declare-fun inv!12 (BitStream!12728) Bool)

(assert (=> start!63832 (and (inv!12 thiss!1929) e!203101)))

(declare-fun b!284107 () Bool)

(declare-fun res!235354 () Bool)

(assert (=> b!284107 (=> (not res!235354) (not e!203103))))

(assert (=> b!284107 (= res!235354 (not (= (currentBit!13781 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284108 () Bool)

(declare-fun lt!418244 () (_ BitVec 64))

(declare-fun lt!418245 () (_ BitVec 64))

(assert (=> b!284108 (= e!203103 (and (= lt!418244 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!418244 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 lt!418245) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!284108 (= lt!418244 (bvand lt!418245 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284108 (= lt!418245 (bitIndex!0 (size!7179 (buf!7425 thiss!1929)) (currentByte!13786 thiss!1929) (currentBit!13781 thiss!1929)))))

(declare-fun b!284109 () Bool)

(declare-fun array_inv!6872 (array!16642) Bool)

(assert (=> b!284109 (= e!203101 (array_inv!6872 (buf!7425 thiss!1929)))))

(assert (= (and start!63832 res!235355) b!284107))

(assert (= (and b!284107 res!235354) b!284108))

(assert (= start!63832 b!284109))

(declare-fun m!417289 () Bool)

(assert (=> start!63832 m!417289))

(declare-fun m!417291 () Bool)

(assert (=> start!63832 m!417291))

(declare-fun m!417293 () Bool)

(assert (=> b!284108 m!417293))

(declare-fun m!417295 () Bool)

(assert (=> b!284109 m!417295))

(push 1)

(assert (not start!63832))

(assert (not b!284109))

(assert (not b!284108))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97800 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97800 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7179 (buf!7425 thiss!1929))) ((_ sign_extend 32) (currentByte!13786 thiss!1929)) ((_ sign_extend 32) (currentBit!13781 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13781 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7179 (buf!7425 thiss!1929))) ((_ sign_extend 32) (currentByte!13786 thiss!1929)) ((_ sign_extend 32) (currentBit!13781 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13781 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24717 () Bool)

(assert (= bs!24717 d!97800))

(declare-fun m!417297 () Bool)

(assert (=> bs!24717 m!417297))

(assert (=> start!63832 d!97800))

(declare-fun d!97802 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97802 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13781 thiss!1929) (currentByte!13786 thiss!1929) (size!7179 (buf!7425 thiss!1929))))))

(declare-fun bs!24718 () Bool)

(assert (= bs!24718 d!97802))

(declare-fun m!417299 () Bool)

(assert (=> bs!24718 m!417299))

(assert (=> start!63832 d!97802))

(declare-fun d!97804 () Bool)

(assert (=> d!97804 (= (array_inv!6872 (buf!7425 thiss!1929)) (bvsge (size!7179 (buf!7425 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284109 d!97804))

(declare-fun d!97806 () Bool)

(declare-fun e!203112 () Bool)

(assert (=> d!97806 e!203112))

(declare-fun res!235372 () Bool)

(assert (=> d!97806 (=> (not res!235372) (not e!203112))))

(declare-fun lt!418299 () (_ BitVec 64))

(declare-fun lt!418298 () (_ BitVec 64))

(declare-fun lt!418294 () (_ BitVec 64))

(assert (=> d!97806 (= res!235372 (= lt!418294 (bvsub lt!418298 lt!418299)))))

(assert (=> d!97806 (or (= (bvand lt!418298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418299 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418298 lt!418299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97806 (= lt!418299 (remainingBits!0 ((_ sign_extend 32) (size!7179 (buf!7425 thiss!1929))) ((_ sign_extend 32) (currentByte!13786 thiss!1929)) ((_ sign_extend 32) (currentBit!13781 thiss!1929))))))

(declare-fun lt!418296 () (_ BitVec 64))

(declare-fun lt!418297 () (_ BitVec 64))

(assert (=> d!97806 (= lt!418298 (bvmul lt!418296 lt!418297))))

(assert (=> d!97806 (or (= lt!418296 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418297 (bvsdiv (bvmul lt!418296 lt!418297) lt!418296)))))

(assert (=> d!97806 (= lt!418297 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97806 (= lt!418296 ((_ sign_extend 32) (size!7179 (buf!7425 thiss!1929))))))

(assert (=> d!97806 (= lt!418294 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13786 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13781 thiss!1929))))))

(assert (=> d!97806 (invariant!0 (currentBit!13781 thiss!1929) (currentByte!13786 thiss!1929) (size!7179 (buf!7425 thiss!1929)))))

(assert (=> d!97806 (= (bitIndex!0 (size!7179 (buf!7425 thiss!1929)) (currentByte!13786 thiss!1929) (currentBit!13781 thiss!1929)) lt!418294)))

(declare-fun b!284126 () Bool)

(declare-fun res!235373 () Bool)

(assert (=> b!284126 (=> (not res!235373) (not e!203112))))

(assert (=> b!284126 (= res!235373 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418294))))

(declare-fun b!284127 () Bool)

(declare-fun lt!418295 () (_ BitVec 64))

(assert (=> b!284127 (= e!203112 (bvsle lt!418294 (bvmul lt!418295 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284127 (or (= lt!418295 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418295 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418295)))))

(assert (=> b!284127 (= lt!418295 ((_ sign_extend 32) (size!7179 (buf!7425 thiss!1929))))))

(assert (= (and d!97806 res!235372) b!284126))

(assert (= (and b!284126 res!235373) b!284127))

(assert (=> d!97806 m!417297))

(assert (=> d!97806 m!417299))

(assert (=> b!284108 d!97806))

(push 1)

(assert (not d!97800))

(assert (not d!97806))

(assert (not d!97802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

