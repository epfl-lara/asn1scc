; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73354 () Bool)

(assert start!73354)

(declare-fun res!267093 () Bool)

(declare-fun e!234705 () Bool)

(assert (=> start!73354 (=> (not res!267093) (not e!234705))))

(declare-fun lt!447919 () (_ BitVec 64))

(declare-datatypes ((array!21052 0))(
  ( (array!21053 (arr!10229 (Array (_ BitVec 32) (_ BitVec 8))) (size!9137 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14436 0))(
  ( (BitStream!14437 (buf!8279 array!21052) (currentByte!15365 (_ BitVec 32)) (currentBit!15360 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14436)

(assert (=> start!73354 (= res!267093 (and (bvsgt lt!447919 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (currentBit!15360 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73354 (= lt!447919 (remainingBits!0 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))) ((_ sign_extend 32) (currentByte!15365 thiss!877)) ((_ sign_extend 32) (currentBit!15360 thiss!877))))))

(assert (=> start!73354 e!234705))

(declare-fun e!234703 () Bool)

(declare-fun inv!12 (BitStream!14436) Bool)

(assert (=> start!73354 (and (inv!12 thiss!877) e!234703)))

(declare-fun b!325484 () Bool)

(declare-fun res!267094 () Bool)

(assert (=> b!325484 (=> (not res!267094) (not e!234705))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325484 (= res!267094 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9137 (buf!8279 thiss!877)) (currentByte!15365 thiss!877) (currentBit!15360 thiss!877))) (bitIndex!0 (size!9137 (buf!8279 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15365 thiss!877)) #b00000000000000000000000000000000)))))

(declare-fun lt!447918 () (_ BitVec 64))

(declare-fun b!325485 () Bool)

(declare-fun lt!447920 () (_ BitVec 64))

(assert (=> b!325485 (= e!234705 (and (not (= lt!447918 (bvand lt!447920 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!447918 (bvand (bvsub lt!447919 lt!447920) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325485 (= lt!447918 (bvand lt!447919 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325485 (= lt!447920 (remainingBits!0 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15365 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!325486 () Bool)

(declare-fun array_inv!8689 (array!21052) Bool)

(assert (=> b!325486 (= e!234703 (array_inv!8689 (buf!8279 thiss!877)))))

(assert (= (and start!73354 res!267093) b!325484))

(assert (= (and b!325484 res!267094) b!325485))

(assert (= start!73354 b!325486))

(declare-fun m!463477 () Bool)

(assert (=> start!73354 m!463477))

(declare-fun m!463479 () Bool)

(assert (=> start!73354 m!463479))

(declare-fun m!463481 () Bool)

(assert (=> b!325484 m!463481))

(declare-fun m!463483 () Bool)

(assert (=> b!325484 m!463483))

(declare-fun m!463485 () Bool)

(assert (=> b!325485 m!463485))

(declare-fun m!463487 () Bool)

(assert (=> b!325486 m!463487))

(check-sat (not b!325486) (not b!325484) (not b!325485) (not start!73354))
(check-sat)
(get-model)

(declare-fun d!107296 () Bool)

(assert (=> d!107296 (= (array_inv!8689 (buf!8279 thiss!877)) (bvsge (size!9137 (buf!8279 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325486 d!107296))

(declare-fun d!107298 () Bool)

(declare-fun e!234717 () Bool)

(assert (=> d!107298 e!234717))

(declare-fun res!267106 () Bool)

(assert (=> d!107298 (=> (not res!267106) (not e!234717))))

(declare-fun lt!447946 () (_ BitVec 64))

(declare-fun lt!447943 () (_ BitVec 64))

(declare-fun lt!447944 () (_ BitVec 64))

(assert (=> d!107298 (= res!267106 (= lt!447946 (bvsub lt!447944 lt!447943)))))

(assert (=> d!107298 (or (= (bvand lt!447944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447943 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447944 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447944 lt!447943) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107298 (= lt!447943 (remainingBits!0 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))) ((_ sign_extend 32) (currentByte!15365 thiss!877)) ((_ sign_extend 32) (currentBit!15360 thiss!877))))))

(declare-fun lt!447945 () (_ BitVec 64))

(declare-fun lt!447942 () (_ BitVec 64))

(assert (=> d!107298 (= lt!447944 (bvmul lt!447945 lt!447942))))

(assert (=> d!107298 (or (= lt!447945 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447942 (bvsdiv (bvmul lt!447945 lt!447942) lt!447945)))))

(assert (=> d!107298 (= lt!447942 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107298 (= lt!447945 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))))))

(assert (=> d!107298 (= lt!447946 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15365 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15360 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107298 (invariant!0 (currentBit!15360 thiss!877) (currentByte!15365 thiss!877) (size!9137 (buf!8279 thiss!877)))))

(assert (=> d!107298 (= (bitIndex!0 (size!9137 (buf!8279 thiss!877)) (currentByte!15365 thiss!877) (currentBit!15360 thiss!877)) lt!447946)))

(declare-fun b!325500 () Bool)

(declare-fun res!267105 () Bool)

(assert (=> b!325500 (=> (not res!267105) (not e!234717))))

(assert (=> b!325500 (= res!267105 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447946))))

(declare-fun b!325501 () Bool)

(declare-fun lt!447947 () (_ BitVec 64))

(assert (=> b!325501 (= e!234717 (bvsle lt!447946 (bvmul lt!447947 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325501 (or (= lt!447947 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447947 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447947)))))

(assert (=> b!325501 (= lt!447947 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))))))

(assert (= (and d!107298 res!267106) b!325500))

(assert (= (and b!325500 res!267105) b!325501))

(assert (=> d!107298 m!463477))

(declare-fun m!463503 () Bool)

(assert (=> d!107298 m!463503))

(assert (=> b!325484 d!107298))

(declare-fun d!107308 () Bool)

(declare-fun e!234718 () Bool)

(assert (=> d!107308 e!234718))

(declare-fun res!267108 () Bool)

(assert (=> d!107308 (=> (not res!267108) (not e!234718))))

(declare-fun lt!447952 () (_ BitVec 64))

(declare-fun lt!447950 () (_ BitVec 64))

(declare-fun lt!447949 () (_ BitVec 64))

(assert (=> d!107308 (= res!267108 (= lt!447952 (bvsub lt!447950 lt!447949)))))

(assert (=> d!107308 (or (= (bvand lt!447950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447949 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447950 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447950 lt!447949) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107308 (= lt!447949 (remainingBits!0 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15365 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!447951 () (_ BitVec 64))

(declare-fun lt!447948 () (_ BitVec 64))

(assert (=> d!107308 (= lt!447950 (bvmul lt!447951 lt!447948))))

(assert (=> d!107308 (or (= lt!447951 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447948 (bvsdiv (bvmul lt!447951 lt!447948) lt!447951)))))

(assert (=> d!107308 (= lt!447948 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107308 (= lt!447951 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))))))

(assert (=> d!107308 (= lt!447952 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15365 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!107308 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15365 thiss!877)) (size!9137 (buf!8279 thiss!877)))))

(assert (=> d!107308 (= (bitIndex!0 (size!9137 (buf!8279 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15365 thiss!877)) #b00000000000000000000000000000000) lt!447952)))

(declare-fun b!325502 () Bool)

(declare-fun res!267107 () Bool)

(assert (=> b!325502 (=> (not res!267107) (not e!234718))))

(assert (=> b!325502 (= res!267107 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447952))))

(declare-fun b!325503 () Bool)

(declare-fun lt!447953 () (_ BitVec 64))

(assert (=> b!325503 (= e!234718 (bvsle lt!447952 (bvmul lt!447953 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325503 (or (= lt!447953 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447953 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447953)))))

(assert (=> b!325503 (= lt!447953 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))))))

(assert (= (and d!107308 res!267108) b!325502))

(assert (= (and b!325502 res!267107) b!325503))

(declare-fun m!463505 () Bool)

(assert (=> d!107308 m!463505))

(declare-fun m!463507 () Bool)

(assert (=> d!107308 m!463507))

(assert (=> b!325484 d!107308))

(declare-fun d!107312 () Bool)

(assert (=> d!107312 (= (remainingBits!0 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15365 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsub (bvmul ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15365 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325485 d!107312))

(declare-fun d!107314 () Bool)

(assert (=> d!107314 (= (remainingBits!0 ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))) ((_ sign_extend 32) (currentByte!15365 thiss!877)) ((_ sign_extend 32) (currentBit!15360 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9137 (buf!8279 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15365 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15360 thiss!877)))))))

(assert (=> start!73354 d!107314))

(declare-fun d!107316 () Bool)

(assert (=> d!107316 (= (inv!12 thiss!877) (invariant!0 (currentBit!15360 thiss!877) (currentByte!15365 thiss!877) (size!9137 (buf!8279 thiss!877))))))

(declare-fun bs!28236 () Bool)

(assert (= bs!28236 d!107316))

(assert (=> bs!28236 m!463503))

(assert (=> start!73354 d!107316))

(check-sat (not d!107316) (not d!107308) (not d!107298))
