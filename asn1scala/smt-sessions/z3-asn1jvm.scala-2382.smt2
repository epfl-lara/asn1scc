; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60812 () Bool)

(assert start!60812)

(declare-fun res!228505 () Bool)

(declare-fun e!194574 () Bool)

(assert (=> start!60812 (=> (not res!228505) (not e!194574))))

(declare-datatypes ((array!15578 0))(
  ( (array!15579 (arr!7739 (Array (_ BitVec 32) (_ BitVec 8))) (size!6752 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12318 0))(
  ( (BitStream!12319 (buf!7220 array!15578) (currentByte!13353 (_ BitVec 32)) (currentBit!13348 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12318)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12318 (_ BitVec 64)) Bool)

(assert (=> start!60812 (= res!228505 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60812 e!194574))

(declare-fun e!194572 () Bool)

(declare-fun inv!12 (BitStream!12318) Bool)

(assert (=> start!60812 (and (inv!12 thiss!882) e!194572)))

(assert (=> start!60812 true))

(declare-fun b!274684 () Bool)

(declare-fun e!194573 () Bool)

(assert (=> b!274684 (= e!194574 e!194573)))

(declare-fun res!228504 () Bool)

(assert (=> b!274684 (=> (not res!228504) (not e!194573))))

(declare-fun lt!412952 () (_ BitVec 32))

(assert (=> b!274684 (= res!228504 (and (bvsge lt!412952 #b00000000000000000000000000000000) (bvsge lt!412952 #b00000000000000000000000000001000)))))

(assert (=> b!274684 (= lt!412952 (bvadd (currentBit!13348 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!412950 () (_ BitVec 64))

(declare-fun b!274685 () Bool)

(declare-fun lt!412951 () (_ BitVec 64))

(assert (=> b!274685 (= e!194573 (and (= lt!412951 (bvand diffInBits!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!412951 (bvand (bvadd lt!412950 diffInBits!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!274685 (= lt!412951 (bvand lt!412950 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274685 (= lt!412950 (bitIndex!0 (size!6752 (buf!7220 thiss!882)) (currentByte!13353 thiss!882) (currentBit!13348 thiss!882)))))

(declare-fun b!274686 () Bool)

(declare-fun array_inv!6476 (array!15578) Bool)

(assert (=> b!274686 (= e!194572 (array_inv!6476 (buf!7220 thiss!882)))))

(assert (= (and start!60812 res!228505) b!274684))

(assert (= (and b!274684 res!228504) b!274685))

(assert (= start!60812 b!274686))

(declare-fun m!407317 () Bool)

(assert (=> start!60812 m!407317))

(declare-fun m!407319 () Bool)

(assert (=> start!60812 m!407319))

(declare-fun m!407321 () Bool)

(assert (=> b!274685 m!407321))

(declare-fun m!407323 () Bool)

(assert (=> b!274686 m!407323))

(check-sat (not start!60812) (not b!274686) (not b!274685))
(check-sat)
(get-model)

(declare-fun d!94356 () Bool)

(declare-fun res!228514 () Bool)

(declare-fun e!194590 () Bool)

(assert (=> d!94356 (=> (not res!228514) (not e!194590))))

(assert (=> d!94356 (= res!228514 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6752 (buf!7220 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6752 (buf!7220 thiss!882)))))))))

(assert (=> d!94356 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194590)))

(declare-fun b!274699 () Bool)

(declare-fun lt!412964 () (_ BitVec 64))

(assert (=> b!274699 (= e!194590 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412964) (bvsle lt!412964 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6752 (buf!7220 thiss!882)))))))))

(assert (=> b!274699 (= lt!412964 (bvadd (bitIndex!0 (size!6752 (buf!7220 thiss!882)) (currentByte!13353 thiss!882) (currentBit!13348 thiss!882)) diffInBits!15))))

(assert (= (and d!94356 res!228514) b!274699))

(assert (=> b!274699 m!407321))

(assert (=> start!60812 d!94356))

(declare-fun d!94358 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94358 (= (inv!12 thiss!882) (invariant!0 (currentBit!13348 thiss!882) (currentByte!13353 thiss!882) (size!6752 (buf!7220 thiss!882))))))

(declare-fun bs!23759 () Bool)

(assert (= bs!23759 d!94358))

(declare-fun m!407333 () Bool)

(assert (=> bs!23759 m!407333))

(assert (=> start!60812 d!94358))

(declare-fun d!94360 () Bool)

(assert (=> d!94360 (= (array_inv!6476 (buf!7220 thiss!882)) (bvsge (size!6752 (buf!7220 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274686 d!94360))

(declare-fun d!94362 () Bool)

(declare-fun e!194593 () Bool)

(assert (=> d!94362 e!194593))

(declare-fun res!228520 () Bool)

(assert (=> d!94362 (=> (not res!228520) (not e!194593))))

(declare-fun lt!412980 () (_ BitVec 64))

(declare-fun lt!412982 () (_ BitVec 64))

(declare-fun lt!412978 () (_ BitVec 64))

(assert (=> d!94362 (= res!228520 (= lt!412982 (bvsub lt!412978 lt!412980)))))

(assert (=> d!94362 (or (= (bvand lt!412978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412978 lt!412980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94362 (= lt!412980 (remainingBits!0 ((_ sign_extend 32) (size!6752 (buf!7220 thiss!882))) ((_ sign_extend 32) (currentByte!13353 thiss!882)) ((_ sign_extend 32) (currentBit!13348 thiss!882))))))

(declare-fun lt!412981 () (_ BitVec 64))

(declare-fun lt!412979 () (_ BitVec 64))

(assert (=> d!94362 (= lt!412978 (bvmul lt!412981 lt!412979))))

(assert (=> d!94362 (or (= lt!412981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412979 (bvsdiv (bvmul lt!412981 lt!412979) lt!412981)))))

(assert (=> d!94362 (= lt!412979 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94362 (= lt!412981 ((_ sign_extend 32) (size!6752 (buf!7220 thiss!882))))))

(assert (=> d!94362 (= lt!412982 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13353 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13348 thiss!882))))))

(assert (=> d!94362 (invariant!0 (currentBit!13348 thiss!882) (currentByte!13353 thiss!882) (size!6752 (buf!7220 thiss!882)))))

(assert (=> d!94362 (= (bitIndex!0 (size!6752 (buf!7220 thiss!882)) (currentByte!13353 thiss!882) (currentBit!13348 thiss!882)) lt!412982)))

(declare-fun b!274704 () Bool)

(declare-fun res!228519 () Bool)

(assert (=> b!274704 (=> (not res!228519) (not e!194593))))

(assert (=> b!274704 (= res!228519 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412982))))

(declare-fun b!274705 () Bool)

(declare-fun lt!412977 () (_ BitVec 64))

(assert (=> b!274705 (= e!194593 (bvsle lt!412982 (bvmul lt!412977 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274705 (or (= lt!412977 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412977 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412977)))))

(assert (=> b!274705 (= lt!412977 ((_ sign_extend 32) (size!6752 (buf!7220 thiss!882))))))

(assert (= (and d!94362 res!228520) b!274704))

(assert (= (and b!274704 res!228519) b!274705))

(declare-fun m!407335 () Bool)

(assert (=> d!94362 m!407335))

(assert (=> d!94362 m!407333))

(assert (=> b!274685 d!94362))

(check-sat (not b!274699) (not d!94362) (not d!94358))
