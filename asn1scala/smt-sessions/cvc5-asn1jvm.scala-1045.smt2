; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29998 () Bool)

(assert start!29998)

(declare-fun res!128937 () Bool)

(declare-fun e!103394 () Bool)

(assert (=> start!29998 (=> (not res!128937) (not e!103394))))

(declare-datatypes ((array!6944 0))(
  ( (array!6945 (arr!3953 (Array (_ BitVec 32) (_ BitVec 8))) (size!3130 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5518 0))(
  ( (BitStream!5519 (buf!3633 array!6944) (currentByte!6646 (_ BitVec 32)) (currentBit!6641 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5518)

(declare-fun bs2!18 () BitStream!5518)

(assert (=> start!29998 (= res!128937 (= (size!3130 (buf!3633 bs1!10)) (size!3130 (buf!3633 bs2!18))))))

(assert (=> start!29998 e!103394))

(declare-fun e!103398 () Bool)

(declare-fun inv!12 (BitStream!5518) Bool)

(assert (=> start!29998 (and (inv!12 bs1!10) e!103398)))

(declare-fun e!103395 () Bool)

(assert (=> start!29998 (and (inv!12 bs2!18) e!103395)))

(declare-fun lt!240382 () (_ BitVec 64))

(declare-fun b!153990 () Bool)

(declare-fun lt!240381 () (_ BitVec 64))

(assert (=> b!153990 (= e!103394 (and (bvsle lt!240382 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3130 (buf!3633 bs1!10))))) (let ((bdg!8949 (bvand lt!240381 #b1000000000000000000000000000000000000000000000000000000000000000))) (and (= bdg!8949 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= bdg!8949 (bvand lt!240382 #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!153990 (= lt!240382 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240381))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153990 (= lt!240381 (bitIndex!0 (size!3130 (buf!3633 bs1!10)) (currentByte!6646 bs1!10) (currentBit!6641 bs1!10)))))

(declare-fun b!153991 () Bool)

(declare-fun array_inv!2919 (array!6944) Bool)

(assert (=> b!153991 (= e!103398 (array_inv!2919 (buf!3633 bs1!10)))))

(declare-fun b!153992 () Bool)

(assert (=> b!153992 (= e!103395 (array_inv!2919 (buf!3633 bs2!18)))))

(assert (= (and start!29998 res!128937) b!153990))

(assert (= start!29998 b!153991))

(assert (= start!29998 b!153992))

(declare-fun m!239983 () Bool)

(assert (=> start!29998 m!239983))

(declare-fun m!239985 () Bool)

(assert (=> start!29998 m!239985))

(declare-fun m!239987 () Bool)

(assert (=> b!153990 m!239987))

(declare-fun m!239989 () Bool)

(assert (=> b!153991 m!239989))

(declare-fun m!239991 () Bool)

(assert (=> b!153992 m!239991))

(push 1)

(assert (not b!153992))

(assert (not b!153991))

(assert (not start!29998))

(assert (not b!153990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50764 () Bool)

(assert (=> d!50764 (= (array_inv!2919 (buf!3633 bs2!18)) (bvsge (size!3130 (buf!3633 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153992 d!50764))

(declare-fun d!50766 () Bool)

(assert (=> d!50766 (= (array_inv!2919 (buf!3633 bs1!10)) (bvsge (size!3130 (buf!3633 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153991 d!50766))

(declare-fun d!50768 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50768 (= (inv!12 bs1!10) (invariant!0 (currentBit!6641 bs1!10) (currentByte!6646 bs1!10) (size!3130 (buf!3633 bs1!10))))))

(declare-fun bs!12413 () Bool)

(assert (= bs!12413 d!50768))

(declare-fun m!240013 () Bool)

(assert (=> bs!12413 m!240013))

(assert (=> start!29998 d!50768))

(declare-fun d!50770 () Bool)

(assert (=> d!50770 (= (inv!12 bs2!18) (invariant!0 (currentBit!6641 bs2!18) (currentByte!6646 bs2!18) (size!3130 (buf!3633 bs2!18))))))

(declare-fun bs!12414 () Bool)

(assert (= bs!12414 d!50770))

(declare-fun m!240015 () Bool)

(assert (=> bs!12414 m!240015))

(assert (=> start!29998 d!50770))

(declare-fun d!50772 () Bool)

(declare-fun e!103433 () Bool)

(assert (=> d!50772 e!103433))

(declare-fun res!128952 () Bool)

(assert (=> d!50772 (=> (not res!128952) (not e!103433))))

(declare-fun lt!240421 () (_ BitVec 64))

(declare-fun lt!240419 () (_ BitVec 64))

(declare-fun lt!240418 () (_ BitVec 64))

(assert (=> d!50772 (= res!128952 (= lt!240419 (bvsub lt!240421 lt!240418)))))

(assert (=> d!50772 (or (= (bvand lt!240421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240418 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240421 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240421 lt!240418) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50772 (= lt!240418 (remainingBits!0 ((_ sign_extend 32) (size!3130 (buf!3633 bs1!10))) ((_ sign_extend 32) (currentByte!6646 bs1!10)) ((_ sign_extend 32) (currentBit!6641 bs1!10))))))

(declare-fun lt!240422 () (_ BitVec 64))

(declare-fun lt!240417 () (_ BitVec 64))

(assert (=> d!50772 (= lt!240421 (bvmul lt!240422 lt!240417))))

(assert (=> d!50772 (or (= lt!240422 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240417 (bvsdiv (bvmul lt!240422 lt!240417) lt!240422)))))

(assert (=> d!50772 (= lt!240417 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50772 (= lt!240422 ((_ sign_extend 32) (size!3130 (buf!3633 bs1!10))))))

(assert (=> d!50772 (= lt!240419 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6646 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6641 bs1!10))))))

(assert (=> d!50772 (invariant!0 (currentBit!6641 bs1!10) (currentByte!6646 bs1!10) (size!3130 (buf!3633 bs1!10)))))

(assert (=> d!50772 (= (bitIndex!0 (size!3130 (buf!3633 bs1!10)) (currentByte!6646 bs1!10) (currentBit!6641 bs1!10)) lt!240419)))

(declare-fun b!154019 () Bool)

(declare-fun res!128953 () Bool)

(assert (=> b!154019 (=> (not res!128953) (not e!103433))))

(assert (=> b!154019 (= res!128953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240419))))

(declare-fun b!154020 () Bool)

(declare-fun lt!240420 () (_ BitVec 64))

(assert (=> b!154020 (= e!103433 (bvsle lt!240419 (bvmul lt!240420 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154020 (or (= lt!240420 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240420 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240420)))))

(assert (=> b!154020 (= lt!240420 ((_ sign_extend 32) (size!3130 (buf!3633 bs1!10))))))

(assert (= (and d!50772 res!128952) b!154019))

(assert (= (and b!154019 res!128953) b!154020))

(declare-fun m!240021 () Bool)

(assert (=> d!50772 m!240021))

(assert (=> d!50772 m!240013))

(assert (=> b!153990 d!50772))

(push 1)

(assert (not d!50770))

(assert (not d!50772))

(assert (not d!50768))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

