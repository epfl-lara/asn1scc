; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60740 () Bool)

(assert start!60740)

(declare-fun res!228424 () Bool)

(declare-fun e!194474 () Bool)

(assert (=> start!60740 (=> (not res!228424) (not e!194474))))

(declare-datatypes ((array!15560 0))(
  ( (array!15561 (arr!7733 (Array (_ BitVec 32) (_ BitVec 8))) (size!6746 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12306 0))(
  ( (BitStream!12307 (buf!7214 array!15560) (currentByte!13335 (_ BitVec 32)) (currentBit!13330 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12306)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12306 (_ BitVec 64)) Bool)

(assert (=> start!60740 (= res!228424 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60740 e!194474))

(declare-fun e!194476 () Bool)

(declare-fun inv!12 (BitStream!12306) Bool)

(assert (=> start!60740 (and (inv!12 thiss!882) e!194476)))

(assert (=> start!60740 true))

(declare-fun b!274579 () Bool)

(declare-fun e!194475 () Bool)

(assert (=> b!274579 (= e!194474 e!194475)))

(declare-fun res!228423 () Bool)

(assert (=> b!274579 (=> (not res!228423) (not e!194475))))

(declare-fun lt!412787 () (_ BitVec 32))

(assert (=> b!274579 (= res!228423 (and (bvsge lt!412787 #b00000000000000000000000000000000) (bvsge lt!412787 #b00000000000000000000000000001000)))))

(assert (=> b!274579 (= lt!412787 (bvadd (currentBit!13330 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274580 () Bool)

(assert (=> b!274580 (= e!194475 (not (inv!12 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000)))))))

(declare-fun b!274581 () Bool)

(declare-fun array_inv!6470 (array!15560) Bool)

(assert (=> b!274581 (= e!194476 (array_inv!6470 (buf!7214 thiss!882)))))

(assert (= (and start!60740 res!228424) b!274579))

(assert (= (and b!274579 res!228423) b!274580))

(assert (= start!60740 b!274581))

(declare-fun m!407233 () Bool)

(assert (=> start!60740 m!407233))

(declare-fun m!407235 () Bool)

(assert (=> start!60740 m!407235))

(declare-fun m!407237 () Bool)

(assert (=> b!274580 m!407237))

(declare-fun m!407239 () Bool)

(assert (=> b!274581 m!407239))

(check-sat (not b!274580) (not b!274581) (not start!60740))
(check-sat)
(get-model)

(declare-fun d!94280 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94280 (= (inv!12 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) (invariant!0 (currentBit!13330 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) (currentByte!13335 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) (size!6746 (buf!7214 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))))))))

(declare-fun bs!23744 () Bool)

(assert (= bs!23744 d!94280))

(declare-fun m!407249 () Bool)

(assert (=> bs!23744 m!407249))

(assert (=> b!274580 d!94280))

(declare-fun d!94282 () Bool)

(assert (=> d!94282 (= (array_inv!6470 (buf!7214 thiss!882)) (bvsge (size!6746 (buf!7214 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274581 d!94282))

(declare-fun d!94284 () Bool)

(declare-fun res!228433 () Bool)

(declare-fun e!194491 () Bool)

(assert (=> d!94284 (=> (not res!228433) (not e!194491))))

(assert (=> d!94284 (= res!228433 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6746 (buf!7214 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6746 (buf!7214 thiss!882)))))))))

(assert (=> d!94284 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194491)))

(declare-fun b!274594 () Bool)

(declare-fun lt!412793 () (_ BitVec 64))

(assert (=> b!274594 (= e!194491 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412793) (bvsle lt!412793 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6746 (buf!7214 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274594 (= lt!412793 (bvadd (bitIndex!0 (size!6746 (buf!7214 thiss!882)) (currentByte!13335 thiss!882) (currentBit!13330 thiss!882)) diffInBits!15))))

(assert (= (and d!94284 res!228433) b!274594))

(declare-fun m!407251 () Bool)

(assert (=> b!274594 m!407251))

(assert (=> start!60740 d!94284))

(declare-fun d!94286 () Bool)

(assert (=> d!94286 (= (inv!12 thiss!882) (invariant!0 (currentBit!13330 thiss!882) (currentByte!13335 thiss!882) (size!6746 (buf!7214 thiss!882))))))

(declare-fun bs!23745 () Bool)

(assert (= bs!23745 d!94286))

(declare-fun m!407253 () Bool)

(assert (=> bs!23745 m!407253))

(assert (=> start!60740 d!94286))

(check-sat (not b!274594) (not d!94280) (not d!94286))
(check-sat)
(get-model)

(declare-fun d!94296 () Bool)

(declare-fun e!194500 () Bool)

(assert (=> d!94296 e!194500))

(declare-fun res!228445 () Bool)

(assert (=> d!94296 (=> (not res!228445) (not e!194500))))

(declare-fun lt!412813 () (_ BitVec 64))

(declare-fun lt!412814 () (_ BitVec 64))

(declare-fun lt!412815 () (_ BitVec 64))

(assert (=> d!94296 (= res!228445 (= lt!412814 (bvsub lt!412813 lt!412815)))))

(assert (=> d!94296 (or (= (bvand lt!412813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412815 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412813 lt!412815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94296 (= lt!412815 (remainingBits!0 ((_ sign_extend 32) (size!6746 (buf!7214 thiss!882))) ((_ sign_extend 32) (currentByte!13335 thiss!882)) ((_ sign_extend 32) (currentBit!13330 thiss!882))))))

(declare-fun lt!412812 () (_ BitVec 64))

(declare-fun lt!412817 () (_ BitVec 64))

(assert (=> d!94296 (= lt!412813 (bvmul lt!412812 lt!412817))))

(assert (=> d!94296 (or (= lt!412812 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412817 (bvsdiv (bvmul lt!412812 lt!412817) lt!412812)))))

(assert (=> d!94296 (= lt!412817 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94296 (= lt!412812 ((_ sign_extend 32) (size!6746 (buf!7214 thiss!882))))))

(assert (=> d!94296 (= lt!412814 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13335 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13330 thiss!882))))))

(assert (=> d!94296 (invariant!0 (currentBit!13330 thiss!882) (currentByte!13335 thiss!882) (size!6746 (buf!7214 thiss!882)))))

(assert (=> d!94296 (= (bitIndex!0 (size!6746 (buf!7214 thiss!882)) (currentByte!13335 thiss!882) (currentBit!13330 thiss!882)) lt!412814)))

(declare-fun b!274607 () Bool)

(declare-fun res!228444 () Bool)

(assert (=> b!274607 (=> (not res!228444) (not e!194500))))

(assert (=> b!274607 (= res!228444 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412814))))

(declare-fun b!274608 () Bool)

(declare-fun lt!412816 () (_ BitVec 64))

(assert (=> b!274608 (= e!194500 (bvsle lt!412814 (bvmul lt!412816 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274608 (or (= lt!412816 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412816 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412816)))))

(assert (=> b!274608 (= lt!412816 ((_ sign_extend 32) (size!6746 (buf!7214 thiss!882))))))

(assert (= (and d!94296 res!228445) b!274607))

(assert (= (and b!274607 res!228444) b!274608))

(declare-fun m!407267 () Bool)

(assert (=> d!94296 m!407267))

(assert (=> d!94296 m!407253))

(assert (=> b!274594 d!94296))

(declare-fun d!94306 () Bool)

(assert (=> d!94306 (= (invariant!0 (currentBit!13330 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) (currentByte!13335 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) (size!6746 (buf!7214 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))))) (and (bvsge (currentBit!13330 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (bvslt (currentBit!13330 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) #b00000000000000000000000000001000) (bvsge (currentByte!13335 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13335 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) (size!6746 (buf!7214 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))))) (and (= (currentBit!13330 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (= (currentByte!13335 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000))) (size!6746 (buf!7214 (BitStream!12307 (buf!7214 thiss!882) (bvadd #b00000000000000000000000000000001 ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)) (currentByte!13335 thiss!882)) (bvsub lt!412787 #b00000000000000000000000000001000)))))))))))

(assert (=> d!94280 d!94306))

(declare-fun d!94308 () Bool)

(assert (=> d!94308 (= (invariant!0 (currentBit!13330 thiss!882) (currentByte!13335 thiss!882) (size!6746 (buf!7214 thiss!882))) (and (bvsge (currentBit!13330 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13330 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13335 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13335 thiss!882) (size!6746 (buf!7214 thiss!882))) (and (= (currentBit!13330 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13335 thiss!882) (size!6746 (buf!7214 thiss!882)))))))))

(assert (=> d!94286 d!94308))

(check-sat (not d!94296))
(check-sat)
