; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29968 () Bool)

(assert start!29968)

(declare-fun res!128910 () Bool)

(declare-fun e!103307 () Bool)

(assert (=> start!29968 (=> (not res!128910) (not e!103307))))

(declare-datatypes ((array!6929 0))(
  ( (array!6930 (arr!3947 (Array (_ BitVec 32) (_ BitVec 8))) (size!3124 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5506 0))(
  ( (BitStream!5507 (buf!3627 array!6929) (currentByte!6637 (_ BitVec 32)) (currentBit!6632 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5506)

(declare-fun bs2!18 () BitStream!5506)

(assert (=> start!29968 (= res!128910 (= (size!3124 (buf!3627 bs1!10)) (size!3124 (buf!3627 bs2!18))))))

(assert (=> start!29968 e!103307))

(declare-fun e!103304 () Bool)

(declare-fun inv!12 (BitStream!5506) Bool)

(assert (=> start!29968 (and (inv!12 bs1!10) e!103304)))

(declare-fun e!103305 () Bool)

(assert (=> start!29968 (and (inv!12 bs2!18) e!103305)))

(declare-fun b!153927 () Bool)

(declare-fun lt!240310 () (_ BitVec 64))

(declare-fun lt!240309 () (_ BitVec 64))

(assert (=> b!153927 (= e!103307 (and (= lt!240310 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!240310 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240309) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!153927 (= lt!240310 (bvand lt!240309 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153927 (= lt!240309 (bitIndex!0 (size!3124 (buf!3627 bs1!10)) (currentByte!6637 bs1!10) (currentBit!6632 bs1!10)))))

(declare-fun b!153928 () Bool)

(declare-fun array_inv!2913 (array!6929) Bool)

(assert (=> b!153928 (= e!103304 (array_inv!2913 (buf!3627 bs1!10)))))

(declare-fun b!153929 () Bool)

(assert (=> b!153929 (= e!103305 (array_inv!2913 (buf!3627 bs2!18)))))

(assert (= (and start!29968 res!128910) b!153927))

(assert (= start!29968 b!153928))

(assert (= start!29968 b!153929))

(declare-fun m!239911 () Bool)

(assert (=> start!29968 m!239911))

(declare-fun m!239913 () Bool)

(assert (=> start!29968 m!239913))

(declare-fun m!239915 () Bool)

(assert (=> b!153927 m!239915))

(declare-fun m!239917 () Bool)

(assert (=> b!153928 m!239917))

(declare-fun m!239919 () Bool)

(assert (=> b!153929 m!239919))

(push 1)

(assert (not b!153929))

(assert (not start!29968))

(assert (not b!153928))

(assert (not b!153927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50730 () Bool)

(assert (=> d!50730 (= (array_inv!2913 (buf!3627 bs2!18)) (bvsge (size!3124 (buf!3627 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153929 d!50730))

(declare-fun d!50732 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50732 (= (inv!12 bs1!10) (invariant!0 (currentBit!6632 bs1!10) (currentByte!6637 bs1!10) (size!3124 (buf!3627 bs1!10))))))

(declare-fun bs!12401 () Bool)

(assert (= bs!12401 d!50732))

(declare-fun m!239941 () Bool)

(assert (=> bs!12401 m!239941))

(assert (=> start!29968 d!50732))

(declare-fun d!50734 () Bool)

(assert (=> d!50734 (= (inv!12 bs2!18) (invariant!0 (currentBit!6632 bs2!18) (currentByte!6637 bs2!18) (size!3124 (buf!3627 bs2!18))))))

(declare-fun bs!12402 () Bool)

(assert (= bs!12402 d!50734))

(declare-fun m!239943 () Bool)

(assert (=> bs!12402 m!239943))

(assert (=> start!29968 d!50734))

(declare-fun d!50736 () Bool)

(assert (=> d!50736 (= (array_inv!2913 (buf!3627 bs1!10)) (bvsge (size!3124 (buf!3627 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153928 d!50736))

(declare-fun d!50738 () Bool)

(declare-fun e!103341 () Bool)

(assert (=> d!50738 e!103341))

(declare-fun res!128922 () Bool)

(assert (=> d!50738 (=> (not res!128922) (not e!103341))))

(declare-fun lt!240335 () (_ BitVec 64))

(declare-fun lt!240336 () (_ BitVec 64))

(declare-fun lt!240340 () (_ BitVec 64))

(assert (=> d!50738 (= res!128922 (= lt!240340 (bvsub lt!240336 lt!240335)))))

(assert (=> d!50738 (or (= (bvand lt!240336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240335 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240336 lt!240335) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50738 (= lt!240335 (remainingBits!0 ((_ sign_extend 32) (size!3124 (buf!3627 bs1!10))) ((_ sign_extend 32) (currentByte!6637 bs1!10)) ((_ sign_extend 32) (currentBit!6632 bs1!10))))))

(declare-fun lt!240339 () (_ BitVec 64))

(declare-fun lt!240338 () (_ BitVec 64))

(assert (=> d!50738 (= lt!240336 (bvmul lt!240339 lt!240338))))

(assert (=> d!50738 (or (= lt!240339 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240338 (bvsdiv (bvmul lt!240339 lt!240338) lt!240339)))))

(assert (=> d!50738 (= lt!240338 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50738 (= lt!240339 ((_ sign_extend 32) (size!3124 (buf!3627 bs1!10))))))

(assert (=> d!50738 (= lt!240340 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6637 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6632 bs1!10))))))

(assert (=> d!50738 (invariant!0 (currentBit!6632 bs1!10) (currentByte!6637 bs1!10) (size!3124 (buf!3627 bs1!10)))))

(assert (=> d!50738 (= (bitIndex!0 (size!3124 (buf!3627 bs1!10)) (currentByte!6637 bs1!10) (currentBit!6632 bs1!10)) lt!240340)))

(declare-fun b!153952 () Bool)

(declare-fun res!128921 () Bool)

(assert (=> b!153952 (=> (not res!128921) (not e!103341))))

(assert (=> b!153952 (= res!128921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240340))))

(declare-fun b!153953 () Bool)

(declare-fun lt!240337 () (_ BitVec 64))

(assert (=> b!153953 (= e!103341 (bvsle lt!240340 (bvmul lt!240337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153953 (or (= lt!240337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240337)))))

(assert (=> b!153953 (= lt!240337 ((_ sign_extend 32) (size!3124 (buf!3627 bs1!10))))))

(assert (= (and d!50738 res!128922) b!153952))

(assert (= (and b!153952 res!128921) b!153953))

(declare-fun m!239953 () Bool)

(assert (=> d!50738 m!239953))

(assert (=> d!50738 m!239941))

(assert (=> b!153927 d!50738))

(push 1)

(assert (not d!50738))

(assert (not d!50734))

(assert (not d!50732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

