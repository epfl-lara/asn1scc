; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60842 () Bool)

(assert start!60842)

(declare-fun res!228550 () Bool)

(declare-fun e!194627 () Bool)

(assert (=> start!60842 (=> (not res!228550) (not e!194627))))

(declare-datatypes ((array!15587 0))(
  ( (array!15588 (arr!7742 (Array (_ BitVec 32) (_ BitVec 8))) (size!6755 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12324 0))(
  ( (BitStream!12325 (buf!7223 array!15587) (currentByte!13359 (_ BitVec 32)) (currentBit!13354 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12324)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12324 (_ BitVec 64)) Bool)

(assert (=> start!60842 (= res!228550 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60842 e!194627))

(declare-fun e!194629 () Bool)

(declare-fun inv!12 (BitStream!12324) Bool)

(assert (=> start!60842 (and (inv!12 thiss!882) e!194629)))

(assert (=> start!60842 true))

(declare-fun b!274741 () Bool)

(declare-fun e!194626 () Bool)

(assert (=> b!274741 (= e!194627 e!194626)))

(declare-fun res!228549 () Bool)

(assert (=> b!274741 (=> (not res!228549) (not e!194626))))

(declare-fun lt!413030 () (_ BitVec 32))

(assert (=> b!274741 (= res!228549 (and (bvsge lt!413030 #b00000000000000000000000000000000) (bvsge lt!413030 #b00000000000000000000000000001000)))))

(assert (=> b!274741 (= lt!413030 (bvadd (currentBit!13354 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274742 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274742 (= e!194626 (not (= (bvadd (bitIndex!0 (size!6755 (buf!7223 thiss!882)) (currentByte!13359 thiss!882) (currentBit!13354 thiss!882)) diffInBits!15) (bitIndex!0 (size!6755 (buf!7223 thiss!882)) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13359 thiss!882)) (bvsub lt!413030 #b00000000000000000000000000001000)))))))

(declare-fun b!274743 () Bool)

(declare-fun array_inv!6479 (array!15587) Bool)

(assert (=> b!274743 (= e!194629 (array_inv!6479 (buf!7223 thiss!882)))))

(assert (= (and start!60842 res!228550) b!274741))

(assert (= (and b!274741 res!228549) b!274742))

(assert (= start!60842 b!274743))

(declare-fun m!407355 () Bool)

(assert (=> start!60842 m!407355))

(declare-fun m!407357 () Bool)

(assert (=> start!60842 m!407357))

(declare-fun m!407359 () Bool)

(assert (=> b!274742 m!407359))

(declare-fun m!407361 () Bool)

(assert (=> b!274742 m!407361))

(declare-fun m!407363 () Bool)

(assert (=> b!274743 m!407363))

(check-sat (not start!60842) (not b!274743) (not b!274742))
(check-sat)
(get-model)

(declare-fun d!94382 () Bool)

(declare-fun res!228559 () Bool)

(declare-fun e!194644 () Bool)

(assert (=> d!94382 (=> (not res!228559) (not e!194644))))

(assert (=> d!94382 (= res!228559 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6755 (buf!7223 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6755 (buf!7223 thiss!882)))))))))

(assert (=> d!94382 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194644)))

(declare-fun b!274756 () Bool)

(declare-fun lt!413036 () (_ BitVec 64))

(assert (=> b!274756 (= e!194644 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413036) (bvsle lt!413036 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6755 (buf!7223 thiss!882)))))))))

(assert (=> b!274756 (= lt!413036 (bvadd (bitIndex!0 (size!6755 (buf!7223 thiss!882)) (currentByte!13359 thiss!882) (currentBit!13354 thiss!882)) diffInBits!15))))

(assert (= (and d!94382 res!228559) b!274756))

(assert (=> b!274756 m!407359))

(assert (=> start!60842 d!94382))

(declare-fun d!94384 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94384 (= (inv!12 thiss!882) (invariant!0 (currentBit!13354 thiss!882) (currentByte!13359 thiss!882) (size!6755 (buf!7223 thiss!882))))))

(declare-fun bs!23765 () Bool)

(assert (= bs!23765 d!94384))

(declare-fun m!407375 () Bool)

(assert (=> bs!23765 m!407375))

(assert (=> start!60842 d!94384))

(declare-fun d!94386 () Bool)

(assert (=> d!94386 (= (array_inv!6479 (buf!7223 thiss!882)) (bvsge (size!6755 (buf!7223 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274743 d!94386))

(declare-fun d!94388 () Bool)

(declare-fun e!194647 () Bool)

(assert (=> d!94388 e!194647))

(declare-fun res!228564 () Bool)

(assert (=> d!94388 (=> (not res!228564) (not e!194647))))

(declare-fun lt!413051 () (_ BitVec 64))

(declare-fun lt!413050 () (_ BitVec 64))

(declare-fun lt!413052 () (_ BitVec 64))

(assert (=> d!94388 (= res!228564 (= lt!413050 (bvsub lt!413052 lt!413051)))))

(assert (=> d!94388 (or (= (bvand lt!413052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413051 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413052 lt!413051) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94388 (= lt!413051 (remainingBits!0 ((_ sign_extend 32) (size!6755 (buf!7223 thiss!882))) ((_ sign_extend 32) (currentByte!13359 thiss!882)) ((_ sign_extend 32) (currentBit!13354 thiss!882))))))

(declare-fun lt!413053 () (_ BitVec 64))

(declare-fun lt!413054 () (_ BitVec 64))

(assert (=> d!94388 (= lt!413052 (bvmul lt!413053 lt!413054))))

(assert (=> d!94388 (or (= lt!413053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413054 (bvsdiv (bvmul lt!413053 lt!413054) lt!413053)))))

(assert (=> d!94388 (= lt!413054 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94388 (= lt!413053 ((_ sign_extend 32) (size!6755 (buf!7223 thiss!882))))))

(assert (=> d!94388 (= lt!413050 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13359 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13354 thiss!882))))))

(assert (=> d!94388 (invariant!0 (currentBit!13354 thiss!882) (currentByte!13359 thiss!882) (size!6755 (buf!7223 thiss!882)))))

(assert (=> d!94388 (= (bitIndex!0 (size!6755 (buf!7223 thiss!882)) (currentByte!13359 thiss!882) (currentBit!13354 thiss!882)) lt!413050)))

(declare-fun b!274761 () Bool)

(declare-fun res!228565 () Bool)

(assert (=> b!274761 (=> (not res!228565) (not e!194647))))

(assert (=> b!274761 (= res!228565 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413050))))

(declare-fun b!274762 () Bool)

(declare-fun lt!413049 () (_ BitVec 64))

(assert (=> b!274762 (= e!194647 (bvsle lt!413050 (bvmul lt!413049 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274762 (or (= lt!413049 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413049 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413049)))))

(assert (=> b!274762 (= lt!413049 ((_ sign_extend 32) (size!6755 (buf!7223 thiss!882))))))

(assert (= (and d!94388 res!228564) b!274761))

(assert (= (and b!274761 res!228565) b!274762))

(declare-fun m!407377 () Bool)

(assert (=> d!94388 m!407377))

(assert (=> d!94388 m!407375))

(assert (=> b!274742 d!94388))

(declare-fun d!94394 () Bool)

(declare-fun e!194648 () Bool)

(assert (=> d!94394 e!194648))

(declare-fun res!228566 () Bool)

(assert (=> d!94394 (=> (not res!228566) (not e!194648))))

(declare-fun lt!413057 () (_ BitVec 64))

(declare-fun lt!413058 () (_ BitVec 64))

(declare-fun lt!413056 () (_ BitVec 64))

(assert (=> d!94394 (= res!228566 (= lt!413056 (bvsub lt!413058 lt!413057)))))

(assert (=> d!94394 (or (= (bvand lt!413058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413057 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413058 lt!413057) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94394 (= lt!413057 (remainingBits!0 ((_ sign_extend 32) (size!6755 (buf!7223 thiss!882))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13359 thiss!882))) ((_ sign_extend 32) (bvsub lt!413030 #b00000000000000000000000000001000))))))

(declare-fun lt!413059 () (_ BitVec 64))

(declare-fun lt!413060 () (_ BitVec 64))

(assert (=> d!94394 (= lt!413058 (bvmul lt!413059 lt!413060))))

(assert (=> d!94394 (or (= lt!413059 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413060 (bvsdiv (bvmul lt!413059 lt!413060) lt!413059)))))

(assert (=> d!94394 (= lt!413060 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94394 (= lt!413059 ((_ sign_extend 32) (size!6755 (buf!7223 thiss!882))))))

(assert (=> d!94394 (= lt!413056 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13359 thiss!882))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvsub lt!413030 #b00000000000000000000000000001000))))))

(assert (=> d!94394 (invariant!0 (bvsub lt!413030 #b00000000000000000000000000001000) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13359 thiss!882)) (size!6755 (buf!7223 thiss!882)))))

(assert (=> d!94394 (= (bitIndex!0 (size!6755 (buf!7223 thiss!882)) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13359 thiss!882)) (bvsub lt!413030 #b00000000000000000000000000001000)) lt!413056)))

(declare-fun b!274763 () Bool)

(declare-fun res!228567 () Bool)

(assert (=> b!274763 (=> (not res!228567) (not e!194648))))

(assert (=> b!274763 (= res!228567 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413056))))

(declare-fun b!274764 () Bool)

(declare-fun lt!413055 () (_ BitVec 64))

(assert (=> b!274764 (= e!194648 (bvsle lt!413056 (bvmul lt!413055 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274764 (or (= lt!413055 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413055 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413055)))))

(assert (=> b!274764 (= lt!413055 ((_ sign_extend 32) (size!6755 (buf!7223 thiss!882))))))

(assert (= (and d!94394 res!228566) b!274763))

(assert (= (and b!274763 res!228567) b!274764))

(declare-fun m!407379 () Bool)

(assert (=> d!94394 m!407379))

(declare-fun m!407381 () Bool)

(assert (=> d!94394 m!407381))

(assert (=> b!274742 d!94394))

(check-sat (not d!94384) (not d!94394) (not b!274756) (not d!94388))
(check-sat)
