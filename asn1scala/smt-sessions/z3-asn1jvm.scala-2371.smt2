; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60484 () Bool)

(assert start!60484)

(declare-fun res!228111 () Bool)

(declare-fun e!194075 () Bool)

(assert (=> start!60484 (=> (not res!228111) (not e!194075))))

(declare-datatypes ((array!15485 0))(
  ( (array!15486 (arr!7706 (Array (_ BitVec 32) (_ BitVec 8))) (size!6719 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12252 0))(
  ( (BitStream!12253 (buf!7187 array!15485) (currentByte!13270 (_ BitVec 32)) (currentBit!13265 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12252)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12252 (_ BitVec 64)) Bool)

(assert (=> start!60484 (= res!228111 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60484 e!194075))

(declare-fun e!194077 () Bool)

(declare-fun inv!12 (BitStream!12252) Bool)

(assert (=> start!60484 (and (inv!12 thiss!882) e!194077)))

(assert (=> start!60484 true))

(declare-fun b!274165 () Bool)

(declare-fun e!194074 () Bool)

(assert (=> b!274165 (= e!194075 e!194074)))

(declare-fun res!228112 () Bool)

(assert (=> b!274165 (=> (not res!228112) (not e!194074))))

(declare-fun lt!412220 () (_ BitVec 32))

(assert (=> b!274165 (= res!228112 (bvslt (bvadd (currentBit!13265 thiss!882) lt!412220) #b00000000000000000000000000000000))))

(assert (=> b!274165 (= lt!412220 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274166 () Bool)

(assert (=> b!274166 (= e!194074 (not (inv!12 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882))))))))

(declare-fun b!274167 () Bool)

(declare-fun array_inv!6443 (array!15485) Bool)

(assert (=> b!274167 (= e!194077 (array_inv!6443 (buf!7187 thiss!882)))))

(assert (= (and start!60484 res!228111) b!274165))

(assert (= (and b!274165 res!228112) b!274166))

(assert (= start!60484 b!274167))

(declare-fun m!406903 () Bool)

(assert (=> start!60484 m!406903))

(declare-fun m!406905 () Bool)

(assert (=> start!60484 m!406905))

(declare-fun m!406907 () Bool)

(assert (=> b!274166 m!406907))

(declare-fun m!406909 () Bool)

(assert (=> b!274167 m!406909))

(check-sat (not start!60484) (not b!274167) (not b!274166))
(check-sat)
(get-model)

(declare-fun d!94026 () Bool)

(declare-fun res!228121 () Bool)

(declare-fun e!194092 () Bool)

(assert (=> d!94026 (=> (not res!228121) (not e!194092))))

(assert (=> d!94026 (= res!228121 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6719 (buf!7187 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6719 (buf!7187 thiss!882)))))))))

(assert (=> d!94026 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!194092)))

(declare-fun b!274180 () Bool)

(declare-fun lt!412226 () (_ BitVec 64))

(assert (=> b!274180 (= e!194092 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412226) (bvsle lt!412226 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6719 (buf!7187 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274180 (= lt!412226 (bvadd (bitIndex!0 (size!6719 (buf!7187 thiss!882)) (currentByte!13270 thiss!882) (currentBit!13265 thiss!882)) diffInBits!15))))

(assert (= (and d!94026 res!228121) b!274180))

(declare-fun m!406921 () Bool)

(assert (=> b!274180 m!406921))

(assert (=> start!60484 d!94026))

(declare-fun d!94034 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!94034 (= (inv!12 thiss!882) (invariant!0 (currentBit!13265 thiss!882) (currentByte!13270 thiss!882) (size!6719 (buf!7187 thiss!882))))))

(declare-fun bs!23691 () Bool)

(assert (= bs!23691 d!94034))

(declare-fun m!406923 () Bool)

(assert (=> bs!23691 m!406923))

(assert (=> start!60484 d!94034))

(declare-fun d!94036 () Bool)

(assert (=> d!94036 (= (array_inv!6443 (buf!7187 thiss!882)) (bvsge (size!6719 (buf!7187 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274167 d!94036))

(declare-fun d!94038 () Bool)

(assert (=> d!94038 (= (inv!12 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) (invariant!0 (currentBit!13265 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) (currentByte!13270 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) (size!6719 (buf!7187 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))))))))

(declare-fun bs!23692 () Bool)

(assert (= bs!23692 d!94038))

(declare-fun m!406925 () Bool)

(assert (=> bs!23692 m!406925))

(assert (=> b!274166 d!94038))

(check-sat (not b!274180) (not d!94038) (not d!94034))
(check-sat)
(get-model)

(declare-fun d!94050 () Bool)

(declare-fun e!194101 () Bool)

(assert (=> d!94050 e!194101))

(declare-fun res!228133 () Bool)

(assert (=> d!94050 (=> (not res!228133) (not e!194101))))

(declare-fun lt!412247 () (_ BitVec 64))

(declare-fun lt!412250 () (_ BitVec 64))

(declare-fun lt!412249 () (_ BitVec 64))

(assert (=> d!94050 (= res!228133 (= lt!412249 (bvsub lt!412247 lt!412250)))))

(assert (=> d!94050 (or (= (bvand lt!412247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412250 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412247 lt!412250) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94050 (= lt!412250 (remainingBits!0 ((_ sign_extend 32) (size!6719 (buf!7187 thiss!882))) ((_ sign_extend 32) (currentByte!13270 thiss!882)) ((_ sign_extend 32) (currentBit!13265 thiss!882))))))

(declare-fun lt!412245 () (_ BitVec 64))

(declare-fun lt!412248 () (_ BitVec 64))

(assert (=> d!94050 (= lt!412247 (bvmul lt!412245 lt!412248))))

(assert (=> d!94050 (or (= lt!412245 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412248 (bvsdiv (bvmul lt!412245 lt!412248) lt!412245)))))

(assert (=> d!94050 (= lt!412248 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94050 (= lt!412245 ((_ sign_extend 32) (size!6719 (buf!7187 thiss!882))))))

(assert (=> d!94050 (= lt!412249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13270 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13265 thiss!882))))))

(assert (=> d!94050 (invariant!0 (currentBit!13265 thiss!882) (currentByte!13270 thiss!882) (size!6719 (buf!7187 thiss!882)))))

(assert (=> d!94050 (= (bitIndex!0 (size!6719 (buf!7187 thiss!882)) (currentByte!13270 thiss!882) (currentBit!13265 thiss!882)) lt!412249)))

(declare-fun b!274193 () Bool)

(declare-fun res!228132 () Bool)

(assert (=> b!274193 (=> (not res!228132) (not e!194101))))

(assert (=> b!274193 (= res!228132 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412249))))

(declare-fun b!274194 () Bool)

(declare-fun lt!412246 () (_ BitVec 64))

(assert (=> b!274194 (= e!194101 (bvsle lt!412249 (bvmul lt!412246 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274194 (or (= lt!412246 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412246 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412246)))))

(assert (=> b!274194 (= lt!412246 ((_ sign_extend 32) (size!6719 (buf!7187 thiss!882))))))

(assert (= (and d!94050 res!228133) b!274193))

(assert (= (and b!274193 res!228132) b!274194))

(declare-fun m!406937 () Bool)

(assert (=> d!94050 m!406937))

(assert (=> d!94050 m!406923))

(assert (=> b!274180 d!94050))

(declare-fun d!94052 () Bool)

(assert (=> d!94052 (= (invariant!0 (currentBit!13265 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) (currentByte!13270 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) (size!6719 (buf!7187 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))))) (and (bvsge (currentBit!13265 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) #b00000000000000000000000000000000) (bvslt (currentBit!13265 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) #b00000000000000000000000000001000) (bvsge (currentByte!13270 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13270 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) (size!6719 (buf!7187 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))))) (and (= (currentBit!13265 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) #b00000000000000000000000000000000) (= (currentByte!13270 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882)))) (size!6719 (buf!7187 (BitStream!12253 (buf!7187 thiss!882) (bvsub (bvadd (currentByte!13270 thiss!882) ((_ extract 31 0) (bvsdiv diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000))) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!412220 (currentBit!13265 thiss!882))))))))))))

(assert (=> d!94038 d!94052))

(declare-fun d!94054 () Bool)

(assert (=> d!94054 (= (invariant!0 (currentBit!13265 thiss!882) (currentByte!13270 thiss!882) (size!6719 (buf!7187 thiss!882))) (and (bvsge (currentBit!13265 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13265 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13270 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13270 thiss!882) (size!6719 (buf!7187 thiss!882))) (and (= (currentBit!13265 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13270 thiss!882) (size!6719 (buf!7187 thiss!882)))))))))

(assert (=> d!94034 d!94054))

(check-sat (not d!94050))
(check-sat)
