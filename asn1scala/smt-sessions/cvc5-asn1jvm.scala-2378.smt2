; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60696 () Bool)

(assert start!60696)

(declare-fun res!228370 () Bool)

(declare-fun e!194389 () Bool)

(assert (=> start!60696 (=> (not res!228370) (not e!194389))))

(declare-datatypes ((array!15543 0))(
  ( (array!15544 (arr!7726 (Array (_ BitVec 32) (_ BitVec 8))) (size!6739 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12292 0))(
  ( (BitStream!12293 (buf!7207 array!15543) (currentByte!13322 (_ BitVec 32)) (currentBit!13317 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12292)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12292 (_ BitVec 64)) Bool)

(assert (=> start!60696 (= res!228370 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60696 e!194389))

(declare-fun e!194388 () Bool)

(declare-fun inv!12 (BitStream!12292) Bool)

(assert (=> start!60696 (and (inv!12 thiss!882) e!194388)))

(assert (=> start!60696 true))

(declare-fun lt!412697 () (_ BitVec 32))

(declare-fun lt!412696 () (_ BitVec 32))

(declare-fun b!274502 () Bool)

(assert (=> b!274502 (= e!194389 (and (bvsge lt!412696 #b00000000000000000000000000000000) (bvsge lt!412696 #b00000000000000000000000000001000) (= (bvand (currentBit!13317 thiss!882) #b10000000000000000000000000000000) (bvand lt!412697 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13317 thiss!882) #b10000000000000000000000000000000) (bvand lt!412696 #b10000000000000000000000000000000)))))))

(assert (=> b!274502 (= lt!412696 (bvadd (currentBit!13317 thiss!882) lt!412697))))

(assert (=> b!274502 (= lt!412697 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274503 () Bool)

(declare-fun array_inv!6463 (array!15543) Bool)

(assert (=> b!274503 (= e!194388 (array_inv!6463 (buf!7207 thiss!882)))))

(assert (= (and start!60696 res!228370) b!274502))

(assert (= start!60696 b!274503))

(declare-fun m!407171 () Bool)

(assert (=> start!60696 m!407171))

(declare-fun m!407173 () Bool)

(assert (=> start!60696 m!407173))

(declare-fun m!407175 () Bool)

(assert (=> b!274503 m!407175))

(push 1)

(assert (not b!274503))

(assert (not start!60696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94250 () Bool)

(assert (=> d!94250 (= (array_inv!6463 (buf!7207 thiss!882)) (bvsge (size!6739 (buf!7207 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274503 d!94250))

(declare-fun d!94252 () Bool)

(declare-fun res!228382 () Bool)

(declare-fun e!194413 () Bool)

(assert (=> d!94252 (=> (not res!228382) (not e!194413))))

(assert (=> d!94252 (= res!228382 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6739 (buf!7207 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6739 (buf!7207 thiss!882)))))))))

(assert (=> d!94252 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194413)))

(declare-fun b!274523 () Bool)

(declare-fun lt!412715 () (_ BitVec 64))

(assert (=> b!274523 (= e!194413 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412715) (bvsle lt!412715 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6739 (buf!7207 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274523 (= lt!412715 (bvadd (bitIndex!0 (size!6739 (buf!7207 thiss!882)) (currentByte!13322 thiss!882) (currentBit!13317 thiss!882)) diffInBits!15))))

(assert (= (and d!94252 res!228382) b!274523))

(declare-fun m!407193 () Bool)

(assert (=> b!274523 m!407193))

(assert (=> start!60696 d!94252))

(declare-fun d!94258 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94258 (= (inv!12 thiss!882) (invariant!0 (currentBit!13317 thiss!882) (currentByte!13322 thiss!882) (size!6739 (buf!7207 thiss!882))))))

(declare-fun bs!23736 () Bool)

(assert (= bs!23736 d!94258))

(declare-fun m!407195 () Bool)

(assert (=> bs!23736 m!407195))

(assert (=> start!60696 d!94258))

(push 1)

(assert (not d!94258))

(assert (not b!274523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94268 () Bool)

(assert (=> d!94268 (= (invariant!0 (currentBit!13317 thiss!882) (currentByte!13322 thiss!882) (size!6739 (buf!7207 thiss!882))) (and (bvsge (currentBit!13317 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13317 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13322 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13322 thiss!882) (size!6739 (buf!7207 thiss!882))) (and (= (currentBit!13317 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13322 thiss!882) (size!6739 (buf!7207 thiss!882)))))))))

(assert (=> d!94258 d!94268))

(declare-fun d!94270 () Bool)

(declare-fun e!194425 () Bool)

(assert (=> d!94270 e!194425))

(declare-fun res!228402 () Bool)

(assert (=> d!94270 (=> (not res!228402) (not e!194425))))

(declare-fun lt!412767 () (_ BitVec 64))

(declare-fun lt!412769 () (_ BitVec 64))

(declare-fun lt!412772 () (_ BitVec 64))

(assert (=> d!94270 (= res!228402 (= lt!412767 (bvsub lt!412769 lt!412772)))))

(assert (=> d!94270 (or (= (bvand lt!412769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412772 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412769 lt!412772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94270 (= lt!412772 (remainingBits!0 ((_ sign_extend 32) (size!6739 (buf!7207 thiss!882))) ((_ sign_extend 32) (currentByte!13322 thiss!882)) ((_ sign_extend 32) (currentBit!13317 thiss!882))))))

(declare-fun lt!412770 () (_ BitVec 64))

(declare-fun lt!412771 () (_ BitVec 64))

(assert (=> d!94270 (= lt!412769 (bvmul lt!412770 lt!412771))))

(assert (=> d!94270 (or (= lt!412770 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412771 (bvsdiv (bvmul lt!412770 lt!412771) lt!412770)))))

(assert (=> d!94270 (= lt!412771 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94270 (= lt!412770 ((_ sign_extend 32) (size!6739 (buf!7207 thiss!882))))))

(assert (=> d!94270 (= lt!412767 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13322 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13317 thiss!882))))))

(assert (=> d!94270 (invariant!0 (currentBit!13317 thiss!882) (currentByte!13322 thiss!882) (size!6739 (buf!7207 thiss!882)))))

(assert (=> d!94270 (= (bitIndex!0 (size!6739 (buf!7207 thiss!882)) (currentByte!13322 thiss!882) (currentBit!13317 thiss!882)) lt!412767)))

(declare-fun b!274544 () Bool)

(declare-fun res!228403 () Bool)

(assert (=> b!274544 (=> (not res!228403) (not e!194425))))

(assert (=> b!274544 (= res!228403 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412767))))

(declare-fun b!274545 () Bool)

(declare-fun lt!412768 () (_ BitVec 64))

(assert (=> b!274545 (= e!194425 (bvsle lt!412767 (bvmul lt!412768 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274545 (or (= lt!412768 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412768 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412768)))))

(assert (=> b!274545 (= lt!412768 ((_ sign_extend 32) (size!6739 (buf!7207 thiss!882))))))

(assert (= (and d!94270 res!228402) b!274544))

(assert (= (and b!274544 res!228403) b!274545))

(declare-fun m!407205 () Bool)

(assert (=> d!94270 m!407205))

(assert (=> d!94270 m!407195))

(assert (=> b!274523 d!94270))

(push 1)

(assert (not d!94270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

