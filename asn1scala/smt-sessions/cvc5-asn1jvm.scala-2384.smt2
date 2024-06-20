; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60874 () Bool)

(assert start!60874)

(declare-fun res!228594 () Bool)

(declare-fun e!194673 () Bool)

(assert (=> start!60874 (=> (not res!228594) (not e!194673))))

(declare-datatypes ((array!15594 0))(
  ( (array!15595 (arr!7744 (Array (_ BitVec 32) (_ BitVec 8))) (size!6757 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12328 0))(
  ( (BitStream!12329 (buf!7225 array!15594) (currentByte!13366 (_ BitVec 32)) (currentBit!13361 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12328)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12328 (_ BitVec 64)) Bool)

(assert (=> start!60874 (= res!228594 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60874 e!194673))

(declare-fun e!194671 () Bool)

(declare-fun inv!12 (BitStream!12328) Bool)

(assert (=> start!60874 (and (inv!12 thiss!882) e!194671)))

(assert (=> start!60874 true))

(declare-fun b!274795 () Bool)

(declare-fun e!194672 () Bool)

(assert (=> b!274795 (= e!194673 e!194672)))

(declare-fun res!228595 () Bool)

(assert (=> b!274795 (=> (not res!228595) (not e!194672))))

(declare-fun lt!413117 () (_ BitVec 32))

(assert (=> b!274795 (= res!228595 (and (bvsge lt!413117 #b00000000000000000000000000000000) (bvslt lt!413117 #b00000000000000000000000000001000)))))

(assert (=> b!274795 (= lt!413117 (bvadd (currentBit!13361 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274796 () Bool)

(assert (=> b!274796 (= e!194672 (not (inv!12 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117))))))

(declare-fun b!274797 () Bool)

(declare-fun array_inv!6481 (array!15594) Bool)

(assert (=> b!274797 (= e!194671 (array_inv!6481 (buf!7225 thiss!882)))))

(assert (= (and start!60874 res!228594) b!274795))

(assert (= (and b!274795 res!228595) b!274796))

(assert (= start!60874 b!274797))

(declare-fun m!407399 () Bool)

(assert (=> start!60874 m!407399))

(declare-fun m!407401 () Bool)

(assert (=> start!60874 m!407401))

(declare-fun m!407403 () Bool)

(assert (=> b!274796 m!407403))

(declare-fun m!407405 () Bool)

(assert (=> b!274797 m!407405))

(push 1)

(assert (not b!274797))

(assert (not b!274796))

(assert (not start!60874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94422 () Bool)

(assert (=> d!94422 (= (array_inv!6481 (buf!7225 thiss!882)) (bvsge (size!6757 (buf!7225 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274797 d!94422))

(declare-fun d!94424 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94424 (= (inv!12 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) (invariant!0 (currentBit!13361 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) (currentByte!13366 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) (size!6757 (buf!7225 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)))))))

(declare-fun bs!23771 () Bool)

(assert (= bs!23771 d!94424))

(declare-fun m!407423 () Bool)

(assert (=> bs!23771 m!407423))

(assert (=> b!274796 d!94424))

(declare-fun d!94426 () Bool)

(declare-fun res!228610 () Bool)

(declare-fun e!194701 () Bool)

(assert (=> d!94426 (=> (not res!228610) (not e!194701))))

(assert (=> d!94426 (= res!228610 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6757 (buf!7225 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6757 (buf!7225 thiss!882)))))))))

(assert (=> d!94426 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194701)))

(declare-fun b!274819 () Bool)

(declare-fun lt!413126 () (_ BitVec 64))

(assert (=> b!274819 (= e!194701 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413126) (bvsle lt!413126 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6757 (buf!7225 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274819 (= lt!413126 (bvadd (bitIndex!0 (size!6757 (buf!7225 thiss!882)) (currentByte!13366 thiss!882) (currentBit!13361 thiss!882)) diffInBits!15))))

(assert (= (and d!94426 res!228610) b!274819))

(declare-fun m!407425 () Bool)

(assert (=> b!274819 m!407425))

(assert (=> start!60874 d!94426))

(declare-fun d!94428 () Bool)

(assert (=> d!94428 (= (inv!12 thiss!882) (invariant!0 (currentBit!13361 thiss!882) (currentByte!13366 thiss!882) (size!6757 (buf!7225 thiss!882))))))

(declare-fun bs!23772 () Bool)

(assert (= bs!23772 d!94428))

(declare-fun m!407427 () Bool)

(assert (=> bs!23772 m!407427))

(assert (=> start!60874 d!94428))

(push 1)

(assert (not b!274819))

(assert (not d!94428))

(assert (not d!94424))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94442 () Bool)

(declare-fun e!194710 () Bool)

(assert (=> d!94442 e!194710))

(declare-fun res!228621 () Bool)

(assert (=> d!94442 (=> (not res!228621) (not e!194710))))

(declare-fun lt!413145 () (_ BitVec 64))

(declare-fun lt!413150 () (_ BitVec 64))

(declare-fun lt!413147 () (_ BitVec 64))

(assert (=> d!94442 (= res!228621 (= lt!413147 (bvsub lt!413145 lt!413150)))))

(assert (=> d!94442 (or (= (bvand lt!413145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413150 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413145 lt!413150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94442 (= lt!413150 (remainingBits!0 ((_ sign_extend 32) (size!6757 (buf!7225 thiss!882))) ((_ sign_extend 32) (currentByte!13366 thiss!882)) ((_ sign_extend 32) (currentBit!13361 thiss!882))))))

(declare-fun lt!413149 () (_ BitVec 64))

(declare-fun lt!413148 () (_ BitVec 64))

(assert (=> d!94442 (= lt!413145 (bvmul lt!413149 lt!413148))))

(assert (=> d!94442 (or (= lt!413149 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413148 (bvsdiv (bvmul lt!413149 lt!413148) lt!413149)))))

(assert (=> d!94442 (= lt!413148 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94442 (= lt!413149 ((_ sign_extend 32) (size!6757 (buf!7225 thiss!882))))))

(assert (=> d!94442 (= lt!413147 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13366 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13361 thiss!882))))))

(assert (=> d!94442 (invariant!0 (currentBit!13361 thiss!882) (currentByte!13366 thiss!882) (size!6757 (buf!7225 thiss!882)))))

(assert (=> d!94442 (= (bitIndex!0 (size!6757 (buf!7225 thiss!882)) (currentByte!13366 thiss!882) (currentBit!13361 thiss!882)) lt!413147)))

(declare-fun b!274832 () Bool)

(declare-fun res!228622 () Bool)

(assert (=> b!274832 (=> (not res!228622) (not e!194710))))

(assert (=> b!274832 (= res!228622 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413147))))

(declare-fun b!274833 () Bool)

(declare-fun lt!413146 () (_ BitVec 64))

(assert (=> b!274833 (= e!194710 (bvsle lt!413147 (bvmul lt!413146 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274833 (or (= lt!413146 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413146 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413146)))))

(assert (=> b!274833 (= lt!413146 ((_ sign_extend 32) (size!6757 (buf!7225 thiss!882))))))

(assert (= (and d!94442 res!228621) b!274832))

(assert (= (and b!274832 res!228622) b!274833))

(declare-fun m!407441 () Bool)

(assert (=> d!94442 m!407441))

(assert (=> d!94442 m!407427))

(assert (=> b!274819 d!94442))

(declare-fun d!94448 () Bool)

(assert (=> d!94448 (= (invariant!0 (currentBit!13361 thiss!882) (currentByte!13366 thiss!882) (size!6757 (buf!7225 thiss!882))) (and (bvsge (currentBit!13361 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13361 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13366 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13366 thiss!882) (size!6757 (buf!7225 thiss!882))) (and (= (currentBit!13361 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13366 thiss!882) (size!6757 (buf!7225 thiss!882)))))))))

(assert (=> d!94428 d!94448))

(declare-fun d!94450 () Bool)

(assert (=> d!94450 (= (invariant!0 (currentBit!13361 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) (currentByte!13366 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) (size!6757 (buf!7225 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)))) (and (bvsge (currentBit!13361 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) #b00000000000000000000000000000000) (bvslt (currentBit!13361 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) #b00000000000000000000000000001000) (bvsge (currentByte!13366 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13366 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) (size!6757 (buf!7225 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)))) (and (= (currentBit!13361 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) #b00000000000000000000000000000000) (= (currentByte!13366 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117)) (size!6757 (buf!7225 (BitStream!12329 (buf!7225 thiss!882) (bvadd (currentByte!13366 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413117))))))))))

(assert (=> d!94424 d!94450))

(push 1)

(assert (not d!94442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

