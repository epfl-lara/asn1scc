; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60446 () Bool)

(assert start!60446)

(declare-fun res!228067 () Bool)

(declare-fun e!194016 () Bool)

(assert (=> start!60446 (=> (not res!228067) (not e!194016))))

(declare-datatypes ((array!15474 0))(
  ( (array!15475 (arr!7702 (Array (_ BitVec 32) (_ BitVec 8))) (size!6715 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12244 0))(
  ( (BitStream!12245 (buf!7183 array!15474) (currentByte!13260 (_ BitVec 32)) (currentBit!13255 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12244)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12244 (_ BitVec 64)) Bool)

(assert (=> start!60446 (= res!228067 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60446 e!194016))

(declare-fun e!194017 () Bool)

(declare-fun inv!12 (BitStream!12244) Bool)

(assert (=> start!60446 (and (inv!12 thiss!882) e!194017)))

(assert (=> start!60446 true))

(declare-fun b!274106 () Bool)

(declare-fun lt!412145 () (_ BitVec 32))

(assert (=> b!274106 (= e!194016 (and (bvslt (bvadd (currentBit!13255 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000) (let ((bdg!16583 (bvand lt!412145 #b10000000000000000000000000000000))) (and (not (= bdg!16583 #b00000000000000000000000000000000)) (not (= bdg!16583 (bvand (bvsub lt!412145 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))))

(assert (=> b!274106 (= lt!412145 (bvadd (currentByte!13260 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274107 () Bool)

(declare-fun array_inv!6439 (array!15474) Bool)

(assert (=> b!274107 (= e!194017 (array_inv!6439 (buf!7183 thiss!882)))))

(assert (= (and start!60446 res!228067) b!274106))

(assert (= start!60446 b!274107))

(declare-fun m!406859 () Bool)

(assert (=> start!60446 m!406859))

(declare-fun m!406861 () Bool)

(assert (=> start!60446 m!406861))

(declare-fun m!406863 () Bool)

(assert (=> b!274107 m!406863))

(push 1)

(assert (not b!274107))

(assert (not start!60446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94000 () Bool)

(assert (=> d!94000 (= (array_inv!6439 (buf!7183 thiss!882)) (bvsge (size!6715 (buf!7183 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274107 d!94000))

(declare-fun d!94002 () Bool)

(declare-fun res!228079 () Bool)

(declare-fun e!194041 () Bool)

(assert (=> d!94002 (=> (not res!228079) (not e!194041))))

(assert (=> d!94002 (= res!228079 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6715 (buf!7183 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6715 (buf!7183 thiss!882)))))))))

(assert (=> d!94002 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194041)))

(declare-fun b!274127 () Bool)

(declare-fun lt!412157 () (_ BitVec 64))

(assert (=> b!274127 (= e!194041 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412157) (bvsle lt!412157 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6715 (buf!7183 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274127 (= lt!412157 (bvadd (bitIndex!0 (size!6715 (buf!7183 thiss!882)) (currentByte!13260 thiss!882) (currentBit!13255 thiss!882)) diffInBits!15))))

(assert (= (and d!94002 res!228079) b!274127))

(declare-fun m!406881 () Bool)

(assert (=> b!274127 m!406881))

(assert (=> start!60446 d!94002))

(declare-fun d!94004 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94004 (= (inv!12 thiss!882) (invariant!0 (currentBit!13255 thiss!882) (currentByte!13260 thiss!882) (size!6715 (buf!7183 thiss!882))))))

(declare-fun bs!23685 () Bool)

(assert (= bs!23685 d!94004))

(declare-fun m!406883 () Bool)

(assert (=> bs!23685 m!406883))

(assert (=> start!60446 d!94004))

(push 1)

(assert (not b!274127))

(assert (not d!94004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94016 () Bool)

(declare-fun e!194050 () Bool)

(assert (=> d!94016 e!194050))

(declare-fun res!228094 () Bool)

(assert (=> d!94016 (=> (not res!228094) (not e!194050))))

(declare-fun lt!412194 () (_ BitVec 64))

(declare-fun lt!412193 () (_ BitVec 64))

(declare-fun lt!412192 () (_ BitVec 64))

(assert (=> d!94016 (= res!228094 (= lt!412193 (bvsub lt!412194 lt!412192)))))

(assert (=> d!94016 (or (= (bvand lt!412194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412192 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412194 lt!412192) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94016 (= lt!412192 (remainingBits!0 ((_ sign_extend 32) (size!6715 (buf!7183 thiss!882))) ((_ sign_extend 32) (currentByte!13260 thiss!882)) ((_ sign_extend 32) (currentBit!13255 thiss!882))))))

(declare-fun lt!412195 () (_ BitVec 64))

(declare-fun lt!412191 () (_ BitVec 64))

(assert (=> d!94016 (= lt!412194 (bvmul lt!412195 lt!412191))))

(assert (=> d!94016 (or (= lt!412195 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412191 (bvsdiv (bvmul lt!412195 lt!412191) lt!412195)))))

(assert (=> d!94016 (= lt!412191 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94016 (= lt!412195 ((_ sign_extend 32) (size!6715 (buf!7183 thiss!882))))))

(assert (=> d!94016 (= lt!412193 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13260 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13255 thiss!882))))))

(assert (=> d!94016 (invariant!0 (currentBit!13255 thiss!882) (currentByte!13260 thiss!882) (size!6715 (buf!7183 thiss!882)))))

(assert (=> d!94016 (= (bitIndex!0 (size!6715 (buf!7183 thiss!882)) (currentByte!13260 thiss!882) (currentBit!13255 thiss!882)) lt!412193)))

(declare-fun b!274142 () Bool)

(declare-fun res!228093 () Bool)

(assert (=> b!274142 (=> (not res!228093) (not e!194050))))

(assert (=> b!274142 (= res!228093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412193))))

(declare-fun b!274143 () Bool)

(declare-fun lt!412196 () (_ BitVec 64))

(assert (=> b!274143 (= e!194050 (bvsle lt!412193 (bvmul lt!412196 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274143 (or (= lt!412196 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412196 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412196)))))

(assert (=> b!274143 (= lt!412196 ((_ sign_extend 32) (size!6715 (buf!7183 thiss!882))))))

(assert (= (and d!94016 res!228094) b!274142))

(assert (= (and b!274142 res!228093) b!274143))

(declare-fun m!406891 () Bool)

(assert (=> d!94016 m!406891))

(assert (=> d!94016 m!406883))

(assert (=> b!274127 d!94016))

(declare-fun d!94018 () Bool)

(assert (=> d!94018 (= (invariant!0 (currentBit!13255 thiss!882) (currentByte!13260 thiss!882) (size!6715 (buf!7183 thiss!882))) (and (bvsge (currentBit!13255 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13255 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13260 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13260 thiss!882) (size!6715 (buf!7183 thiss!882))) (and (= (currentBit!13255 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13260 thiss!882) (size!6715 (buf!7183 thiss!882)))))))))

(assert (=> d!94004 d!94018))

(push 1)

(assert (not d!94016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

