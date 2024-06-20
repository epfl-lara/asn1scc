; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60526 () Bool)

(assert start!60526)

(declare-fun res!228160 () Bool)

(declare-fun e!194151 () Bool)

(assert (=> start!60526 (=> (not res!228160) (not e!194151))))

(declare-datatypes ((array!15500 0))(
  ( (array!15501 (arr!7712 (Array (_ BitVec 32) (_ BitVec 8))) (size!6725 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12264 0))(
  ( (BitStream!12265 (buf!7193 array!15500) (currentByte!13282 (_ BitVec 32)) (currentBit!13277 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12264)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12264 (_ BitVec 64)) Bool)

(assert (=> start!60526 (= res!228160 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60526 e!194151))

(declare-fun e!194152 () Bool)

(declare-fun inv!12 (BitStream!12264) Bool)

(assert (=> start!60526 (and (inv!12 thiss!882) e!194152)))

(assert (=> start!60526 true))

(declare-fun b!274235 () Bool)

(declare-fun lt!412301 () (_ BitVec 32))

(assert (=> b!274235 (= e!194151 (and (bvslt (bvadd (currentBit!13277 thiss!882) lt!412301) #b00000000000000000000000000000000) (let ((bdg!16587 (bvand (bvadd #b00000000000000000000000000001000 lt!412301) #b10000000000000000000000000000000))) (and (= bdg!16587 (bvand (currentBit!13277 thiss!882) #b10000000000000000000000000000000)) (not (= bdg!16587 (bvand (bvadd #b00000000000000000000000000001000 lt!412301 (currentBit!13277 thiss!882)) #b10000000000000000000000000000000)))))))))

(assert (=> b!274235 (= lt!412301 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274236 () Bool)

(declare-fun array_inv!6449 (array!15500) Bool)

(assert (=> b!274236 (= e!194152 (array_inv!6449 (buf!7193 thiss!882)))))

(assert (= (and start!60526 res!228160) b!274235))

(assert (= start!60526 b!274236))

(declare-fun m!406967 () Bool)

(assert (=> start!60526 m!406967))

(declare-fun m!406969 () Bool)

(assert (=> start!60526 m!406969))

(declare-fun m!406971 () Bool)

(assert (=> b!274236 m!406971))

(check-sat (not start!60526) (not b!274236))
(check-sat)
(get-model)

(declare-fun d!94072 () Bool)

(declare-fun res!228166 () Bool)

(declare-fun e!194164 () Bool)

(assert (=> d!94072 (=> (not res!228166) (not e!194164))))

(assert (=> d!94072 (= res!228166 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6725 (buf!7193 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6725 (buf!7193 thiss!882)))))))))

(assert (=> d!94072 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194164)))

(declare-fun b!274246 () Bool)

(declare-fun lt!412307 () (_ BitVec 64))

(assert (=> b!274246 (= e!194164 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412307) (bvsle lt!412307 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6725 (buf!7193 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274246 (= lt!412307 (bvadd (bitIndex!0 (size!6725 (buf!7193 thiss!882)) (currentByte!13282 thiss!882) (currentBit!13277 thiss!882)) diffInBits!15))))

(assert (= (and d!94072 res!228166) b!274246))

(declare-fun m!406979 () Bool)

(assert (=> b!274246 m!406979))

(assert (=> start!60526 d!94072))

(declare-fun d!94074 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94074 (= (inv!12 thiss!882) (invariant!0 (currentBit!13277 thiss!882) (currentByte!13282 thiss!882) (size!6725 (buf!7193 thiss!882))))))

(declare-fun bs!23702 () Bool)

(assert (= bs!23702 d!94074))

(declare-fun m!406981 () Bool)

(assert (=> bs!23702 m!406981))

(assert (=> start!60526 d!94074))

(declare-fun d!94076 () Bool)

(assert (=> d!94076 (= (array_inv!6449 (buf!7193 thiss!882)) (bvsge (size!6725 (buf!7193 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274236 d!94076))

(check-sat (not b!274246) (not d!94074))
(check-sat)
(get-model)

(declare-fun d!94086 () Bool)

(declare-fun e!194173 () Bool)

(assert (=> d!94086 e!194173))

(declare-fun res!228178 () Bool)

(assert (=> d!94086 (=> (not res!228178) (not e!194173))))

(declare-fun lt!412329 () (_ BitVec 64))

(declare-fun lt!412328 () (_ BitVec 64))

(declare-fun lt!412330 () (_ BitVec 64))

(assert (=> d!94086 (= res!228178 (= lt!412328 (bvsub lt!412330 lt!412329)))))

(assert (=> d!94086 (or (= (bvand lt!412330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412329 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412330 lt!412329) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94086 (= lt!412329 (remainingBits!0 ((_ sign_extend 32) (size!6725 (buf!7193 thiss!882))) ((_ sign_extend 32) (currentByte!13282 thiss!882)) ((_ sign_extend 32) (currentBit!13277 thiss!882))))))

(declare-fun lt!412326 () (_ BitVec 64))

(declare-fun lt!412331 () (_ BitVec 64))

(assert (=> d!94086 (= lt!412330 (bvmul lt!412326 lt!412331))))

(assert (=> d!94086 (or (= lt!412326 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412331 (bvsdiv (bvmul lt!412326 lt!412331) lt!412326)))))

(assert (=> d!94086 (= lt!412331 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94086 (= lt!412326 ((_ sign_extend 32) (size!6725 (buf!7193 thiss!882))))))

(assert (=> d!94086 (= lt!412328 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13282 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13277 thiss!882))))))

(assert (=> d!94086 (invariant!0 (currentBit!13277 thiss!882) (currentByte!13282 thiss!882) (size!6725 (buf!7193 thiss!882)))))

(assert (=> d!94086 (= (bitIndex!0 (size!6725 (buf!7193 thiss!882)) (currentByte!13282 thiss!882) (currentBit!13277 thiss!882)) lt!412328)))

(declare-fun b!274259 () Bool)

(declare-fun res!228177 () Bool)

(assert (=> b!274259 (=> (not res!228177) (not e!194173))))

(assert (=> b!274259 (= res!228177 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412328))))

(declare-fun b!274260 () Bool)

(declare-fun lt!412327 () (_ BitVec 64))

(assert (=> b!274260 (= e!194173 (bvsle lt!412328 (bvmul lt!412327 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274260 (or (= lt!412327 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412327 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412327)))))

(assert (=> b!274260 (= lt!412327 ((_ sign_extend 32) (size!6725 (buf!7193 thiss!882))))))

(assert (= (and d!94086 res!228178) b!274259))

(assert (= (and b!274259 res!228177) b!274260))

(declare-fun m!406991 () Bool)

(assert (=> d!94086 m!406991))

(assert (=> d!94086 m!406981))

(assert (=> b!274246 d!94086))

(declare-fun d!94092 () Bool)

(assert (=> d!94092 (= (invariant!0 (currentBit!13277 thiss!882) (currentByte!13282 thiss!882) (size!6725 (buf!7193 thiss!882))) (and (bvsge (currentBit!13277 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13277 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13282 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13282 thiss!882) (size!6725 (buf!7193 thiss!882))) (and (= (currentBit!13277 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13282 thiss!882) (size!6725 (buf!7193 thiss!882)))))))))

(assert (=> d!94074 d!94092))

(check-sat (not d!94086))
