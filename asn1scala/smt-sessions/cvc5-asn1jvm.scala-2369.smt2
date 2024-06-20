; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60410 () Bool)

(assert start!60410)

(declare-fun res!228024 () Bool)

(declare-fun e!193970 () Bool)

(assert (=> start!60410 (=> (not res!228024) (not e!193970))))

(declare-datatypes ((array!15465 0))(
  ( (array!15466 (arr!7699 (Array (_ BitVec 32) (_ BitVec 8))) (size!6712 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12238 0))(
  ( (BitStream!12239 (buf!7180 array!15465) (currentByte!13251 (_ BitVec 32)) (currentBit!13246 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12238)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12238 (_ BitVec 64)) Bool)

(assert (=> start!60410 (= res!228024 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60410 e!193970))

(declare-fun e!193971 () Bool)

(declare-fun inv!12 (BitStream!12238) Bool)

(assert (=> start!60410 (and (inv!12 thiss!882) e!193971)))

(assert (=> start!60410 true))

(declare-fun b!274051 () Bool)

(declare-fun res!228025 () Bool)

(assert (=> b!274051 (=> (not res!228025) (not e!193970))))

(assert (=> b!274051 (= res!228025 (bvslt (bvadd (currentBit!13246 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000))))

(declare-fun b!274052 () Bool)

(assert (=> b!274052 (= e!193970 (not (inv!12 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882)))))))

(declare-fun b!274053 () Bool)

(declare-fun array_inv!6436 (array!15465) Bool)

(assert (=> b!274053 (= e!193971 (array_inv!6436 (buf!7180 thiss!882)))))

(assert (= (and start!60410 res!228024) b!274051))

(assert (= (and b!274051 res!228025) b!274052))

(assert (= start!60410 b!274053))

(declare-fun m!406811 () Bool)

(assert (=> start!60410 m!406811))

(declare-fun m!406813 () Bool)

(assert (=> start!60410 m!406813))

(declare-fun m!406815 () Bool)

(assert (=> b!274052 m!406815))

(declare-fun m!406817 () Bool)

(assert (=> b!274053 m!406817))

(push 1)

(assert (not b!274053))

(assert (not b!274052))

(assert (not start!60410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93956 () Bool)

(assert (=> d!93956 (= (array_inv!6436 (buf!7180 thiss!882)) (bvsge (size!6712 (buf!7180 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274053 d!93956))

(declare-fun d!93958 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93958 (= (inv!12 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) (invariant!0 (currentBit!13246 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) (currentByte!13251 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) (size!6712 (buf!7180 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))))))))

(declare-fun bs!23676 () Bool)

(assert (= bs!23676 d!93958))

(declare-fun m!406837 () Bool)

(assert (=> bs!23676 m!406837))

(assert (=> b!274052 d!93958))

(declare-fun d!93960 () Bool)

(declare-fun res!228040 () Bool)

(declare-fun e!193993 () Bool)

(assert (=> d!93960 (=> (not res!228040) (not e!193993))))

(assert (=> d!93960 (= res!228040 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6712 (buf!7180 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6712 (buf!7180 thiss!882)))))))))

(assert (=> d!93960 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193993)))

(declare-fun b!274075 () Bool)

(declare-fun lt!412082 () (_ BitVec 64))

(assert (=> b!274075 (= e!193993 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412082) (bvsle lt!412082 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6712 (buf!7180 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274075 (= lt!412082 (bvadd (bitIndex!0 (size!6712 (buf!7180 thiss!882)) (currentByte!13251 thiss!882) (currentBit!13246 thiss!882)) diffInBits!15))))

(assert (= (and d!93960 res!228040) b!274075))

(declare-fun m!406839 () Bool)

(assert (=> b!274075 m!406839))

(assert (=> start!60410 d!93960))

(declare-fun d!93962 () Bool)

(assert (=> d!93962 (= (inv!12 thiss!882) (invariant!0 (currentBit!13246 thiss!882) (currentByte!13251 thiss!882) (size!6712 (buf!7180 thiss!882))))))

(declare-fun bs!23677 () Bool)

(assert (= bs!23677 d!93962))

(declare-fun m!406841 () Bool)

(assert (=> bs!23677 m!406841))

(assert (=> start!60410 d!93962))

(push 1)

(assert (not d!93958))

(assert (not d!93962))

(assert (not b!274075))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93974 () Bool)

(assert (=> d!93974 (= (invariant!0 (currentBit!13246 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) (currentByte!13251 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) (size!6712 (buf!7180 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))))) (and (bvsge (currentBit!13246 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) #b00000000000000000000000000000000) (bvslt (currentBit!13246 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) #b00000000000000000000000000001000) (bvsge (currentByte!13251 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13251 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) (size!6712 (buf!7180 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))))) (and (= (currentBit!13246 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) #b00000000000000000000000000000000) (= (currentByte!13251 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882))) (size!6712 (buf!7180 (BitStream!12239 (buf!7180 thiss!882) (bvsub (bvadd (currentByte!13251 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13246 thiss!882)))))))))))

(assert (=> d!93958 d!93974))

(declare-fun d!93976 () Bool)

(assert (=> d!93976 (= (invariant!0 (currentBit!13246 thiss!882) (currentByte!13251 thiss!882) (size!6712 (buf!7180 thiss!882))) (and (bvsge (currentBit!13246 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13246 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13251 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13251 thiss!882) (size!6712 (buf!7180 thiss!882))) (and (= (currentBit!13246 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13251 thiss!882) (size!6712 (buf!7180 thiss!882)))))))))

(assert (=> d!93962 d!93976))

(declare-fun d!93978 () Bool)

(declare-fun e!194002 () Bool)

(assert (=> d!93978 e!194002))

(declare-fun res!228051 () Bool)

(assert (=> d!93978 (=> (not res!228051) (not e!194002))))

(declare-fun lt!412105 () (_ BitVec 64))

(declare-fun lt!412101 () (_ BitVec 64))

(declare-fun lt!412103 () (_ BitVec 64))

(assert (=> d!93978 (= res!228051 (= lt!412105 (bvsub lt!412101 lt!412103)))))

(assert (=> d!93978 (or (= (bvand lt!412101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412101 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412101 lt!412103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93978 (= lt!412103 (remainingBits!0 ((_ sign_extend 32) (size!6712 (buf!7180 thiss!882))) ((_ sign_extend 32) (currentByte!13251 thiss!882)) ((_ sign_extend 32) (currentBit!13246 thiss!882))))))

(declare-fun lt!412102 () (_ BitVec 64))

(declare-fun lt!412104 () (_ BitVec 64))

(assert (=> d!93978 (= lt!412101 (bvmul lt!412102 lt!412104))))

(assert (=> d!93978 (or (= lt!412102 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412104 (bvsdiv (bvmul lt!412102 lt!412104) lt!412102)))))

(assert (=> d!93978 (= lt!412104 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93978 (= lt!412102 ((_ sign_extend 32) (size!6712 (buf!7180 thiss!882))))))

(assert (=> d!93978 (= lt!412105 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13251 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13246 thiss!882))))))

(assert (=> d!93978 (invariant!0 (currentBit!13246 thiss!882) (currentByte!13251 thiss!882) (size!6712 (buf!7180 thiss!882)))))

(assert (=> d!93978 (= (bitIndex!0 (size!6712 (buf!7180 thiss!882)) (currentByte!13251 thiss!882) (currentBit!13246 thiss!882)) lt!412105)))

(declare-fun b!274088 () Bool)

(declare-fun res!228052 () Bool)

(assert (=> b!274088 (=> (not res!228052) (not e!194002))))

(assert (=> b!274088 (= res!228052 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412105))))

(declare-fun b!274089 () Bool)

(declare-fun lt!412106 () (_ BitVec 64))

(assert (=> b!274089 (= e!194002 (bvsle lt!412105 (bvmul lt!412106 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274089 (or (= lt!412106 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412106 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412106)))))

(assert (=> b!274089 (= lt!412106 ((_ sign_extend 32) (size!6712 (buf!7180 thiss!882))))))

(assert (= (and d!93978 res!228051) b!274088))

(assert (= (and b!274088 res!228052) b!274089))

(declare-fun m!406853 () Bool)

(assert (=> d!93978 m!406853))

(assert (=> d!93978 m!406841))

(assert (=> b!274075 d!93978))

(push 1)

(assert (not d!93978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

