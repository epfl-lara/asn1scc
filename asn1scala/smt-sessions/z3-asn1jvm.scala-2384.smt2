; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60876 () Bool)

(assert start!60876)

(declare-fun res!228600 () Bool)

(declare-fun e!194684 () Bool)

(assert (=> start!60876 (=> (not res!228600) (not e!194684))))

(declare-datatypes ((array!15596 0))(
  ( (array!15597 (arr!7745 (Array (_ BitVec 32) (_ BitVec 8))) (size!6758 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12330 0))(
  ( (BitStream!12331 (buf!7226 array!15596) (currentByte!13367 (_ BitVec 32)) (currentBit!13362 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12330)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12330 (_ BitVec 64)) Bool)

(assert (=> start!60876 (= res!228600 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60876 e!194684))

(declare-fun e!194686 () Bool)

(declare-fun inv!12 (BitStream!12330) Bool)

(assert (=> start!60876 (and (inv!12 thiss!882) e!194686)))

(assert (=> start!60876 true))

(declare-fun b!274804 () Bool)

(declare-fun e!194683 () Bool)

(assert (=> b!274804 (= e!194684 e!194683)))

(declare-fun res!228601 () Bool)

(assert (=> b!274804 (=> (not res!228601) (not e!194683))))

(declare-fun lt!413120 () (_ BitVec 32))

(assert (=> b!274804 (= res!228601 (and (bvsge lt!413120 #b00000000000000000000000000000000) (bvslt lt!413120 #b00000000000000000000000000001000)))))

(assert (=> b!274804 (= lt!413120 (bvadd (currentBit!13362 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274805 () Bool)

(assert (=> b!274805 (= e!194683 (not (inv!12 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120))))))

(declare-fun b!274806 () Bool)

(declare-fun array_inv!6482 (array!15596) Bool)

(assert (=> b!274806 (= e!194686 (array_inv!6482 (buf!7226 thiss!882)))))

(assert (= (and start!60876 res!228600) b!274804))

(assert (= (and b!274804 res!228601) b!274805))

(assert (= start!60876 b!274806))

(declare-fun m!407407 () Bool)

(assert (=> start!60876 m!407407))

(declare-fun m!407409 () Bool)

(assert (=> start!60876 m!407409))

(declare-fun m!407411 () Bool)

(assert (=> b!274805 m!407411))

(declare-fun m!407413 () Bool)

(assert (=> b!274806 m!407413))

(check-sat (not start!60876) (not b!274806) (not b!274805))
(check-sat)
(get-model)

(declare-fun d!94436 () Bool)

(declare-fun res!228616 () Bool)

(declare-fun e!194707 () Bool)

(assert (=> d!94436 (=> (not res!228616) (not e!194707))))

(assert (=> d!94436 (= res!228616 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6758 (buf!7226 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6758 (buf!7226 thiss!882)))))))))

(assert (=> d!94436 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194707)))

(declare-fun b!274827 () Bool)

(declare-fun lt!413132 () (_ BitVec 64))

(assert (=> b!274827 (= e!194707 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413132) (bvsle lt!413132 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6758 (buf!7226 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274827 (= lt!413132 (bvadd (bitIndex!0 (size!6758 (buf!7226 thiss!882)) (currentByte!13367 thiss!882) (currentBit!13362 thiss!882)) diffInBits!15))))

(assert (= (and d!94436 res!228616) b!274827))

(declare-fun m!407435 () Bool)

(assert (=> b!274827 m!407435))

(assert (=> start!60876 d!94436))

(declare-fun d!94440 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94440 (= (inv!12 thiss!882) (invariant!0 (currentBit!13362 thiss!882) (currentByte!13367 thiss!882) (size!6758 (buf!7226 thiss!882))))))

(declare-fun bs!23775 () Bool)

(assert (= bs!23775 d!94440))

(declare-fun m!407437 () Bool)

(assert (=> bs!23775 m!407437))

(assert (=> start!60876 d!94440))

(declare-fun d!94444 () Bool)

(assert (=> d!94444 (= (array_inv!6482 (buf!7226 thiss!882)) (bvsge (size!6758 (buf!7226 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274806 d!94444))

(declare-fun d!94446 () Bool)

(assert (=> d!94446 (= (inv!12 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) (invariant!0 (currentBit!13362 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) (currentByte!13367 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) (size!6758 (buf!7226 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)))))))

(declare-fun bs!23776 () Bool)

(assert (= bs!23776 d!94446))

(declare-fun m!407439 () Bool)

(assert (=> bs!23776 m!407439))

(assert (=> b!274805 d!94446))

(check-sat (not b!274827) (not d!94440) (not d!94446))
(check-sat)
(get-model)

(declare-fun d!94456 () Bool)

(declare-fun e!194716 () Bool)

(assert (=> d!94456 e!194716))

(declare-fun res!228633 () Bool)

(assert (=> d!94456 (=> (not res!228633) (not e!194716))))

(declare-fun lt!413182 () (_ BitVec 64))

(declare-fun lt!413183 () (_ BitVec 64))

(declare-fun lt!413186 () (_ BitVec 64))

(assert (=> d!94456 (= res!228633 (= lt!413183 (bvsub lt!413186 lt!413182)))))

(assert (=> d!94456 (or (= (bvand lt!413186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413182 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413186 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413186 lt!413182) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94456 (= lt!413182 (remainingBits!0 ((_ sign_extend 32) (size!6758 (buf!7226 thiss!882))) ((_ sign_extend 32) (currentByte!13367 thiss!882)) ((_ sign_extend 32) (currentBit!13362 thiss!882))))))

(declare-fun lt!413185 () (_ BitVec 64))

(declare-fun lt!413184 () (_ BitVec 64))

(assert (=> d!94456 (= lt!413186 (bvmul lt!413185 lt!413184))))

(assert (=> d!94456 (or (= lt!413185 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413184 (bvsdiv (bvmul lt!413185 lt!413184) lt!413185)))))

(assert (=> d!94456 (= lt!413184 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94456 (= lt!413185 ((_ sign_extend 32) (size!6758 (buf!7226 thiss!882))))))

(assert (=> d!94456 (= lt!413183 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13367 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13362 thiss!882))))))

(assert (=> d!94456 (invariant!0 (currentBit!13362 thiss!882) (currentByte!13367 thiss!882) (size!6758 (buf!7226 thiss!882)))))

(assert (=> d!94456 (= (bitIndex!0 (size!6758 (buf!7226 thiss!882)) (currentByte!13367 thiss!882) (currentBit!13362 thiss!882)) lt!413183)))

(declare-fun b!274844 () Bool)

(declare-fun res!228634 () Bool)

(assert (=> b!274844 (=> (not res!228634) (not e!194716))))

(assert (=> b!274844 (= res!228634 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413183))))

(declare-fun b!274845 () Bool)

(declare-fun lt!413181 () (_ BitVec 64))

(assert (=> b!274845 (= e!194716 (bvsle lt!413183 (bvmul lt!413181 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274845 (or (= lt!413181 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413181 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413181)))))

(assert (=> b!274845 (= lt!413181 ((_ sign_extend 32) (size!6758 (buf!7226 thiss!882))))))

(assert (= (and d!94456 res!228633) b!274844))

(assert (= (and b!274844 res!228634) b!274845))

(declare-fun m!407445 () Bool)

(assert (=> d!94456 m!407445))

(assert (=> d!94456 m!407437))

(assert (=> b!274827 d!94456))

(declare-fun d!94460 () Bool)

(assert (=> d!94460 (= (invariant!0 (currentBit!13362 thiss!882) (currentByte!13367 thiss!882) (size!6758 (buf!7226 thiss!882))) (and (bvsge (currentBit!13362 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13362 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13367 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13367 thiss!882) (size!6758 (buf!7226 thiss!882))) (and (= (currentBit!13362 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13367 thiss!882) (size!6758 (buf!7226 thiss!882)))))))))

(assert (=> d!94440 d!94460))

(declare-fun d!94462 () Bool)

(assert (=> d!94462 (= (invariant!0 (currentBit!13362 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) (currentByte!13367 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) (size!6758 (buf!7226 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)))) (and (bvsge (currentBit!13362 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) #b00000000000000000000000000000000) (bvslt (currentBit!13362 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) #b00000000000000000000000000001000) (bvsge (currentByte!13367 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13367 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) (size!6758 (buf!7226 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)))) (and (= (currentBit!13362 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) #b00000000000000000000000000000000) (= (currentByte!13367 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120)) (size!6758 (buf!7226 (BitStream!12331 (buf!7226 thiss!882) (bvadd (currentByte!13367 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!413120))))))))))

(assert (=> d!94446 d!94462))

(check-sat (not d!94456))
(check-sat)
