; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29534 () Bool)

(assert start!29534)

(declare-fun res!127878 () Bool)

(declare-fun e!102053 () Bool)

(assert (=> start!29534 (=> (not res!127878) (not e!102053))))

(declare-datatypes ((array!6816 0))(
  ( (array!6817 (arr!3904 (Array (_ BitVec 32) (_ BitVec 8))) (size!3081 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5420 0))(
  ( (BitStream!5421 (buf!3584 array!6816) (currentByte!6537 (_ BitVec 32)) (currentBit!6532 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5420)

(declare-fun bs2!18 () BitStream!5420)

(assert (=> start!29534 (= res!127878 (= (size!3081 (buf!3584 bs1!10)) (size!3081 (buf!3584 bs2!18))))))

(assert (=> start!29534 e!102053))

(declare-fun e!102057 () Bool)

(declare-fun inv!12 (BitStream!5420) Bool)

(assert (=> start!29534 (and (inv!12 bs1!10) e!102057)))

(declare-fun e!102054 () Bool)

(assert (=> start!29534 (and (inv!12 bs2!18) e!102054)))

(declare-fun b!152553 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152553 (= e!102053 (not (invariant!0 (currentBit!6532 bs1!10) (currentByte!6537 bs1!10) (size!3081 (buf!3584 bs1!10)))))))

(declare-fun b!152555 () Bool)

(declare-fun array_inv!2870 (array!6816) Bool)

(assert (=> b!152555 (= e!102054 (array_inv!2870 (buf!3584 bs2!18)))))

(declare-fun b!152554 () Bool)

(assert (=> b!152554 (= e!102057 (array_inv!2870 (buf!3584 bs1!10)))))

(declare-fun b!152552 () Bool)

(declare-fun res!127877 () Bool)

(assert (=> b!152552 (=> (not res!127877) (not e!102053))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152552 (= res!127877 (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3081 (buf!3584 bs1!10)) (currentByte!6537 bs1!10) (currentBit!6532 bs1!10))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3081 (buf!3584 bs1!10))))))))

(assert (= (and start!29534 res!127878) b!152552))

(assert (= (and b!152552 res!127877) b!152553))

(assert (= start!29534 b!152554))

(assert (= start!29534 b!152555))

(declare-fun m!238417 () Bool)

(assert (=> b!152554 m!238417))

(declare-fun m!238419 () Bool)

(assert (=> b!152555 m!238419))

(declare-fun m!238421 () Bool)

(assert (=> start!29534 m!238421))

(declare-fun m!238423 () Bool)

(assert (=> start!29534 m!238423))

(declare-fun m!238425 () Bool)

(assert (=> b!152552 m!238425))

(declare-fun m!238427 () Bool)

(assert (=> b!152553 m!238427))

(push 1)

(assert (not b!152552))

(assert (not b!152553))

(assert (not b!152555))

(assert (not b!152554))

(assert (not start!29534))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50106 () Bool)

(assert (=> d!50106 (= (invariant!0 (currentBit!6532 bs1!10) (currentByte!6537 bs1!10) (size!3081 (buf!3584 bs1!10))) (and (bvsge (currentBit!6532 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6532 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6537 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6537 bs1!10) (size!3081 (buf!3584 bs1!10))) (and (= (currentBit!6532 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6537 bs1!10) (size!3081 (buf!3584 bs1!10)))))))))

(assert (=> b!152553 d!50106))

(declare-fun d!50108 () Bool)

(assert (=> d!50108 (= (inv!12 bs1!10) (invariant!0 (currentBit!6532 bs1!10) (currentByte!6537 bs1!10) (size!3081 (buf!3584 bs1!10))))))

(declare-fun bs!12251 () Bool)

(assert (= bs!12251 d!50108))

(assert (=> bs!12251 m!238427))

(assert (=> start!29534 d!50108))

(declare-fun d!50110 () Bool)

(assert (=> d!50110 (= (inv!12 bs2!18) (invariant!0 (currentBit!6532 bs2!18) (currentByte!6537 bs2!18) (size!3081 (buf!3584 bs2!18))))))

(declare-fun bs!12252 () Bool)

(assert (= bs!12252 d!50110))

(declare-fun m!238429 () Bool)

(assert (=> bs!12252 m!238429))

(assert (=> start!29534 d!50110))

(declare-fun d!50112 () Bool)

(assert (=> d!50112 (= (array_inv!2870 (buf!3584 bs1!10)) (bvsge (size!3081 (buf!3584 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152554 d!50112))

(declare-fun d!50114 () Bool)

(assert (=> d!50114 (= (array_inv!2870 (buf!3584 bs2!18)) (bvsge (size!3081 (buf!3584 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152555 d!50114))

(declare-fun d!50116 () Bool)

(declare-fun e!102065 () Bool)

(assert (=> d!50116 e!102065))

(declare-fun res!127893 () Bool)

(assert (=> d!50116 (=> (not res!127893) (not e!102065))))

(declare-fun lt!239046 () (_ BitVec 64))

(declare-fun lt!239047 () (_ BitVec 64))

(declare-fun lt!239048 () (_ BitVec 64))

(assert (=> d!50116 (= res!127893 (= lt!239046 (bvsub lt!239047 lt!239048)))))

(assert (=> d!50116 (or (= (bvand lt!239047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239047 lt!239048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50116 (= lt!239048 (remainingBits!0 ((_ sign_extend 32) (size!3081 (buf!3584 bs1!10))) ((_ sign_extend 32) (currentByte!6537 bs1!10)) ((_ sign_extend 32) (currentBit!6532 bs1!10))))))

(declare-fun lt!239050 () (_ BitVec 64))

(declare-fun lt!239049 () (_ BitVec 64))

(assert (=> d!50116 (= lt!239047 (bvmul lt!239050 lt!239049))))

(assert (=> d!50116 (or (= lt!239050 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239049 (bvsdiv (bvmul lt!239050 lt!239049) lt!239050)))))

(assert (=> d!50116 (= lt!239049 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50116 (= lt!239050 ((_ sign_extend 32) (size!3081 (buf!3584 bs1!10))))))

(assert (=> d!50116 (= lt!239046 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6537 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6532 bs1!10))))))

(assert (=> d!50116 (invariant!0 (currentBit!6532 bs1!10) (currentByte!6537 bs1!10) (size!3081 (buf!3584 bs1!10)))))

(assert (=> d!50116 (= (bitIndex!0 (size!3081 (buf!3584 bs1!10)) (currentByte!6537 bs1!10) (currentBit!6532 bs1!10)) lt!239046)))

(declare-fun b!152570 () Bool)

(declare-fun res!127894 () Bool)

(assert (=> b!152570 (=> (not res!127894) (not e!102065))))

(assert (=> b!152570 (= res!127894 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239046))))

(declare-fun b!152571 () Bool)

(declare-fun lt!239045 () (_ BitVec 64))

(assert (=> b!152571 (= e!102065 (bvsle lt!239046 (bvmul lt!239045 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (