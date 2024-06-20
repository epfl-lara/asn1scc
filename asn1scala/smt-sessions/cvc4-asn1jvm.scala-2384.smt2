; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60878 () Bool)

(assert start!60878)

(declare-fun res!228607 () Bool)

(declare-fun e!194695 () Bool)

(assert (=> start!60878 (=> (not res!228607) (not e!194695))))

(declare-datatypes ((array!15598 0))(
  ( (array!15599 (arr!7746 (Array (_ BitVec 32) (_ BitVec 8))) (size!6759 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12332 0))(
  ( (BitStream!12333 (buf!7227 array!15598) (currentByte!13368 (_ BitVec 32)) (currentBit!13363 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12332)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12332 (_ BitVec 64)) Bool)

(assert (=> start!60878 (= res!228607 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60878 e!194695))

(declare-fun e!194698 () Bool)

(declare-fun inv!12 (BitStream!12332) Bool)

(assert (=> start!60878 (and (inv!12 thiss!882) e!194698)))

(assert (=> start!60878 true))

(declare-fun b!274813 () Bool)

(declare-fun e!194697 () Bool)

(assert (=> b!274813 (= e!194695 e!194697)))

(declare-fun res!228606 () Bool)

(assert (=> b!274813 (=> (not res!228606) (not e!194697))))

(declare-fun lt!413123 () (_ BitVec 32))

(assert (=> b!274813 (= res!228606 (and (bvsge lt!413123 #b00000000000000000000000000000000) (bvslt lt!413123 #b00000000000000000000000000001000)))))

(assert (=> b!274813 (= lt!413123 (bvadd (currentBit!13363 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274814 () Bool)

(assert (=> b!274814 (= e!194697 (not (inv!12 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123))))))

(declare-fun b!274815 () Bool)

(declare-fun array_inv!6483 (array!15598) Bool)

(assert (=> b!274815 (= e!194698 (array_inv!6483 (buf!7227 thiss!882)))))

(assert (= (and start!60878 res!228607) b!274813))

(assert (= (and b!274813 res!228606) b!274814))

(assert (= start!60878 b!274815))

(declare-fun m!407415 () Bool)

(assert (=> start!60878 m!407415))

(declare-fun m!407417 () Bool)

(assert (=> start!60878 m!407417))

(declare-fun m!407419 () Bool)

(assert (=> b!274814 m!407419))

(declare-fun m!407421 () Bool)

(assert (=> b!274815 m!407421))

(push 1)

(assert (not b!274815))

(assert (not b!274814))

(assert (not start!60878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94430 () Bool)

(assert (=> d!94430 (= (array_inv!6483 (buf!7227 thiss!882)) (bvsge (size!6759 (buf!7227 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274815 d!94430))

(declare-fun d!94432 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94432 (= (inv!12 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) (invariant!0 (currentBit!13363 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) (currentByte!13368 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) (size!6759 (buf!7227 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)))))))

(declare-fun bs!23773 () Bool)

(assert (= bs!23773 d!94432))

(declare-fun m!407429 () Bool)

(assert (=> bs!23773 m!407429))

(assert (=> b!274814 d!94432))

(declare-fun d!94434 () Bool)

(declare-fun res!228613 () Bool)

(declare-fun e!194704 () Bool)

(assert (=> d!94434 (=> (not res!228613) (not e!194704))))

(assert (=> d!94434 (= res!228613 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6759 (buf!7227 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6759 (buf!7227 thiss!882)))))))))

(assert (=> d!94434 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194704)))

(declare-fun b!274823 () Bool)

(declare-fun lt!413129 () (_ BitVec 64))

(assert (=> b!274823 (= e!194704 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413129) (bvsle lt!413129 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6759 (buf!7227 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274823 (= lt!413129 (bvadd (bitIndex!0 (size!6759 (buf!7227 thiss!882)) (currentByte!13368 thiss!882) (currentBit!13363 thiss!882)) diffInBits!15))))

(assert (= (and d!94434 res!228613) b!274823))

(declare-fun m!407431 () Bool)

(assert (=> b!274823 m!407431))

(assert (=> start!60878 d!94434))

(declare-fun d!94438 () Bool)

(assert (=> d!94438 (= (inv!12 thiss!882) (invariant!0 (currentBit!13363 thiss!882) (currentByte!13368 thiss!882) (size!6759 (buf!7227 thiss!882))))))

(declare-fun bs!23774 () Bool)

(assert (= bs!23774 d!94438))

(declare-fun m!407433 () Bool)

(assert (=> bs!23774 m!407433))

(assert (=> start!60878 d!94438))

(push 1)

(assert (not d!94432))

(assert (not b!274823))

(assert (not d!94438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94452 () Bool)

(assert (=> d!94452 (= (invariant!0 (currentBit!13363 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) (currentByte!13368 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) (size!6759 (buf!7227 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)))) (and (bvsge (currentBit!13363 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) #b00000000000000000000000000000000) (bvslt (currentBit!13363 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) #b00000000000000000000000000001000) (bvsge (currentByte!13368 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13368 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) (size!6759 (buf!7227 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)))) (and (= (currentBit!13363 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) #b00000000000000000000000000000000) (= (currentByte!13368 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123)) (size!6759 (buf!7227 (BitStream!12333 (buf!7227 thiss!882) (bvadd (currentByte!13368 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413123))))))))))

(assert (=> d!94432 d!94452))

(declare-fun d!94454 () Bool)

(declare-fun e!194713 () Bool)

(assert (=> d!94454 e!194713))

(declare-fun res!228627 () Bool)

(assert (=> d!94454 (=> (not res!228627) (not e!194713))))

(declare-fun lt!413167 () (_ BitVec 64))

(declare-fun lt!413164 () (_ BitVec 64))

(declare-fun lt!413168 () (_ BitVec 64))

(assert (=> d!94454 (= res!228627 (= lt!413168 (bvsub lt!413164 lt!413167)))))

(assert (=> d!94454 (or (= (bvand lt!413164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413167 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413164 lt!413167) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94454 (= lt!413167 (remainingBits!0 ((_ sign_extend 32) (size!6759 (buf!7227 thiss!882))) ((_ sign_extend 32) (currentByte!13368 thiss!882)) ((_ sign_extend 32) (currentBit!13363 thiss!882))))))

(declare-fun lt!413163 () (_ BitVec 64))

(declare-fun lt!413166 () (_ BitVec 64))

(assert (=> d!94454 (= lt!413164 (bvmul lt!413163 lt!413166))))

(assert (=> d!94454 (or (= lt!413163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413166 (bvsdiv (bvmul lt!413163 lt!413166) lt!413163)))))

(assert (=> d!94454 (= lt!413166 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94454 (= lt!413163 ((_ sign_extend 32) (size!6759 (buf!7227 thiss!882))))))

(assert (=> d!94454 (= lt!413168 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13368 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13363 thiss!882))))))

(assert (=> d!94454 (invariant!0 (currentBit!13363 thiss!882) (currentByte!13368 thiss!882) (size!6759 (buf!7227 thiss!882)))))

(assert (=> d!94454 (= (bitIndex!0 (size!6759 (buf!7227 thiss!882)) (currentByte!13368 thiss!882) (currentBit!13363 thiss!882)) lt!413168)))

(declare-fun b!274838 () Bool)

(declare-fun res!228628 () Bool)

(assert (=> b!274838 (=> (not res!228628) (not e!194713))))

(assert (=> b!274838 (= res!228628 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413168))))

(declare-fun b!274839 () Bool)

(declare-fun lt!413165 () (_ BitVec 64))

(assert (=> b!274839 (= e!194713 (bvsle lt!413168 (bvmul lt!413165 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274839 (or (= lt!413165 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413165 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413165)))))

(assert (=> b!274839 (= lt!413165 ((_ sign_extend 32) (size!6759 (buf!7227 thiss!882))))))

(assert (= (and d!94454 res!228627) b!274838))

(assert (= (and b!274838 res!228628) b!274839))

(declare-fun m!407443 () Bool)

(assert (=> d!94454 m!407443))

(assert (=> d!94454 m!407433))

(assert (=> b!274823 d!94454))

(declare-fun d!94458 () Bool)

(assert (=> d!94458 (= (invariant!0 (currentBit!13363 thiss!882) (currentByte!13368 thiss!882) (size!6759 (buf!7227 thiss!882))) (and (bvsge (currentBit!13363 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13363 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13368 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13368 thiss!882) (size!6759 (buf!7227 thiss!882))) (and (= (currentBit!13363 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13368 thiss!882) (size!6759 (buf!7227 thiss!882)))))))))

(assert (=> d!94438 d!94458))

(push 1)

(assert (not d!94454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

