; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29564 () Bool)

(assert start!29564)

(declare-fun res!127914 () Bool)

(declare-fun e!102109 () Bool)

(assert (=> start!29564 (=> (not res!127914) (not e!102109))))

(declare-datatypes ((array!6825 0))(
  ( (array!6826 (arr!3907 (Array (_ BitVec 32) (_ BitVec 8))) (size!3084 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5426 0))(
  ( (BitStream!5427 (buf!3587 array!6825) (currentByte!6546 (_ BitVec 32)) (currentBit!6541 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5426)

(declare-fun bs2!18 () BitStream!5426)

(assert (=> start!29564 (= res!127914 (= (size!3084 (buf!3587 bs1!10)) (size!3084 (buf!3587 bs2!18))))))

(assert (=> start!29564 e!102109))

(declare-fun e!102108 () Bool)

(declare-fun inv!12 (BitStream!5426) Bool)

(assert (=> start!29564 (and (inv!12 bs1!10) e!102108)))

(declare-fun e!102107 () Bool)

(assert (=> start!29564 (and (inv!12 bs2!18) e!102107)))

(declare-fun b!152608 () Bool)

(declare-fun array_inv!2873 (array!6825) Bool)

(assert (=> b!152608 (= e!102108 (array_inv!2873 (buf!3587 bs1!10)))))

(declare-fun b!152606 () Bool)

(declare-fun res!127913 () Bool)

(assert (=> b!152606 (=> (not res!127913) (not e!102109))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152606 (= res!127913 (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3084 (buf!3587 bs1!10)) (currentByte!6546 bs1!10) (currentBit!6541 bs1!10))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3084 (buf!3587 bs1!10))))))))

(declare-fun b!152607 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152607 (= e!102109 (not (invariant!0 (currentBit!6541 bs2!18) (currentByte!6546 bs2!18) (size!3084 (buf!3587 bs2!18)))))))

(declare-fun b!152609 () Bool)

(assert (=> b!152609 (= e!102107 (array_inv!2873 (buf!3587 bs2!18)))))

(assert (= (and start!29564 res!127914) b!152606))

(assert (= (and b!152606 res!127913) b!152607))

(assert (= start!29564 b!152608))

(assert (= start!29564 b!152609))

(declare-fun m!238465 () Bool)

(assert (=> b!152607 m!238465))

(declare-fun m!238467 () Bool)

(assert (=> b!152609 m!238467))

(declare-fun m!238469 () Bool)

(assert (=> b!152608 m!238469))

(declare-fun m!238471 () Bool)

(assert (=> b!152606 m!238471))

(declare-fun m!238473 () Bool)

(assert (=> start!29564 m!238473))

(declare-fun m!238475 () Bool)

(assert (=> start!29564 m!238475))

(push 1)

(assert (not b!152608))

(assert (not b!152609))

(assert (not start!29564))

(assert (not b!152606))

(assert (not b!152607))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50148 () Bool)

(assert (=> d!50148 (= (array_inv!2873 (buf!3587 bs2!18)) (bvsge (size!3084 (buf!3587 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152609 d!50148))

(declare-fun d!50152 () Bool)

(declare-fun e!102117 () Bool)

(assert (=> d!50152 e!102117))

(declare-fun res!127926 () Bool)

(assert (=> d!50152 (=> (not res!127926) (not e!102117))))

(declare-fun lt!239087 () (_ BitVec 64))

(declare-fun lt!239091 () (_ BitVec 64))

(declare-fun lt!239090 () (_ BitVec 64))

(assert (=> d!50152 (= res!127926 (= lt!239091 (bvsub lt!239090 lt!239087)))))

(assert (=> d!50152 (or (= (bvand lt!239090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239087 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239090 lt!239087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50152 (= lt!239087 (remainingBits!0 ((_ sign_extend 32) (size!3084 (buf!3587 bs1!10))) ((_ sign_extend 32) (currentByte!6546 bs1!10)) ((_ sign_extend 32) (currentBit!6541 bs1!10))))))

(declare-fun lt!239092 () (_ BitVec 64))

(declare-fun lt!239088 () (_ BitVec 64))

(assert (=> d!50152 (= lt!239090 (bvmul lt!239092 lt!239088))))

(assert (=> d!50152 (or (= lt!239092 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239088 (bvsdiv (bvmul lt!239092 lt!239088) lt!239092)))))

(assert (=> d!50152 (= lt!239088 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50152 (= lt!239092 ((_ sign_extend 32) (size!3084 (buf!3587 bs1!10))))))

(assert (=> d!50152 (= lt!239091 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6546 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6541 bs1!10))))))

(assert (=> d!50152 (invariant!0 (currentBit!6541 bs1!10) (currentByte!6546 bs1!10) (size!3084 (buf!3587 bs1!10)))))

(assert (=> d!50152 (= (bitIndex!0 (size!3084 (buf!3587 bs1!10)) (currentByte!6546 bs1!10) (currentBit!6541 bs1!10)) lt!239091)))

(declare-fun b!152620 () Bool)

(declare-fun res!127925 () Bool)

(assert (=> b!152620 (=> (not res!127925) (not e!102117))))

(assert (=> b!152620 (= res!127925 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239091))))

(declare-fun b!152621 () Bool)

(declare-fun lt!239089 () (_ BitVec 64))

(assert (=> b!152621 (= e!102117 (bvsle lt!239091 (bvmul lt!239089 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152621 (or (= lt!239089 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239089 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239089)))))

(assert (=> b!152621 (= lt!239089 ((_ sign_extend 32) (size!3084 (buf!3587 bs1!10))))))

(assert (= (and d!50152 res!127926) b!152620))

(assert (= (and b!152620 res!127925) b!152621))

(declare-fun m!238483 () Bool)

(assert (=> d!50152 m!238483))

(declare-fun m!238485 () Bool)

(assert (=> d!50152 m!238485))

(assert (=> b!152606 d!50152))

(declare-fun d!50164 () Bool)

(assert (=> d!50164 (= (invariant!0 (currentBit!6541 bs2!18) (currentByte!6546 bs2!18) (size!3084 (buf!3587 bs2!18))) (and (bvsge (currentBit!6541 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6541 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6546 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6546 bs2!18) (size!3084 (buf!3587 bs2!18))) (and (= (currentBit!6541 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6546 bs2!18) (size!3084 (buf!3587 bs2!18)))))))))

(assert (=> b!152607 d!50164))

(declare-fun d!50166 () Bool)

(assert (=> d!50166 (= (array_inv!2873 (buf!3587 bs1!10)) (bvsge (size!3084 (buf!3587 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152608 d!50166))

(declare-fun d!50168 () Bool)

