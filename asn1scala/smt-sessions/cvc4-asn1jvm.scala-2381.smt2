; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60778 () Bool)

(assert start!60778)

(declare-fun res!228466 () Bool)

(declare-fun e!194531 () Bool)

(assert (=> start!60778 (=> (not res!228466) (not e!194531))))

(declare-datatypes ((array!15571 0))(
  ( (array!15572 (arr!7737 (Array (_ BitVec 32) (_ BitVec 8))) (size!6750 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12314 0))(
  ( (BitStream!12315 (buf!7218 array!15571) (currentByte!13345 (_ BitVec 32)) (currentBit!13340 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12314)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12314 (_ BitVec 64)) Bool)

(assert (=> start!60778 (= res!228466 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60778 e!194531))

(declare-fun e!194533 () Bool)

(declare-fun inv!12 (BitStream!12314) Bool)

(assert (=> start!60778 (and (inv!12 thiss!882) e!194533)))

(assert (=> start!60778 true))

(declare-fun lt!412871 () (_ BitVec 32))

(declare-fun b!274637 () Bool)

(declare-fun lt!412870 () (_ BitVec 32))

(assert (=> b!274637 (= e!194531 (and (bvsge lt!412871 #b00000000000000000000000000000000) (bvsge lt!412871 #b00000000000000000000000000001000) (let ((bdg!16601 (bvand (bvadd (currentByte!13345 thiss!882) lt!412870) #b10000000000000000000000000000000))) (and (= bdg!16601 #b00000000000000000000000000000000) (not (= bdg!16601 (bvand (bvadd #b00000000000000000000000000000001 lt!412870 (currentByte!13345 thiss!882)) #b10000000000000000000000000000000)))))))))

(assert (=> b!274637 (= lt!412871 (bvadd (currentBit!13340 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!274637 (= lt!412870 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274638 () Bool)

(declare-fun array_inv!6474 (array!15571) Bool)

(assert (=> b!274638 (= e!194533 (array_inv!6474 (buf!7218 thiss!882)))))

(assert (= (and start!60778 res!228466) b!274637))

(assert (= start!60778 b!274638))

(declare-fun m!407285 () Bool)

(assert (=> start!60778 m!407285))

(declare-fun m!407287 () Bool)

(assert (=> start!60778 m!407287))

(declare-fun m!407289 () Bool)

(assert (=> b!274638 m!407289))

(push 1)

(assert (not start!60778))

(assert (not b!274638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94336 () Bool)

(declare-fun res!228475 () Bool)

(declare-fun e!194542 () Bool)

(assert (=> d!94336 (=> (not res!228475) (not e!194542))))

(assert (=> d!94336 (= res!228475 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6750 (buf!7218 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6750 (buf!7218 thiss!882)))))))))

(assert (=> d!94336 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194542)))

(declare-fun b!274650 () Bool)

(declare-fun lt!412880 () (_ BitVec 64))

(assert (=> b!274650 (= e!194542 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412880) (bvsle lt!412880 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6750 (buf!7218 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274650 (= lt!412880 (bvadd (bitIndex!0 (size!6750 (buf!7218 thiss!882)) (currentByte!13345 thiss!882) (currentBit!13340 thiss!882)) diffInBits!15))))

(assert (= (and d!94336 res!228475) b!274650))

(declare-fun m!407299 () Bool)

(assert (=> b!274650 m!407299))

(assert (=> start!60778 d!94336))

(declare-fun d!94338 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94338 (= (inv!12 thiss!882) (invariant!0 (currentBit!13340 thiss!882) (currentByte!13345 thiss!882) (size!6750 (buf!7218 thiss!882))))))

(declare-fun bs!23755 () Bool)

(assert (= bs!23755 d!94338))

(declare-fun m!407301 () Bool)

(assert (=> bs!23755 m!407301))

(assert (=> start!60778 d!94338))

(declare-fun d!94340 () Bool)

(assert (=> d!94340 (= (array_inv!6474 (buf!7218 thiss!882)) (bvsge (size!6750 (buf!7218 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274638 d!94340))

(push 1)

(assert (not d!94338))

(assert (not b!274650))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94350 () Bool)

(assert (=> d!94350 (= (invariant!0 (currentBit!13340 thiss!882) (currentByte!13345 thiss!882) (size!6750 (buf!7218 thiss!882))) (and (bvsge (currentBit!13340 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13340 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13345 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13345 thiss!882) (size!6750 (buf!7218 thiss!882))) (and (= (currentBit!13340 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13345 thiss!882) (size!6750 (buf!7218 thiss!882)))))))))

(assert (=> d!94338 d!94350))

(declare-fun d!94352 () Bool)

(declare-fun e!194551 () Bool)

(assert (=> d!94352 e!194551))

(declare-fun res!228493 () Bool)

(assert (=> d!94352 (=> (not res!228493) (not e!194551))))

(declare-fun lt!412931 () (_ BitVec 64))

(declare-fun lt!412932 () (_ BitVec 64))

(declare-fun lt!412933 () (_ BitVec 64))

(assert (=> d!94352 (= res!228493 (= lt!412933 (bvsub lt!412931 lt!412932)))))

(assert (=> d!94352 (or (= (bvand lt!412931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412932 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412931 lt!412932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94352 (= lt!412932 (remainingBits!0 ((_ sign_extend 32) (size!6750 (buf!7218 thiss!882))) ((_ sign_extend 32) (currentByte!13345 thiss!882)) ((_ sign_extend 32) (currentBit!13340 thiss!882))))))

(declare-fun lt!412929 () (_ BitVec 64))

(declare-fun lt!412934 () (_ BitVec 64))

(assert (=> d!94352 (= lt!412931 (bvmul lt!412929 lt!412934))))

(assert (=> d!94352 (or (= lt!412929 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412934 (bvsdiv (bvmul lt!412929 lt!412934) lt!412929)))))

(assert (=> d!94352 (= lt!412934 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94352 (= lt!412929 ((_ sign_extend 32) (size!6750 (buf!7218 thiss!882))))))

(assert (=> d!94352 (= lt!412933 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13345 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13340 thiss!882))))))

(assert (=> d!94352 (invariant!0 (currentBit!13340 thiss!882) (currentByte!13345 thiss!882) (size!6750 (buf!7218 thiss!882)))))

(assert (=> d!94352 (= (bitIndex!0 (size!6750 (buf!7218 thiss!882)) (currentByte!13345 thiss!882) (currentBit!13340 thiss!882)) lt!412933)))

(declare-fun b!274667 () Bool)

(declare-fun res!228492 () Bool)

(assert (=> b!274667 (=> (not res!228492) (not e!194551))))

(assert (=> b!274667 (= res!228492 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412933))))

(declare-fun b!274668 () Bool)

(declare-fun lt!412930 () (_ BitVec 64))

(assert (=> b!274668 (= e!194551 (bvsle lt!412933 (bvmul lt!412930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274668 (or (= lt!412930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412930)))))

(assert (=> b!274668 (= lt!412930 ((_ sign_extend 32) (size!6750 (buf!7218 thiss!882))))))

(assert (= (and d!94352 res!228493) b!274667))

(assert (= (and b!274667 res!228492) b!274668))

(declare-fun m!407307 () Bool)

(assert (=> d!94352 m!407307))

(assert (=> d!94352 m!407301))

(assert (=> b!274650 d!94352))

(push 1)

(assert (not d!94352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

