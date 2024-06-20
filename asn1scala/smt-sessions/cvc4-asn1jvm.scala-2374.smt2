; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60564 () Bool)

(assert start!60564)

(declare-fun res!228207 () Bool)

(declare-fun e!194205 () Bool)

(assert (=> start!60564 (=> (not res!228207) (not e!194205))))

(declare-datatypes ((array!15511 0))(
  ( (array!15512 (arr!7716 (Array (_ BitVec 32) (_ BitVec 8))) (size!6729 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12272 0))(
  ( (BitStream!12273 (buf!7197 array!15511) (currentByte!13292 (_ BitVec 32)) (currentBit!13287 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12272)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12272 (_ BitVec 64)) Bool)

(assert (=> start!60564 (= res!228207 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60564 e!194205))

(declare-fun e!194204 () Bool)

(declare-fun inv!12 (BitStream!12272) Bool)

(assert (=> start!60564 (and (inv!12 thiss!882) e!194204)))

(assert (=> start!60564 true))

(declare-fun b!274297 () Bool)

(declare-fun res!228208 () Bool)

(assert (=> b!274297 (=> (not res!228208) (not e!194205))))

(assert (=> b!274297 (= res!228208 (bvslt (bvadd (currentBit!13287 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000))))

(declare-fun b!274298 () Bool)

(declare-fun lt!412384 () (_ BitVec 64))

(declare-fun lt!412385 () (_ BitVec 64))

(assert (=> b!274298 (= e!194205 (and (= lt!412384 (bvand diffInBits!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!412384 (bvand (bvadd lt!412385 diffInBits!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!274298 (= lt!412384 (bvand lt!412385 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274298 (= lt!412385 (bitIndex!0 (size!6729 (buf!7197 thiss!882)) (currentByte!13292 thiss!882) (currentBit!13287 thiss!882)))))

(declare-fun b!274299 () Bool)

(declare-fun array_inv!6453 (array!15511) Bool)

(assert (=> b!274299 (= e!194204 (array_inv!6453 (buf!7197 thiss!882)))))

(assert (= (and start!60564 res!228207) b!274297))

(assert (= (and b!274297 res!228208) b!274298))

(assert (= start!60564 b!274299))

(declare-fun m!407013 () Bool)

(assert (=> start!60564 m!407013))

(declare-fun m!407015 () Bool)

(assert (=> start!60564 m!407015))

(declare-fun m!407017 () Bool)

(assert (=> b!274298 m!407017))

(declare-fun m!407019 () Bool)

(assert (=> b!274299 m!407019))

(push 1)

(assert (not start!60564))

(assert (not b!274299))

(assert (not b!274298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94116 () Bool)

(declare-fun res!228222 () Bool)

(declare-fun e!194217 () Bool)

(assert (=> d!94116 (=> (not res!228222) (not e!194217))))

(assert (=> d!94116 (= res!228222 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6729 (buf!7197 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6729 (buf!7197 thiss!882)))))))))

(assert (=> d!94116 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194217)))

(declare-fun b!274313 () Bool)

(declare-fun lt!412419 () (_ BitVec 64))

(assert (=> b!274313 (= e!194217 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412419) (bvsle lt!412419 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6729 (buf!7197 thiss!882)))))))))

(assert (=> b!274313 (= lt!412419 (bvadd (bitIndex!0 (size!6729 (buf!7197 thiss!882)) (currentByte!13292 thiss!882) (currentBit!13287 thiss!882)) diffInBits!15))))

(assert (= (and d!94116 res!228222) b!274313))

(assert (=> b!274313 m!407017))

(assert (=> start!60564 d!94116))

(declare-fun d!94118 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94118 (= (inv!12 thiss!882) (invariant!0 (currentBit!13287 thiss!882) (currentByte!13292 thiss!882) (size!6729 (buf!7197 thiss!882))))))

(declare-fun bs!23709 () Bool)

(assert (= bs!23709 d!94118))

(declare-fun m!407025 () Bool)

(assert (=> bs!23709 m!407025))

(assert (=> start!60564 d!94118))

(declare-fun d!94120 () Bool)

(assert (=> d!94120 (= (array_inv!6453 (buf!7197 thiss!882)) (bvsge (size!6729 (buf!7197 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274299 d!94120))

(declare-fun d!94122 () Bool)

(declare-fun e!194224 () Bool)

(assert (=> d!94122 e!194224))

(declare-fun res!228234 () Bool)

(assert (=> d!94122 (=> (not res!228234) (not e!194224))))

(declare-fun lt!412445 () (_ BitVec 64))

(declare-fun lt!412448 () (_ BitVec 64))

(declare-fun lt!412447 () (_ BitVec 64))

(assert (=> d!94122 (= res!228234 (= lt!412445 (bvsub lt!412448 lt!412447)))))

(assert (=> d!94122 (or (= (bvand lt!412448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412447 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412448 lt!412447) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94122 (= lt!412447 (remainingBits!0 ((_ sign_extend 32) (size!6729 (buf!7197 thiss!882))) ((_ sign_extend 32) (currentByte!13292 thiss!882)) ((_ sign_extend 32) (currentBit!13287 thiss!882))))))

(declare-fun lt!412443 () (_ BitVec 64))

(declare-fun lt!412444 () (_ BitVec 64))

(assert (=> d!94122 (= lt!412448 (bvmul lt!412443 lt!412444))))

(assert (=> d!94122 (or (= lt!412443 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412444 (bvsdiv (bvmul lt!412443 lt!412444) lt!412443)))))

(assert (=> d!94122 (= lt!412444 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94122 (= lt!412443 ((_ sign_extend 32) (size!6729 (buf!7197 thiss!882))))))

(assert (=> d!94122 (= lt!412445 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13292 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13287 thiss!882))))))

(assert (=> d!94122 (invariant!0 (currentBit!13287 thiss!882) (currentByte!13292 thiss!882) (size!6729 (buf!7197 thiss!882)))))

(assert (=> d!94122 (= (bitIndex!0 (size!6729 (buf!7197 thiss!882)) (currentByte!13292 thiss!882) (currentBit!13287 thiss!882)) lt!412445)))

(declare-fun b!274328 () Bool)

(declare-fun res!228235 () Bool)

(assert (=> b!274328 (=> (not res!228235) (not e!194224))))

(assert (=> b!274328 (= res!228235 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412445))))

(declare-fun b!274329 () Bool)

(declare-fun lt!412446 () (_ BitVec 64))

(assert (=> b!274329 (= e!194224 (bvsle lt!412445 (bvmul lt!412446 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274329 (or (= lt!412446 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412446 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412446)))))

(assert (=> b!274329 (= lt!412446 ((_ sign_extend 32) (size!6729 (buf!7197 thiss!882))))))

(assert (= (and d!94122 res!228234) b!274328))

(assert (= (and b!274328 res!228235) b!274329))

(declare-fun m!407031 () Bool)

(assert (=> d!94122 m!407031))

(assert (=> d!94122 m!407025))

(assert (=> b!274298 d!94122))

(push 1)

(assert (not d!94118))

(assert (not b!274313))

(assert (not d!94122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

