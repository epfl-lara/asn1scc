; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63858 () Bool)

(assert start!63858)

(declare-fun res!235379 () Bool)

(declare-fun e!203120 () Bool)

(assert (=> start!63858 (=> (not res!235379) (not e!203120))))

(declare-datatypes ((array!16647 0))(
  ( (array!16648 (arr!8176 (Array (_ BitVec 32) (_ BitVec 8))) (size!7180 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12730 0))(
  ( (BitStream!12731 (buf!7426 array!16647) (currentByte!13793 (_ BitVec 32)) (currentBit!13788 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12730)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63858 (= res!235379 (validate_offset_bits!1 ((_ sign_extend 32) (size!7180 (buf!7426 thiss!1929))) ((_ sign_extend 32) (currentByte!13793 thiss!1929)) ((_ sign_extend 32) (currentBit!13788 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13788 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63858 e!203120))

(declare-fun e!203121 () Bool)

(declare-fun inv!12 (BitStream!12730) Bool)

(assert (=> start!63858 (and (inv!12 thiss!1929) e!203121)))

(declare-fun b!284134 () Bool)

(declare-fun res!235378 () Bool)

(assert (=> b!284134 (=> (not res!235378) (not e!203120))))

(assert (=> b!284134 (= res!235378 (not (= (currentBit!13788 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284135 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284135 (= e!203120 (bvsgt (bitIndex!0 (size!7180 (buf!7426 thiss!1929)) (bvadd #b00000000000000000000000000000001 (currentByte!13793 thiss!1929)) #b00000000000000000000000000000000) (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 (bitIndex!0 (size!7180 (buf!7426 thiss!1929)) (currentByte!13793 thiss!1929) (currentBit!13788 thiss!1929)))))))

(declare-fun b!284136 () Bool)

(declare-fun array_inv!6873 (array!16647) Bool)

(assert (=> b!284136 (= e!203121 (array_inv!6873 (buf!7426 thiss!1929)))))

(assert (= (and start!63858 res!235379) b!284134))

(assert (= (and b!284134 res!235378) b!284135))

(assert (= start!63858 b!284136))

(declare-fun m!417309 () Bool)

(assert (=> start!63858 m!417309))

(declare-fun m!417311 () Bool)

(assert (=> start!63858 m!417311))

(declare-fun m!417313 () Bool)

(assert (=> b!284135 m!417313))

(declare-fun m!417315 () Bool)

(assert (=> b!284135 m!417315))

(declare-fun m!417317 () Bool)

(assert (=> b!284136 m!417317))

(push 1)

(assert (not b!284136))

(assert (not start!63858))

(assert (not b!284135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97820 () Bool)

(assert (=> d!97820 (= (array_inv!6873 (buf!7426 thiss!1929)) (bvsge (size!7180 (buf!7426 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284136 d!97820))

(declare-fun d!97822 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97822 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7180 (buf!7426 thiss!1929))) ((_ sign_extend 32) (currentByte!13793 thiss!1929)) ((_ sign_extend 32) (currentBit!13788 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13788 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7180 (buf!7426 thiss!1929))) ((_ sign_extend 32) (currentByte!13793 thiss!1929)) ((_ sign_extend 32) (currentBit!13788 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13788 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24726 () Bool)

(assert (= bs!24726 d!97822))

(declare-fun m!417339 () Bool)

(assert (=> bs!24726 m!417339))

(assert (=> start!63858 d!97822))

(declare-fun d!97826 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97826 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13788 thiss!1929) (currentByte!13793 thiss!1929) (size!7180 (buf!7426 thiss!1929))))))

(declare-fun bs!24727 () Bool)

(assert (= bs!24727 d!97826))

(declare-fun m!417341 () Bool)

(assert (=> bs!24727 m!417341))

(assert (=> start!63858 d!97826))

(declare-fun d!97828 () Bool)

(declare-fun e!203146 () Bool)

(assert (=> d!97828 e!203146))

(declare-fun res!235405 () Bool)

(assert (=> d!97828 (=> (not res!235405) (not e!203146))))

(declare-fun lt!418341 () (_ BitVec 64))

(declare-fun lt!418340 () (_ BitVec 64))

(declare-fun lt!418336 () (_ BitVec 64))

(assert (=> d!97828 (= res!235405 (= lt!418340 (bvsub lt!418341 lt!418336)))))

(assert (=> d!97828 (or (= (bvand lt!418341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418336 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418341 lt!418336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97828 (= lt!418336 (remainingBits!0 ((_ sign_extend 32) (size!7180 (buf!7426 thiss!1929))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!13793 thiss!1929))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!418339 () (_ BitVec 64))

(declare-fun lt!418337 () (_ BitVec 64))

(assert (=> d!97828 (= lt!418341 (bvmul lt!418339 lt!418337))))

(assert (=> d!97828 (or (= lt!418339 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418337 (bvsdiv (bvmul lt!418339 lt!418337) lt!418339)))))

(assert (=> d!97828 (= lt!418337 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97828 (= lt!418339 ((_ sign_extend 32) (size!7180 (buf!7426 thiss!1929))))))

(assert (=> d!97828 (= lt!418340 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!13793 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!97828 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13793 thiss!1929)) (size!7180 (buf!7426 thiss!1929)))))

(assert (=> d!97828 (= (bitIndex!0 (size!7180 (buf!7426 thiss!1929)) (bvadd #b00000000000000000000000000000001 (currentByte!13793 thiss!1929)) #b00000000000000000000000000000000) lt!418340)))

(declare-fun b!284167 () Bool)

(declare-fun res!235404 () Bool)

(assert (=> b!284167 (=> (not res!235404) (not e!203146))))

(assert (=> b!284167 (= res!235404 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418340))))

(declare-fun b!284168 () Bool)

(declare-fun lt!418338 () (_ BitVec 64))

(assert (=> b!284168 (= e!203146 (bvsle lt!418340 (bvmul lt!418338 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284168 (or (= lt!418338 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418338 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418338)))))

(assert (=> b!284168 (= lt!418338 ((_ sign_extend 32) (size!7180 (buf!7426 thiss!1929))))))

(assert (= (and d!97828 res!235405) b!284167))

(assert (= (and b!284167 res!235404) b!284168))

(declare-fun m!417351 () Bool)

(assert (=> d!97828 m!417351))

(declare-fun m!417353 () Bool)

(assert (=> d!97828 m!417353))

(assert (=> b!284135 d!97828))

(declare-fun d!97840 () Bool)

(declare-fun e!203147 () Bool)

(assert (=> d!97840 e!203147))

(declare-fun res!235407 () Bool)

(assert (=> d!97840 (=> (not res!235407) (not e!203147))))

(declare-fun lt!418346 () (_ BitVec 64))

(declare-fun lt!418342 () (_ BitVec 64))

(declare-fun lt!418347 () (_ BitVec 64))

(assert (=> d!97840 (= res!235407 (= lt!418346 (bvsub lt!418347 lt!418342)))))

(assert (=> d!97840 (or (= (bvand lt!418347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418342 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418347 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418347 lt!418342) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97840 (= lt!418342 (remainingBits!0 ((_ sign_extend 32) (size!7180 (buf!7426 thiss!1929))) ((_ sign_extend 32) (currentByte!13793 thiss!1929)) ((_ sign_extend 32) (currentBit!13788 thiss!1929))))))

(declare-fun lt!418345 () (_ BitVec 64))

(declare-fun lt!418343 () (_ BitVec 64))

(assert (=> d!97840 (= lt!418347 (bvmul lt!418345 lt!418343))))

(assert (=> d!97840 (or (= lt!418345 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418343 (bvsdiv (bvmul lt!418345 lt!418343) lt!418345)))))

(assert (=> d!97840 (= lt!418343 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97840 (= lt!418345 ((_ sign_extend 32) (size!7180 (buf!7426 thiss!1929))))))

(assert (=> d!97840 (= lt!418346 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13793 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13788 thiss!1929))))))

(assert (=> d!97840 (invariant!0 (currentBit!13788 thiss!1929) (currentByte!13793 thiss!1929) (size!7180 (buf!7426 thiss!1929)))))

(assert (=> d!97840 (= (bitIndex!0 (size!7180 (buf!7426 thiss!1929)) (currentByte!13793 thiss!1929) (currentBit!13788 thiss!1929)) lt!418346)))

(declare-fun b!284169 () Bool)

(declare-fun res!235406 () Bool)

(assert (=> b!284169 (=> (not res!235406) (not e!203147))))

(assert (=> b!284169 (= res!235406 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418346))))

(declare-fun b!284170 () Bool)

(declare-fun lt!418344 () (_ BitVec 64))

(assert (=> b!284170 (= e!203147 (bvsle lt!418346 (bvmul lt!418344 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284170 (or (= lt!418344 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418344 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418344)))))

(assert (=> b!284170 (= lt!418344 ((_ sign_extend 32) (size!7180 (buf!7426 thiss!1929))))))

(assert (= (and d!97840 res!235407) b!284169))

(assert (= (and b!284169 res!235406) b!284170))

(assert (=> d!97840 m!417339))

(assert (=> d!97840 m!417341))

(assert (=> b!284135 d!97840))

(push 1)

(assert (not d!97822))

(assert (not d!97828))

(assert (not d!97826))

(assert (not d!97840))

(check-sat)

(pop 1)

(push 1)

(check-sat)

