; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60450 () Bool)

(assert start!60450)

(declare-fun res!228073 () Bool)

(declare-fun e!194033 () Bool)

(assert (=> start!60450 (=> (not res!228073) (not e!194033))))

(declare-datatypes ((array!15478 0))(
  ( (array!15479 (arr!7704 (Array (_ BitVec 32) (_ BitVec 8))) (size!6717 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12248 0))(
  ( (BitStream!12249 (buf!7185 array!15478) (currentByte!13262 (_ BitVec 32)) (currentBit!13257 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12248)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12248 (_ BitVec 64)) Bool)

(assert (=> start!60450 (= res!228073 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60450 e!194033))

(declare-fun e!194034 () Bool)

(declare-fun inv!12 (BitStream!12248) Bool)

(assert (=> start!60450 (and (inv!12 thiss!882) e!194034)))

(assert (=> start!60450 true))

(declare-fun lt!412151 () (_ BitVec 32))

(declare-fun b!274118 () Bool)

(assert (=> b!274118 (= e!194033 (and (bvslt (bvadd (currentBit!13257 thiss!882) ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000000) (let ((bdg!16583 (bvand lt!412151 #b10000000000000000000000000000000))) (and (not (= bdg!16583 #b00000000000000000000000000000000)) (not (= bdg!16583 (bvand (bvsub lt!412151 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))))

(assert (=> b!274118 (= lt!412151 (bvadd (currentByte!13262 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!274119 () Bool)

(declare-fun array_inv!6441 (array!15478) Bool)

(assert (=> b!274119 (= e!194034 (array_inv!6441 (buf!7185 thiss!882)))))

(assert (= (and start!60450 res!228073) b!274118))

(assert (= start!60450 b!274119))

(declare-fun m!406871 () Bool)

(assert (=> start!60450 m!406871))

(declare-fun m!406873 () Bool)

(assert (=> start!60450 m!406873))

(declare-fun m!406875 () Bool)

(assert (=> b!274119 m!406875))

(push 1)

(assert (not b!274119))

(assert (not start!60450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94010 () Bool)

(assert (=> d!94010 (= (array_inv!6441 (buf!7185 thiss!882)) (bvsge (size!6717 (buf!7185 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274119 d!94010))

(declare-fun d!94012 () Bool)

(declare-fun res!228086 () Bool)

(declare-fun e!194046 () Bool)

(assert (=> d!94012 (=> (not res!228086) (not e!194046))))

(assert (=> d!94012 (= res!228086 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6717 (buf!7185 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6717 (buf!7185 thiss!882)))))))))

(assert (=> d!94012 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194046)))

(declare-fun b!274135 () Bool)

(declare-fun lt!412172 () (_ BitVec 64))

(assert (=> b!274135 (= e!194046 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412172) (bvsle lt!412172 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6717 (buf!7185 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274135 (= lt!412172 (bvadd (bitIndex!0 (size!6717 (buf!7185 thiss!882)) (currentByte!13262 thiss!882) (currentBit!13257 thiss!882)) diffInBits!15))))

(assert (= (and d!94012 res!228086) b!274135))

(declare-fun m!406885 () Bool)

(assert (=> b!274135 m!406885))

(assert (=> start!60450 d!94012))

(declare-fun d!94014 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94014 (= (inv!12 thiss!882) (invariant!0 (currentBit!13257 thiss!882) (currentByte!13262 thiss!882) (size!6717 (buf!7185 thiss!882))))))

(declare-fun bs!23686 () Bool)

(assert (= bs!23686 d!94014))

(declare-fun m!406889 () Bool)

(assert (=> bs!23686 m!406889))

(assert (=> start!60450 d!94014))

(push 1)

(assert (not d!94014))

(assert (not b!274135))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94020 () Bool)

(assert (=> d!94020 (= (invariant!0 (currentBit!13257 thiss!882) (currentByte!13262 thiss!882) (size!6717 (buf!7185 thiss!882))) (and (bvsge (currentBit!13257 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13257 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13262 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13262 thiss!882) (size!6717 (buf!7185 thiss!882))) (and (= (currentBit!13257 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13262 thiss!882) (size!6717 (buf!7185 thiss!882)))))))))

(assert (=> d!94014 d!94020))

(declare-fun d!94022 () Bool)

(declare-fun e!194053 () Bool)

(assert (=> d!94022 e!194053))

(declare-fun res!228100 () Bool)

(assert (=> d!94022 (=> (not res!228100) (not e!194053))))

(declare-fun lt!412211 () (_ BitVec 64))

(declare-fun lt!412212 () (_ BitVec 64))

(declare-fun lt!412209 () (_ BitVec 64))

(assert (=> d!94022 (= res!228100 (= lt!412209 (bvsub lt!412212 lt!412211)))))

(assert (=> d!94022 (or (= (bvand lt!412212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412211 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412212 lt!412211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94022 (= lt!412211 (remainingBits!0 ((_ sign_extend 32) (size!6717 (buf!7185 thiss!882))) ((_ sign_extend 32) (currentByte!13262 thiss!882)) ((_ sign_extend 32) (currentBit!13257 thiss!882))))))

(declare-fun lt!412210 () (_ BitVec 64))

(declare-fun lt!412214 () (_ BitVec 64))

(assert (=> d!94022 (= lt!412212 (bvmul lt!412210 lt!412214))))

(assert (=> d!94022 (or (= lt!412210 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412214 (bvsdiv (bvmul lt!412210 lt!412214) lt!412210)))))

(assert (=> d!94022 (= lt!412214 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94022 (= lt!412210 ((_ sign_extend 32) (size!6717 (buf!7185 thiss!882))))))

(assert (=> d!94022 (= lt!412209 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13262 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13257 thiss!882))))))

(assert (=> d!94022 (invariant!0 (currentBit!13257 thiss!882) (currentByte!13262 thiss!882) (size!6717 (buf!7185 thiss!882)))))

(assert (=> d!94022 (= (bitIndex!0 (size!6717 (buf!7185 thiss!882)) (currentByte!13262 thiss!882) (currentBit!13257 thiss!882)) lt!412209)))

(declare-fun b!274148 () Bool)

(declare-fun res!228099 () Bool)

(assert (=> b!274148 (=> (not res!228099) (not e!194053))))

(assert (=> b!274148 (= res!228099 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412209))))

(declare-fun b!274149 () Bool)

(declare-fun lt!412213 () (_ BitVec 64))

(assert (=> b!274149 (= e!194053 (bvsle lt!412209 (bvmul lt!412213 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274149 (or (= lt!412213 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412213 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412213)))))

(assert (=> b!274149 (= lt!412213 ((_ sign_extend 32) (size!6717 (buf!7185 thiss!882))))))

(assert (= (and d!94022 res!228100) b!274148))

(assert (= (and b!274148 res!228099) b!274149))

(declare-fun m!406893 () Bool)

(assert (=> d!94022 m!406893))

(assert (=> d!94022 m!406889))

(assert (=> b!274135 d!94022))

(push 1)

(assert (not d!94022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

