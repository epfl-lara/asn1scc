; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60414 () Bool)

(assert start!60414)

(declare-fun res!228036 () Bool)

(declare-fun e!193988 () Bool)

(assert (=> start!60414 (=> (not res!228036) (not e!193988))))

(declare-datatypes ((array!15469 0))(
  ( (array!15470 (arr!7701 (Array (_ BitVec 32) (_ BitVec 8))) (size!6714 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12242 0))(
  ( (BitStream!12243 (buf!7182 array!15469) (currentByte!13253 (_ BitVec 32)) (currentBit!13248 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12242)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12242 (_ BitVec 64)) Bool)

(assert (=> start!60414 (= res!228036 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60414 e!193988))

(declare-fun e!193990 () Bool)

(declare-fun inv!12 (BitStream!12242) Bool)

(assert (=> start!60414 (and (inv!12 thiss!882) e!193990)))

(assert (=> start!60414 true))

(declare-fun b!274069 () Bool)

(declare-fun res!228037 () Bool)

(assert (=> b!274069 (=> (not res!228037) (not e!193988))))

(assert (=> b!274069 (= res!228037 (bvslt (bvadd (currentBit!13248 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000))))

(declare-fun b!274070 () Bool)

(assert (=> b!274070 (= e!193988 (not (inv!12 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882)))))))

(declare-fun b!274071 () Bool)

(declare-fun array_inv!6438 (array!15469) Bool)

(assert (=> b!274071 (= e!193990 (array_inv!6438 (buf!7182 thiss!882)))))

(assert (= (and start!60414 res!228036) b!274069))

(assert (= (and b!274069 res!228037) b!274070))

(assert (= start!60414 b!274071))

(declare-fun m!406827 () Bool)

(assert (=> start!60414 m!406827))

(declare-fun m!406829 () Bool)

(assert (=> start!60414 m!406829))

(declare-fun m!406831 () Bool)

(assert (=> b!274070 m!406831))

(declare-fun m!406833 () Bool)

(assert (=> b!274071 m!406833))

(push 1)

(assert (not b!274070))

(assert (not start!60414))

(assert (not b!274071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93964 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93964 (= (inv!12 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) (invariant!0 (currentBit!13248 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) (currentByte!13253 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) (size!6714 (buf!7182 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))))))))

(declare-fun bs!23678 () Bool)

(assert (= bs!23678 d!93964))

(declare-fun m!406843 () Bool)

(assert (=> bs!23678 m!406843))

(assert (=> b!274070 d!93964))

(declare-fun d!93966 () Bool)

(declare-fun res!228046 () Bool)

(declare-fun e!193999 () Bool)

(assert (=> d!93966 (=> (not res!228046) (not e!193999))))

(assert (=> d!93966 (= res!228046 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6714 (buf!7182 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6714 (buf!7182 thiss!882)))))))))

(assert (=> d!93966 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193999)))

(declare-fun b!274083 () Bool)

(declare-fun lt!412088 () (_ BitVec 64))

