; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60776 () Bool)

(assert start!60776)

(declare-fun res!228463 () Bool)

(declare-fun e!194524 () Bool)

(assert (=> start!60776 (=> (not res!228463) (not e!194524))))

(declare-datatypes ((array!15569 0))(
  ( (array!15570 (arr!7736 (Array (_ BitVec 32) (_ BitVec 8))) (size!6749 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12312 0))(
  ( (BitStream!12313 (buf!7217 array!15569) (currentByte!13344 (_ BitVec 32)) (currentBit!13339 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12312)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12312 (_ BitVec 64)) Bool)

(assert (=> start!60776 (= res!228463 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60776 e!194524))

(declare-fun e!194522 () Bool)

(declare-fun inv!12 (BitStream!12312) Bool)

(assert (=> start!60776 (and (inv!12 thiss!882) e!194522)))

(assert (=> start!60776 true))

(declare-fun lt!412865 () (_ BitVec 32))

(declare-fun lt!412864 () (_ BitVec 32))

(declare-fun b!274631 () Bool)

(assert (=> b!274631 (= e!194524 (and (bvsge lt!412864 #b00000000000000000000000000000000) (bvsge lt!412864 #b00000000000000000000000000001000) (let ((bdg!16601 (bvand (bvadd (currentByte!13344 thiss!882) lt!412865) #b10000000000000000000000000000000))) (and (= bdg!16601 #b00000000000000000000000000000000) (not (= bdg!16601 (bvand (bvadd #b00000000000000000000000000000001 lt!412865 (currentByte!13344 thiss!882)) #b10000000000000000000000000000000)))))))))

(assert (=> b!274631 (= lt!412864 (bvadd (currentBit!13339 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!274631 (= lt!412865 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274632 () Bool)

(declare-fun array_inv!6473 (array!15569) Bool)

(assert (=> b!274632 (= e!194522 (array_inv!6473 (buf!7217 thiss!882)))))

(assert (= (and start!60776 res!228463) b!274631))

(assert (= start!60776 b!274632))

(declare-fun m!407279 () Bool)

(assert (=> start!60776 m!407279))

(declare-fun m!407281 () Bool)

(assert (=> start!60776 m!407281))

(declare-fun m!407283 () Bool)

(assert (=> b!274632 m!407283))

(check-sat (not b!274632) (not start!60776))
(check-sat)
(get-model)

(declare-fun d!94324 () Bool)

(assert (=> d!94324 (= (array_inv!6473 (buf!7217 thiss!882)) (bvsge (size!6749 (buf!7217 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274632 d!94324))

(declare-fun d!94326 () Bool)

(declare-fun res!228472 () Bool)

(declare-fun e!194539 () Bool)

(assert (=> d!94326 (=> (not res!228472) (not e!194539))))

(assert (=> d!94326 (= res!228472 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6749 (buf!7217 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6749 (buf!7217 thiss!882)))))))))

(assert (=> d!94326 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194539)))

(declare-fun b!274646 () Bool)

(declare-fun lt!412877 () (_ BitVec 64))

(assert (=> b!274646 (= e!194539 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412877) (bvsle lt!412877 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6749 (buf!7217 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274646 (= lt!412877 (bvadd (bitIndex!0 (size!6749 (buf!7217 thiss!882)) (currentByte!13344 thiss!882) (currentBit!13339 thiss!882)) diffInBits!15))))

(assert (= (and d!94326 res!228472) b!274646))

(declare-fun m!407295 () Bool)

(assert (=> b!274646 m!407295))

(assert (=> start!60776 d!94326))

(declare-fun d!94334 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94334 (= (inv!12 thiss!882) (invariant!0 (currentBit!13339 thiss!882) (currentByte!13344 thiss!882) (size!6749 (buf!7217 thiss!882))))))

(declare-fun bs!23754 () Bool)

(assert (= bs!23754 d!94334))

(declare-fun m!407297 () Bool)

(assert (=> bs!23754 m!407297))

(assert (=> start!60776 d!94334))

(check-sat (not b!274646) (not d!94334))
(check-sat)
(get-model)

(declare-fun d!94344 () Bool)

(declare-fun e!194548 () Bool)

(assert (=> d!94344 e!194548))

(declare-fun res!228486 () Bool)

(assert (=> d!94344 (=> (not res!228486) (not e!194548))))

(declare-fun lt!412912 () (_ BitVec 64))

(declare-fun lt!412915 () (_ BitVec 64))

(declare-fun lt!412914 () (_ BitVec 64))

(assert (=> d!94344 (= res!228486 (= lt!412912 (bvsub lt!412914 lt!412915)))))

(assert (=> d!94344 (or (= (bvand lt!412914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412915 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412914 lt!412915) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94344 (= lt!412915 (remainingBits!0 ((_ sign_extend 32) (size!6749 (buf!7217 thiss!882))) ((_ sign_extend 32) (currentByte!13344 thiss!882)) ((_ sign_extend 32) (currentBit!13339 thiss!882))))))

(declare-fun lt!412913 () (_ BitVec 64))

(declare-fun lt!412911 () (_ BitVec 64))

(assert (=> d!94344 (= lt!412914 (bvmul lt!412913 lt!412911))))

(assert (=> d!94344 (or (= lt!412913 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412911 (bvsdiv (bvmul lt!412913 lt!412911) lt!412913)))))

(assert (=> d!94344 (= lt!412911 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94344 (= lt!412913 ((_ sign_extend 32) (size!6749 (buf!7217 thiss!882))))))

(assert (=> d!94344 (= lt!412912 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13344 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13339 thiss!882))))))

(assert (=> d!94344 (invariant!0 (currentBit!13339 thiss!882) (currentByte!13344 thiss!882) (size!6749 (buf!7217 thiss!882)))))

(assert (=> d!94344 (= (bitIndex!0 (size!6749 (buf!7217 thiss!882)) (currentByte!13344 thiss!882) (currentBit!13339 thiss!882)) lt!412912)))

(declare-fun b!274661 () Bool)

(declare-fun res!228487 () Bool)

(assert (=> b!274661 (=> (not res!228487) (not e!194548))))

(assert (=> b!274661 (= res!228487 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412912))))

(declare-fun b!274662 () Bool)

(declare-fun lt!412916 () (_ BitVec 64))

(assert (=> b!274662 (= e!194548 (bvsle lt!412912 (bvmul lt!412916 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274662 (or (= lt!412916 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412916 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412916)))))

(assert (=> b!274662 (= lt!412916 ((_ sign_extend 32) (size!6749 (buf!7217 thiss!882))))))

(assert (= (and d!94344 res!228486) b!274661))

(assert (= (and b!274661 res!228487) b!274662))

(declare-fun m!407305 () Bool)

(assert (=> d!94344 m!407305))

(assert (=> d!94344 m!407297))

(assert (=> b!274646 d!94344))

(declare-fun d!94348 () Bool)

(assert (=> d!94348 (= (invariant!0 (currentBit!13339 thiss!882) (currentByte!13344 thiss!882) (size!6749 (buf!7217 thiss!882))) (and (bvsge (currentBit!13339 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13339 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13344 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13344 thiss!882) (size!6749 (buf!7217 thiss!882))) (and (= (currentBit!13339 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13344 thiss!882) (size!6749 (buf!7217 thiss!882)))))))))

(assert (=> d!94334 d!94348))

(check-sat (not d!94344))
(check-sat)
