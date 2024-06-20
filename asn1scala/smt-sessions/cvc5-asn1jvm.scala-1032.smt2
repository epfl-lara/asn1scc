; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29626 () Bool)

(assert start!29626)

(declare-fun b!152743 () Bool)

(declare-fun e!102244 () Bool)

(declare-datatypes ((array!6845 0))(
  ( (array!6846 (arr!3914 (Array (_ BitVec 32) (_ BitVec 8))) (size!3091 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5440 0))(
  ( (BitStream!5441 (buf!3594 array!6845) (currentByte!6565 (_ BitVec 32)) (currentBit!6560 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5440)

(declare-fun array_inv!2880 (array!6845) Bool)

(assert (=> b!152743 (= e!102244 (array_inv!2880 (buf!3594 bs1!10)))))

(declare-fun b!152745 () Bool)

(declare-fun res!128008 () Bool)

(declare-fun e!102245 () Bool)

(assert (=> b!152745 (=> (not res!128008) (not e!102245))))

(declare-fun lt!239203 () (_ BitVec 64))

(declare-fun bs2!18 () BitStream!5440)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152745 (= res!128008 (bvsle lt!239203 (bitIndex!0 (size!3091 (buf!3594 bs2!18)) (currentByte!6565 bs2!18) (currentBit!6560 bs2!18))))))

(declare-fun b!152746 () Bool)

(assert (=> b!152746 (= e!102245 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!239203))))

(declare-fun b!152747 () Bool)

(declare-fun e!102248 () Bool)

(assert (=> b!152747 (= e!102248 (array_inv!2880 (buf!3594 bs2!18)))))

(declare-fun res!128010 () Bool)

(declare-fun e!102246 () Bool)

(assert (=> start!29626 (=> (not res!128010) (not e!102246))))

(assert (=> start!29626 (= res!128010 (= (size!3091 (buf!3594 bs1!10)) (size!3091 (buf!3594 bs2!18))))))

(assert (=> start!29626 e!102246))

(declare-fun inv!12 (BitStream!5440) Bool)

(assert (=> start!29626 (and (inv!12 bs1!10) e!102244)))

(assert (=> start!29626 (and (inv!12 bs2!18) e!102248)))

(declare-fun b!152744 () Bool)

(assert (=> b!152744 (= e!102246 e!102245)))

(declare-fun res!128009 () Bool)

(assert (=> b!152744 (=> (not res!128009) (not e!102245))))

(assert (=> b!152744 (= res!128009 (bvsle lt!239203 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3091 (buf!3594 bs1!10))))))))

(assert (=> b!152744 (= lt!239203 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3091 (buf!3594 bs1!10)) (currentByte!6565 bs1!10) (currentBit!6560 bs1!10))))))

(assert (= (and start!29626 res!128010) b!152744))

(assert (= (and b!152744 res!128009) b!152745))

(assert (= (and b!152745 res!128008) b!152746))

(assert (= start!29626 b!152743))

(assert (= start!29626 b!152747))

(declare-fun m!238585 () Bool)

(assert (=> b!152745 m!238585))

(declare-fun m!238587 () Bool)

(assert (=> start!29626 m!238587))

(declare-fun m!238589 () Bool)

(assert (=> start!29626 m!238589))

(declare-fun m!238591 () Bool)

(assert (=> b!152743 m!238591))

(declare-fun m!238593 () Bool)

(assert (=> b!152747 m!238593))

(declare-fun m!238595 () Bool)

(assert (=> b!152744 m!238595))

(push 1)

(assert (not b!152744))

(assert (not start!29626))

(assert (not b!152743))

(assert (not b!152747))

(assert (not b!152745))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50222 () Bool)

(declare-fun e!102292 () Bool)

(assert (=> d!50222 e!102292))

(declare-fun res!128042 () Bool)

(assert (=> d!50222 (=> (not res!128042) (not e!102292))))

(declare-fun lt!239246 () (_ BitVec 64))

(declare-fun lt!239247 () (_ BitVec 64))

(declare-fun lt!239250 () (_ BitVec 64))

(assert (=> d!50222 (= res!128042 (= lt!239250 (bvsub lt!239246 lt!239247)))))