(assert (=> b!274083 (= e!193999 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412088) (bvsle lt!412088 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6714 (buf!7182 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274083 (= lt!412088 (bvadd (bitIndex!0 (size!6714 (buf!7182 thiss!882)) (currentByte!13253 thiss!882) (currentBit!13248 thiss!882)) diffInBits!15))))

(assert (= (and d!93966 res!228046) b!274083))

(declare-fun m!406849 () Bool)

(assert (=> b!274083 m!406849))

(assert (=> start!60414 d!93966))

(declare-fun d!93970 () Bool)

(assert (=> d!93970 (= (inv!12 thiss!882) (invariant!0 (currentBit!13248 thiss!882) (currentByte!13253 thiss!882) (size!6714 (buf!7182 thiss!882))))))

(declare-fun bs!23680 () Bool)

(assert (= bs!23680 d!93970))

(declare-fun m!406851 () Bool)

(assert (=> bs!23680 m!406851))

(assert (=> start!60414 d!93970))

(declare-fun d!93972 () Bool)

(assert (=> d!93972 (= (array_inv!6438 (buf!7182 thiss!882)) (bvsge (size!6714 (buf!7182 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274071 d!93972))

(push 1)

(assert (not b!274083))

(assert (not d!93970))

(assert (not d!93964))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93984 () Bool)

(declare-fun e!194008 () Bool)

(assert (=> d!93984 e!194008))

(declare-fun res!228064 () Bool)

(assert (=> d!93984 (=> (not res!228064) (not e!194008))))

(declare-fun lt!412141 () (_ BitVec 64))

(declare-fun lt!412137 () (_ BitVec 64))

(declare-fun lt!412138 () (_ BitVec 64))

(assert (=> d!93984 (= res!228064 (= lt!412137 (bvsub lt!412138 lt!412141)))))

(assert (=> d!93984 (or (= (bvand lt!412138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412141 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412138 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412138 lt!412141) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93984 (= lt!412141 (remainingBits!0 ((_ sign_extend 32) (size!6714 (buf!7182 thiss!882))) ((_ sign_extend 32) (currentByte!13253 thiss!882)) ((_ sign_extend 32) (currentBit!13248 thiss!882))))))

(declare-fun lt!412142 () (_ BitVec 64))

(declare-fun lt!412140 () (_ BitVec 64))

(assert (=> d!93984 (= lt!412138 (bvmul lt!412142 lt!412140))))

(assert (=> d!93984 (or (= lt!412142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412140 (bvsdiv (bvmul lt!412142 lt!412140) lt!412142)))))

(assert (=> d!93984 (= lt!412140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93984 (= lt!412142 ((_ sign_extend 32) (size!6714 (buf!7182 thiss!882))))))

(assert (=> d!93984 (= lt!412137 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13253 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13248 thiss!882))))))

(assert (=> d!93984 (invariant!0 (currentBit!13248 thiss!882) (currentByte!13253 thiss!882) (size!6714 (buf!7182 thiss!882)))))

(assert (=> d!93984 (= (bitIndex!0 (size!6714 (buf!7182 thiss!882)) (currentByte!13253 thiss!882) (currentBit!13248 thiss!882)) lt!412137)))

(declare-fun b!274100 () Bool)

(declare-fun res!228063 () Bool)

(assert (=> b!274100 (=> (not res!228063) (not e!194008))))

(assert (=> b!274100 (= res!228063 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412137))))

(declare-fun b!274101 () Bool)

(declare-fun lt!412139 () (_ BitVec 64))

(assert (=> b!274101 (= e!194008 (bvsle lt!412137 (bvmul lt!412139 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274101 (or (= lt!412139 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412139 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412139)))))

(assert (=> b!274101 (= lt!412139 ((_ sign_extend 32) (size!6714 (buf!7182 thiss!882))))))

(assert (= (and d!93984 res!228064) b!274100))

(assert (= (and b!274100 res!228063) b!274101))

(declare-fun m!406857 () Bool)

(assert (=> d!93984 m!406857))

(assert (=> d!93984 m!406851))

(assert (=> b!274083 d!93984))

(declare-fun d!93988 () Bool)

(assert (=> d!93988 (= (invariant!0 (currentBit!13248 thiss!882) (currentByte!13253 thiss!882) (size!6714 (buf!7182 thiss!882))) (and (bvsge (currentBit!13248 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13248 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13253 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13253 thiss!882) (size!6714 (buf!7182 thiss!882))) (and (= (currentBit!13248 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13253 thiss!882) (size!6714 (buf!7182 thiss!882)))))))))

(assert (=> d!93970 d!93988))

(declare-fun d!93990 () Bool)

(assert (=> d!93990 (= (invariant!0 (currentBit!13248 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) (currentByte!13253 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) (size!6714 (buf!7182 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))))) (and (bvsge (currentBit!13248 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) #b00000000000000000000000000000000) (bvslt (currentBit!13248 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) #b00000000000000000000000000001000) (bvsge (currentByte!13253 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13253 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) (size!6714 (buf!7182 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))))) (and (= (currentBit!13248 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) #b00000000000000000000000000000000) (= (currentByte!13253 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882))) (size!6714 (buf!7182 (BitStream!12243 (buf!7182 thiss!882) (bvsub (bvadd (currentByte!13253 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (currentBit!13248 thiss!882)))))))))))

(assert (=> d!93964 d!93990))

(push 1)

(assert (not d!93984))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

