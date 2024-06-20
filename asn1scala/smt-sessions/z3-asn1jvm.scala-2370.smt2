; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60448 () Bool)

(assert start!60448)

(declare-fun res!228070 () Bool)

(declare-fun e!194025 () Bool)

(assert (=> start!60448 (=> (not res!228070) (not e!194025))))

(declare-datatypes ((array!15476 0))(
  ( (array!15477 (arr!7703 (Array (_ BitVec 32) (_ BitVec 8))) (size!6716 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12246 0))(
  ( (BitStream!12247 (buf!7184 array!15476) (currentByte!13261 (_ BitVec 32)) (currentBit!13256 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12246)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12246 (_ BitVec 64)) Bool)

(assert (=> start!60448 (= res!228070 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60448 e!194025))

(declare-fun e!194026 () Bool)

(declare-fun inv!12 (BitStream!12246) Bool)

(assert (=> start!60448 (and (inv!12 thiss!882) e!194026)))

(assert (=> start!60448 true))

(declare-fun lt!412148 () (_ BitVec 32))

(declare-fun b!274112 () Bool)

(assert (=> b!274112 (= e!194025 (and (bvslt (bvadd (currentBit!13256 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000) (let ((bdg!16583 (bvand lt!412148 #b10000000000000000000000000000000))) (and (not (= bdg!16583 #b00000000000000000000000000000000)) (not (= bdg!16583 (bvand (bvsub lt!412148 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))))

(assert (=> b!274112 (= lt!412148 (bvadd (currentByte!13261 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274113 () Bool)

(declare-fun array_inv!6440 (array!15476) Bool)

(assert (=> b!274113 (= e!194026 (array_inv!6440 (buf!7184 thiss!882)))))

(assert (= (and start!60448 res!228070) b!274112))

(assert (= start!60448 b!274113))

(declare-fun m!406865 () Bool)

(assert (=> start!60448 m!406865))

(declare-fun m!406867 () Bool)

(assert (=> start!60448 m!406867))

(declare-fun m!406869 () Bool)

(assert (=> b!274113 m!406869))

(check-sat (not start!60448) (not b!274113))
(check-sat)
(get-model)

(declare-fun d!93994 () Bool)

(declare-fun res!228076 () Bool)

(declare-fun e!194038 () Bool)

(assert (=> d!93994 (=> (not res!228076) (not e!194038))))

(assert (=> d!93994 (= res!228076 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6716 (buf!7184 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6716 (buf!7184 thiss!882)))))))))

(assert (=> d!93994 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194038)))

(declare-fun b!274123 () Bool)

(declare-fun lt!412154 () (_ BitVec 64))

(assert (=> b!274123 (= e!194038 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412154) (bvsle lt!412154 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6716 (buf!7184 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274123 (= lt!412154 (bvadd (bitIndex!0 (size!6716 (buf!7184 thiss!882)) (currentByte!13261 thiss!882) (currentBit!13256 thiss!882)) diffInBits!15))))

(assert (= (and d!93994 res!228076) b!274123))

(declare-fun m!406877 () Bool)

(assert (=> b!274123 m!406877))

(assert (=> start!60448 d!93994))

(declare-fun d!93996 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93996 (= (inv!12 thiss!882) (invariant!0 (currentBit!13256 thiss!882) (currentByte!13261 thiss!882) (size!6716 (buf!7184 thiss!882))))))

(declare-fun bs!23684 () Bool)

(assert (= bs!23684 d!93996))

(declare-fun m!406879 () Bool)

(assert (=> bs!23684 m!406879))

(assert (=> start!60448 d!93996))

(declare-fun d!93998 () Bool)

(assert (=> d!93998 (= (array_inv!6440 (buf!7184 thiss!882)) (bvsge (size!6716 (buf!7184 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274113 d!93998))

(check-sat (not d!93996) (not b!274123))
(check-sat)
(get-model)

(declare-fun d!94006 () Bool)

(assert (=> d!94006 (= (invariant!0 (currentBit!13256 thiss!882) (currentByte!13261 thiss!882) (size!6716 (buf!7184 thiss!882))) (and (bvsge (currentBit!13256 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13256 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13261 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13261 thiss!882) (size!6716 (buf!7184 thiss!882))) (and (= (currentBit!13256 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13261 thiss!882) (size!6716 (buf!7184 thiss!882)))))))))

(assert (=> d!93996 d!94006))

(declare-fun d!94008 () Bool)

(declare-fun e!194047 () Bool)

(assert (=> d!94008 e!194047))

(declare-fun res!228088 () Bool)

(assert (=> d!94008 (=> (not res!228088) (not e!194047))))

(declare-fun lt!412174 () (_ BitVec 64))

(declare-fun lt!412178 () (_ BitVec 64))

(declare-fun lt!412175 () (_ BitVec 64))

(assert (=> d!94008 (= res!228088 (= lt!412175 (bvsub lt!412178 lt!412174)))))

(assert (=> d!94008 (or (= (bvand lt!412178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412174 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412178 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412178 lt!412174) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94008 (= lt!412174 (remainingBits!0 ((_ sign_extend 32) (size!6716 (buf!7184 thiss!882))) ((_ sign_extend 32) (currentByte!13261 thiss!882)) ((_ sign_extend 32) (currentBit!13256 thiss!882))))))

(declare-fun lt!412173 () (_ BitVec 64))

(declare-fun lt!412176 () (_ BitVec 64))

(assert (=> d!94008 (= lt!412178 (bvmul lt!412173 lt!412176))))

(assert (=> d!94008 (or (= lt!412173 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412176 (bvsdiv (bvmul lt!412173 lt!412176) lt!412173)))))

(assert (=> d!94008 (= lt!412176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94008 (= lt!412173 ((_ sign_extend 32) (size!6716 (buf!7184 thiss!882))))))

(assert (=> d!94008 (= lt!412175 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13261 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13256 thiss!882))))))

(assert (=> d!94008 (invariant!0 (currentBit!13256 thiss!882) (currentByte!13261 thiss!882) (size!6716 (buf!7184 thiss!882)))))

(assert (=> d!94008 (= (bitIndex!0 (size!6716 (buf!7184 thiss!882)) (currentByte!13261 thiss!882) (currentBit!13256 thiss!882)) lt!412175)))

(declare-fun b!274136 () Bool)

(declare-fun res!228087 () Bool)

(assert (=> b!274136 (=> (not res!228087) (not e!194047))))

(assert (=> b!274136 (= res!228087 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412175))))

(declare-fun b!274137 () Bool)

(declare-fun lt!412177 () (_ BitVec 64))

(assert (=> b!274137 (= e!194047 (bvsle lt!412175 (bvmul lt!412177 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274137 (or (= lt!412177 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412177 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412177)))))

(assert (=> b!274137 (= lt!412177 ((_ sign_extend 32) (size!6716 (buf!7184 thiss!882))))))

(assert (= (and d!94008 res!228088) b!274136))

(assert (= (and b!274136 res!228087) b!274137))

(declare-fun m!406887 () Bool)

(assert (=> d!94008 m!406887))

(assert (=> d!94008 m!406879))

(assert (=> b!274123 d!94008))

(check-sat (not d!94008))
(check-sat)
