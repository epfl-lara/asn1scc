; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60742 () Bool)

(assert start!60742)

(declare-fun res!228429 () Bool)

(declare-fun e!194485 () Bool)

(assert (=> start!60742 (=> (not res!228429) (not e!194485))))

(declare-datatypes ((array!15562 0))(
  ( (array!15563 (arr!7734 (Array (_ BitVec 32) (_ BitVec 8))) (size!6747 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12308 0))(
  ( (BitStream!12309 (buf!7215 array!15562) (currentByte!13336 (_ BitVec 32)) (currentBit!13331 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12308)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12308 (_ BitVec 64)) Bool)

(assert (=> start!60742 (= res!228429 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60742 e!194485))

(declare-fun e!194486 () Bool)

(declare-fun inv!12 (BitStream!12308) Bool)

(assert (=> start!60742 (and (inv!12 thiss!882) e!194486)))

(assert (=> start!60742 true))

(declare-fun b!274588 () Bool)

(declare-fun e!194487 () Bool)

(assert (=> b!274588 (= e!194485 e!194487)))

(declare-fun res!228430 () Bool)

(assert (=> b!274588 (=> (not res!228430) (not e!194487))))

(declare-fun lt!412790 () (_ BitVec 32))

(assert (=> b!274588 (= res!228430 (and (bvsge lt!412790 #b00000000000000000000000000000000) (bvsge lt!412790 #b00000000000000000000000000001000)))))

(assert (=> b!274588 (= lt!412790 (bvadd (currentBit!13331 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274589 () Bool)

(assert (=> b!274589 (= e!194487 (not (inv!12 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000)))))))

(declare-fun b!274590 () Bool)

(declare-fun array_inv!6471 (array!15562) Bool)

(assert (=> b!274590 (= e!194486 (array_inv!6471 (buf!7215 thiss!882)))))

(assert (= (and start!60742 res!228429) b!274588))

(assert (= (and b!274588 res!228430) b!274589))

(assert (= start!60742 b!274590))

(declare-fun m!407241 () Bool)

(assert (=> start!60742 m!407241))

(declare-fun m!407243 () Bool)

(assert (=> start!60742 m!407243))

(declare-fun m!407245 () Bool)

(assert (=> b!274589 m!407245))

(declare-fun m!407247 () Bool)

(assert (=> b!274590 m!407247))

(push 1)

(assert (not start!60742))

(assert (not b!274589))

(assert (not b!274590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94298 () Bool)

(declare-fun res!228439 () Bool)

(declare-fun e!194497 () Bool)

(assert (=> d!94298 (=> (not res!228439) (not e!194497))))

(assert (=> d!94298 (= res!228439 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6747 (buf!7215 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6747 (buf!7215 thiss!882)))))))))

(assert (=> d!94298 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194497)))

(declare-fun b!274602 () Bool)

(declare-fun lt!412799 () (_ BitVec 64))

(assert (=> b!274602 (= e!194497 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412799) (bvsle lt!412799 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6747 (buf!7215 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274602 (= lt!412799 (bvadd (bitIndex!0 (size!6747 (buf!7215 thiss!882)) (currentByte!13336 thiss!882) (currentBit!13331 thiss!882)) diffInBits!15))))

(assert (= (and d!94298 res!228439) b!274602))

(declare-fun m!407261 () Bool)

(assert (=> b!274602 m!407261))

(assert (=> start!60742 d!94298))

(declare-fun d!94300 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94300 (= (inv!12 thiss!882) (invariant!0 (currentBit!13331 thiss!882) (currentByte!13336 thiss!882) (size!6747 (buf!7215 thiss!882))))))

(declare-fun bs!23748 () Bool)

(assert (= bs!23748 d!94300))

(declare-fun m!407263 () Bool)

(assert (=> bs!23748 m!407263))

(assert (=> start!60742 d!94300))

(declare-fun d!94302 () Bool)

(assert (=> d!94302 (= (inv!12 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) (invariant!0 (currentBit!13331 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) (currentByte!13336 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) (size!6747 (buf!7215 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))))))))

(declare-fun bs!23749 () Bool)

(assert (= bs!23749 d!94302))

(declare-fun m!407265 () Bool)

(assert (=> bs!23749 m!407265))

(assert (=> b!274589 d!94302))

(declare-fun d!94304 () Bool)

(assert (=> d!94304 (= (array_inv!6471 (buf!7215 thiss!882)) (bvsge (size!6747 (buf!7215 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274590 d!94304))

(push 1)

(assert (not d!94300))

(assert (not b!274602))

(assert (not d!94302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94314 () Bool)

(assert (=> d!94314 (= (invariant!0 (currentBit!13331 thiss!882) (currentByte!13336 thiss!882) (size!6747 (buf!7215 thiss!882))) (and (bvsge (currentBit!13331 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13331 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13336 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13336 thiss!882) (size!6747 (buf!7215 thiss!882))) (and (= (currentBit!13331 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13336 thiss!882) (size!6747 (buf!7215 thiss!882)))))))))

(assert (=> d!94300 d!94314))

(declare-fun d!94318 () Bool)

(declare-fun e!194506 () Bool)

(assert (=> d!94318 e!194506))

(declare-fun res!228456 () Bool)

(assert (=> d!94318 (=> (not res!228456) (not e!194506))))

(declare-fun lt!412851 () (_ BitVec 64))

(declare-fun lt!412850 () (_ BitVec 64))

(declare-fun lt!412848 () (_ BitVec 64))

(assert (=> d!94318 (= res!228456 (= lt!412851 (bvsub lt!412848 lt!412850)))))

(assert (=> d!94318 (or (= (bvand lt!412848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412850 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412848 lt!412850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94318 (= lt!412850 (remainingBits!0 ((_ sign_extend 32) (size!6747 (buf!7215 thiss!882))) ((_ sign_extend 32) (currentByte!13336 thiss!882)) ((_ sign_extend 32) (currentBit!13331 thiss!882))))))

(declare-fun lt!412853 () (_ BitVec 64))

(declare-fun lt!412852 () (_ BitVec 64))

(assert (=> d!94318 (= lt!412848 (bvmul lt!412853 lt!412852))))

(assert (=> d!94318 (or (= lt!412853 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412852 (bvsdiv (bvmul lt!412853 lt!412852) lt!412853)))))

(assert (=> d!94318 (= lt!412852 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94318 (= lt!412853 ((_ sign_extend 32) (size!6747 (buf!7215 thiss!882))))))

(assert (=> d!94318 (= lt!412851 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13336 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13331 thiss!882))))))

(assert (=> d!94318 (invariant!0 (currentBit!13331 thiss!882) (currentByte!13336 thiss!882) (size!6747 (buf!7215 thiss!882)))))

(assert (=> d!94318 (= (bitIndex!0 (size!6747 (buf!7215 thiss!882)) (currentByte!13336 thiss!882) (currentBit!13331 thiss!882)) lt!412851)))

(declare-fun b!274619 () Bool)

(declare-fun res!228457 () Bool)

(assert (=> b!274619 (=> (not res!228457) (not e!194506))))

(assert (=> b!274619 (= res!228457 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412851))))

(declare-fun b!274620 () Bool)

(declare-fun lt!412849 () (_ BitVec 64))

(assert (=> b!274620 (= e!194506 (bvsle lt!412851 (bvmul lt!412849 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274620 (or (= lt!412849 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412849 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412849)))))

(assert (=> b!274620 (= lt!412849 ((_ sign_extend 32) (size!6747 (buf!7215 thiss!882))))))

(assert (= (and d!94318 res!228456) b!274619))

(assert (= (and b!274619 res!228457) b!274620))

(declare-fun m!407271 () Bool)

(assert (=> d!94318 m!407271))

(assert (=> d!94318 m!407263))

(assert (=> b!274602 d!94318))

(declare-fun d!94320 () Bool)

(assert (=> d!94320 (= (invariant!0 (currentBit!13331 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) (currentByte!13336 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) (size!6747 (buf!7215 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))))) (and (bvsge (currentBit!13331 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (bvslt (currentBit!13331 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) #b00000000000000000000000000001000) (bvsge (currentByte!13336 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13336 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) (size!6747 (buf!7215 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))))) (and (= (currentBit!13331 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (= (currentByte!13336 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000))) (size!6747 (buf!7215 (BitStream!12309 (buf!7215 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13336 thiss!882)) (bvsub lt!412790 #b00000000000000000000000000001000)))))))))))

(assert (=> d!94302 d!94320))

(push 1)

(assert (not d!94318))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

