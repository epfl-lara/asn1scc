; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60562 () Bool)

(assert start!60562)

(declare-fun res!228201 () Bool)

(declare-fun e!194195 () Bool)

(assert (=> start!60562 (=> (not res!228201) (not e!194195))))

(declare-datatypes ((array!15509 0))(
  ( (array!15510 (arr!7715 (Array (_ BitVec 32) (_ BitVec 8))) (size!6728 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12270 0))(
  ( (BitStream!12271 (buf!7196 array!15509) (currentByte!13291 (_ BitVec 32)) (currentBit!13286 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12270)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12270 (_ BitVec 64)) Bool)

(assert (=> start!60562 (= res!228201 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60562 e!194195))

(declare-fun e!194196 () Bool)

(declare-fun inv!12 (BitStream!12270) Bool)

(assert (=> start!60562 (and (inv!12 thiss!882) e!194196)))

(assert (=> start!60562 true))

(declare-fun b!274288 () Bool)

(declare-fun res!228202 () Bool)

(assert (=> b!274288 (=> (not res!228202) (not e!194195))))

(assert (=> b!274288 (= res!228202 (bvslt (bvadd (currentBit!13286 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000))))

(declare-fun b!274289 () Bool)

(declare-fun lt!412379 () (_ BitVec 64))

(declare-fun lt!412378 () (_ BitVec 64))

(assert (=> b!274289 (= e!194195 (and (= lt!412378 (bvand diffInBits!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!412378 (bvand (bvadd lt!412379 diffInBits!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!274289 (= lt!412378 (bvand lt!412379 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274289 (= lt!412379 (bitIndex!0 (size!6728 (buf!7196 thiss!882)) (currentByte!13291 thiss!882) (currentBit!13286 thiss!882)))))

(declare-fun b!274290 () Bool)

(declare-fun array_inv!6452 (array!15509) Bool)

(assert (=> b!274290 (= e!194196 (array_inv!6452 (buf!7196 thiss!882)))))

(assert (= (and start!60562 res!228201) b!274288))

(assert (= (and b!274288 res!228202) b!274289))

(assert (= start!60562 b!274290))

(declare-fun m!407005 () Bool)

(assert (=> start!60562 m!407005))

(declare-fun m!407007 () Bool)

(assert (=> start!60562 m!407007))

(declare-fun m!407009 () Bool)

(assert (=> b!274289 m!407009))

(declare-fun m!407011 () Bool)

(assert (=> b!274290 m!407011))

(check-sat (not b!274289) (not b!274290) (not start!60562))
(check-sat)
(get-model)

(declare-fun d!94104 () Bool)

(declare-fun e!194209 () Bool)

(assert (=> d!94104 e!194209))

(declare-fun res!228214 () Bool)

(assert (=> d!94104 (=> (not res!228214) (not e!194209))))

(declare-fun lt!412402 () (_ BitVec 64))

(declare-fun lt!412403 () (_ BitVec 64))

(declare-fun lt!412400 () (_ BitVec 64))

(assert (=> d!94104 (= res!228214 (= lt!412402 (bvsub lt!412403 lt!412400)))))

(assert (=> d!94104 (or (= (bvand lt!412403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412400 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412403 lt!412400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94104 (= lt!412400 (remainingBits!0 ((_ sign_extend 32) (size!6728 (buf!7196 thiss!882))) ((_ sign_extend 32) (currentByte!13291 thiss!882)) ((_ sign_extend 32) (currentBit!13286 thiss!882))))))

(declare-fun lt!412398 () (_ BitVec 64))

(declare-fun lt!412399 () (_ BitVec 64))

(assert (=> d!94104 (= lt!412403 (bvmul lt!412398 lt!412399))))

(assert (=> d!94104 (or (= lt!412398 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412399 (bvsdiv (bvmul lt!412398 lt!412399) lt!412398)))))

(assert (=> d!94104 (= lt!412399 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94104 (= lt!412398 ((_ sign_extend 32) (size!6728 (buf!7196 thiss!882))))))

(assert (=> d!94104 (= lt!412402 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13291 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13286 thiss!882))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94104 (invariant!0 (currentBit!13286 thiss!882) (currentByte!13291 thiss!882) (size!6728 (buf!7196 thiss!882)))))

(assert (=> d!94104 (= (bitIndex!0 (size!6728 (buf!7196 thiss!882)) (currentByte!13291 thiss!882) (currentBit!13286 thiss!882)) lt!412402)))

(declare-fun b!274304 () Bool)

(declare-fun res!228213 () Bool)

(assert (=> b!274304 (=> (not res!228213) (not e!194209))))

(assert (=> b!274304 (= res!228213 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412402))))

(declare-fun b!274305 () Bool)

(declare-fun lt!412401 () (_ BitVec 64))

(assert (=> b!274305 (= e!194209 (bvsle lt!412402 (bvmul lt!412401 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274305 (or (= lt!412401 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412401 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412401)))))

(assert (=> b!274305 (= lt!412401 ((_ sign_extend 32) (size!6728 (buf!7196 thiss!882))))))

(assert (= (and d!94104 res!228214) b!274304))

(assert (= (and b!274304 res!228213) b!274305))

(declare-fun m!407021 () Bool)

(assert (=> d!94104 m!407021))

(declare-fun m!407023 () Bool)

(assert (=> d!94104 m!407023))

(assert (=> b!274289 d!94104))

(declare-fun d!94110 () Bool)

(assert (=> d!94110 (= (array_inv!6452 (buf!7196 thiss!882)) (bvsge (size!6728 (buf!7196 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274290 d!94110))

(declare-fun d!94112 () Bool)

(declare-fun res!228217 () Bool)

(declare-fun e!194212 () Bool)

(assert (=> d!94112 (=> (not res!228217) (not e!194212))))

(assert (=> d!94112 (= res!228217 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6728 (buf!7196 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6728 (buf!7196 thiss!882)))))))))

(assert (=> d!94112 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194212)))

(declare-fun b!274309 () Bool)

(declare-fun lt!412406 () (_ BitVec 64))

(assert (=> b!274309 (= e!194212 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412406) (bvsle lt!412406 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6728 (buf!7196 thiss!882)))))))))

(assert (=> b!274309 (= lt!412406 (bvadd (bitIndex!0 (size!6728 (buf!7196 thiss!882)) (currentByte!13291 thiss!882) (currentBit!13286 thiss!882)) diffInBits!15))))

(assert (= (and d!94112 res!228217) b!274309))

(assert (=> b!274309 m!407009))

(assert (=> start!60562 d!94112))

(declare-fun d!94114 () Bool)

(assert (=> d!94114 (= (inv!12 thiss!882) (invariant!0 (currentBit!13286 thiss!882) (currentByte!13291 thiss!882) (size!6728 (buf!7196 thiss!882))))))

(declare-fun bs!23708 () Bool)

(assert (= bs!23708 d!94114))

(assert (=> bs!23708 m!407023))

(assert (=> start!60562 d!94114))

(check-sat (not b!274309) (not d!94104) (not d!94114))
