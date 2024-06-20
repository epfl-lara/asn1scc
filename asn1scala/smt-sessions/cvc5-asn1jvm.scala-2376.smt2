; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60624 () Bool)

(assert start!60624)

(declare-fun res!228289 () Bool)

(declare-fun e!194288 () Bool)

(assert (=> start!60624 (=> (not res!228289) (not e!194288))))

(declare-datatypes ((array!15525 0))(
  ( (array!15526 (arr!7720 (Array (_ BitVec 32) (_ BitVec 8))) (size!6733 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12280 0))(
  ( (BitStream!12281 (buf!7201 array!15525) (currentByte!13304 (_ BitVec 32)) (currentBit!13299 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12280)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12280 (_ BitVec 64)) Bool)

(assert (=> start!60624 (= res!228289 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60624 e!194288))

(declare-fun e!194290 () Bool)

(declare-fun inv!12 (BitStream!12280) Bool)

(assert (=> start!60624 (and (inv!12 thiss!882) e!194290)))

(assert (=> start!60624 true))

(declare-fun lt!412544 () (_ BitVec 32))

(declare-fun b!274397 () Bool)

(declare-fun lt!412543 () (_ BitVec 32))

(assert (=> b!274397 (= e!194288 (and (bvsge lt!412544 #b00000000000000000000000000000000) (= (bvand (currentBit!13299 thiss!882) #b10000000000000000000000000000000) (bvand lt!412543 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13299 thiss!882) #b10000000000000000000000000000000) (bvand lt!412544 #b10000000000000000000000000000000)))))))

(assert (=> b!274397 (= lt!412544 (bvadd (currentBit!13299 thiss!882) lt!412543))))

(assert (=> b!274397 (= lt!412543 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274398 () Bool)

(declare-fun array_inv!6457 (array!15525) Bool)

(assert (=> b!274398 (= e!194290 (array_inv!6457 (buf!7201 thiss!882)))))

(assert (= (and start!60624 res!228289) b!274397))

(assert (= start!60624 b!274398))

(declare-fun m!407087 () Bool)

(assert (=> start!60624 m!407087))

(declare-fun m!407089 () Bool)

(assert (=> start!60624 m!407089))

(declare-fun m!407091 () Bool)

(assert (=> b!274398 m!407091))

(push 1)

(assert (not start!60624))

(assert (not b!274398))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94172 () Bool)

(declare-fun res!228301 () Bool)

(declare-fun e!194314 () Bool)

(assert (=> d!94172 (=> (not res!228301) (not e!194314))))

(assert (=> d!94172 (= res!228301 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6733 (buf!7201 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6733 (buf!7201 thiss!882)))))))))

(assert (=> d!94172 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194314)))

(declare-fun b!274418 () Bool)

(declare-fun lt!412562 () (_ BitVec 64))

(assert (=> b!274418 (= e!194314 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412562) (bvsle lt!412562 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6733 (buf!7201 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274418 (= lt!412562 (bvadd (bitIndex!0 (size!6733 (buf!7201 thiss!882)) (currentByte!13304 thiss!882) (currentBit!13299 thiss!882)) diffInBits!15))))

(assert (= (and d!94172 res!228301) b!274418))

(declare-fun m!407109 () Bool)

(assert (=> b!274418 m!407109))

(assert (=> start!60624 d!94172))

(declare-fun d!94180 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94180 (= (inv!12 thiss!882) (invariant!0 (currentBit!13299 thiss!882) (currentByte!13304 thiss!882) (size!6733 (buf!7201 thiss!882))))))

(declare-fun bs!23721 () Bool)

(assert (= bs!23721 d!94180))

(declare-fun m!407111 () Bool)

(assert (=> bs!23721 m!407111))

(assert (=> start!60624 d!94180))

(declare-fun d!94182 () Bool)

(assert (=> d!94182 (= (array_inv!6457 (buf!7201 thiss!882)) (bvsge (size!6733 (buf!7201 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274398 d!94182))

(push 1)

(assert (not d!94180))

(assert (not b!274418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94192 () Bool)

(assert (=> d!94192 (= (invariant!0 (currentBit!13299 thiss!882) (currentByte!13304 thiss!882) (size!6733 (buf!7201 thiss!882))) (and (bvsge (currentBit!13299 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13299 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13304 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13304 thiss!882) (size!6733 (buf!7201 thiss!882))) (and (= (currentBit!13299 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13304 thiss!882) (size!6733 (buf!7201 thiss!882)))))))))

(assert (=> d!94180 d!94192))

(declare-fun d!94194 () Bool)

(declare-fun e!194326 () Bool)

(assert (=> d!94194 e!194326))

(declare-fun res!228321 () Bool)

(assert (=> d!94194 (=> (not res!228321) (not e!194326))))

(declare-fun lt!412618 () (_ BitVec 64))

(declare-fun lt!412615 () (_ BitVec 64))

(declare-fun lt!412614 () (_ BitVec 64))

(assert (=> d!94194 (= res!228321 (= lt!412614 (bvsub lt!412615 lt!412618)))))

(assert (=> d!94194 (or (= (bvand lt!412615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412615 lt!412618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94194 (= lt!412618 (remainingBits!0 ((_ sign_extend 32) (size!6733 (buf!7201 thiss!882))) ((_ sign_extend 32) (currentByte!13304 thiss!882)) ((_ sign_extend 32) (currentBit!13299 thiss!882))))))

(declare-fun lt!412617 () (_ BitVec 64))

(declare-fun lt!412619 () (_ BitVec 64))

(assert (=> d!94194 (= lt!412615 (bvmul lt!412617 lt!412619))))

(assert (=> d!94194 (or (= lt!412617 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412619 (bvsdiv (bvmul lt!412617 lt!412619) lt!412617)))))

(assert (=> d!94194 (= lt!412619 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94194 (= lt!412617 ((_ sign_extend 32) (size!6733 (buf!7201 thiss!882))))))

(assert (=> d!94194 (= lt!412614 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13304 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13299 thiss!882))))))

(assert (=> d!94194 (invariant!0 (currentBit!13299 thiss!882) (currentByte!13304 thiss!882) (size!6733 (buf!7201 thiss!882)))))

(assert (=> d!94194 (= (bitIndex!0 (size!6733 (buf!7201 thiss!882)) (currentByte!13304 thiss!882) (currentBit!13299 thiss!882)) lt!412614)))

(declare-fun b!274439 () Bool)

(declare-fun res!228322 () Bool)

(assert (=> b!274439 (=> (not res!228322) (not e!194326))))

(assert (=> b!274439 (= res!228322 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412614))))

(declare-fun b!274440 () Bool)

(declare-fun lt!412616 () (_ BitVec 64))

(assert (=> b!274440 (= e!194326 (bvsle lt!412614 (bvmul lt!412616 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274440 (or (= lt!412616 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412616 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412616)))))

(assert (=> b!274440 (= lt!412616 ((_ sign_extend 32) (size!6733 (buf!7201 thiss!882))))))

(assert (= (and d!94194 res!228321) b!274439))

(assert (= (and b!274439 res!228322) b!274440))

(declare-fun m!407121 () Bool)

(assert (=> d!94194 m!407121))

(assert (=> d!94194 m!407111))

(assert (=> b!274418 d!94194))

(push 1)

(assert (not d!94194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

