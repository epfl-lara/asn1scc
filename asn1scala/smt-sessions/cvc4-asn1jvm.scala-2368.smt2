; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60378 () Bool)

(assert start!60378)

(declare-fun res!227992 () Bool)

(declare-fun e!193943 () Bool)

(assert (=> start!60378 (=> (not res!227992) (not e!193943))))

(declare-datatypes ((array!15460 0))(
  ( (array!15461 (arr!7698 (Array (_ BitVec 32) (_ BitVec 8))) (size!6711 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12236 0))(
  ( (BitStream!12237 (buf!7179 array!15460) (currentByte!13244 (_ BitVec 32)) (currentBit!13239 (_ BitVec 32))) )
))
(declare-fun thiss!882 () BitStream!12236)

(declare-fun diffInBits!15 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!12236 (_ BitVec 64)) Bool)

(assert (=> start!60378 (= res!227992 (moveBitIndexPrecond!0 thiss!882 diffInBits!15))))

(assert (=> start!60378 e!193943))

(declare-fun e!193945 () Bool)

(declare-fun inv!12 (BitStream!12236) Bool)

(assert (=> start!60378 (and (inv!12 thiss!882) e!193945)))

(assert (=> start!60378 true))

(declare-fun b!274013 () Bool)

(declare-fun lt!412016 () (_ BitVec 32))

(assert (=> b!274013 (= e!193943 (and (= (bvand (currentBit!13239 thiss!882) #b10000000000000000000000000000000) (bvand lt!412016 #b10000000000000000000000000000000)) (not (= (bvand (currentBit!13239 thiss!882) #b10000000000000000000000000000000) (bvand (bvadd (currentBit!13239 thiss!882) lt!412016) #b10000000000000000000000000000000)))))))

(assert (=> b!274013 (= lt!412016 ((_ extract 31 0) (bvsrem diffInBits!15 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!274014 () Bool)

(declare-fun array_inv!6435 (array!15460) Bool)

(assert (=> b!274014 (= e!193945 (array_inv!6435 (buf!7179 thiss!882)))))

(assert (= (and start!60378 res!227992) b!274013))

(assert (= start!60378 b!274014))

(declare-fun m!406787 () Bool)

(assert (=> start!60378 m!406787))

(declare-fun m!406789 () Bool)

(assert (=> start!60378 m!406789))

(declare-fun m!406791 () Bool)

(assert (=> b!274014 m!406791))

(push 1)

(assert (not start!60378))

(assert (not b!274014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93926 () Bool)

(declare-fun res!228001 () Bool)

(declare-fun e!193954 () Bool)

(assert (=> d!93926 (=> (not res!228001) (not e!193954))))

(assert (=> d!93926 (= res!228001 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!6711 (buf!7179 thiss!882)))) diffInBits!15) (bvsle diffInBits!15 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6711 (buf!7179 thiss!882)))))))))

(assert (=> d!93926 (= (moveBitIndexPrecond!0 thiss!882 diffInBits!15) e!193954)))

(declare-fun b!274026 () Bool)

(declare-fun lt!412025 () (_ BitVec 64))

(assert (=> b!274026 (= e!193954 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412025) (bvsle lt!412025 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6711 (buf!7179 thiss!882)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!274026 (= lt!412025 (bvadd (bitIndex!0 (size!6711 (buf!7179 thiss!882)) (currentByte!13244 thiss!882) (currentBit!13239 thiss!882)) diffInBits!15))))

(assert (= (and d!93926 res!228001) b!274026))

(declare-fun m!406801 () Bool)

(assert (=> b!274026 m!406801))

(assert (=> start!60378 d!93926))

(declare-fun d!93932 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!93932 (= (inv!12 thiss!882) (invariant!0 (currentBit!13239 thiss!882) (currentByte!13244 thiss!882) (size!6711 (buf!7179 thiss!882))))))

(declare-fun bs!23671 () Bool)

(assert (= bs!23671 d!93932))

(declare-fun m!406803 () Bool)

(assert (=> bs!23671 m!406803))

(assert (=> start!60378 d!93932))

(declare-fun d!93934 () Bool)

(assert (=> d!93934 (= (array_inv!6435 (buf!7179 thiss!882)) (bvsge (size!6711 (buf!7179 thiss!882)) #b00000000000000000000000000000000))))

(assert (=> b!274014 d!93934))

(push 1)

(assert (not b!274026))

(assert (not d!93932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93944 () Bool)

(declare-fun e!193963 () Bool)

(assert (=> d!93944 e!193963))

(declare-fun res!228019 () Bool)

(assert (=> d!93944 (=> (not res!228019) (not e!193963))))

(declare-fun lt!412074 () (_ BitVec 64))

(declare-fun lt!412078 () (_ BitVec 64))

(declare-fun lt!412076 () (_ BitVec 64))

(assert (=> d!93944 (= res!228019 (= lt!412074 (bvsub lt!412076 lt!412078)))))

(assert (=> d!93944 (or (= (bvand lt!412076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!412078 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!412076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!412076 lt!412078) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!93944 (= lt!412078 (remainingBits!0 ((_ sign_extend 32) (size!6711 (buf!7179 thiss!882))) ((_ sign_extend 32) (currentByte!13244 thiss!882)) ((_ sign_extend 32) (currentBit!13239 thiss!882))))))

(declare-fun lt!412079 () (_ BitVec 64))

(declare-fun lt!412075 () (_ BitVec 64))

(assert (=> d!93944 (= lt!412076 (bvmul lt!412079 lt!412075))))

(assert (=> d!93944 (or (= lt!412079 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412075 (bvsdiv (bvmul lt!412079 lt!412075) lt!412079)))))

(assert (=> d!93944 (= lt!412075 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!93944 (= lt!412079 ((_ sign_extend 32) (size!6711 (buf!7179 thiss!882))))))

(assert (=> d!93944 (= lt!412074 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13244 thiss!882)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13239 thiss!882))))))

(assert (=> d!93944 (invariant!0 (currentBit!13239 thiss!882) (currentByte!13244 thiss!882) (size!6711 (buf!7179 thiss!882)))))

(assert (=> d!93944 (= (bitIndex!0 (size!6711 (buf!7179 thiss!882)) (currentByte!13244 thiss!882) (currentBit!13239 thiss!882)) lt!412074)))

(declare-fun b!274043 () Bool)

(declare-fun res!228018 () Bool)

(assert (=> b!274043 (=> (not res!228018) (not e!193963))))

(assert (=> b!274043 (= res!228018 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!412074))))

(declare-fun b!274044 () Bool)

(declare-fun lt!412077 () (_ BitVec 64))

(assert (=> b!274044 (= e!193963 (bvsle lt!412074 (bvmul lt!412077 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!274044 (or (= lt!412077 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!412077 #b0000000000000000000000000000000000000000000000000000000000001000) lt!412077)))))

(assert (=> b!274044 (= lt!412077 ((_ sign_extend 32) (size!6711 (buf!7179 thiss!882))))))

(assert (= (and d!93944 res!228019) b!274043))

(assert (= (and b!274043 res!228018) b!274044))

(declare-fun m!406809 () Bool)

(assert (=> d!93944 m!406809))

(assert (=> d!93944 m!406803))

(assert (=> b!274026 d!93944))

(declare-fun d!93946 () Bool)

(assert (=> d!93946 (= (invariant!0 (currentBit!13239 thiss!882) (currentByte!13244 thiss!882) (size!6711 (buf!7179 thiss!882))) (and (bvsge (currentBit!13239 thiss!882) #b00000000000000000000000000000000) (bvslt (currentBit!13239 thiss!882) #b00000000000000000000000000001000) (bvsge (currentByte!13244 thiss!882) #b00000000000000000000000000000000) (or (bvslt (currentByte!13244 thiss!882) (size!6711 (buf!7179 thiss!882))) (and (= (currentBit!13239 thiss!882) #b00000000000000000000000000000000) (= (currentByte!13244 thiss!882) (size!6711 (buf!7179 thiss!882)))))))))

(assert (=> d!93932 d!93946))

(push 1)

(assert (not d!93944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

