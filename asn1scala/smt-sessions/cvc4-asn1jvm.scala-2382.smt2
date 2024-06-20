; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60814 () Bool)

(assert start!60814)

(declare-fun res!228510 () Bool)

(declare-fun e!194587 () Bool)

(assert (=> start!60814 (=> (not res!228510) (not e!194587))))

(declare-datatypes ((array!15580 0))(
  ( (array!15581 (arr!7740 (Array (_ BitVec 32) (_ BitVec 8))) (size!6753 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12320 0))(
  ( (BitStream!12321 (buf!7221 array!15580) (currentByte!13354 (_ BitVec 32)) (currentBit!13349 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12320)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12320 (_ BitVec 64)) Bool)

(assert (=> start!60814 (= res!228510 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60814 e!194587))

(declare-fun e!194584 () Bool)

(declare-fun inv!12 (BitStream!12320) Bool)

(assert (=> start!60814 (and (inv!12 thiss!882) e!194584)))

(assert (=> start!60814 true))

(declare-fun b!274693 () Bool)

(declare-fun e!194585 () Bool)

(assert (=> b!274693 (= e!194587 e!194585)))

(declare-fun res!228511 () Bool)

(assert (=> b!274693 (=> (not res!228511) (not e!194585))))

(declare-fun lt!412959 () (_ BitVec 32))

(assert (=> b!274693 (= res!228511 (and (bvsge lt!412959 #b00000000000000000000000000000000) (bvsge lt!412959 #b00000000000000000000000000001000)))))

(assert (=> b!274693 (= lt!412959 (bvadd (currentBit!13349 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!412960 () (_ BitVec 64))

(declare-fun b!274694 () Bool)

(declare-fun lt!412961 () (_ BitVec 64))

(assert (=> b!274694 (= e!194585 (and (= lt!412961 (bvand diffInBits!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!412961 (bvand (bvadd lt!412960 diffInBits!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!274694 (= lt!412961 (bvand lt!412960 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274694 (= lt!412960 (bitIndex!0 (size!6753 (buf!7221 thiss!882)) (currentByte!13354 thiss!882) (currentBit!13349 thiss!882)))))

(declare-fun b!274695 () Bool)

(declare-fun array_inv!6477 (array!15580) Bool)

(assert (=> b!274695 (= e!194584 (array_inv!6477 (buf!7221 thiss!882)))))

(assert (= (and start!60814 res!228510) b!274693))

(assert (= (and b!274693 res!228511) b!274694))

(assert (= start!60814 b!274695))

(declare-fun m!407325 () Bool)

(assert (=> start!60814 m!407325))

(declare-fun m!407327 () Bool)

(assert (=> start!60814 m!407327))

(declare-fun m!407329 () Bool)

(assert (=> b!274694 m!407329))

(declare-fun m!407331 () Bool)

(assert (=> b!274695 m!407331))

(push 1)

(assert (not b!274694))

(assert (not start!60814))

(assert (not b!274695))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94366 () Bool)

(declare-fun e!194599 () Bool)

(assert (=> d!94366 e!194599))

(declare-fun res!228531 () Bool)

(assert (=> d!94366 (=> (not res!228531) (not e!194599))))

(declare-fun lt!413014 () (_ BitVec 64))

(declare-fun lt!413016 () (_ BitVec 64))

(declare-fun lt!413013 () (_ BitVec 64))

(assert (=> d!94366 (= res!228531 (= lt!413013 (bvsub lt!413016 lt!413014)))))

(assert (=> d!94366 (or (= (bvand lt!413016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413014 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413016 lt!413014) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94366 (= lt!413014 (remainingBits!0 ((_ sign_extend 32) (size!6753 (buf!7221 thiss!882))) ((_ sign_extend 32) (currentByte!13354 thiss!882)) ((_ sign_extend 32) (currentBit!13349 thiss!882))))))

(declare-fun lt!413015 () (_ BitVec 64))

(declare-fun lt!413017 () (_ BitVec 64))

(assert (=> d!94366 (= lt!413016 (bvmul lt!413015 lt!413017))))

(assert (=> d!94366 (or (= lt!413015 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413017 (bvsdiv (bvmul lt!413015 lt!413017) lt!413015)))))

(assert (=> d!94366 (= lt!413017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94366 (= lt!413015 ((_ sign_extend 32) (size!6753 (buf!7221 thiss!882))))))

(assert (=> d!94366 (= lt!413013 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13354 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13349 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94366 (invariant!0 (currentBit!13349 thiss!882) (currentByte!13354 thiss!882) (size!6753 (buf!7221 thiss!882)))))

(assert (=> d!94366 (= (bitIndex!0 (size!6753 (buf!7221 thiss!882)) (currentByte!13354 thiss!882) (currentBit!13349 thiss!882)) lt!413013)))

(declare-fun b!274716 () Bool)

(declare-fun res!228532 () Bool)

(assert (=> b!274716 (=> (not res!228532) (not e!194599))))

(assert (=> b!274716 (= res!228532 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413013))))

(declare-fun b!274717 () Bool)

(declare-fun lt!413018 () (_ BitVec 64))

(assert (=> b!274717 (= e!194599 (bvsle lt!413013 (bvmul lt!413018 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274717 (or (= lt!413018 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413018 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413018)))))

(assert (=> b!274717 (= lt!413018 ((_ sign_extend 32) (size!6753 (buf!7221 thiss!882))))))

(assert (= (and d!94366 res!228531) b!274716))

(assert (= (and b!274716 res!228532) b!274717))

(declare-fun m!407341 () Bool)

(assert (=> d!94366 m!407341))

(declare-fun m!407343 () Bool)

(assert (=> d!94366 m!407343))

(assert (=> b!274694 d!94366))

(declare-fun d!94370 () Bool)

(declare-fun res!228538 () Bool)

(declare-fun e!194605 () Bool)

(assert (=> d!94370 (=> (not res!228538) (not e!194605))))

(assert (=> d!94370 (= res!228538 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6753 (buf!7221 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6753 (buf!7221 thiss!882)))))))))

(assert (=> d!94370 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194605)))

(declare-fun b!274725 () Bool)

(declare-fun lt!413024 () (_ BitVec 64))

(assert (=> b!274725 (= e!194605 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413024) (bvsle lt!413024 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6753 (buf!7221 thiss!882)))))))))

(assert (=> b!274725 (= lt!413024 (bvadd (bitIndex!0 (size!6753 (buf!7221 thiss!882)) (currentByte!13354 thiss!882) (currentBit!13349 thiss!882)) diffInBits!15))))

(assert (= (and d!94370 res!228538) b!274725))

(assert (=> b!274725 m!407329))

(assert (=> start!60814 d!94370))

(declare-fun d!94376 () Bool)

(assert (=> d!94376 (= (inv!12 thiss!882) (invariant!0 (currentBit!13349 thiss!882) (currentByte!13354 thiss!882) (size!6753 (buf!7221 thiss!882))))))

(declare-fun bs!23761 () Bool)

(assert (= bs!23761 d!94376))

(assert (=> bs!23761 m!407343))

(assert (=> start!60814 d!94376))

(declare-fun d!94378 () Bool)

(assert (=> d!94378 (= (array_inv!6477 (buf!7221 thiss!882)) (bvsge (size!6753 (buf!7221 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274695 d!94378))

(push 1)

(assert (not d!94366))

(assert (not d!94376))

(assert (not b!274725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

