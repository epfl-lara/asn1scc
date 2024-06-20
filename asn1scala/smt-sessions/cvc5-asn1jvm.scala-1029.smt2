; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29560 () Bool)

(assert start!29560)

(declare-fun b!152582 () Bool)

(declare-fun res!127901 () Bool)

(declare-fun e!102080 () Bool)

(assert (=> b!152582 (=> (not res!127901) (not e!102080))))

(declare-datatypes ((array!6821 0))(
  ( (array!6822 (arr!3905 (Array (_ BitVec 32) (_ BitVec 8))) (size!3082 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5422 0))(
  ( (BitStream!5423 (buf!3585 array!6821) (currentByte!6544 (_ BitVec 32)) (currentBit!6539 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5422)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152582 (= res!127901 (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3082 (buf!3585 bs1!10)) (currentByte!6544 bs1!10) (currentBit!6539 bs1!10))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3082 (buf!3585 bs1!10))))))))

(declare-fun b!152584 () Bool)

(declare-fun e!102077 () Bool)

(declare-fun array_inv!2871 (array!6821) Bool)

(assert (=> b!152584 (= e!102077 (array_inv!2871 (buf!3585 bs1!10)))))

(declare-fun res!127902 () Bool)

(assert (=> start!29560 (=> (not res!127902) (not e!102080))))

(declare-fun bs2!18 () BitStream!5422)

(assert (=> start!29560 (= res!127902 (= (size!3082 (buf!3585 bs1!10)) (size!3082 (buf!3585 bs2!18))))))

(assert (=> start!29560 e!102080))

(declare-fun inv!12 (BitStream!5422) Bool)

(assert (=> start!29560 (and (inv!12 bs1!10) e!102077)))

(declare-fun e!102078 () Bool)

(assert (=> start!29560 (and (inv!12 bs2!18) e!102078)))

(declare-fun b!152583 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152583 (= e!102080 (not (invariant!0 (currentBit!6539 bs2!18) (currentByte!6544 bs2!18) (size!3082 (buf!3585 bs2!18)))))))

(declare-fun b!152585 () Bool)

(assert (=> b!152585 (= e!102078 (array_inv!2871 (buf!3585 bs2!18)))))

(assert (= (and start!29560 res!127902) b!152582))

(assert (= (and b!152582 res!127901) b!152583))

(assert (= start!29560 b!152584))

(assert (= start!29560 b!152585))

(declare-fun m!238441 () Bool)

(assert (=> b!152585 m!238441))

(declare-fun m!238443 () Bool)

(assert (=> start!29560 m!238443))

(declare-fun m!238445 () Bool)

(assert (=> start!29560 m!238445))

(declare-fun m!238447 () Bool)

(assert (=> b!152583 m!238447))

(declare-fun m!238449 () Bool)

(assert (=> b!152582 m!238449))

(declare-fun m!238451 () Bool)

(assert (=> b!152584 m!238451))

(push 1)

(assert (not b!152582))

(assert (not b!152584))

(assert (not b!152583))

(assert (not start!29560))

