; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63830 () Bool)

(assert start!63830)

(declare-fun res!235348 () Bool)

(declare-fun e!203092 () Bool)

(assert (=> start!63830 (=> (not res!235348) (not e!203092))))

(declare-datatypes ((array!16640 0))(
  ( (array!16641 (arr!8174 (Array (_ BitVec 32) (_ BitVec 8))) (size!7178 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12726 0))(
  ( (BitStream!12727 (buf!7424 array!16640) (currentByte!13785 (_ BitVec 32)) (currentBit!13780 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12726)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63830 (= res!235348 (validate_offset_bits!1 ((_ sign_extend 32) (size!7178 (buf!7424 thiss!1929))) ((_ sign_extend 32) (currentByte!13785 thiss!1929)) ((_ sign_extend 32) (currentBit!13780 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13780 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63830 e!203092))

(declare-fun e!203094 () Bool)

(declare-fun inv!12 (BitStream!12726) Bool)

(assert (=> start!63830 (and (inv!12 thiss!1929) e!203094)))

(declare-fun b!284098 () Bool)

(declare-fun res!235349 () Bool)

(assert (=> b!284098 (=> (not res!235349) (not e!203092))))

(assert (=> b!284098 (= res!235349 (not (= (currentBit!13780 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284099 () Bool)

(declare-fun lt!418239 () (_ BitVec 64))

(declare-fun lt!418238 () (_ BitVec 64))

(assert (=> b!284099 (= e!203092 (and (= lt!418239 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!418239 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 lt!418238) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!284099 (= lt!418239 (bvand lt!418238 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284099 (= lt!418238 (bitIndex!0 (size!7178 (buf!7424 thiss!1929)) (currentByte!13785 thiss!1929) (currentBit!13780 thiss!1929)))))

(declare-fun b!284100 () Bool)

(declare-fun array_inv!6871 (array!16640) Bool)

(assert (=> b!284100 (= e!203094 (array_inv!6871 (buf!7424 thiss!1929)))))

(assert (= (and start!63830 res!235348) b!284098))

(assert (= (and b!284098 res!235349) b!284099))

(assert (= start!63830 b!284100))

(declare-fun m!417281 () Bool)

(assert (=> start!63830 m!417281))

(declare-fun m!417283 () Bool)

(assert (=> start!63830 m!417283))

(declare-fun m!417285 () Bool)

(assert (=> b!284099 m!417285))

(declare-fun m!417287 () Bool)

(assert (=> b!284100 m!417287))

(check-sat (not b!284099) (not start!63830) (not b!284100))
(check-sat)
(get-model)

(declare-fun d!97798 () Bool)

(declare-fun e!203109 () Bool)

(assert (=> d!97798 e!203109))

(declare-fun res!235367 () Bool)

(assert (=> d!97798 (=> (not res!235367) (not e!203109))))

(declare-fun lt!418280 () (_ BitVec 64))

(declare-fun lt!418276 () (_ BitVec 64))

(declare-fun lt!418279 () (_ BitVec 64))

(assert (=> d!97798 (= res!235367 (= lt!418280 (bvsub lt!418276 lt!418279)))))

(assert (=> d!97798 (or (= (bvand lt!418276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418279 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418276 lt!418279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97798 (= lt!418279 (remainingBits!0 ((_ sign_extend 32) (size!7178 (buf!7424 thiss!1929))) ((_ sign_extend 32) (currentByte!13785 thiss!1929)) ((_ sign_extend 32) (currentBit!13780 thiss!1929))))))

(declare-fun lt!418281 () (_ BitVec 64))

(declare-fun lt!418278 () (_ BitVec 64))

(assert (=> d!97798 (= lt!418276 (bvmul lt!418281 lt!418278))))

(assert (=> d!97798 (or (= lt!418281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418278 (bvsdiv (bvmul lt!418281 lt!418278) lt!418281)))))

(assert (=> d!97798 (= lt!418278 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97798 (= lt!418281 ((_ sign_extend 32) (size!7178 (buf!7424 thiss!1929))))))

(assert (=> d!97798 (= lt!418280 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13785 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13780 thiss!1929))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97798 (invariant!0 (currentBit!13780 thiss!1929) (currentByte!13785 thiss!1929) (size!7178 (buf!7424 thiss!1929)))))

(assert (=> d!97798 (= (bitIndex!0 (size!7178 (buf!7424 thiss!1929)) (currentByte!13785 thiss!1929) (currentBit!13780 thiss!1929)) lt!418280)))

(declare-fun b!284120 () Bool)

(declare-fun res!235366 () Bool)

(assert (=> b!284120 (=> (not res!235366) (not e!203109))))

(assert (=> b!284120 (= res!235366 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418280))))

(declare-fun b!284121 () Bool)

(declare-fun lt!418277 () (_ BitVec 64))

(assert (=> b!284121 (= e!203109 (bvsle lt!418280 (bvmul lt!418277 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284121 (or (= lt!418277 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418277 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418277)))))

(assert (=> b!284121 (= lt!418277 ((_ sign_extend 32) (size!7178 (buf!7424 thiss!1929))))))

(assert (= (and d!97798 res!235367) b!284120))

(assert (= (and b!284120 res!235366) b!284121))

(declare-fun m!417305 () Bool)

(assert (=> d!97798 m!417305))

(declare-fun m!417307 () Bool)

(assert (=> d!97798 m!417307))

(assert (=> b!284099 d!97798))

(declare-fun d!97812 () Bool)

(assert (=> d!97812 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7178 (buf!7424 thiss!1929))) ((_ sign_extend 32) (currentByte!13785 thiss!1929)) ((_ sign_extend 32) (currentBit!13780 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13780 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7178 (buf!7424 thiss!1929))) ((_ sign_extend 32) (currentByte!13785 thiss!1929)) ((_ sign_extend 32) (currentBit!13780 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13780 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24721 () Bool)

(assert (= bs!24721 d!97812))

(assert (=> bs!24721 m!417305))

(assert (=> start!63830 d!97812))

(declare-fun d!97814 () Bool)

(assert (=> d!97814 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13780 thiss!1929) (currentByte!13785 thiss!1929) (size!7178 (buf!7424 thiss!1929))))))

(declare-fun bs!24722 () Bool)

(assert (= bs!24722 d!97814))

(assert (=> bs!24722 m!417307))

(assert (=> start!63830 d!97814))

(declare-fun d!97816 () Bool)

(assert (=> d!97816 (= (array_inv!6871 (buf!7424 thiss!1929)) (bvsge (size!7178 (buf!7424 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284100 d!97816))

(check-sat (not d!97798) (not d!97814) (not d!97812))
