; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60774 () Bool)

(assert start!60774)

(declare-fun res!228460 () Bool)

(declare-fun e!194515 () Bool)

(assert (=> start!60774 (=> (not res!228460) (not e!194515))))

(declare-datatypes ((array!15567 0))(
  ( (array!15568 (arr!7735 (Array (_ BitVec 32) (_ BitVec 8))) (size!6748 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12310 0))(
  ( (BitStream!12311 (buf!7216 array!15567) (currentByte!13343 (_ BitVec 32)) (currentBit!13338 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12310)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12310 (_ BitVec 64)) Bool)

(assert (=> start!60774 (= res!228460 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60774 e!194515))

(declare-fun e!194514 () Bool)

(declare-fun inv!12 (BitStream!12310) Bool)

(assert (=> start!60774 (and (inv!12 thiss!882) e!194514)))

(assert (=> start!60774 true))

(declare-fun lt!412858 () (_ BitVec 32))

(declare-fun lt!412859 () (_ BitVec 32))

(declare-fun b!274625 () Bool)

(assert (=> b!274625 (= e!194515 (and (bvsge lt!412858 #b00000000000000000000000000000000) (bvsge lt!412858 #b00000000000000000000000000001000) (let ((bdg!16601 (bvand (bvadd (currentByte!13343 thiss!882) lt!412859) #b10000000000000000000000000000000))) (and (= bdg!16601 #b00000000000000000000000000000000) (not (= bdg!16601 (bvand (bvadd #b00000000000000000000000000000001 lt!412859 (currentByte!13343 thiss!882)) #b10000000000000000000000000000000)))))))))

(assert (=> b!274625 (= lt!412858 (bvadd (currentBit!13338 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!274625 (= lt!412859 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274626 () Bool)

(declare-fun array_inv!6472 (array!15567) Bool)

(assert (=> b!274626 (= e!194514 (array_inv!6472 (buf!7216 thiss!882)))))

(assert (= (and start!60774 res!228460) b!274625))

(assert (= start!60774 b!274626))

(declare-fun m!407273 () Bool)

(assert (=> start!60774 m!407273))

(declare-fun m!407275 () Bool)

(assert (=> start!60774 m!407275))

(declare-fun m!407277 () Bool)

(assert (=> b!274626 m!407277))

(push 1)

(assert (not b!274626))

(assert (not start!60774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94328 () Bool)

(assert (=> d!94328 (= (array_inv!6472 (buf!7216 thiss!882)) (bvsge (size!6748 (buf!7216 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274626 d!94328))

(declare-fun d!94330 () Bool)

(declare-fun res!228471 () Bool)

(declare-fun e!194538 () Bool)

(assert (=> d!94330 (=> (not res!228471) (not e!194538))))

(assert (=> d!94330 (= res!228471 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6748 (buf!7216 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6748 (buf!7216 thiss!882)))))))))

(assert (=> d!94330 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194538)))

(declare-fun b!274645 () Bool)

(declare-fun lt!412876 () (_ BitVec 64))

(assert (=> b!274645 (= e!194538 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412876) (bvsle lt!412876 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6748 (buf!7216 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274645 (= lt!412876 (bvadd (bitIndex!0 (size!6748 (buf!7216 thiss!882)) (currentByte!13343 thiss!882) (currentBit!13338 thiss!882)) diffInBits!15))))

(assert (= (and d!94330 res!228471) b!274645))

(declare-fun m!407291 () Bool)

(assert (=> b!274645 m!407291))

(assert (=> start!60774 d!94330))

(declare-fun d!94332 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94332 (= (inv!12 thiss!882) (invariant!0 (currentBit!13338 thiss!882) (currentByte!13343 thiss!882) (size!6748 (buf!7216 thiss!882))))))

(declare-fun bs!23753 () Bool)

(assert (= bs!23753 d!94332))

(declare-fun m!407293 () Bool)

(assert (=> bs!23753 m!407293))

(assert (=> start!60774 d!94332))

(push 1)

(assert (not b!274645))

(assert (not d!94332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94342 () Bool)

(declare-fun e!194547 () Bool)

(assert (=> d!94342 e!194547))

(declare-fun res!228483 () Bool)

(assert (=> d!94342 (=> (not res!228483) (not e!194547))))

(declare-fun lt!412901 () (_ BitVec 64))

(declare-fun lt!412903 () (_ BitVec 64))

(declare-fun lt!412906 () (_ BitVec 64))

(assert (=> d!94342 (= res!228483 (= lt!412903 (bvsub lt!412906 lt!412901)))))

(assert (=> d!94342 (or (= (bvand lt!412906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412901 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412906 lt!412901) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94342 (= lt!412901 (remainingBits!0 ((_ sign_extend 32) (size!6748 (buf!7216 thiss!882))) ((_ sign_extend 32) (currentByte!13343 thiss!882)) ((_ sign_extend 32) (currentBit!13338 thiss!882))))))

(declare-fun lt!412905 () (_ BitVec 64))

(declare-fun lt!412904 () (_ BitVec 64))

(assert (=> d!94342 (= lt!412906 (bvmul lt!412905 lt!412904))))

(assert (=> d!94342 (or (= lt!412905 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412904 (bvsdiv (bvmul lt!412905 lt!412904) lt!412905)))))

(assert (=> d!94342 (= lt!412904 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94342 (= lt!412905 ((_ sign_extend 32) (size!6748 (buf!7216 thiss!882))))))

(assert (=> d!94342 (= lt!412903 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13343 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13338 thiss!882))))))

(assert (=> d!94342 (invariant!0 (currentBit!13338 thiss!882) (currentByte!13343 thiss!882) (size!6748 (buf!7216 thiss!882)))))

(assert (=> d!94342 (= (bitIndex!0 (size!6748 (buf!7216 thiss!882)) (currentByte!13343 thiss!882) (currentBit!13338 thiss!882)) lt!412903)))

(declare-fun b!274655 () Bool)

(declare-fun res!228482 () Bool)

(assert (=> b!274655 (=> (not res!228482) (not e!194547))))

(assert (=> b!274655 (= res!228482 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412903))))

(declare-fun b!274656 () Bool)

(declare-fun lt!412899 () (_ BitVec 64))

(assert (=> b!274656 (= e!194547 (bvsle lt!412903 (bvmul lt!412899 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274656 (or (= lt!412899 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412899 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412899)))))

(assert (=> b!274656 (= lt!412899 ((_ sign_extend 32) (size!6748 (buf!7216 thiss!882))))))

(assert (= (and d!94342 res!228483) b!274655))

(assert (= (and b!274655 res!228482) b!274656))

(declare-fun m!407303 () Bool)

(assert (=> d!94342 m!407303))

(assert (=> d!94342 m!407293))

(assert (=> b!274645 d!94342))

(declare-fun d!94346 () Bool)

(assert (=> d!94346 (= (invariant!0 (currentBit!13338 thiss!882) (currentByte!13343 thiss!882) (size!6748 (buf!7216 thiss!882))) (and (bvsge (currentBit!13338 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13338 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13343 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13343 thiss!882) (size!6748 (buf!7216 thiss!882))) (and (= (currentBit!13338 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13343 thiss!882) (size!6748 (buf!7216 thiss!882)))))))))

(assert (=> d!94332 d!94346))

(push 1)

(assert (not d!94342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

