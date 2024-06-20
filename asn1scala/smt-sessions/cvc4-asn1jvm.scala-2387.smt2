; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60950 () Bool)

(assert start!60950)

(declare-fun res!228706 () Bool)

(declare-fun e!194830 () Bool)

(assert (=> start!60950 (=> (not res!228706) (not e!194830))))

(declare-datatypes ((array!15622 0))(
  ( (array!15623 (arr!7755 (Array (_ BitVec 32) (_ BitVec 8))) (size!6768 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12350 0))(
  ( (BitStream!12351 (buf!7236 array!15622) (currentByte!13386 (_ BitVec 32)) (currentBit!13381 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12350)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12350 (_ BitVec 64)) Bool)

(assert (=> start!60950 (= res!228706 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60950 e!194830))

(declare-fun e!194833 () Bool)

(declare-fun inv!12 (BitStream!12350) Bool)

(assert (=> start!60950 (and (inv!12 thiss!882) e!194833)))

(assert (=> start!60950 true))

(declare-fun b!274945 () Bool)

(declare-fun e!194831 () Bool)

(assert (=> b!274945 (= e!194830 e!194831)))

(declare-fun res!228705 () Bool)

(assert (=> b!274945 (=> (not res!228705) (not e!194831))))

(declare-fun lt!413303 () (_ BitVec 32))

(assert (=> b!274945 (= res!228705 (and (bvsge lt!413303 #b00000000000000000000000000000000) (bvslt lt!413303 #b00000000000000000000000000001000)))))

(assert (=> b!274945 (= lt!413303 (bvadd (currentBit!13381 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274946 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274946 (= e!194831 (not (= (bvadd (bitIndex!0 (size!6768 (buf!7236 thiss!882)) (currentByte!13386 thiss!882) (currentBit!13381 thiss!882)) diffInBits!15) (bitIndex!0 (size!6768 (buf!7236 thiss!882)) (bvadd (currentByte!13386 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413303))))))

(declare-fun b!274947 () Bool)

(declare-fun array_inv!6492 (array!15622) Bool)

(assert (=> b!274947 (= e!194833 (array_inv!6492 (buf!7236 thiss!882)))))

(assert (= (and start!60950 res!228706) b!274945))

(assert (= (and b!274945 res!228705) b!274946))

(assert (= start!60950 b!274947))

(declare-fun m!407521 () Bool)

(assert (=> start!60950 m!407521))

(declare-fun m!407523 () Bool)

(assert (=> start!60950 m!407523))

(declare-fun m!407525 () Bool)

(assert (=> b!274946 m!407525))

(declare-fun m!407527 () Bool)

(assert (=> b!274946 m!407527))

(declare-fun m!407529 () Bool)

(assert (=> b!274947 m!407529))

(push 1)

(assert (not start!60950))

(assert (not b!274947))

(assert (not b!274946))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94502 () Bool)

(declare-fun res!228720 () Bool)

(declare-fun e!194843 () Bool)

(assert (=> d!94502 (=> (not res!228720) (not e!194843))))

(assert (=> d!94502 (= res!228720 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6768 (buf!7236 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6768 (buf!7236 thiss!882)))))))))

(assert (=> d!94502 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194843)))

(declare-fun b!274963 () Bool)

(declare-fun lt!413333 () (_ BitVec 64))

(assert (=> b!274963 (= e!194843 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413333) (bvsle lt!413333 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6768 (buf!7236 thiss!882)))))))))

(assert (=> b!274963 (= lt!413333 (bvadd (bitIndex!0 (size!6768 (buf!7236 thiss!882)) (currentByte!13386 thiss!882) (currentBit!13381 thiss!882)) diffInBits!15))))

(assert (= (and d!94502 res!228720) b!274963))

(assert (=> b!274963 m!407525))

(assert (=> start!60950 d!94502))

(declare-fun d!94508 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94508 (= (inv!12 thiss!882) (invariant!0 (currentBit!13381 thiss!882) (currentByte!13386 thiss!882) (size!6768 (buf!7236 thiss!882))))))

(declare-fun bs!23790 () Bool)

(assert (= bs!23790 d!94508))

(declare-fun m!407539 () Bool)

(assert (=> bs!23790 m!407539))

(assert (=> start!60950 d!94508))

(declare-fun d!94512 () Bool)

(assert (=> d!94512 (= (array_inv!6492 (buf!7236 thiss!882)) (bvsge (size!6768 (buf!7236 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274947 d!94512))

(declare-fun d!94514 () Bool)

(declare-fun e!194853 () Bool)

(assert (=> d!94514 e!194853))

(declare-fun res!228736 () Bool)

(assert (=> d!94514 (=> (not res!228736) (not e!194853))))

(declare-fun lt!413376 () (_ BitVec 64))

(declare-fun lt!413375 () (_ BitVec 64))

(declare-fun lt!413378 () (_ BitVec 64))

(assert (=> d!94514 (= res!228736 (= lt!413378 (bvsub lt!413376 lt!413375)))))

(assert (=> d!94514 (or (= (bvand lt!413376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413375 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413376 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413376 lt!413375) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94514 (= lt!413375 (remainingBits!0 ((_ sign_extend 32) (size!6768 (buf!7236 thiss!882))) ((_ sign_extend 32) (currentByte!13386 thiss!882)) ((_ sign_extend 32) (currentBit!13381 thiss!882))))))

(declare-fun lt!413373 () (_ BitVec 64))

(declare-fun lt!413374 () (_ BitVec 64))

(assert (=> d!94514 (= lt!413376 (bvmul lt!413373 lt!413374))))

(assert (=> d!94514 (or (= lt!413373 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413374 (bvsdiv (bvmul lt!413373 lt!413374) lt!413373)))))

(assert (=> d!94514 (= lt!413374 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94514 (= lt!413373 ((_ sign_extend 32) (size!6768 (buf!7236 thiss!882))))))

(assert (=> d!94514 (= lt!413378 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13386 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13381 thiss!882))))))

(assert (=> d!94514 (invariant!0 (currentBit!13381 thiss!882) (currentByte!13386 thiss!882) (size!6768 (buf!7236 thiss!882)))))

(assert (=> d!94514 (= (bitIndex!0 (size!6768 (buf!7236 thiss!882)) (currentByte!13386 thiss!882) (currentBit!13381 thiss!882)) lt!413378)))

(declare-fun b!274980 () Bool)

(declare-fun res!228737 () Bool)

(assert (=> b!274980 (=> (not res!228737) (not e!194853))))

(assert (=> b!274980 (= res!228737 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413378))))

(declare-fun b!274981 () Bool)

(declare-fun lt!413377 () (_ BitVec 64))

(assert (=> b!274981 (= e!194853 (bvsle lt!413378 (bvmul lt!413377 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274981 (or (= lt!413377 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413377 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413377)))))

(assert (=> b!274981 (= lt!413377 ((_ sign_extend 32) (size!6768 (buf!7236 thiss!882))))))

(assert (= (and d!94514 res!228736) b!274980))

(assert (= (and b!274980 res!228737) b!274981))

(declare-fun m!407549 () Bool)

(assert (=> d!94514 m!407549))

(assert (=> d!94514 m!407539))

(assert (=> b!274946 d!94514))

(declare-fun d!94522 () Bool)

(declare-fun e!194854 () Bool)

(assert (=> d!94522 e!194854))

(declare-fun res!228738 () Bool)

(assert (=> d!94522 (=> (not res!228738) (not e!194854))))

(declare-fun lt!413382 () (_ BitVec 64))

(declare-fun lt!413384 () (_ BitVec 64))

(declare-fun lt!413381 () (_ BitVec 64))

(assert (=> d!94522 (= res!228738 (= lt!413384 (bvsub lt!413382 lt!413381)))))

(assert (=> d!94522 (or (= (bvand lt!413382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413381 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413382 lt!413381) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!94522 (= lt!413381 (remainingBits!0 ((_ sign_extend 32) (size!6768 (buf!7236 thiss!882))) ((_ sign_extend 32) (bvadd (currentByte!13386 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 32) lt!413303)))))

(declare-fun lt!413379 () (_ BitVec 64))

(declare-fun lt!413380 () (_ BitVec 64))

(assert (=> d!94522 (= lt!413382 (bvmul lt!413379 lt!413380))))

(assert (=> d!94522 (or (= lt!413379 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413380 (bvsdiv (bvmul lt!413379 lt!413380) lt!413379)))))

(assert (=> d!94522 (= lt!413380 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94522 (= lt!413379 ((_ sign_extend 32) (size!6768 (buf!7236 thiss!882))))))

(assert (=> d!94522 (= lt!413384 (bvadd (bvmul ((_ sign_extend 32) (bvadd (currentByte!13386 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!413303)))))

(assert (=> d!94522 (invariant!0 lt!413303 (bvadd (currentByte!13386 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (size!6768 (buf!7236 thiss!882)))))

(assert (=> d!94522 (= (bitIndex!0 (size!6768 (buf!7236 thiss!882)) (bvadd (currentByte!13386 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413303) lt!413384)))

(declare-fun b!274982 () Bool)

(declare-fun res!228739 () Bool)

(assert (=> b!274982 (=> (not res!228739) (not e!194854))))

(assert (=> b!274982 (= res!228739 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413384))))

(declare-fun b!274983 () Bool)

(declare-fun lt!413383 () (_ BitVec 64))

(assert (=> b!274983 (= e!194854 (bvsle lt!413384 (bvmul lt!413383 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274983 (or (= lt!413383 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413383 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413383)))))

(assert (=> b!274983 (= lt!413383 ((_ sign_extend 32) (size!6768 (buf!7236 thiss!882))))))

(assert (= (and d!94522 res!228738) b!274982))

(assert (= (and b!274982 res!228739) b!274983))

(declare-fun m!407551 () Bool)

(assert (=> d!94522 m!407551))

(declare-fun m!407553 () Bool)

(assert (=> d!94522 m!407553))

(assert (=> b!274946 d!94522))

(push 1)

(assert (not b!274963))

(assert (not d!94514))

(assert (not d!94508))

(assert (not d!94522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

