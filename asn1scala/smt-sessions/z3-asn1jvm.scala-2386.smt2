; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60918 () Bool)

(assert start!60918)

(declare-fun res!228655 () Bool)

(declare-fun e!194766 () Bool)

(assert (=> start!60918 (=> (not res!228655) (not e!194766))))

(declare-datatypes ((array!15611 0))(
  ( (array!15612 (arr!7751 (Array (_ BitVec 32) (_ BitVec 8))) (size!6764 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12342 0))(
  ( (BitStream!12343 (buf!7232 array!15611) (currentByte!13379 (_ BitVec 32)) (currentBit!13374 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12342)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12342 (_ BitVec 64)) Bool)

(assert (=> start!60918 (= res!228655 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60918 e!194766))

(declare-fun e!194764 () Bool)

(declare-fun inv!12 (BitStream!12342) Bool)

(assert (=> start!60918 (and (inv!12 thiss!882) e!194764)))

(assert (=> start!60918 true))

(declare-fun b!274879 () Bool)

(declare-fun e!194765 () Bool)

(assert (=> b!274879 (= e!194766 e!194765)))

(declare-fun res!228654 () Bool)

(assert (=> b!274879 (=> (not res!228654) (not e!194765))))

(declare-fun lt!413220 () (_ BitVec 32))

(assert (=> b!274879 (= res!228654 (and (bvsge lt!413220 #b00000000000000000000000000000000) (bvslt lt!413220 #b00000000000000000000000000001000)))))

(assert (=> b!274879 (= lt!413220 (bvadd (currentBit!13374 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!413222 () (_ BitVec 64))

(declare-fun lt!413221 () (_ BitVec 64))

(declare-fun b!274880 () Bool)

(assert (=> b!274880 (= e!194765 (and (= lt!413222 (bvand diffInBits!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!413222 (bvand (bvadd lt!413221 diffInBits!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!274880 (= lt!413222 (bvand lt!413221 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274880 (= lt!413221 (bitIndex!0 (size!6764 (buf!7232 thiss!882)) (currentByte!13379 thiss!882) (currentBit!13374 thiss!882)))))

(declare-fun b!274881 () Bool)

(declare-fun array_inv!6488 (array!15611) Bool)

(assert (=> b!274881 (= e!194764 (array_inv!6488 (buf!7232 thiss!882)))))

(assert (= (and start!60918 res!228655) b!274879))

(assert (= (and b!274879 res!228654) b!274880))

(assert (= start!60918 b!274881))

(declare-fun m!407473 () Bool)

(assert (=> start!60918 m!407473))

(declare-fun m!407475 () Bool)

(assert (=> start!60918 m!407475))

(declare-fun m!407477 () Bool)

(assert (=> b!274880 m!407477))

(declare-fun m!407479 () Bool)

(assert (=> b!274881 m!407479))

(check-sat (not b!274880) (not start!60918) (not b!274881))
(check-sat)
(get-model)

(declare-fun d!94468 () Bool)

(declare-fun e!194790 () Bool)

(assert (=> d!94468 e!194790))

(declare-fun res!228677 () Bool)

(assert (=> d!94468 (=> (not res!228677) (not e!194790))))

(declare-fun lt!413263 () (_ BitVec 64))

(declare-fun lt!413265 () (_ BitVec 64))

(declare-fun lt!413267 () (_ BitVec 64))

(assert (=> d!94468 (= res!228677 (= lt!413265 (bvsub lt!413263 lt!413267)))))

(assert (=> d!94468 (or (= (bvand lt!413263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413267 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413263 lt!413267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94468 (= lt!413267 (remainingBits!0 ((_ sign_extend 32) (size!6764 (buf!7232 thiss!882))) ((_ sign_extend 32) (currentByte!13379 thiss!882)) ((_ sign_extend 32) (currentBit!13374 thiss!882))))))

(declare-fun lt!413262 () (_ BitVec 64))

(declare-fun lt!413264 () (_ BitVec 64))

(assert (=> d!94468 (= lt!413263 (bvmul lt!413262 lt!413264))))

(assert (=> d!94468 (or (= lt!413262 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413264 (bvsdiv (bvmul lt!413262 lt!413264) lt!413262)))))

(assert (=> d!94468 (= lt!413264 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94468 (= lt!413262 ((_ sign_extend 32) (size!6764 (buf!7232 thiss!882))))))

(assert (=> d!94468 (= lt!413265 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13379 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13374 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94468 (invariant!0 (currentBit!13374 thiss!882) (currentByte!13379 thiss!882) (size!6764 (buf!7232 thiss!882)))))

(assert (=> d!94468 (= (bitIndex!0 (size!6764 (buf!7232 thiss!882)) (currentByte!13379 thiss!882) (currentBit!13374 thiss!882)) lt!413265)))

(declare-fun b!274907 () Bool)

(declare-fun res!228676 () Bool)

(assert (=> b!274907 (=> (not res!228676) (not e!194790))))

(assert (=> b!274907 (= res!228676 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413265))))

(declare-fun b!274908 () Bool)

(declare-fun lt!413266 () (_ BitVec 64))

(assert (=> b!274908 (= e!194790 (bvsle lt!413265 (bvmul lt!413266 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274908 (or (= lt!413266 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413266 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413266)))))

(assert (=> b!274908 (= lt!413266 ((_ sign_extend 32) (size!6764 (buf!7232 thiss!882))))))

(assert (= (and d!94468 res!228677) b!274907))

(assert (= (and b!274907 res!228676) b!274908))

(declare-fun m!407493 () Bool)

(assert (=> d!94468 m!407493))

(declare-fun m!407495 () Bool)

(assert (=> d!94468 m!407495))

(assert (=> b!274880 d!94468))

(declare-fun d!94486 () Bool)

(declare-fun res!228682 () Bool)

(declare-fun e!194794 () Bool)

(assert (=> d!94486 (=> (not res!228682) (not e!194794))))

(assert (=> d!94486 (= res!228682 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6764 (buf!7232 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6764 (buf!7232 thiss!882)))))))))

(assert (=> d!94486 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194794)))

(declare-fun b!274914 () Bool)

(declare-fun lt!413276 () (_ BitVec 64))

(assert (=> b!274914 (= e!194794 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413276) (bvsle lt!413276 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6764 (buf!7232 thiss!882)))))))))

(assert (=> b!274914 (= lt!413276 (bvadd (bitIndex!0 (size!6764 (buf!7232 thiss!882)) (currentByte!13379 thiss!882) (currentBit!13374 thiss!882)) diffInBits!15))))

(assert (= (and d!94486 res!228682) b!274914))

(assert (=> b!274914 m!407477))

(assert (=> start!60918 d!94486))

(declare-fun d!94488 () Bool)

(assert (=> d!94488 (= (inv!12 thiss!882) (invariant!0 (currentBit!13374 thiss!882) (currentByte!13379 thiss!882) (size!6764 (buf!7232 thiss!882))))))

(declare-fun bs!23785 () Bool)

(assert (= bs!23785 d!94488))

(assert (=> bs!23785 m!407495))

(assert (=> start!60918 d!94488))

(declare-fun d!94490 () Bool)

(assert (=> d!94490 (= (array_inv!6488 (buf!7232 thiss!882)) (bvsge (size!6764 (buf!7232 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274881 d!94490))

(check-sat (not d!94468) (not b!274914) (not d!94488))