(assert (=> d!50222 (or (= (bvand lt!239246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239247 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239246 lt!239247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50222 (= lt!239247 (remainingBits!0 ((_ sign_extend 32) (size!3091 (buf!3594 bs1!10))) ((_ sign_extend 32) (currentByte!6565 bs1!10)) ((_ sign_extend 32) (currentBit!6560 bs1!10))))))

(declare-fun lt!239248 () (_ BitVec 64))

(declare-fun lt!239251 () (_ BitVec 64))

(assert (=> d!50222 (= lt!239246 (bvmul lt!239248 lt!239251))))

(assert (=> d!50222 (or (= lt!239248 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239251 (bvsdiv (bvmul lt!239248 lt!239251) lt!239248)))))

(assert (=> d!50222 (= lt!239251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50222 (= lt!239248 ((_ sign_extend 32) (size!3091 (buf!3594 bs1!10))))))

(assert (=> d!50222 (= lt!239250 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6565 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6560 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50222 (invariant!0 (currentBit!6560 bs1!10) (currentByte!6565 bs1!10) (size!3091 (buf!3594 bs1!10)))))

(assert (=> d!50222 (= (bitIndex!0 (size!3091 (buf!3594 bs1!10)) (currentByte!6565 bs1!10) (currentBit!6560 bs1!10)) lt!239250)))

(declare-fun b!152790 () Bool)

(declare-fun res!128041 () Bool)

(assert (=> b!152790 (=> (not res!128041) (not e!102292))))

(assert (=> b!152790 (= res!128041 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239250))))

(declare-fun b!152791 () Bool)

(declare-fun lt!239249 () (_ BitVec 64))

(assert (=> b!152791 (= e!102292 (bvsle lt!239250 (bvmul lt!239249 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152791 (or (= lt!239249 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239249 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239249)))))

(assert (=> b!152791 (= lt!239249 ((_ sign_extend 32) (size!3091 (buf!3594 bs1!10))))))

(assert (= (and d!50222 res!128042) b!152790))

(assert (= (and b!152790 res!128041) b!152791))

(declare-fun m!238629 () Bool)

(assert (=> d!50222 m!238629))

(declare-fun m!238631 () Bool)

(assert (=> d!50222 m!238631))

(assert (=> b!152744 d!50222))

(declare-fun d!50240 () Bool)

(assert (=> d!50240 (= (inv!12 bs1!10) (invariant!0 (currentBit!6560 bs1!10) (currentByte!6565 bs1!10) (size!3091 (buf!3594 bs1!10))))))

(declare-fun bs!12283 () Bool)

(assert (= bs!12283 d!50240))

(assert (=> bs!12283 m!238631))

(assert (=> start!29626 d!50240))

(declare-fun d!50242 () Bool)

(assert (=> d!50242 (= (inv!12 bs2!18) (invariant!0 (currentBit!6560 bs2!18) (currentByte!6565 bs2!18) (size!3091 (buf!3594 bs2!18))))))

(declare-fun bs!12284 () Bool)

(assert (= bs!12284 d!50242))

(declare-fun m!238633 () Bool)

(assert (=> bs!12284 m!238633))

(assert (=> start!29626 d!50242))

(declare-fun d!50244 () Bool)

(declare-fun e!102293 () Bool)

(assert (=> d!50244 e!102293))

(declare-fun res!128044 () Bool)

(assert (=> d!50244 (=> (not res!128044) (not e!102293))))

(declare-fun lt!239253 () (_ BitVec 64))

(declare-fun lt!239252 () (_ BitVec 64))

(declare-fun lt!239256 () (_ BitVec 64))

(assert (=> d!50244 (= res!128044 (= lt!239256 (bvsub lt!239252 lt!239253)))))

(assert (=> d!50244 (or (= (bvand lt!239252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!239253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!239252 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!239252 lt!239253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50244 (= lt!239253 (remainingBits!0 ((_ sign_extend 32) (size!3091 (buf!3594 bs2!18))) ((_ sign_extend 32) (currentByte!6565 bs2!18)) ((_ sign_extend 32) (currentBit!6560 bs2!18))))))

(declare-fun lt!239254 () (_ BitVec 64))

(declare-fun lt!239257 () (_ BitVec 64))

(assert (=> d!50244 (= lt!239252 (bvmul lt!239254 lt!239257))))

(assert (=> d!50244 (or (= lt!239254 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!239257 (bvsdiv (bvmul lt!239254 lt!239257) lt!239254)))))

(assert (=> d!50244 (= lt!239257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50244 (= lt!239254 ((_ sign_extend 32) (size!3091 (buf!3594 bs2!18))))))

(assert (=> d!50244 (= lt!239256 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6565 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6560 bs2!18))))))

(assert (=> d!50244 (invariant!0 (currentBit!6560 bs2!18) (currentByte!6565 bs2!18) (size!3091 (buf!3594 bs2!18)))))

(assert (=> d!50244 (= (bitIndex!0 (size!3091 (buf!3594 bs2!18)) (currentByte!6565 bs2!18) (currentBit!6560 bs2!18)) lt!239256)))

(declare-fun b!152792 () Bool)

(declare-fun res!128043 () Bool)

(assert (=> b!152792 (=> (not res!128043) (not e!102293))))

(assert (=> b!152792 (= res!128043 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!239256))))

(declare-fun b!152793 () Bool)

(declare-fun lt!239255 () (_ BitVec 64))

(assert (=> b!152793 (= e!102293 (bvsle lt!239256 (bvmul lt!239255 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152793 (or (= lt!239255 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!239255 #b0000000000000000000000000000000000000000000000000000000000001000) lt!239255)))))

(assert (=> b!152793 (= lt!239255 ((_ sign_extend 32) (size!3091 (buf!3594 bs2!18))))))

(assert (= (and d!50244 res!128044) b!152792))

(assert (= (and b!152792 res!128043) b!152793))

(declare-fun m!238635 () Bool)

(assert (=> d!50244 m!238635))

(assert (=> d!50244 m!238633))

(assert (=> b!152745 d!50244))

(declare-fun d!50246 () Bool)

(assert (=> d!50246 (= (array_inv!2880 (buf!3594 bs2!18)) (bvsge (size!3091 (buf!3594 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152747 d!50246))

(declare-fun d!50248 () Bool)

(assert (=> d!50248 (= (array_inv!2880 (buf!3594 bs1!10)) (bvsge (size!3091 (buf!3594 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152743 d!50248))

(push 1)

(assert (not d!50242))

(assert (not d!50244))

(assert (not d!50240))

(assert (not d!50222))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

