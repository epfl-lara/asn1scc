; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29972 () Bool)

(assert start!29972)

(declare-fun res!128916 () Bool)

(declare-fun e!103338 () Bool)

(assert (=> start!29972 (=> (not res!128916) (not e!103338))))

(declare-datatypes ((array!6933 0))(
  ( (array!6934 (arr!3949 (Array (_ BitVec 32) (_ BitVec 8))) (size!3126 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5510 0))(
  ( (BitStream!5511 (buf!3629 array!6933) (currentByte!6639 (_ BitVec 32)) (currentBit!6634 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5510)

(declare-fun bs2!18 () BitStream!5510)

(assert (=> start!29972 (= res!128916 (= (size!3126 (buf!3629 bs1!10)) (size!3126 (buf!3629 bs2!18))))))

(assert (=> start!29972 e!103338))

(declare-fun e!103337 () Bool)

(declare-fun inv!12 (BitStream!5510) Bool)

(assert (=> start!29972 (and (inv!12 bs1!10) e!103337)))

(declare-fun e!103334 () Bool)

(assert (=> start!29972 (and (inv!12 bs2!18) e!103334)))

(declare-fun b!153945 () Bool)

(declare-fun lt!240322 () (_ BitVec 64))

(declare-fun lt!240321 () (_ BitVec 64))

(assert (=> b!153945 (= e!103338 (and (= lt!240322 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!240322 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240321) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!153945 (= lt!240322 (bvand lt!240321 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153945 (= lt!240321 (bitIndex!0 (size!3126 (buf!3629 bs1!10)) (currentByte!6639 bs1!10) (currentBit!6634 bs1!10)))))

(declare-fun b!153946 () Bool)

(declare-fun array_inv!2915 (array!6933) Bool)

(assert (=> b!153946 (= e!103337 (array_inv!2915 (buf!3629 bs1!10)))))

(declare-fun b!153947 () Bool)

(assert (=> b!153947 (= e!103334 (array_inv!2915 (buf!3629 bs2!18)))))

(assert (= (and start!29972 res!128916) b!153945))

(assert (= start!29972 b!153946))

(assert (= start!29972 b!153947))

(declare-fun m!239931 () Bool)

(assert (=> start!29972 m!239931))

(declare-fun m!239933 () Bool)

(assert (=> start!29972 m!239933))

(declare-fun m!239935 () Bool)

(assert (=> b!153945 m!239935))

(declare-fun m!239937 () Bool)

(assert (=> b!153946 m!239937))

(declare-fun m!239939 () Bool)

(assert (=> b!153947 m!239939))

(push 1)

(assert (not b!153946))

(assert (not start!29972))

(assert (not b!153945))

(assert (not b!153947))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50750 () Bool)

(assert (=> d!50750 (= (array_inv!2915 (buf!3629 bs1!10)) (bvsge (size!3126 (buf!3629 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153946 d!50750))

(declare-fun d!50752 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50752 (= (inv!12 bs1!10) (invariant!0 (currentBit!6634 bs1!10) (currentByte!6639 bs1!10) (size!3126 (buf!3629 bs1!10))))))

(declare-fun bs!12405 () Bool)

(assert (= bs!12405 d!50752))

(declare-fun m!239949 () Bool)

(assert (=> bs!12405 m!239949))

(assert (=> start!29972 d!50752))

(declare-fun d!50754 () Bool)

(assert (=> d!50754 (= (inv!12 bs2!18) (invariant!0 (currentBit!6634 bs2!18) (currentByte!6639 bs2!18) (size!3126 (buf!3629 bs2!18))))))

(declare-fun bs!12406 () Bool)

(assert (= bs!12406 d!50754))

(declare-fun m!239951 () Bool)

(assert (=> bs!12406 m!239951))

(assert (=> start!29972 d!50754))

(declare-fun d!50756 () Bool)

(declare-fun e!103347 () Bool)

(assert (=> d!50756 e!103347))

(declare-fun res!128933 () Bool)

(assert (=> d!50756 (=> (not res!128933) (not e!103347))))

(declare-fun lt!240374 () (_ BitVec 64))

(declare-fun lt!240373 () (_ BitVec 64))

(declare-fun lt!240371 () (_ BitVec 64))

(assert (=> d!50756 (= res!128933 (= lt!240373 (bvsub lt!240374 lt!240371)))))

(assert (=> d!50756 (or (= (bvand lt!240374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240371 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240374 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240374 lt!240371) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50756 (= lt!240371 (remainingBits!0 ((_ sign_extend 32) (size!3126 (buf!3629 bs1!10))) ((_ sign_extend 32) (currentByte!6639 bs1!10)) ((_ sign_extend 32) (currentBit!6634 bs1!10))))))

(declare-fun lt!240375 () (_ BitVec 64))

(declare-fun lt!240376 () (_ BitVec 64))

(assert (=> d!50756 (= lt!240374 (bvmul lt!240375 lt!240376))))

(assert (=> d!50756 (or (= lt!240375 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240376 (bvsdiv (bvmul lt!240375 lt!240376) lt!240375)))))

(assert (=> d!50756 (= lt!240376 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50756 (= lt!240375 ((_ sign_extend 32) (size!3126 (buf!3629 bs1!10))))))

(assert (=> d!50756 (= lt!240373 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6639 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6634 bs1!10))))))

(assert (=> d!50756 (invariant!0 (currentBit!6634 bs1!10) (currentByte!6639 bs1!10) (size!3126 (buf!3629 bs1!10)))))

(assert (=> d!50756 (= (bitIndex!0 (size!3126 (buf!3629 bs1!10)) (currentByte!6639 bs1!10) (currentBit!6634 bs1!10)) lt!240373)))

(declare-fun b!153964 () Bool)

(declare-fun res!128934 () Bool)

(assert (=> b!153964 (=> (not res!128934) (not e!103347))))

(assert (=> b!153964 (= res!128934 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240373))))

(declare-fun b!153965 () Bool)

(declare-fun lt!240372 () (_ BitVec 64))

(assert (=> b!153965 (= e!103347 (bvsle lt!240373 (bvmul lt!240372 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153965 (or (= lt!240372 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240372 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240372)))))

(assert (=> b!153965 (= lt!240372 ((_ sign_extend 32) (size!3126 (buf!3629 bs1!10))))))

(assert (= (and d!50756 res!128933) b!153964))

(assert (= (and b!153964 res!128934) b!153965))

(declare-fun m!239957 () Bool)

(assert (=> d!50756 m!239957))

(assert (=> d!50756 m!239949))

(assert (=> b!153945 d!50756))

(declare-fun d!50758 () Bool)

(assert (=> d!50758 (= (array_inv!2915 (buf!3629 bs2!18)) (bvsge (size!3126 (buf!3629 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153947 d!50758))

(push 1)

(assert (not d!50754))

(assert (not d!50756))

(assert (not d!50752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

