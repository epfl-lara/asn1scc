; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29530 () Bool)

(assert start!29530)

(declare-fun b!152530 () Bool)

(declare-fun e!102023 () Bool)

(declare-datatypes ((array!6812 0))(
  ( (array!6813 (arr!3902 (Array (_ BitVec 32) (_ BitVec 8))) (size!3079 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5416 0))(
  ( (BitStream!5417 (buf!3582 array!6812) (currentByte!6535 (_ BitVec 32)) (currentBit!6530 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5416)

(declare-fun array_inv!2868 (array!6812) Bool)

(assert (=> b!152530 (= e!102023 (array_inv!2868 (buf!3582 bs1!10)))))

(declare-fun b!152528 () Bool)

(declare-fun res!127865 () Bool)

(declare-fun e!102027 () Bool)

(assert (=> b!152528 (=> (not res!127865) (not e!102027))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152528 (= res!127865 (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3079 (buf!3582 bs1!10)) (currentByte!6535 bs1!10) (currentBit!6530 bs1!10))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3079 (buf!3582 bs1!10))))))))

(declare-fun b!152531 () Bool)

(declare-fun e!102024 () Bool)

(declare-fun bs2!18 () BitStream!5416)

(assert (=> b!152531 (= e!102024 (array_inv!2868 (buf!3582 bs2!18)))))

(declare-fun b!152529 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152529 (= e!102027 (not (invariant!0 (currentBit!6530 bs1!10) (currentByte!6535 bs1!10) (size!3079 (buf!3582 bs1!10)))))))

(declare-fun res!127866 () Bool)

(assert (=> start!29530 (=> (not res!127866) (not e!102027))))

(assert (=> start!29530 (= res!127866 (= (size!3079 (buf!3582 bs1!10)) (size!3079 (buf!3582 bs2!18))))))

(assert (=> start!29530 e!102027))

(declare-fun inv!12 (BitStream!5416) Bool)

(assert (=> start!29530 (and (inv!12 bs1!10) e!102023)))

(assert (=> start!29530 (and (inv!12 bs2!18) e!102024)))

(assert (= (and start!29530 res!127866) b!152528))

(assert (= (and b!152528 res!127865) b!152529))

(assert (= start!29530 b!152530))

(assert (= start!29530 b!152531))

(declare-fun m!238393 () Bool)

(assert (=> b!152528 m!238393))

(declare-fun m!238395 () Bool)

(assert (=> b!152530 m!238395))

(declare-fun m!238397 () Bool)

(assert (=> b!152529 m!238397))

(declare-fun m!238399 () Bool)

(assert (=> start!29530 m!238399))

(declare-fun m!238401 () Bool)

(assert (=> start!29530 m!238401))

(declare-fun m!238403 () Bool)

(assert (=> b!152531 m!238403))

(push 1)

(assert (not b!152530))

(assert (not start!29530))

(assert (not b!152531))

(assert (not b!152528))

(assert (not b!152529))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50100 () Bool)

(assert (=> d!50100 (= (array_inv!2868 (buf!3582 bs2!18)) (bvsge (size!3079 (buf!3582 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152531 d!50100))

(declare-fun d!50102 () Bool)

(declare-fun e!102060 () Bool)

(assert (=> d!50102 e!102060))

(declare-fun res!127883 () Bool)

(assert (=> d!50102 (=> (not res!127883) (not e!102060))))

(declare-fun lt!239017 () (_ BitVec 64))

(declare-fun lt!239019 () (_ BitVec 64))

(declare-fun lt!239015 () (_ BitVec 64))

(assert (=> d!50102 (= res!127883 (= lt!239017 (bvsub lt!239015 lt!239019)))))

(assert (=> d!50102 (or (= (bvand lt!239015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239019 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239015 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239015 lt!239019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50102 (= lt!239019 (remainingBits!0 ((_ sign_extend 32) (size!3079 (buf!3582 bs1!10))) ((_ sign_extend 32) (currentByte!6535 bs1!10)) ((_ sign_extend 32) (currentBit!6530 bs1!10))))))

(declare-fun lt!239020 () (_ BitVec 64))

(declare-fun lt!239016 () (_ BitVec 64))

(assert (=> d!50102 (= lt!239015 (bvmul lt!239020 lt!239016))))

(assert (=> d!50102 (or (= lt!239020 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239016 (bvsdiv (bvmul lt!239020 lt!239016) lt!239020)))))

(assert (=> d!50102 (= lt!239016 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50102 (= lt!239020 ((_ sign_extend 32) (size!3079 (buf!3582 bs1!10))))))

(assert (=> d!50102 (= lt!239017 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6535 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6530 bs1!10))))))

(assert (=> d!50102 (invariant!0 (currentBit!6530 bs1!10) (currentByte!6535 bs1!10) (size!3079 (buf!3582 bs1!10)))))

(assert (=> d!50102 (= (bitIndex!0 (size!3079 (buf!3582 bs1!10)) (currentByte!6535 bs1!10) (currentBit!6530 bs1!10)) lt!239017)))

(declare-fun b!152560 () Bool)

(declare-fun res!127884 () Bool)

(assert (=> b!152560 (=> (not res!127884) (not e!102060))))

(assert (=> b!152560 (= res!127884 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239017))))

(declare-fun b!152561 () Bool)

(declare-fun lt!239018 () (_ BitVec 64))

(assert (=> b!152561 (= e!102060 (bvsle lt!239017 (bvmul lt!239018 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152561 (or (= lt!239018 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239018 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239018)))))

(assert (=> b!152561 (= lt!239018 ((_ sign_extend 32) (size!3079 (buf!3582 bs1!10))))))

(assert (= (and d!50102 res!127883) b!152560))

(assert (= (and b!152560 res!127884) b!152561))

(declare-fun m!238431 () Bool)

(assert (=> d!50102 m!238431))

(assert (=> d!50102 m!238397))

(assert (=> b!152528 d!50102))

(declare-fun d!50118 () Bool)

(assert (=> d!50118 (= (invariant!0 (currentBit!6530 bs1!10) (currentByte!6535 bs1!10) (size!3079 (buf!3582 bs1!10))) (and (bvsge (currentBit!6530 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6530 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6535 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6535 bs1!10) (size!3079 (buf!3582 bs1!10))) (and (= (currentBit!6530 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6535 bs1!10) (size!3079 (buf!3582 bs1!10)))))))))

(assert (=> b!152529 d!50118))

(declare-fun d!50120 () Bool)

(assert (=> d!50120 (= (array_inv!2868 (buf!3582 bs1!10)) (bvsge (size!3079 (buf!3582 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152530 d!50120))

(declare-fun d!50122 () Bool)

(assert (=> d!50122 (= (inv!12 bs1!10) (invariant!0 (currentBit!6530 bs1!10) (currentByte!6535 bs1!10) (size!3079 (buf!3582 bs1!10))))))

(declare-fun bs!12253 () Bool)

(assert (= bs!12253 d!50122))

(assert (=> bs!12253 m!238397))

(assert (=> start!29530 d!50122))

(declare-fun d!50124 () Bool)

(assert (=> d!50124 (= (inv!12 bs2!18) (invariant!0 (currentBit!6530 bs2!18) (currentByte!6535 bs2!18) (size!3079 (buf!3582 bs2!18))))))

(declare-fun bs!12254 () Bool)

(assert (= bs!12254 d!50124))

(declare-fun m!238433 () Bool)

(assert (=> bs!12254 m!238433))

(assert (=> start!29530 d!50124))

(push 1)

(assert (not d!50122))

(assert (not d!50102))

(assert (not d!50124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

