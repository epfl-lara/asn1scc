; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60920 () Bool)

(assert start!60920)

(declare-fun res!228660 () Bool)

(declare-fun e!194778 () Bool)

(assert (=> start!60920 (=> (not res!228660) (not e!194778))))

(declare-datatypes ((array!15613 0))(
  ( (array!15614 (arr!7752 (Array (_ BitVec 32) (_ BitVec 8))) (size!6765 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12344 0))(
  ( (BitStream!12345 (buf!7233 array!15613) (currentByte!13380 (_ BitVec 32)) (currentBit!13375 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12344)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12344 (_ BitVec 64)) Bool)

(assert (=> start!60920 (= res!228660 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60920 e!194778))

(declare-fun e!194776 () Bool)

(declare-fun inv!12 (BitStream!12344) Bool)

(assert (=> start!60920 (and (inv!12 thiss!882) e!194776)))

(assert (=> start!60920 true))

(declare-fun b!274888 () Bool)

(declare-fun e!194779 () Bool)

(assert (=> b!274888 (= e!194778 e!194779)))

(declare-fun res!228661 () Bool)

(assert (=> b!274888 (=> (not res!228661) (not e!194779))))

(declare-fun lt!413231 () (_ BitVec 32))

(assert (=> b!274888 (= res!228661 (and (bvsge lt!413231 #b00000000000000000000000000000000) (bvslt lt!413231 #b00000000000000000000000000001000)))))

(assert (=> b!274888 (= lt!413231 (bvadd (currentBit!13375 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!413229 () (_ BitVec 64))

(declare-fun lt!413230 () (_ BitVec 64))

(declare-fun b!274889 () Bool)

(assert (=> b!274889 (= e!194779 (and (= lt!413229 (bvand diffInBits!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!413229 (bvand (bvadd lt!413230 diffInBits!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!274889 (= lt!413229 (bvand lt!413230 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274889 (= lt!413230 (bitIndex!0 (size!6765 (buf!7233 thiss!882)) (currentByte!13380 thiss!882) (currentBit!13375 thiss!882)))))

(declare-fun b!274890 () Bool)

(declare-fun array_inv!6489 (array!15613) Bool)

(assert (=> b!274890 (= e!194776 (array_inv!6489 (buf!7233 thiss!882)))))

(assert (= (and start!60920 res!228660) b!274888))

(assert (= (and b!274888 res!228661) b!274889))

(assert (= start!60920 b!274890))

(declare-fun m!407481 () Bool)

(assert (=> start!60920 m!407481))

(declare-fun m!407483 () Bool)

(assert (=> start!60920 m!407483))

(declare-fun m!407485 () Bool)

(assert (=> b!274889 m!407485))

(declare-fun m!407487 () Bool)

(assert (=> b!274890 m!407487))

(push 1)

(assert (not start!60920))

(assert (not b!274890))

(assert (not b!274889))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94478 () Bool)

(declare-fun res!228667 () Bool)

(declare-fun e!194785 () Bool)

(assert (=> d!94478 (=> (not res!228667) (not e!194785))))

(assert (=> d!94478 (= res!228667 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6765 (buf!7233 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6765 (buf!7233 thiss!882)))))))))

(assert (=> d!94478 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194785)))

(declare-fun b!274898 () Bool)

(declare-fun lt!413239 () (_ BitVec 64))

(assert (=> b!274898 (= e!194785 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413239) (bvsle lt!413239 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6765 (buf!7233 thiss!882)))))))))

(assert (=> b!274898 (= lt!413239 (bvadd (bitIndex!0 (size!6765 (buf!7233 thiss!882)) (currentByte!13380 thiss!882) (currentBit!13375 thiss!882)) diffInBits!15))))

(assert (= (and d!94478 res!228667) b!274898))

(assert (=> b!274898 m!407485))

(assert (=> start!60920 d!94478))

(declare-fun d!94480 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94480 (= (inv!12 thiss!882) (invariant!0 (currentBit!13375 thiss!882) (currentByte!13380 thiss!882) (size!6765 (buf!7233 thiss!882))))))

(declare-fun bs!23784 () Bool)

(assert (= bs!23784 d!94480))

(declare-fun m!407491 () Bool)

(assert (=> bs!23784 m!407491))

(assert (=> start!60920 d!94480))

(declare-fun d!94482 () Bool)

(assert (=> d!94482 (= (array_inv!6489 (buf!7233 thiss!882)) (bvsge (size!6765 (buf!7233 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274890 d!94482))

(declare-fun d!94484 () Bool)

(declare-fun e!194797 () Bool)

(assert (=> d!94484 e!194797))

(declare-fun res!228687 () Bool)

(assert (=> d!94484 (=> (not res!228687) (not e!194797))))

(declare-fun lt!413289 () (_ BitVec 64))

(declare-fun lt!413294 () (_ BitVec 64))

(declare-fun lt!413290 () (_ BitVec 64))

(assert (=> d!94484 (= res!228687 (= lt!413289 (bvsub lt!413290 lt!413294)))))

(assert (=> d!94484 (or (= (bvand lt!413290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413294 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413290 lt!413294) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94484 (= lt!413294 (remainingBits!0 ((_ sign_extend 32) (size!6765 (buf!7233 thiss!882))) ((_ sign_extend 32) (currentByte!13380 thiss!882)) ((_ sign_extend 32) (currentBit!13375 thiss!882))))))

(declare-fun lt!413293 () (_ BitVec 64))

(declare-fun lt!413291 () (_ BitVec 64))

(assert (=> d!94484 (= lt!413290 (bvmul lt!413293 lt!413291))))

(assert (=> d!94484 (or (= lt!413293 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413291 (bvsdiv (bvmul lt!413293 lt!413291) lt!413293)))))

(assert (=> d!94484 (= lt!413291 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94484 (= lt!413293 ((_ sign_extend 32) (size!6765 (buf!7233 thiss!882))))))

(assert (=> d!94484 (= lt!413289 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13380 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13375 thiss!882))))))

(assert (=> d!94484 (invariant!0 (currentBit!13375 thiss!882) (currentByte!13380 thiss!882) (size!6765 (buf!7233 thiss!882)))))

(assert (=> d!94484 (= (bitIndex!0 (size!6765 (buf!7233 thiss!882)) (currentByte!13380 thiss!882) (currentBit!13375 thiss!882)) lt!413289)))

(declare-fun b!274919 () Bool)

(declare-fun res!228688 () Bool)

(assert (=> b!274919 (=> (not res!228688) (not e!194797))))

(assert (=> b!274919 (= res!228688 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413289))))

(declare-fun b!274920 () Bool)

(declare-fun lt!413292 () (_ BitVec 64))

(assert (=> b!274920 (= e!194797 (bvsle lt!413289 (bvmul lt!413292 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274920 (or (= lt!413292 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413292 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413292)))))

(assert (=> b!274920 (= lt!413292 ((_ sign_extend 32) (size!6765 (buf!7233 thiss!882))))))

(assert (= (and d!94484 res!228687) b!274919))

(assert (= (and b!274919 res!228688) b!274920))

(declare-fun m!407499 () Bool)

(assert (=> d!94484 m!407499))

(assert (=> d!94484 m!407491))

(assert (=> b!274889 d!94484))

(push 1)

(assert (not d!94484))

(assert (not d!94480))

(assert (not b!274898))

(check-sat)

(pop 1)

(push 1)

(check-sat)