(assert (not b!152585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50140 () Bool)

(declare-fun e!102114 () Bool)

(assert (=> d!50140 e!102114))

(declare-fun res!127919 () Bool)

(assert (=> d!50140 (=> (not res!127919) (not e!102114))))

(declare-fun lt!239069 () (_ BitVec 64))

(declare-fun lt!239074 () (_ BitVec 64))

(declare-fun lt!239072 () (_ BitVec 64))

(assert (=> d!50140 (= res!127919 (= lt!239072 (bvsub lt!239069 lt!239074)))))

(assert (=> d!50140 (or (= (bvand lt!239069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239069 lt!239074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50140 (= lt!239074 (remainingBits!0 ((_ sign_extend 32) (size!3082 (buf!3585 bs1!10))) ((_ sign_extend 32) (currentByte!6544 bs1!10)) ((_ sign_extend 32) (currentBit!6539 bs1!10))))))

(declare-fun lt!239071 () (_ BitVec 64))

(declare-fun lt!239073 () (_ BitVec 64))

(assert (=> d!50140 (= lt!239069 (bvmul lt!239071 lt!239073))))

(assert (=> d!50140 (or (= lt!239071 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239073 (bvsdiv (bvmul lt!239071 lt!239073) lt!239071)))))

(assert (=> d!50140 (= lt!239073 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50140 (= lt!239071 ((_ sign_extend 32) (size!3082 (buf!3585 bs1!10))))))

(assert (=> d!50140 (= lt!239072 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6544 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6539 bs1!10))))))

(assert (=> d!50140 (invariant!0 (currentBit!6539 bs1!10) (currentByte!6544 bs1!10) (size!3082 (buf!3585 bs1!10)))))

(assert (=> d!50140 (= (bitIndex!0 (size!3082 (buf!3585 bs1!10)) (currentByte!6544 bs1!10) (currentBit!6539 bs1!10)) lt!239072)))

(declare-fun b!152614 () Bool)

(declare-fun res!127920 () Bool)

(assert (=> b!152614 (=> (not res!127920) (not e!102114))))

(assert (=> b!152614 (= res!127920 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239072))))

(declare-fun b!152615 () Bool)

(declare-fun lt!239070 () (_ BitVec 64))

(assert (=> b!152615 (= e!102114 (bvsle lt!239072 (bvmul lt!239070 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152615 (or (= lt!239070 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239070 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239070)))))

(assert (=> b!152615 (= lt!239070 ((_ sign_extend 32) (size!3082 (buf!3585 bs1!10))))))

(assert (= (and d!50140 res!127919) b!152614))

(assert (= (and b!152614 res!127920) b!152615))

(declare-fun m!238479 () Bool)

(assert (=> d!50140 m!238479))

(declare-fun m!238481 () Bool)

(assert (=> d!50140 m!238481))

(assert (=> b!152582 d!50140))

(declare-fun d!50154 () Bool)

(assert (=> d!50154 (= (invariant!0 (currentBit!6539 bs2!18) (currentByte!6544 bs2!18) (size!3082 (buf!3585 bs2!18))) (and (bvsge (currentBit!6539 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6539 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6544 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6544 bs2!18) (size!3082 (buf!3585 bs2!18))) (and (= (currentBit!6539 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6544 bs2!18) (size!3082 (buf!3585 bs2!18)))))))))

(assert (=> b!152583 d!50154))

(declare-fun d!50156 () Bool)

(assert (=> d!50156 (= (inv!12 bs1!10) (invariant!0 (currentBit!6539 bs1!10) (currentByte!6544 bs1!10) (size!3082 (buf!3585 bs1!10))))))

(declare-fun bs!12262 () Bool)

(assert (= bs!12262 d!50156))

(assert (=> bs!12262 m!238481))

(assert (=> start!29560 d!50156))

(declare-fun d!50158 () Bool)

(assert (=> d!50158 (= (inv!12 bs2!18) (invariant!0 (currentBit!6539 bs2!18) (currentByte!6544 bs2!18) (size!3082 (buf!3585 bs2!18))))))

(declare-fun bs!12263 () Bool)

(assert (= bs!12263 d!50158))

(assert (=> bs!12263 m!238447))

(assert (=> start!29560 d!50158))

(declare-fun d!50160 () Bool)

(assert (=> d!50160 (= (array_inv!2871 (buf!3585 bs1!10)) (bvsge (size!3082 (buf!3585 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152584 d!50160))

(declare-fun d!50162 () Bool)

(assert (=> d!50162 (= (array_inv!2871 (buf!3585 bs2!18)) (bvsge (size!3082 (buf!3585 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152585 d!50162))

(push 1)

(assert (not d!50158))

(assert (not d!50156))

(assert (not d!50140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

