; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60916 () Bool)

(assert start!60916)

(declare-fun res!228648 () Bool)

(declare-fun e!194755 () Bool)

(assert (=> start!60916 (=> (not res!228648) (not e!194755))))

(declare-datatypes ((array!15609 0))(
  ( (array!15610 (arr!7750 (Array (_ BitVec 32) (_ BitVec 8))) (size!6763 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12340 0))(
  ( (BitStream!12341 (buf!7231 array!15609) (currentByte!13378 (_ BitVec 32)) (currentBit!13373 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12340)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12340 (_ BitVec 64)) Bool)

(assert (=> start!60916 (= res!228648 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60916 e!194755))

(declare-fun e!194752 () Bool)

(declare-fun inv!12 (BitStream!12340) Bool)

(assert (=> start!60916 (and (inv!12 thiss!882) e!194752)))

(assert (=> start!60916 true))

(declare-fun b!274870 () Bool)

(declare-fun e!194753 () Bool)

(assert (=> b!274870 (= e!194755 e!194753)))

(declare-fun res!228649 () Bool)

(assert (=> b!274870 (=> (not res!228649) (not e!194753))))

(declare-fun lt!413213 () (_ BitVec 32))

(assert (=> b!274870 (= res!228649 (and (bvsge lt!413213 #b00000000000000000000000000000000) (bvslt lt!413213 #b00000000000000000000000000001000)))))

(assert (=> b!274870 (= lt!413213 (bvadd (currentBit!13373 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!413211 () (_ BitVec 64))

(declare-fun lt!413212 () (_ BitVec 64))

(declare-fun b!274871 () Bool)

(assert (=> b!274871 (= e!194753 (and (= lt!413211 (bvand diffInBits!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!413211 (bvand (bvadd lt!413212 diffInBits!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!274871 (= lt!413211 (bvand lt!413212 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274871 (= lt!413212 (bitIndex!0 (size!6763 (buf!7231 thiss!882)) (currentByte!13378 thiss!882) (currentBit!13373 thiss!882)))))

(declare-fun b!274872 () Bool)

(declare-fun array_inv!6487 (array!15609) Bool)

(assert (=> b!274872 (= e!194752 (array_inv!6487 (buf!7231 thiss!882)))))

(assert (= (and start!60916 res!228648) b!274870))

(assert (= (and b!274870 res!228649) b!274871))

(assert (= start!60916 b!274872))

(declare-fun m!407465 () Bool)

(assert (=> start!60916 m!407465))

(declare-fun m!407467 () Bool)

(assert (=> start!60916 m!407467))

(declare-fun m!407469 () Bool)

(assert (=> b!274871 m!407469))

(declare-fun m!407471 () Bool)

(assert (=> b!274872 m!407471))

(push 1)

(assert (not start!60916))

(assert (not b!274872))

(assert (not b!274871))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94470 () Bool)

(declare-fun res!228664 () Bool)

(declare-fun e!194782 () Bool)

(assert (=> d!94470 (=> (not res!228664) (not e!194782))))

(assert (=> d!94470 (= res!228664 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6763 (buf!7231 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6763 (buf!7231 thiss!882)))))))))

(assert (=> d!94470 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194782)))

(declare-fun b!274894 () Bool)

(declare-fun lt!413234 () (_ BitVec 64))

(assert (=> b!274894 (= e!194782 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413234) (bvsle lt!413234 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6763 (buf!7231 thiss!882)))))))))

(assert (=> b!274894 (= lt!413234 (bvadd (bitIndex!0 (size!6763 (buf!7231 thiss!882)) (currentByte!13378 thiss!882) (currentBit!13373 thiss!882)) diffInBits!15))))

(assert (= (and d!94470 res!228664) b!274894))

(assert (=> b!274894 m!407469))

(assert (=> start!60916 d!94470))

(declare-fun d!94472 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94472 (= (inv!12 thiss!882) (invariant!0 (currentBit!13373 thiss!882) (currentByte!13378 thiss!882) (size!6763 (buf!7231 thiss!882))))))

(declare-fun bs!23783 () Bool)

(assert (= bs!23783 d!94472))

(declare-fun m!407489 () Bool)

(assert (=> bs!23783 m!407489))

(assert (=> start!60916 d!94472))

(declare-fun d!94474 () Bool)

(assert (=> d!94474 (= (array_inv!6487 (buf!7231 thiss!882)) (bvsge (size!6763 (buf!7231 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274872 d!94474))

(declare-fun d!94476 () Bool)

(declare-fun e!194791 () Bool)

(assert (=> d!94476 e!194791))

(declare-fun res!228679 () Bool)

(assert (=> d!94476 (=> (not res!228679) (not e!194791))))

(declare-fun lt!413273 () (_ BitVec 64))

(declare-fun lt!413270 () (_ BitVec 64))

(declare-fun lt!413268 () (_ BitVec 64))

(assert (=> d!94476 (= res!228679 (= lt!413273 (bvsub lt!413268 lt!413270)))))

(assert (=> d!94476 (or (= (bvand lt!413268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413270 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!413268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!413268 lt!413270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94476 (= lt!413270 (remainingBits!0 ((_ sign_extend 32) (size!6763 (buf!7231 thiss!882))) ((_ sign_extend 32) (currentByte!13378 thiss!882)) ((_ sign_extend 32) (currentBit!13373 thiss!882))))))

(declare-fun lt!413271 () (_ BitVec 64))

(declare-fun lt!413272 () (_ BitVec 64))

(assert (=> d!94476 (= lt!413268 (bvmul lt!413271 lt!413272))))

(assert (=> d!94476 (or (= lt!413271 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!413272 (bvsdiv (bvmul lt!413271 lt!413272) lt!413271)))))

(assert (=> d!94476 (= lt!413272 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94476 (= lt!413271 ((_ sign_extend 32) (size!6763 (buf!7231 thiss!882))))))

(assert (=> d!94476 (= lt!413273 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13378 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13373 thiss!882))))))

(assert (=> d!94476 (invariant!0 (currentBit!13373 thiss!882) (currentByte!13378 thiss!882) (size!6763 (buf!7231 thiss!882)))))

(assert (=> d!94476 (= (bitIndex!0 (size!6763 (buf!7231 thiss!882)) (currentByte!13378 thiss!882) (currentBit!13373 thiss!882)) lt!413273)))

(declare-fun b!274909 () Bool)

(declare-fun res!228678 () Bool)

(assert (=> b!274909 (=> (not res!228678) (not e!194791))))

(assert (=> b!274909 (= res!228678 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413273))))

(declare-fun b!274910 () Bool)

(declare-fun lt!413269 () (_ BitVec 64))

(assert (=> b!274910 (= e!194791 (bvsle lt!413273 (bvmul lt!413269 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274910 (or (= lt!413269 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!413269 #b0000000000000000000000000000000000000000000000000000000000001000) lt!413269)))))

(assert (=> b!274910 (= lt!413269 ((_ sign_extend 32) (size!6763 (buf!7231 thiss!882))))))

(assert (= (and d!94476 res!228679) b!274909))

(assert (= (and b!274909 res!228678) b!274910))

(declare-fun m!407497 () Bool)

(assert (=> d!94476 m!407497))

(assert (=> d!94476 m!407489))

(assert (=> b!274871 d!94476))

(push 1)

(assert (not d!94476))

(assert (not b!274894))

(assert (not d!94472))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

