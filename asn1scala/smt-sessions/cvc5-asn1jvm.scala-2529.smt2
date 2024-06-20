; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63892 () Bool)

(assert start!63892)

(declare-fun res!235420 () Bool)

(declare-fun e!203158 () Bool)

(assert (=> start!63892 (=> (not res!235420) (not e!203158))))

(declare-datatypes ((array!16656 0))(
  ( (array!16657 (arr!8179 (Array (_ BitVec 32) (_ BitVec 8))) (size!7183 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12736 0))(
  ( (BitStream!12737 (buf!7429 array!16656) (currentByte!13804 (_ BitVec 32)) (currentBit!13799 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12736)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63892 (= res!235420 (validate_offset_bits!1 ((_ sign_extend 32) (size!7183 (buf!7429 thiss!1929))) ((_ sign_extend 32) (currentByte!13804 thiss!1929)) ((_ sign_extend 32) (currentBit!13799 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13799 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63892 e!203158))

(declare-fun e!203160 () Bool)

(declare-fun inv!12 (BitStream!12736) Bool)

(assert (=> start!63892 (and (inv!12 thiss!1929) e!203160)))

(declare-fun b!284185 () Bool)

(declare-fun res!235421 () Bool)

(assert (=> b!284185 (=> (not res!235421) (not e!203158))))

(assert (=> b!284185 (= res!235421 (= (currentBit!13799 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!284186 () Bool)

(declare-fun lt!418376 () (_ BitVec 64))

(declare-fun lt!418377 () (_ BitVec 64))

(assert (=> b!284186 (= e!203158 (and (= lt!418376 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!418376 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 lt!418377) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!284186 (= lt!418376 (bvand lt!418377 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284186 (= lt!418377 (bitIndex!0 (size!7183 (buf!7429 thiss!1929)) (currentByte!13804 thiss!1929) (currentBit!13799 thiss!1929)))))

(declare-fun b!284187 () Bool)

(declare-fun array_inv!6876 (array!16656) Bool)

(assert (=> b!284187 (= e!203160 (array_inv!6876 (buf!7429 thiss!1929)))))

(assert (= (and start!63892 res!235420) b!284185))

(assert (= (and b!284185 res!235421) b!284186))

(assert (= start!63892 b!284187))

(declare-fun m!417363 () Bool)

(assert (=> start!63892 m!417363))

(declare-fun m!417365 () Bool)

(assert (=> start!63892 m!417365))

(declare-fun m!417367 () Bool)

(assert (=> b!284186 m!417367))

(declare-fun m!417369 () Bool)

(assert (=> b!284187 m!417369))

(push 1)

(assert (not b!284186))

(assert (not b!284187))

(assert (not start!63892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97860 () Bool)

(declare-fun e!203181 () Bool)

(assert (=> d!97860 e!203181))

(declare-fun res!235439 () Bool)

(assert (=> d!97860 (=> (not res!235439) (not e!203181))))

(declare-fun lt!418404 () (_ BitVec 64))

(declare-fun lt!418403 () (_ BitVec 64))

(declare-fun lt!418407 () (_ BitVec 64))

(assert (=> d!97860 (= res!235439 (= lt!418403 (bvsub lt!418404 lt!418407)))))

(assert (=> d!97860 (or (= (bvand lt!418404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418404 lt!418407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97860 (= lt!418407 (remainingBits!0 ((_ sign_extend 32) (size!7183 (buf!7429 thiss!1929))) ((_ sign_extend 32) (currentByte!13804 thiss!1929)) ((_ sign_extend 32) (currentBit!13799 thiss!1929))))))

(declare-fun lt!418406 () (_ BitVec 64))

(declare-fun lt!418402 () (_ BitVec 64))

(assert (=> d!97860 (= lt!418404 (bvmul lt!418406 lt!418402))))

(assert (=> d!97860 (or (= lt!418406 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418402 (bvsdiv (bvmul lt!418406 lt!418402) lt!418406)))))

(assert (=> d!97860 (= lt!418402 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97860 (= lt!418406 ((_ sign_extend 32) (size!7183 (buf!7429 thiss!1929))))))

(assert (=> d!97860 (= lt!418403 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13804 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13799 thiss!1929))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97860 (invariant!0 (currentBit!13799 thiss!1929) (currentByte!13804 thiss!1929) (size!7183 (buf!7429 thiss!1929)))))

(assert (=> d!97860 (= (bitIndex!0 (size!7183 (buf!7429 thiss!1929)) (currentByte!13804 thiss!1929) (currentBit!13799 thiss!1929)) lt!418403)))

(declare-fun b!284210 () Bool)

(declare-fun res!235438 () Bool)

(assert (=> b!284210 (=> (not res!235438) (not e!203181))))

(assert (=> b!284210 (= res!235438 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418403))))

(declare-fun b!284211 () Bool)

(declare-fun lt!418405 () (_ BitVec 64))

(assert (=> b!284211 (= e!203181 (bvsle lt!418403 (bvmul lt!418405 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284211 (or (= lt!418405 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418405 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418405)))))

(assert (=> b!284211 (= lt!418405 ((_ sign_extend 32) (size!7183 (buf!7429 thiss!1929))))))

(assert (= (and d!97860 res!235439) b!284210))

(assert (= (and b!284210 res!235438) b!284211))

(declare-fun m!417395 () Bool)

(assert (=> d!97860 m!417395))

(declare-fun m!417397 () Bool)

(assert (=> d!97860 m!417397))

(assert (=> b!284186 d!97860))

(declare-fun d!97878 () Bool)

(assert (=> d!97878 (= (array_inv!6876 (buf!7429 thiss!1929)) (bvsge (size!7183 (buf!7429 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284187 d!97878))

(declare-fun d!97880 () Bool)

(assert (=> d!97880 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7183 (buf!7429 thiss!1929))) ((_ sign_extend 32) (currentByte!13804 thiss!1929)) ((_ sign_extend 32) (currentBit!13799 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13799 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7183 (buf!7429 thiss!1929))) ((_ sign_extend 32) (currentByte!13804 thiss!1929)) ((_ sign_extend 32) (currentBit!13799 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13799 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24739 () Bool)

(assert (= bs!24739 d!97880))

(assert (=> bs!24739 m!417395))

(assert (=> start!63892 d!97880))

(declare-fun d!97882 () Bool)

(assert (=> d!97882 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13799 thiss!1929) (currentByte!13804 thiss!1929) (size!7183 (buf!7429 thiss!1929))))))

(declare-fun bs!24740 () Bool)

(assert (= bs!24740 d!97882))

(assert (=> bs!24740 m!417397))

(assert (=> start!63892 d!97882))

(push 1)

(assert (not d!97882))

(assert (not d!97860))

(assert (not d!97880))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

