; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29970 () Bool)

(assert start!29970)

(declare-fun res!128913 () Bool)

(declare-fun e!103322 () Bool)

(assert (=> start!29970 (=> (not res!128913) (not e!103322))))

(declare-datatypes ((array!6931 0))(
  ( (array!6932 (arr!3948 (Array (_ BitVec 32) (_ BitVec 8))) (size!3125 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5508 0))(
  ( (BitStream!5509 (buf!3628 array!6931) (currentByte!6638 (_ BitVec 32)) (currentBit!6633 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5508)

(declare-fun bs2!18 () BitStream!5508)

(assert (=> start!29970 (= res!128913 (= (size!3125 (buf!3628 bs1!10)) (size!3125 (buf!3628 bs2!18))))))

(assert (=> start!29970 e!103322))

(declare-fun e!103319 () Bool)

(declare-fun inv!12 (BitStream!5508) Bool)

(assert (=> start!29970 (and (inv!12 bs1!10) e!103319)))

(declare-fun e!103323 () Bool)

(assert (=> start!29970 (and (inv!12 bs2!18) e!103323)))

(declare-fun b!153936 () Bool)

(declare-fun lt!240315 () (_ BitVec 64))

(declare-fun lt!240316 () (_ BitVec 64))

(assert (=> b!153936 (= e!103322 (and (= lt!240315 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!240315 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240316) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!153936 (= lt!240315 (bvand lt!240316 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153936 (= lt!240316 (bitIndex!0 (size!3125 (buf!3628 bs1!10)) (currentByte!6638 bs1!10) (currentBit!6633 bs1!10)))))

(declare-fun b!153937 () Bool)

(declare-fun array_inv!2914 (array!6931) Bool)

(assert (=> b!153937 (= e!103319 (array_inv!2914 (buf!3628 bs1!10)))))

(declare-fun b!153938 () Bool)

(assert (=> b!153938 (= e!103323 (array_inv!2914 (buf!3628 bs2!18)))))

(assert (= (and start!29970 res!128913) b!153936))

(assert (= start!29970 b!153937))

(assert (= start!29970 b!153938))

(declare-fun m!239921 () Bool)

(assert (=> start!29970 m!239921))

(declare-fun m!239923 () Bool)

(assert (=> start!29970 m!239923))

(declare-fun m!239925 () Bool)

(assert (=> b!153936 m!239925))

(declare-fun m!239927 () Bool)

(assert (=> b!153937 m!239927))

(declare-fun m!239929 () Bool)

(assert (=> b!153938 m!239929))

(check-sat (not b!153938) (not b!153937) (not start!29970) (not b!153936))
(check-sat)
(get-model)

(declare-fun d!50740 () Bool)

(assert (=> d!50740 (= (array_inv!2914 (buf!3628 bs2!18)) (bvsge (size!3125 (buf!3628 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153938 d!50740))

(declare-fun d!50742 () Bool)

(assert (=> d!50742 (= (array_inv!2914 (buf!3628 bs1!10)) (bvsge (size!3125 (buf!3628 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153937 d!50742))

(declare-fun d!50744 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50744 (= (inv!12 bs1!10) (invariant!0 (currentBit!6633 bs1!10) (currentByte!6638 bs1!10) (size!3125 (buf!3628 bs1!10))))))

(declare-fun bs!12403 () Bool)

(assert (= bs!12403 d!50744))

(declare-fun m!239945 () Bool)

(assert (=> bs!12403 m!239945))

(assert (=> start!29970 d!50744))

(declare-fun d!50746 () Bool)

(assert (=> d!50746 (= (inv!12 bs2!18) (invariant!0 (currentBit!6633 bs2!18) (currentByte!6638 bs2!18) (size!3125 (buf!3628 bs2!18))))))

(declare-fun bs!12404 () Bool)

(assert (= bs!12404 d!50746))

(declare-fun m!239947 () Bool)

(assert (=> bs!12404 m!239947))

(assert (=> start!29970 d!50746))

(declare-fun d!50748 () Bool)

(declare-fun e!103344 () Bool)

(assert (=> d!50748 e!103344))

(declare-fun res!128927 () Bool)

(assert (=> d!50748 (=> (not res!128927) (not e!103344))))

(declare-fun lt!240354 () (_ BitVec 64))

(declare-fun lt!240356 () (_ BitVec 64))

(declare-fun lt!240358 () (_ BitVec 64))

(assert (=> d!50748 (= res!128927 (= lt!240358 (bvsub lt!240356 lt!240354)))))

(assert (=> d!50748 (or (= (bvand lt!240356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240354 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240356 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240356 lt!240354) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50748 (= lt!240354 (remainingBits!0 ((_ sign_extend 32) (size!3125 (buf!3628 bs1!10))) ((_ sign_extend 32) (currentByte!6638 bs1!10)) ((_ sign_extend 32) (currentBit!6633 bs1!10))))))

(declare-fun lt!240357 () (_ BitVec 64))

(declare-fun lt!240355 () (_ BitVec 64))

(assert (=> d!50748 (= lt!240356 (bvmul lt!240357 lt!240355))))

(assert (=> d!50748 (or (= lt!240357 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240355 (bvsdiv (bvmul lt!240357 lt!240355) lt!240357)))))

(assert (=> d!50748 (= lt!240355 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50748 (= lt!240357 ((_ sign_extend 32) (size!3125 (buf!3628 bs1!10))))))

(assert (=> d!50748 (= lt!240358 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6638 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6633 bs1!10))))))

(assert (=> d!50748 (invariant!0 (currentBit!6633 bs1!10) (currentByte!6638 bs1!10) (size!3125 (buf!3628 bs1!10)))))

(assert (=> d!50748 (= (bitIndex!0 (size!3125 (buf!3628 bs1!10)) (currentByte!6638 bs1!10) (currentBit!6633 bs1!10)) lt!240358)))

(declare-fun b!153958 () Bool)

(declare-fun res!128928 () Bool)

(assert (=> b!153958 (=> (not res!128928) (not e!103344))))

(assert (=> b!153958 (= res!128928 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240358))))

(declare-fun b!153959 () Bool)

(declare-fun lt!240353 () (_ BitVec 64))

(assert (=> b!153959 (= e!103344 (bvsle lt!240358 (bvmul lt!240353 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153959 (or (= lt!240353 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240353 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240353)))))

(assert (=> b!153959 (= lt!240353 ((_ sign_extend 32) (size!3125 (buf!3628 bs1!10))))))

(assert (= (and d!50748 res!128927) b!153958))

(assert (= (and b!153958 res!128928) b!153959))

(declare-fun m!239955 () Bool)

(assert (=> d!50748 m!239955))

(assert (=> d!50748 m!239945))

(assert (=> b!153936 d!50748))

(check-sat (not d!50744) (not d!50746) (not d!50748))
