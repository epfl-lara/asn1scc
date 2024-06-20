; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60662 () Bool)

(assert start!60662)

(declare-fun res!228334 () Bool)

(declare-fun e!194350 () Bool)

(assert (=> start!60662 (=> (not res!228334) (not e!194350))))

(declare-datatypes ((array!15536 0))(
  ( (array!15537 (arr!7724 (Array (_ BitVec 32) (_ BitVec 8))) (size!6737 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12288 0))(
  ( (BitStream!12289 (buf!7205 array!15536) (currentByte!13314 (_ BitVec 32)) (currentBit!13309 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12288)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12288 (_ BitVec 64)) Bool)

(assert (=> start!60662 (= res!228334 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60662 e!194350))

(declare-fun e!194348 () Bool)

(declare-fun inv!12 (BitStream!12288) Bool)

(assert (=> start!60662 (and (inv!12 thiss!882) e!194348)))

(assert (=> start!60662 true))

(declare-fun b!274456 () Bool)

(declare-fun e!194349 () Bool)

(assert (=> b!274456 (= e!194350 e!194349)))

(declare-fun res!228333 () Bool)

(assert (=> b!274456 (=> (not res!228333) (not e!194349))))

(declare-fun lt!412625 () (_ BitVec 32))

(assert (=> b!274456 (= res!228333 (and (bvsge lt!412625 #b00000000000000000000000000000000) (bvsge lt!412625 #b00000000000000000000000000001000)))))

(assert (=> b!274456 (= lt!412625 (bvadd (currentBit!13309 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274457 () Bool)

(assert (=> b!274457 (= e!194349 (not (inv!12 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000)))))))

(declare-fun b!274458 () Bool)

(declare-fun array_inv!6461 (array!15536) Bool)

(assert (=> b!274458 (= e!194348 (array_inv!6461 (buf!7205 thiss!882)))))

(assert (= (and start!60662 res!228334) b!274456))

(assert (= (and b!274456 res!228333) b!274457))

(assert (= start!60662 b!274458))

(declare-fun m!407131 () Bool)

(assert (=> start!60662 m!407131))

(declare-fun m!407133 () Bool)

(assert (=> start!60662 m!407133))

(declare-fun m!407135 () Bool)

(assert (=> b!274457 m!407135))

(declare-fun m!407137 () Bool)

(assert (=> b!274458 m!407137))

(check-sat (not b!274458) (not start!60662) (not b!274457))
(check-sat)
(get-model)

(declare-fun d!94202 () Bool)

(assert (=> d!94202 (= (array_inv!6461 (buf!7205 thiss!882)) (bvsge (size!6737 (buf!7205 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274458 d!94202))

(declare-fun d!94204 () Bool)

(declare-fun res!228343 () Bool)

(declare-fun e!194365 () Bool)

(assert (=> d!94204 (=> (not res!228343) (not e!194365))))

(assert (=> d!94204 (= res!228343 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6737 (buf!7205 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6737 (buf!7205 thiss!882)))))))))

(assert (=> d!94204 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194365)))

(declare-fun b!274471 () Bool)

(declare-fun lt!412631 () (_ BitVec 64))

(assert (=> b!274471 (= e!194365 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412631) (bvsle lt!412631 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6737 (buf!7205 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274471 (= lt!412631 (bvadd (bitIndex!0 (size!6737 (buf!7205 thiss!882)) (currentByte!13314 thiss!882) (currentBit!13309 thiss!882)) diffInBits!15))))

(assert (= (and d!94204 res!228343) b!274471))

(declare-fun m!407147 () Bool)

(assert (=> b!274471 m!407147))

(assert (=> start!60662 d!94204))

(declare-fun d!94206 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94206 (= (inv!12 thiss!882) (invariant!0 (currentBit!13309 thiss!882) (currentByte!13314 thiss!882) (size!6737 (buf!7205 thiss!882))))))

(declare-fun bs!23726 () Bool)

(assert (= bs!23726 d!94206))

(declare-fun m!407149 () Bool)

(assert (=> bs!23726 m!407149))

(assert (=> start!60662 d!94206))

(declare-fun d!94208 () Bool)

(assert (=> d!94208 (= (inv!12 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) (invariant!0 (currentBit!13309 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) (currentByte!13314 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) (size!6737 (buf!7205 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))))))))

(declare-fun bs!23727 () Bool)

(assert (= bs!23727 d!94208))

(declare-fun m!407151 () Bool)

(assert (=> bs!23727 m!407151))

(assert (=> b!274457 d!94208))

(check-sat (not b!274471) (not d!94208) (not d!94206))
(check-sat)
(get-model)

(declare-fun d!94226 () Bool)

(declare-fun e!194374 () Bool)

(assert (=> d!94226 e!194374))

(declare-fun res!228355 () Bool)

(assert (=> d!94226 (=> (not res!228355) (not e!194374))))

(declare-fun lt!412653 () (_ BitVec 64))

(declare-fun lt!412652 () (_ BitVec 64))

(declare-fun lt!412655 () (_ BitVec 64))

(assert (=> d!94226 (= res!228355 (= lt!412655 (bvsub lt!412653 lt!412652)))))

(assert (=> d!94226 (or (= (bvand lt!412653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412652 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412653 lt!412652) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94226 (= lt!412652 (remainingBits!0 ((_ sign_extend 32) (size!6737 (buf!7205 thiss!882))) ((_ sign_extend 32) (currentByte!13314 thiss!882)) ((_ sign_extend 32) (currentBit!13309 thiss!882))))))

(declare-fun lt!412651 () (_ BitVec 64))

(declare-fun lt!412650 () (_ BitVec 64))

(assert (=> d!94226 (= lt!412653 (bvmul lt!412651 lt!412650))))

(assert (=> d!94226 (or (= lt!412651 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412650 (bvsdiv (bvmul lt!412651 lt!412650) lt!412651)))))

(assert (=> d!94226 (= lt!412650 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94226 (= lt!412651 ((_ sign_extend 32) (size!6737 (buf!7205 thiss!882))))))

(assert (=> d!94226 (= lt!412655 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13314 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13309 thiss!882))))))

(assert (=> d!94226 (invariant!0 (currentBit!13309 thiss!882) (currentByte!13314 thiss!882) (size!6737 (buf!7205 thiss!882)))))

(assert (=> d!94226 (= (bitIndex!0 (size!6737 (buf!7205 thiss!882)) (currentByte!13314 thiss!882) (currentBit!13309 thiss!882)) lt!412655)))

(declare-fun b!274484 () Bool)

(declare-fun res!228354 () Bool)

(assert (=> b!274484 (=> (not res!228354) (not e!194374))))

(assert (=> b!274484 (= res!228354 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412655))))

(declare-fun b!274485 () Bool)

(declare-fun lt!412654 () (_ BitVec 64))

(assert (=> b!274485 (= e!194374 (bvsle lt!412655 (bvmul lt!412654 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274485 (or (= lt!412654 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412654 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412654)))))

(assert (=> b!274485 (= lt!412654 ((_ sign_extend 32) (size!6737 (buf!7205 thiss!882))))))

(assert (= (and d!94226 res!228355) b!274484))

(assert (= (and b!274484 res!228354) b!274485))

(declare-fun m!407165 () Bool)

(assert (=> d!94226 m!407165))

(assert (=> d!94226 m!407149))

(assert (=> b!274471 d!94226))

(declare-fun d!94232 () Bool)

(assert (=> d!94232 (= (invariant!0 (currentBit!13309 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) (currentByte!13314 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) (size!6737 (buf!7205 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))))) (and (bvsge (currentBit!13309 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (bvslt (currentBit!13309 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) #b00000000000000000000000000001000) (bvsge (currentByte!13314 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13314 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) (size!6737 (buf!7205 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))))) (and (= (currentBit!13309 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) #b00000000000000000000000000000000) (= (currentByte!13314 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000))) (size!6737 (buf!7205 (BitStream!12289 (buf!7205 thiss!882) (bvadd (currentByte!13314 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) (bvsub lt!412625 #b00000000000000000000000000001000)))))))))))

(assert (=> d!94208 d!94232))

(declare-fun d!94234 () Bool)

(assert (=> d!94234 (= (invariant!0 (currentBit!13309 thiss!882) (currentByte!13314 thiss!882) (size!6737 (buf!7205 thiss!882))) (and (bvsge (currentBit!13309 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13309 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13314 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13314 thiss!882) (size!6737 (buf!7205 thiss!882))) (and (= (currentBit!13309 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13314 thiss!882) (size!6737 (buf!7205 thiss!882)))))))))

(assert (=> d!94206 d!94234))

(check-sat (not d!94226))
(check-sat)
