; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63860 () Bool)

(assert start!63860)

(declare-fun res!235384 () Bool)

(declare-fun e!203129 () Bool)

(assert (=> start!63860 (=> (not res!235384) (not e!203129))))

(declare-datatypes ((array!16649 0))(
  ( (array!16650 (arr!8177 (Array (_ BitVec 32) (_ BitVec 8))) (size!7181 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12732 0))(
  ( (BitStream!12733 (buf!7427 array!16649) (currentByte!13794 (_ BitVec 32)) (currentBit!13789 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12732)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63860 (= res!235384 (validate_offset_bits!1 ((_ sign_extend 32) (size!7181 (buf!7427 thiss!1929))) ((_ sign_extend 32) (currentByte!13794 thiss!1929)) ((_ sign_extend 32) (currentBit!13789 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13789 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63860 e!203129))

(declare-fun e!203128 () Bool)

(declare-fun inv!12 (BitStream!12732) Bool)

(assert (=> start!63860 (and (inv!12 thiss!1929) e!203128)))

(declare-fun b!284143 () Bool)

(declare-fun res!235385 () Bool)

(assert (=> b!284143 (=> (not res!235385) (not e!203129))))

(assert (=> b!284143 (= res!235385 (not (= (currentBit!13789 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284144 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284144 (= e!203129 (bvsgt (bitIndex!0 (size!7181 (buf!7427 thiss!1929)) (bvadd #b00000000000000000000000000000001 (currentByte!13794 thiss!1929)) #b00000000000000000000000000000000) (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 (bitIndex!0 (size!7181 (buf!7427 thiss!1929)) (currentByte!13794 thiss!1929) (currentBit!13789 thiss!1929)))))))

(declare-fun b!284145 () Bool)

(declare-fun array_inv!6874 (array!16649) Bool)

(assert (=> b!284145 (= e!203128 (array_inv!6874 (buf!7427 thiss!1929)))))

(assert (= (and start!63860 res!235384) b!284143))

(assert (= (and b!284143 res!235385) b!284144))

(assert (= start!63860 b!284145))

(declare-fun m!417319 () Bool)

(assert (=> start!63860 m!417319))

(declare-fun m!417321 () Bool)

(assert (=> start!63860 m!417321))

(declare-fun m!417323 () Bool)

(assert (=> b!284144 m!417323))

(declare-fun m!417325 () Bool)

(assert (=> b!284144 m!417325))

(declare-fun m!417327 () Bool)

(assert (=> b!284145 m!417327))

(check-sat (not start!63860) (not b!284144) (not b!284145))
(check-sat)
(get-model)

(declare-fun d!97824 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7181 (buf!7427 thiss!1929))) ((_ sign_extend 32) (currentByte!13794 thiss!1929)) ((_ sign_extend 32) (currentBit!13789 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13789 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7181 (buf!7427 thiss!1929))) ((_ sign_extend 32) (currentByte!13794 thiss!1929)) ((_ sign_extend 32) (currentBit!13789 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13789 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24728 () Bool)

(assert (= bs!24728 d!97824))

(declare-fun m!417343 () Bool)

(assert (=> bs!24728 m!417343))

(assert (=> start!63860 d!97824))

(declare-fun d!97830 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97830 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13789 thiss!1929) (currentByte!13794 thiss!1929) (size!7181 (buf!7427 thiss!1929))))))

(declare-fun bs!24729 () Bool)

(assert (= bs!24729 d!97830))

(declare-fun m!417345 () Bool)

(assert (=> bs!24729 m!417345))

(assert (=> start!63860 d!97830))

(declare-fun d!97832 () Bool)

(declare-fun e!203144 () Bool)

(assert (=> d!97832 e!203144))

(declare-fun res!235401 () Bool)

(assert (=> d!97832 (=> (not res!235401) (not e!203144))))

(declare-fun lt!418325 () (_ BitVec 64))

(declare-fun lt!418329 () (_ BitVec 64))

(declare-fun lt!418324 () (_ BitVec 64))

(assert (=> d!97832 (= res!235401 (= lt!418325 (bvsub lt!418329 lt!418324)))))

(assert (=> d!97832 (or (= (bvand lt!418329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418329 lt!418324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97832 (= lt!418324 (remainingBits!0 ((_ sign_extend 32) (size!7181 (buf!7427 thiss!1929))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!13794 thiss!1929))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!418328 () (_ BitVec 64))

(declare-fun lt!418327 () (_ BitVec 64))

(assert (=> d!97832 (= lt!418329 (bvmul lt!418328 lt!418327))))

(assert (=> d!97832 (or (= lt!418328 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418327 (bvsdiv (bvmul lt!418328 lt!418327) lt!418328)))))

(assert (=> d!97832 (= lt!418327 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97832 (= lt!418328 ((_ sign_extend 32) (size!7181 (buf!7427 thiss!1929))))))

(assert (=> d!97832 (= lt!418325 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!13794 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!97832 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13794 thiss!1929)) (size!7181 (buf!7427 thiss!1929)))))

(assert (=> d!97832 (= (bitIndex!0 (size!7181 (buf!7427 thiss!1929)) (bvadd #b00000000000000000000000000000001 (currentByte!13794 thiss!1929)) #b00000000000000000000000000000000) lt!418325)))

(declare-fun b!284163 () Bool)

(declare-fun res!235400 () Bool)

(assert (=> b!284163 (=> (not res!235400) (not e!203144))))

(assert (=> b!284163 (= res!235400 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418325))))

(declare-fun b!284164 () Bool)

(declare-fun lt!418326 () (_ BitVec 64))

(assert (=> b!284164 (= e!203144 (bvsle lt!418325 (bvmul lt!418326 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284164 (or (= lt!418326 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418326 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418326)))))

(assert (=> b!284164 (= lt!418326 ((_ sign_extend 32) (size!7181 (buf!7427 thiss!1929))))))

(assert (= (and d!97832 res!235401) b!284163))

(assert (= (and b!284163 res!235400) b!284164))

(declare-fun m!417347 () Bool)

(assert (=> d!97832 m!417347))

(declare-fun m!417349 () Bool)

(assert (=> d!97832 m!417349))

(assert (=> b!284144 d!97832))

(declare-fun d!97836 () Bool)

(declare-fun e!203145 () Bool)

(assert (=> d!97836 e!203145))

(declare-fun res!235403 () Bool)

(assert (=> d!97836 (=> (not res!235403) (not e!203145))))

(declare-fun lt!418331 () (_ BitVec 64))

(declare-fun lt!418335 () (_ BitVec 64))

(declare-fun lt!418330 () (_ BitVec 64))

(assert (=> d!97836 (= res!235403 (= lt!418331 (bvsub lt!418335 lt!418330)))))

(assert (=> d!97836 (or (= (bvand lt!418335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418330 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418335 lt!418330) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97836 (= lt!418330 (remainingBits!0 ((_ sign_extend 32) (size!7181 (buf!7427 thiss!1929))) ((_ sign_extend 32) (currentByte!13794 thiss!1929)) ((_ sign_extend 32) (currentBit!13789 thiss!1929))))))

(declare-fun lt!418334 () (_ BitVec 64))

(declare-fun lt!418333 () (_ BitVec 64))

(assert (=> d!97836 (= lt!418335 (bvmul lt!418334 lt!418333))))

(assert (=> d!97836 (or (= lt!418334 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418333 (bvsdiv (bvmul lt!418334 lt!418333) lt!418334)))))

(assert (=> d!97836 (= lt!418333 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97836 (= lt!418334 ((_ sign_extend 32) (size!7181 (buf!7427 thiss!1929))))))

(assert (=> d!97836 (= lt!418331 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13794 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13789 thiss!1929))))))

(assert (=> d!97836 (invariant!0 (currentBit!13789 thiss!1929) (currentByte!13794 thiss!1929) (size!7181 (buf!7427 thiss!1929)))))

(assert (=> d!97836 (= (bitIndex!0 (size!7181 (buf!7427 thiss!1929)) (currentByte!13794 thiss!1929) (currentBit!13789 thiss!1929)) lt!418331)))

(declare-fun b!284165 () Bool)

(declare-fun res!235402 () Bool)

(assert (=> b!284165 (=> (not res!235402) (not e!203145))))

(assert (=> b!284165 (= res!235402 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418331))))

(declare-fun b!284166 () Bool)

(declare-fun lt!418332 () (_ BitVec 64))

(assert (=> b!284166 (= e!203145 (bvsle lt!418331 (bvmul lt!418332 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284166 (or (= lt!418332 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418332 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418332)))))

(assert (=> b!284166 (= lt!418332 ((_ sign_extend 32) (size!7181 (buf!7427 thiss!1929))))))

(assert (= (and d!97836 res!235403) b!284165))

(assert (= (and b!284165 res!235402) b!284166))

(assert (=> d!97836 m!417343))

(assert (=> d!97836 m!417345))

(assert (=> b!284144 d!97836))

(declare-fun d!97838 () Bool)

(assert (=> d!97838 (= (array_inv!6874 (buf!7427 thiss!1929)) (bvsge (size!7181 (buf!7427 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284145 d!97838))

(check-sat (not d!97830) (not d!97836) (not d!97832) (not d!97824))
