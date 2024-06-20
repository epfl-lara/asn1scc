; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60698 () Bool)

(assert start!60698)

(declare-fun res!228373 () Bool)

(declare-fun e!194398 () Bool)

(assert (=> start!60698 (=> (not res!228373) (not e!194398))))

(declare-datatypes ((array!15545 0))(
  ( (array!15546 (arr!7727 (Array (_ BitVec 32) (_ BitVec 8))) (size!6740 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12294 0))(
  ( (BitStream!12295 (buf!7208 array!15545) (currentByte!13323 (_ BitVec 32)) (currentBit!13318 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12294)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12294 (_ BitVec 64)) Bool)

(assert (=> start!60698 (= res!228373 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60698 e!194398))

(declare-fun e!194397 () Bool)

(declare-fun inv!12 (BitStream!12294) Bool)

(assert (=> start!60698 (and (inv!12 thiss!882) e!194397)))

(assert (=> start!60698 true))

(declare-fun lt!412702 () (_ BitVec 32))

(declare-fun b!274508 () Bool)

(declare-fun lt!412703 () (_ BitVec 32))

(assert (=> b!274508 (= e!194398 (and (bvsge lt!412702 #b00000000000000000000000000000000) (bvsge lt!412702 #b00000000000000000000000000001000) (= (bvand (currentBit!13318 thiss!882) #b10000000000000000000000000000000) (bvand lt!412703 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13318 thiss!882) #b10000000000000000000000000000000) (bvand lt!412702 #b10000000000000000000000000000000)))))))

(assert (=> b!274508 (= lt!412702 (bvadd (currentBit!13318 thiss!882) lt!412703))))

(assert (=> b!274508 (= lt!412703 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274509 () Bool)

(declare-fun array_inv!6464 (array!15545) Bool)

(assert (=> b!274509 (= e!194397 (array_inv!6464 (buf!7208 thiss!882)))))

(assert (= (and start!60698 res!228373) b!274508))

(assert (= start!60698 b!274509))

(declare-fun m!407177 () Bool)

(assert (=> start!60698 m!407177))

(declare-fun m!407179 () Bool)

(assert (=> start!60698 m!407179))

(declare-fun m!407181 () Bool)

(assert (=> b!274509 m!407181))

(check-sat (not start!60698) (not b!274509))
(check-sat)
(get-model)

(declare-fun d!94246 () Bool)

(declare-fun res!228379 () Bool)

(declare-fun e!194410 () Bool)

(assert (=> d!94246 (=> (not res!228379) (not e!194410))))

(assert (=> d!94246 (= res!228379 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6740 (buf!7208 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6740 (buf!7208 thiss!882)))))))))

(assert (=> d!94246 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194410)))

(declare-fun b!274519 () Bool)

(declare-fun lt!412712 () (_ BitVec 64))

(assert (=> b!274519 (= e!194410 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412712) (bvsle lt!412712 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6740 (buf!7208 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274519 (= lt!412712 (bvadd (bitIndex!0 (size!6740 (buf!7208 thiss!882)) (currentByte!13323 thiss!882) (currentBit!13318 thiss!882)) diffInBits!15))))

(assert (= (and d!94246 res!228379) b!274519))

(declare-fun m!407189 () Bool)

(assert (=> b!274519 m!407189))

(assert (=> start!60698 d!94246))

(declare-fun d!94248 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94248 (= (inv!12 thiss!882) (invariant!0 (currentBit!13318 thiss!882) (currentByte!13323 thiss!882) (size!6740 (buf!7208 thiss!882))))))

(declare-fun bs!23735 () Bool)

(assert (= bs!23735 d!94248))

(declare-fun m!407191 () Bool)

(assert (=> bs!23735 m!407191))

(assert (=> start!60698 d!94248))

(declare-fun d!94254 () Bool)

(assert (=> d!94254 (= (array_inv!6464 (buf!7208 thiss!882)) (bvsge (size!6740 (buf!7208 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274509 d!94254))

(check-sat (not b!274519) (not d!94248))
(check-sat)
(get-model)

(declare-fun d!94264 () Bool)

(declare-fun e!194419 () Bool)

(assert (=> d!94264 e!194419))

(declare-fun res!228390 () Bool)

(assert (=> d!94264 (=> (not res!228390) (not e!194419))))

(declare-fun lt!412734 () (_ BitVec 64))

(declare-fun lt!412735 () (_ BitVec 64))

(declare-fun lt!412736 () (_ BitVec 64))

(assert (=> d!94264 (= res!228390 (= lt!412736 (bvsub lt!412735 lt!412734)))))

(assert (=> d!94264 (or (= (bvand lt!412735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412734 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412735 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412735 lt!412734) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94264 (= lt!412734 (remainingBits!0 ((_ sign_extend 32) (size!6740 (buf!7208 thiss!882))) ((_ sign_extend 32) (currentByte!13323 thiss!882)) ((_ sign_extend 32) (currentBit!13318 thiss!882))))))

(declare-fun lt!412732 () (_ BitVec 64))

(declare-fun lt!412733 () (_ BitVec 64))

(assert (=> d!94264 (= lt!412735 (bvmul lt!412732 lt!412733))))

(assert (=> d!94264 (or (= lt!412732 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412733 (bvsdiv (bvmul lt!412732 lt!412733) lt!412732)))))

(assert (=> d!94264 (= lt!412733 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94264 (= lt!412732 ((_ sign_extend 32) (size!6740 (buf!7208 thiss!882))))))

(assert (=> d!94264 (= lt!412736 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13323 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13318 thiss!882))))))

(assert (=> d!94264 (invariant!0 (currentBit!13318 thiss!882) (currentByte!13323 thiss!882) (size!6740 (buf!7208 thiss!882)))))

(assert (=> d!94264 (= (bitIndex!0 (size!6740 (buf!7208 thiss!882)) (currentByte!13323 thiss!882) (currentBit!13318 thiss!882)) lt!412736)))

(declare-fun b!274532 () Bool)

(declare-fun res!228391 () Bool)

(assert (=> b!274532 (=> (not res!228391) (not e!194419))))

(assert (=> b!274532 (= res!228391 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412736))))

(declare-fun b!274533 () Bool)

(declare-fun lt!412731 () (_ BitVec 64))

(assert (=> b!274533 (= e!194419 (bvsle lt!412736 (bvmul lt!412731 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274533 (or (= lt!412731 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412731 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412731)))))

(assert (=> b!274533 (= lt!412731 ((_ sign_extend 32) (size!6740 (buf!7208 thiss!882))))))

(assert (= (and d!94264 res!228390) b!274532))

(assert (= (and b!274532 res!228391) b!274533))

(declare-fun m!407201 () Bool)

(assert (=> d!94264 m!407201))

(assert (=> d!94264 m!407191))

(assert (=> b!274519 d!94264))

(declare-fun d!94266 () Bool)

(assert (=> d!94266 (= (invariant!0 (currentBit!13318 thiss!882) (currentByte!13323 thiss!882) (size!6740 (buf!7208 thiss!882))) (and (bvsge (currentBit!13318 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13318 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13323 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13323 thiss!882) (size!6740 (buf!7208 thiss!882))) (and (= (currentBit!13318 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13323 thiss!882) (size!6740 (buf!7208 thiss!882)))))))))

(assert (=> d!94248 d!94266))

(check-sat (not d!94264))
