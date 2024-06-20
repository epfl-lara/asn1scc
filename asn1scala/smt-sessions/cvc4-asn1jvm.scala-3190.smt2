; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73356 () Bool)

(assert start!73356)

(declare-fun res!267100 () Bool)

(declare-fun e!234714 () Bool)

(assert (=> start!73356 (=> (not res!267100) (not e!234714))))

(declare-fun lt!447928 () (_ BitVec 64))

(declare-datatypes ((array!21054 0))(
  ( (array!21055 (arr!10230 (Array (_ BitVec 32) (_ BitVec 8))) (size!9138 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14438 0))(
  ( (BitStream!14439 (buf!8280 array!21054) (currentByte!15366 (_ BitVec 32)) (currentBit!15361 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14438)

(assert (=> start!73356 (= res!267100 (and (bvsgt lt!447928 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (currentBit!15361 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73356 (= lt!447928 (remainingBits!0 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))) ((_ sign_extend 32) (currentByte!15366 thiss!877)) ((_ sign_extend 32) (currentBit!15361 thiss!877))))))

(assert (=> start!73356 e!234714))

(declare-fun e!234713 () Bool)

(declare-fun inv!12 (BitStream!14438) Bool)

(assert (=> start!73356 (and (inv!12 thiss!877) e!234713)))

(declare-fun b!325493 () Bool)

(declare-fun res!267099 () Bool)

(assert (=> b!325493 (=> (not res!267099) (not e!234714))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325493 (= res!267099 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9138 (buf!8280 thiss!877)) (currentByte!15366 thiss!877) (currentBit!15361 thiss!877))) (bitIndex!0 (size!9138 (buf!8280 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15366 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun lt!447927 () (_ BitVec 64))

(declare-fun lt!447929 () (_ BitVec 64))

(declare-fun b!325494 () Bool)

(assert (=> b!325494 (= e!234714 (and (not (= lt!447927 (bvand lt!447929 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!447927 (bvand (bvsub lt!447928 lt!447929) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325494 (= lt!447927 (bvand lt!447928 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325494 (= lt!447929 (remainingBits!0 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15366 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325495 () Bool)

(declare-fun array_inv!8690 (array!21054) Bool)

(assert (=> b!325495 (= e!234713 (array_inv!8690 (buf!8280 thiss!877)))))

(assert (= (and start!73356 res!267100) b!325493))

(assert (= (and b!325493 res!267099) b!325494))

(assert (= start!73356 b!325495))

(declare-fun m!463489 () Bool)

(assert (=> start!73356 m!463489))

(declare-fun m!463491 () Bool)

(assert (=> start!73356 m!463491))

(declare-fun m!463493 () Bool)

(assert (=> b!325493 m!463493))

(declare-fun m!463495 () Bool)

(assert (=> b!325493 m!463495))

(declare-fun m!463497 () Bool)

(assert (=> b!325494 m!463497))

(declare-fun m!463499 () Bool)

(assert (=> b!325495 m!463499))

(push 1)

(assert (not b!325494))

(assert (not start!73356))

(assert (not b!325493))

(assert (not b!325495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107318 () Bool)

(assert (=> d!107318 (= (remainingBits!0 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15366 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsub (bvmul ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15366 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325494 d!107318))

(declare-fun d!107320 () Bool)

(assert (=> d!107320 (= (remainingBits!0 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))) ((_ sign_extend 32) (currentByte!15366 thiss!877)) ((_ sign_extend 32) (currentBit!15361 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15366 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15361 thiss!877)))))))

(assert (=> start!73356 d!107320))

(declare-fun d!107322 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107322 (= (inv!12 thiss!877) (invariant!0 (currentBit!15361 thiss!877) (currentByte!15366 thiss!877) (size!9138 (buf!8280 thiss!877))))))

(declare-fun bs!28237 () Bool)

(assert (= bs!28237 d!107322))

(declare-fun m!463509 () Bool)

(assert (=> bs!28237 m!463509))

(assert (=> start!73356 d!107322))

(declare-fun d!107324 () Bool)

(declare-fun e!234723 () Bool)

(assert (=> d!107324 e!234723))

(declare-fun res!267117 () Bool)

(assert (=> d!107324 (=> (not res!267117) (not e!234723))))

(declare-fun lt!447980 () (_ BitVec 64))

(declare-fun lt!447978 () (_ BitVec 64))

(declare-fun lt!447983 () (_ BitVec 64))

(assert (=> d!107324 (= res!267117 (= lt!447983 (bvsub lt!447978 lt!447980)))))

(assert (=> d!107324 (or (= (bvand lt!447978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447978 lt!447980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107324 (= lt!447980 (remainingBits!0 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))) ((_ sign_extend 32) (currentByte!15366 thiss!877)) ((_ sign_extend 32) (currentBit!15361 thiss!877))))))

(declare-fun lt!447981 () (_ BitVec 64))

(declare-fun lt!447982 () (_ BitVec 64))

(assert (=> d!107324 (= lt!447978 (bvmul lt!447981 lt!447982))))

(assert (=> d!107324 (or (= lt!447981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447982 (bvsdiv (bvmul lt!447981 lt!447982) lt!447981)))))

(assert (=> d!107324 (= lt!447982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107324 (= lt!447981 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))))))

(assert (=> d!107324 (= lt!447983 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15366 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15361 thiss!877))))))

(assert (=> d!107324 (invariant!0 (currentBit!15361 thiss!877) (currentByte!15366 thiss!877) (size!9138 (buf!8280 thiss!877)))))

(assert (=> d!107324 (= (bitIndex!0 (size!9138 (buf!8280 thiss!877)) (currentByte!15366 thiss!877) (currentBit!15361 thiss!877)) lt!447983)))

(declare-fun b!325512 () Bool)

(declare-fun res!267118 () Bool)

(assert (=> b!325512 (=> (not res!267118) (not e!234723))))

(assert (=> b!325512 (= res!267118 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447983))))

(declare-fun b!325513 () Bool)

(declare-fun lt!447979 () (_ BitVec 64))

(assert (=> b!325513 (= e!234723 (bvsle lt!447983 (bvmul lt!447979 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325513 (or (= lt!447979 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447979 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447979)))))

(assert (=> b!325513 (= lt!447979 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))))))

(assert (= (and d!107324 res!267117) b!325512))

(assert (= (and b!325512 res!267118) b!325513))

(assert (=> d!107324 m!463489))

(assert (=> d!107324 m!463509))

(assert (=> b!325493 d!107324))

(declare-fun d!107326 () Bool)

(declare-fun e!234724 () Bool)

(assert (=> d!107326 e!234724))

(declare-fun res!267119 () Bool)

(assert (=> d!107326 (=> (not res!267119) (not e!234724))))

(declare-fun lt!447989 () (_ BitVec 64))

(declare-fun lt!447984 () (_ BitVec 64))

(declare-fun lt!447986 () (_ BitVec 64))

(assert (=> d!107326 (= res!267119 (= lt!447989 (bvsub lt!447984 lt!447986)))))

(assert (=> d!107326 (or (= (bvand lt!447984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447986 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447984 lt!447986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107326 (= lt!447986 (remainingBits!0 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15366 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447987 () (_ BitVec 64))

(declare-fun lt!447988 () (_ BitVec 64))

(assert (=> d!107326 (= lt!447984 (bvmul lt!447987 lt!447988))))

(assert (=> d!107326 (or (= lt!447987 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447988 (bvsdiv (bvmul lt!447987 lt!447988) lt!447987)))))

(assert (=> d!107326 (= lt!447988 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107326 (= lt!447987 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))))))

(assert (=> d!107326 (= lt!447989 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15366 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!107326 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15366 thiss!877)) (size!9138 (buf!8280 thiss!877)))))

(assert (=> d!107326 (= (bitIndex!0 (size!9138 (buf!8280 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15366 thiss!877)) #b00000000000000000000000000000000) lt!447989)))

(declare-fun b!325514 () Bool)

(declare-fun res!267120 () Bool)

(assert (=> b!325514 (=> (not res!267120) (not e!234724))))

(assert (=> b!325514 (= res!267120 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447989))))

(declare-fun b!325515 () Bool)

(declare-fun lt!447985 () (_ BitVec 64))

(assert (=> b!325515 (= e!234724 (bvsle lt!447989 (bvmul lt!447985 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325515 (or (= lt!447985 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447985 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447985)))))

(assert (=> b!325515 (= lt!447985 ((_ sign_extend 32) (size!9138 (buf!8280 thiss!877))))))

(assert (= (and d!107326 res!267119) b!325514))

(assert (= (and b!325514 res!267120) b!325515))

(declare-fun m!463511 () Bool)

(assert (=> d!107326 m!463511))

(declare-fun m!463513 () Bool)

(assert (=> d!107326 m!463513))

(assert (=> b!325493 d!107326))

(declare-fun d!107328 () Bool)

(assert (=> d!107328 (= (array_inv!8690 (buf!8280 thiss!877)) (bvsge (size!9138 (buf!8280 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325495 d!107328))

(push 1)

(assert (not d!107322))

(assert (not d!107326))

(assert (not d!107324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

